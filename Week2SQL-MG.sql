
-- task 1 Find the count of all the employees in the organization.

select  count(*) as count_of_employees
from employees;

select *
from employees;

-- task 2 Find the department ID-wise count of employees in the organization.
select department_id, count(*)
from employees
group by department_id;

select *
from departments;

/* task 3 - 
Find the first names, last names, and salaries of those employees 
whose salary is greater than $6,000. 
*/
select first_name, last_name,salary
from employees
where salary > 6000;

/* task 4 - 
Determine the count of employees who are earning a salary greater than $20,000
*/
select count(*)
from employees
where salary > 20000;

/* task 5 - 
List the details of those employees who get a commission, to decide the 
percentage of bonus they should receive. (Display all the columns of the employee's table.)
*/
select *
from employees 
where commission_pct is not null;

/* task 6 - 
The HR department wants to send an invite to all the employees who get a commission. 
The invites will address the employees with their full names. Extract
 the full names of these employees
*/
select concat(first_name, ' ' , last_name) as name
from employees 
where commission_pct is not null;

/* task 7 - 
Fetch the following details of employees who get a commission: Employee ID, 
Employee Name, Email ID, Phone Number.
*/
select employee_id,
 concat(first_name, ' ' , last_name) as name, 
email, phone_number
from employees 
where commission_pct is not null;


-- task 8 Identify the top three department IDs that have the highest total salary of employees.
select department_id, avg(salary)
from employees
group by department_id
order by 
limit 3;
-- Error Code: 1055. Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'hr.employees.salary' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by

select *
from employees;

-- or 
select department_id, salary, count(*)
from employees
group by department_id
order by salary desc
limit 3;

/* task 9 - 
List the details of employees from the IT department.
*/
select *
from employees
cross join departments
on employees.department_id = departments.department_id 
where departments.department_name  like 'IT%';


-- task 10 Find the count of all the employees in the IT department and their average salary.
select count(*) , avg(salary)
from employees
cross join departments
on employees.department_id = departments.department_id 
where departments.department_name  like 'IT%';

/* task 11 - 
Identify the department IDs and the number of employees for the departments in which employee
 salaries range from $7,000 to $10,000.
*/
select department_id, count(*)
from employees
where salary between 7000 and 10000
group by department_id;

