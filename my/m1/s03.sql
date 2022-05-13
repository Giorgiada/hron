-- examples on select
use hron;

-- select = select all --> cioè mostrami tutta la tabella regione
select *                      
from region;

-- selecting a single column and a single row (if exists)
select name
from region
where region_id = 1;

-- select a single column, no row filtering
select manager_id
from employee;

-- SELECT DISTINCT = selecting only non-duplicated values
select distinct manager_id
from employee;

select *
from employee;

-- select with changes on values and column names
select title, min_salary, min_salary * 2 as 'doubled min salary'
from job;

-- other ways to specify column aliases
select title, min_salary as min, max_salary max
from job;

-- the dual table and the function current_date
select current_date;
-- from dual; 

select sqrt(25);

-- concatenation
select concat(region_id, ': ' ,country_id) as 'the countries'
from country;

-- limit to get a result set with a specified max size
select first_name, last_name
from employee
limit 10, 10;

-- the second block of ten employees
select first_name, last_name
from employee
limit 10, 10;

-- there are less than 110 employees, so this result set is smaller than 10
select first_name, last_name
from employee
limit 100, 10;

SELECT concat (first_name, " ", last_name, " ", phone) as "Name & phone", salary
FROM employee
WHERE first_name = "John";

SELECT *
FROM employee
WHERE manager_id = "100";

SELECT *
FROM employee
WHERE salary <3000 and employee_id > 160;

SELECT *
FROM employee
WHERE department_id =5 or department_id=3;

SELECT *
FROM employee
WHERE department_id=3 AND hired < "2021-01-01";
