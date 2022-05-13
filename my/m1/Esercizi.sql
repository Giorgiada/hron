-- Employee: nome, cognome, telefono, data di assunzione
SELECT first_name, last_name, phone,hired
FROM employee
order by last_name, first_name;

-- chi ha nome David o Peter
SELECT first_name, last_name, phone,hired
FROM employee
WHERE first_name in ("David", "Peter")
order by last_name, first_name;

-- chi appartiene al dipartimento 6
SELECT first_name, last_name, phone, hired,  department_id
FROM employee
WHERE department_id = 6;

-- chi appartiene ai dipartimenti 3 5 
SELECT first_name, last_name, phone, hired, department_id
FROM employee
WHERE department_id in (3,5);
-- Where department_id is 3 or department_id =5;

-- Chi ha il salario maggiore di 1000
SELECT first_name, last_name, phone, hired, department_id, salary
FROM employee
WHERE salary >1000
ORDER BY salary desc;

-- minore di 4000 o maggiore di 15000
SELECT first_name, last_name, phone, hired, department_id, salary
FROM employee
WHERE salary < 4000 or salary > 15000
ORDER BY salary desc;

-- minore di 4000 o maggiore di 15000, ma solo per i dipartimenti 5 e 8
SELECT first_name, last_name, phone, hired, department_id, salary
FROM employee
WHERE  department_id in (5,8)
ORDER BY salary ;

SELECT first_name, last_name, phone, hired, department_id, salary
FROM employee
WHERE (salary < 4000 or salary > 15000) AND department_id in (5,8);

-- chi è stato assunto nel 2015
SELECT first_name, last_name, hired
FROM employee
WHERE hired LIKE '2015%';

-- Quali job_id sono presenti, in ordine naturale
SELECT DISTINCT job_id
FROM employee
order by job_id;

-- Chi ha una commissione
SELECT first_name, last_name, commission
FROM employee
WHERE commission is not null
ORDER BY commission, first_name;

-- Chi ha una ‘a’ nel nome o cognome
SELECT first_name, last_name
FROM employee
WHERE first_name LIKE "%a%" or last_name LIKE "%a%";

-- department, nomi in ordine naturali
SELECT name
FROM department
ORDER BY name;

-- LOCATION, indirizzo nelle sedi italiane
SELECT street_address, country_id, city
FROM location 
WHERE country_id = "IT";



