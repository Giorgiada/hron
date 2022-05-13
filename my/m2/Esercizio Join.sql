-- dipendenti che lavorano in IT 
SELECT e.first_name, e.last_name, d.name
FROM employee e JOIN department d
USING (department_id)
WHERE name = "IT";

SELECT e.first_name, e.last_name, d.name
FROM employee e JOIN department d
ON d.department_id = e.department_id
WHERE name = "IT";

SELECT e.first_name, e.last_name, d.name
FROM employee e JOIN department d
WHERE d.department_id = e.department_id
ANd name = "IT";

-- employee , car. nome cognome dipendenti e nome auto 
SELECT e.first_name, e.last_name, c.name as "car"
FROM employee e JOIN car c
USING (employee_id)
ORDER BY first_name;

SELECT e.first_name, e.last_name, c.name as "car"
FROM employee e JOIN car c
WHERE e.employee_id = c.employee_id
ORDER BY first_name;

-- Join a tre
SELECT e.first_name, e.last_name, l.city, l.street_address
FROM employee e JOIN department d 
USING (department_id)
JOIN location l
USING (location_id)
WHERE e.last_name = "King";

-- indirizzi in europa 
SELECT  c.name,l.city, l.street_address, r.name
FROM region r JOIN country c 
USING (region_id)
JOIN location l 
USING (country_id)
WHERE r.name ="Europe"
ORDER BY c.name, l.city; 

-- tutti employee che sono in dipartimento IT 
SELECT e.first_name, e.last_name, d.name
FROM department d JOIN employee e
ON d.department_id = e.department_id
WHERE d.name = "IT";

SELECT first_name, last_name, name
FROM car c JOIN employee e 
ON c.employee_id = e.employee_id;

-- join a 3
SELECT first_name, last_name, city, street_address
FROM employee e JOIN department d ON e.department_id = d.department_id
	JOIN location l ON d.location_id = l.location_id
WHERE city = "London";
    
SELECT l.city, c.name
FROM location l JOIN country c
on l.country_id= c.country_id
JOIN region r 
ON c.region_id = r.region_id
WHERE r.name = "Americas";

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

-- nome del dipartimento anche se non hanno indirizzo associato
SELECT d.name, l.city
FROM department d LEFT OUTER JOIN location l
ON d.location_id = l.location_id;

SELECT d.name, l.city
FROM department d RIGHT OUTER JOIN location l
ON d.location_id = l.location_id; 

-- union 
SELECT d.name, l.city
FROM department d LEFT OUTER JOIN location l
ON d.location_id= l.location_id
UNION 
SELECT d.name, l.city
FROM department d RIGHT OUTER JOIN location l
ON d.location_id = l.location_id
ORDER BY name; 

-- 1 nome dei dipendenti e del loro dipartimento 
SELECT e.first_name, e.last_name, d.name
FROM employee e JOIN department d
ON e.department_id = d.department_id
ORDER BY d.name;

-- 2 nome dei dipendenti e del loro lavoro (JOB)
SELECT e.first_name, e.last_name, j.title
FROM employee e JOIN job j 
ON e.job_id = j.job_id;

-- 3 Nome dei dipendenti con il salario minimo o massimo per il loro lavoro
SELECT e.first_name, e.last_name, e.salary, j.min_salary, j.max_salary
FROM employee e JOIN job j
USING (job_id)
WHERE e.salary IN (j.min_salary, j.max_salary);

-- 4 Nome dei dipendenti basati in UK 
SELECT  e.last_name, e.first_name, l.country_id
FROM employee e JOIN department d
ON e.department_id = d.department_id
JOIN location l
ON d.location_id = l.location_id
WHERE country_id = "UK"
ORDER BY last_name;

-- 5 Nome dei dipartimenti e manager associato
SELECT e.employee_id, e.first_name, e.last_name
FROM department d JOIN employee e
ON d.manager_id= e.employee_id
ORDER BY d.name;

-- 6 Nome di ogni dipartimento e, se esiste, del manager responsabile
SELECT d.name, m.first_name, m.last_name
FROM department d LEFT OUTER JOIN employee m 
ON d.manager_id = m.employee_id
ORDER BY first_name;

-- 7 Nome dei dipartimenti che non hanno un manager associato
SELECT d.name
FROM department d
WHERE manager_id is null;


-- 8 Nome dei dipendenti e del loro manager
SELECT e.first_name, e.last_name, m.first_name, m.last_name
FROM employee e JOIN employee m 
ON e.manager_id = m.employee_id;

-- many to many. auto in relazione al servizio
SELECT c.name, cs.checkin, cs.checkout, s.name
FROM car c JOIN car_service cs
ON c.car_id =cs.car_id
JOIN service s USING (service_id);

-- join a 4 
-- dipendenti in europa
SELECT  e.last_name, e.first_name, r.name
FROM employee e JOIN department d ON e.department_id = d.department_id
	JOIN location l ON d.location_id = l.location_id
		JOIN country c ON l.country_id = c.country_id
        JOIN region r ON c.region_id = r.region_id
        WHERE r.name= "EUROPE"
        ORDER BY last_name;

SELECT *
FROM employee
WHERE first_name = "David";

UPDATE employee
SET salary = salary +100, department_id =5
WHERE first_name = "David";

rollback;
commit;







