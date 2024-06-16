--Data Analysis Queries
--Employee Number, last name, first name, sex & salary

Select employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
from schema_sql.employees
inner join schema_sql.salaries on 
schema_sql.employees.emp_no =salaries.salary;

--List the first name, last name, and hire date for the employees who were hired in 1986 

select first_name, last_name, hire_Date
from schema_sql.employees
where EXTRACT(year from hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name
select department_mgr.dept_no, 
	departments.dept_name, 
	department_mgr.emp_no, 
	schema_sql.employees.first_name, 
	schema_sql.employees.last_name
from schema_sql.department_mgr
-- select * from schema_sql.department_mgr
inner join schema_sql.departments on
schema_sql.department_mgr.dept_no = schema_sql.departments.dept_no
inner join schema_sql.employees on
department_mgr.emp_no = schema_sql.employees.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select department_employee.dept_no,
	department_employee.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from schema_sql.department_employee
INNER JOIN schema_sql.employees ON department_employee.emp_no = employees.emp_no
INNER JOIN schema_sql.departments ON department_employee.dept_no = departments.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select first_name,
last_name,
sex
from schema_sql.employees
where first_name= 'Hercules'
AND LAST_NAME LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name

SELECT employees.emp_no, employees.last_name, employees.first_name
FROM schema_sql.employees
INNER JOIN schema_sql.department_employee ON employees.emp_no = department_employee.emp_no
INNER JOIN schema_sql.departments ON department_employee.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name
    , count(last_name)
FROM schema_sql.employees
GROUP BY last_name
ORDER BY count(last_name) DESC;




