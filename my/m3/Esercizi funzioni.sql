-- Qual è il salario corrente, quale sarebbe con un incremento dell’8.5%, qual è il delta come valore assoluto
-- ROUND() = Arrotonda/tronca decimali (+) o potenze di 10 (-):
SELECT first_name, last_name, salary, round (salary / 100 *8.5) as aumento,
	 round( salary + (salary / 100 * 8.5)) as totale
FROM employee
ORDER BY salary desc;
