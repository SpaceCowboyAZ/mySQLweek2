DESCRIBE dept_manager;
DESCRIBE dept_emp;
DESCRIBE employees;
DESCRIBE departments;
DESCRIBE titles;
DESCRIBE salaries;

-- 1. I want to know how many employees with each title were born after 1965-01-01.
SELECT t.title, e.first_name, e.last_name, e.birth_date
FROM employees e
INNER JOIN titles t ON e.emp_no = t.emp_no
WHERE e.birth_date > '1965-01-01'
ORDER BY e.birth_date;

-- I want to know the average salary per title.
SELECT t.title, avg(salary) AS avg_salary
FROM salaries s
INNER JOIN titles t ON s.emp_no = t.emp_no
GROUP BY t.title
ORDER BY avg_salary DESC;

-- How much money was spent on salary for the marketing department between the years 1990 and 1992?
SELECT d.dept_name, sum(salary)
FROM dept_emp de
INNER JOIN departments d ON d.dept_no = de.dept_no
INNER JOIN salaries s ON s.emp_no =  de.emp_no
WHERE d.dept_name = 'Marketing' AND
s.from_date >= '1990-01-01' AND s.to_date <= '1992-12-31'
GROUP BY d.dept_name;
-- LAST 20 OUT OF 100 ROWS