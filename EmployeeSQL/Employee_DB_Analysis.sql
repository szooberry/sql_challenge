-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salaries
FROM employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,
last_name,
hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT departmentmanagers.dept_no,
departments.dept_name,
departmentmanagers.emp_no,
employees.last_name,
employees.first_name
FROM departmentmanagers
INNER JOIN departments ON
departments.dept_no=departmentmanagers.dept_no
INNER JOIN employees ON
employees.emp_no=departmentmanagers.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT departmentemployees.dept_no,
departmentemployees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM departmentemployees
INNER JOIN employees ON
employees.emp_no=departmentemployees.emp_no
INNER JOIN departments ON
departments.dept_no=departmentemployees.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,
last_name,
sex
FROM employees
WHERE last_name LIKE 'B%' AND first_name = 'Hercules';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no,
last_name,
first_name
FROM employees
WHERE emp_no IN
	(
	SELECT emp_no
	FROM departmentemployees
	WHERE dept_no IN
		(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
		)
	);
	
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT departmentemployees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM departmentemployees
INNER JOIN departments ON
departments.dept_no=departmentemployees.dept_no
INNER JOIN employees ON
employees.emp_no=departmentemployees.emp_no
WHERE departmentemployees.emp_no IN
	(
	SELECT emp_no
	FROM departmentemployees
	WHERE dept_no IN
		(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales' OR 
		dept_name = 'Development'
		)
	)
AND departments.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Count" DESC;
