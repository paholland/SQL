-- Data overview
SELECT * FROM employees
LIMIT 10;
SELECT * FROM departments
LIMIT 10;
SELECT * FROM dept_emp
LIMIT 10;
SELECT * FROM dept_manager
LIMIT 10;
SELECT * FROM salaries
LIMIT 10;
SELECT * FROM titles
LIMIT 10;

-- List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees
JOIN salaries 
ON employees.emp_no = salaries.salary

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no =employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no


-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'


--  List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.last_name, employees.first_name, dept_emp.emp_no, departments.dept_name
FROM dept_emp
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN employees ON employees.emp_no  = dept_emp.emp_no
WHERE departments.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no  = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name, COUNT(employees.last_name)
FROM employees
GROUP BY employees.last_name 
ORDER BY employees.last_name DESC;

-- epilogue here
SELECT * FROM employees
WHERE emp_no = 499942

