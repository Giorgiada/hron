-- examples on sorting
use hron;

-- a plain sorted query
select first_name, last_name
from employee
order by last_name;

-- ordering by more columns
select last_name, first_name
from employee
order by last_name, first_name;

-- natural order is not always what we want
select first_name, last_name, salary
from employee
order by salary;

-- descending and limited
select first_name, last_name, salary
from employee
order by salary desc
limit 6;

-- ...
select first_name, last_name
from employee
where first_name like 'b%'
order by salary desc;

-- positional notation
select first_name, last_name
from employee order by 1, 2;
-- ti orfino per la prima colonna indicata su (first name) e la seconda (last name)

SELECT first_name, last_name
FROM employee 
ORDER BY first_name, last_name;

SELECT  last_name,first_name
FROM employee 
ORDER BY last_name, first_name;
 
-- ...
select first_name, last_name, hired
from employee
where first_name like 'c%'
order by 3 asc;



