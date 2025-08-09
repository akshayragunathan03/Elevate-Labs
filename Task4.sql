use employee_details;

select * from employee;

SELECT dept_id,
       COUNT(emp_id) AS employee_count,
       SUM(salary) AS total_salary,
       AVG(salary) AS avg_salary
FROM employee
WHERE dept_id 
GROUP BY dept_id
HAVING SUM(salary) > 120000;

SELECT SUM(salary) AS total_salary
FROM employee;

SELECT COUNT(emp_id) AS total_employees
FROM employee;


SELECT AVG(salary) AS average_salary
FROM employee;