-- examples on left/right outer join - from "many" perspective
use hron;

-- Kimberely is an employee not associated to a department
select first_name, last_name, department_id
from employee
where last_name like 'Gr%';

-- the inner join skips Kimberely
select e.first_name, e.last_name, d.name as department
from employee e inner join department d
using (department_id)
where e.last_name like 'Gr%';

-- left outer join preserves Kimberely, giving NULL for the department columns
select e.first_name, e.last_name, d.name as department
from employee e left outer join department d
using (department_id)
where e.last_name like 'Gr%';

-- rewritten as right outer join
select e.first_name, e.last_name, d.name as department
from department d right outer join employee e
using (department_id)
where e.last_name like 'Gr%';

-- "left" or "right" implies "outer"
select e.first_name, e.last_name, d.name as department
from employee e left join department d
using (department_id)
where e.last_name = 'Grant';

-- indirizzo dipartimenti 
-- INNER JOIN = fa vedere SOLO i dipartimenti che hanno un indirizzo
SELECT  d.name, l.city, l.street_address
FROM location l JOIN department d
ON d.location_id = l.location_id; 

-- OUTER JOIN per far vedere i dipartimenti che non hanno indirizzo, e che verranno mostrati con valore NULL
SELECT  d.name, l.city, l.street_address
-- RIGHT perchè department è a destra  
FROM location l RIGHT OUTER JOIN department d
ON d.location_id = l.location_id; 



