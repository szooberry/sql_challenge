-- Create Table called departments for departments.csv
CREATE TABLE departments(
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(250) NOT NULL
);

-- Create Table called titles for titles.csv
CREATE TABLE titles(
	title_id VARCHAR(10) PRIMARY KEY NOT NULL,
	title VARCHAR(250) NOT NULL
);

-- Create Table called employees for employees.csv
CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date VARCHAR(20),
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	sex VARCHAR(5),
	hire_date VARCHAR(20)
);

-- Create Table called departmentemployees for dept_emp.csv
CREATE TABLE departmentemployees(
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create Table called departmentmanagers for dept_manager.csv
CREATE TABLE departmentmanagers(
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create Table called salaries for salaries.csv
CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salaries INTEGER NOT NULL
);
