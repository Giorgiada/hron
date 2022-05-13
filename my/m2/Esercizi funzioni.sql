-- 1 Qual è il salario corrente, quale sarebbe con un incremento dell’8.5%, qual è il delta come valore assoluto
-- ROUND() = Arrotonda/tronca decimali (+) o potenze di 10 (-):
SELECT first_name, last_name, salary, round (salary / 100 *8.5) as aumento,
	 round( salary + (salary / 100 * 8.5)) as totale
FROM employee
ORDER BY salary desc;


-- 2 Quanti giorni sono passati dall’assunzione a oggi
SELECT first_name, last_name, hired, datediff(curdate(), hired)
FROM employee
ORDER BY hired desc;

-- Quant’è la commissione di ognuno o ‘no value’
-- IFNULL() = guarda il primo argomento, se questo è null ritorna il 2 arg, altrimenti ritorna il 1 arg 
SELECT first_name, last_name, ifnull(commission, 'no value')
FROM employee;


-- quanti sono gli stati appartenenti alle diverse regioni
-- count(*) = conta tutte le righe 
SELECT count(*), r.name
FROM country c JOIN region r ON c.region_id=r.region_id
GROUP BY c.region_id;

-- 1 salario maggiore, minore, la loro sommma e media (dipendenti)
SELECT max(salary), min(salary), sum(salary), round(avg(salary),2)
FROM employee;

-- per ogni job_id
SELECT e.job_id, max(salary), min(salary), sum(salary), round(avg(salary),2)
FROM employee e JOIN job j ON j.job_id= e.job_id
GROUP BY e.job_id;

-- 2 Quanti dipendenti per ogni tipo di lavoro
SELECT count(*), j.title
FROM employee e JOIN job j ON j.job_id = e.job_id
GROUP BY e.job_id;

-- quanti sono i programmatori
SELECT count(*), j.title
FROM employee e JOIN job j ON j.job_id = e.job_id
GROUP BY e.job_id
HAVING j.title= "programmer";

-- Quanti sono i manager (dedotti dalla colonna manager_id)
SELECT count(DISTINCT manager_id) as "manager"
FROM employee;
 
 -- Nome dei dipendenti che sono manager
 SELECT DISTINCT manager_id
 FROM employee e
 WHERE manager_id is not null;

-- nome cognome dei manager
SELECT first_name, last_name
FROM employee e 
WHERE employee_id in (SELECT DISTINCT manager_id
 FROM employee e
 WHERE manager_id is not null);
 
 --  Nome dei dipendenti che non sono manager. Aggiungere NOT
SELECT first_name, last_name
FROM employee e 
WHERE employee_id NOT in (SELECT DISTINCT manager_id
 FROM employee e
 WHERE manager_id is not null);
 
--  Qual è la differenza tra il salario maggiore e il minore
SELECT max(salary) - min(salary) as "differenza"
FROM employee; 

-- per ogni job_id
SELECT job_id, max(salary) - min(salary) as "differenza"
FROM employee e
GROUP BY e.job_id
HAVING differenza != 0;
-- max(salary) - min(salary) !=0; 

-- join con job 
SELECT j.title, max(salary) - min(salary) as "differenza"
FROM employee e JOIN job j ON e.job_id =j.job_id
GROUP BY e.job_id
HAVING differenza != 0;

-- indirizzi completi, tra location e country
SELECT e.first_name, e.last_name, d.name, l.city
FROM employee e JOIN department d
USING (department_id)
JOIN location l 
USING (location_id)
GROUP BY employee_id
HAVING l.city= "TORONTO";

-- Nome e cognome dei dipendenti assunti dopo David Lee

-- data assunzione 
SELECT hired
FROM employee e
WHERE e.first_name="David" and e.last_name ="LEE";

SELECT first_name, last_name
FROM employee
WHERE hired > (SELECT hired
FROM employee e
WHERE e.first_name = "David" AND e.last_name ="Lee");

SELECT e.first_name, e.last_name
FROM employee e JOIN employee dl
ON dl.first_name ="David" AND dl.last_name= "Lee"
WHERE e.hired > dl.hired; 


