---1.  List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;
---this query is a complete list of employee number, last name, first name, gender, and salary.

---2.  List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';
---This query lists first name and last name for every employee hired in 1986.

---3. List the manager of each department with the following information: 
---   department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name,dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;
---This query lists Manager information: department number, department name, employee number, last name, and first name.

---4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_employee.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_employee
JOIN employees
ON dept_employee.emp_no = employees.emp_no
JOIN departments
ON dept_employee.dept_no = departments.dept_no;
---This query lists employee number, last name, first name, and department name for every employee.

---5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with letter "B".
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
---There are (20) employees with first name of Hercules and last name starting with letter B.

---6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_employee.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_employee
JOIN employees
ON dept_employee.emp_no = employees.emp_no
JOIN departments
ON dept_employee.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';
---This query lists the employee number, last name, first name, and department name of employees in the Sales department.

---7. List employees in the sales and Development departments, including their employee number, last name, first name, and department name.
---Sales and Development are different departments, not a single department.
SELECT dept_employee.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_employee
JOIN employees
ON dept_employee.emp_no = employees.emp_no
JOIN departments
ON dept_employee.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';
---This query lists the employee number, last name, and first name of every employee in the Sales OR Development department.

---8. In descending order, list the frequency count of employee last name, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name)DESC;
---BABA is the most frequent last name (226).
