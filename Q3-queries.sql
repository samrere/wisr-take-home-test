-- Use database wisr
USE wisr;

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp_no, last_name, first_name, sex, salary 
FROM employees 
JOIN salaries USING (emp_no);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
-- Created index on hire_date for faster filtering
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_no, dept_name, emp_no, last_name, first_name 
FROM dept_manager 
JOIN departments USING (dept_no) 
JOIN employees USING (emp_no);

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name 
FROM dept_emp 
JOIN departments USING (dept_no) 
JOIN employees USING (emp_no);

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B".
-- Created composite index on last_name and first_name (so in question 8, it will be efficient to group by last_name only)
SELECT first_name, last_name, sex 
FROM employees 
WHERE last_name LIKE 'B%' AND first_name = 'Hercules';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name 
FROM dept_emp 
JOIN departments USING (dept_no) 
JOIN employees USING (emp_no) 
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name 
FROM dept_emp 
JOIN departments USING (dept_no) 
JOIN employees USING (emp_no) 
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS last_name_freq 
FROM employees 
GROUP BY last_name 
ORDER BY last_name_freq DESC, last_name ASC;
