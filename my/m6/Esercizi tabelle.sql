-- create new table

 
CREATE TABLE client(
	client_id INTEGER PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR (40) NOT NULL, 
	phone VARCHAR (20) NOT NULL UNIQUE
); 

SELECT * FROM client; 

INSERT INTO client (name, phone) VALUES ('Giorgia D', '12345678');

INSERT INTO client (name, phone) VALUES ('Mario Rossi', '22222');

UPDATE client
SET name= 'Giorgia Da'
WHERE client_id=1; 

DELETE FROM client
WHERE client_id=3;

INSERT INTO client (name, phone) VALUES ('Martina Deci', '9999');

DELETE FROM client
WHERE client_id=5;

CREATE TABLE reservation (
	reservation_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	day TIMESTAMP NOT NULL,
	count INTEGER NOT NULL,
	client_id INTEGER NOT NULL
);

SELECT*
FROM reservation;

INSERT INTO reservation (day, count, client_id) VALUES 
	(now(), 2, 1);
    
DROP TABLE IF EXISTS reservation; 
    
CREATE TABLE reservation (
	reservation_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	day TIMESTAMP NOT NULL,
	count INTEGER NOT NULL,
	client_id INTEGER NOT NULL,
    -- creo foreign key
    FOREIGN KEY (client_id) references client (client_id)
);

SELECT*
FROM reservation;

INSERT INTO reservation (day, count, client_id) VALUES 
	(now(),2,1),
    (now(),4,7);
    
    
DESCRIBE reservation; 

DROP TABLE IF EXISTS constrained;