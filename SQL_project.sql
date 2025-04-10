CREATE DATABASE proiect_1
USE proiect_1

CREATE TABLE aeroport(
	id_aeroport int primary key,
	nume_aeroport varchar(100),
	locatie varchar(100),
	telefon varchar(20)
	)

INSERT INTO aeroport VALUES(1, 'Avram Iancu Airport', 'Cluj-Napoca RO', '0264 307 500')
INSERT INTO aeroport VALUES(2, 'Henri Coandă Airport', 'Bucuresti RO', '0212 041 000')
INSERT INTO aeroport VALUES(3, 'Leonardo da Vinci Airport', 'Roma IT', '+39 066 5951')
INSERT INTO aeroport VALUES(4, 'Ferenc Liszt Airport', 'Budapesta HU', '+36 1296 7000')
INSERT INTO aeroport VALUES(5, 'Vienna Airport', 'Viena AU', '+43 1 70070')

SELECT * FROM aeroport
DROP TABLE aeroport
 
 CREATE TABLE companie(
 id_companie int PRIMARY KEY,
 nume_companie varchar(100)
 )

 INSERT INTO companie VALUES (1, 'WizzAir')
 INSERT INTO companie VALUES (2, 'RyanAir')
 INSERT INTO companie VALUES (3, 'Tarom')
 
 SELECT * FROM companie

CREATE TABLE avion(
id_avion int PRIMARY KEY,
nume_avion varchar(100),
culoare varchar(100),
id_companie int FOREIGN KEY REFERENCES companie(id_companie) ON DELETE CASCADE ON UPDATE CASCADE
)

INSERT INTO avion VALUES(1, 'Boeing A380', 'albastru', 1)
INSERT INTO avion VALUES(2, 'Antonov', 'alb', 1)
INSERT INTO avion VALUES(3, 'Concorde', 'alb', 1)
INSERT INTO avion VALUES(4, 'Airbus A380', 'roz', 1)

SELECT * FROM avion

CREATE TABLE deplasare(
id_avion int FOREIGN KEY REFERENCES avion(id_avion) ON DELETE CASCADE ON UPDATE CASCADE,
id_aeroport int FOREIGN KEY REFERENCES aeroport(id_aeroport) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT pk_deplasare PRIMARY KEY (id_avion, id_aeroport),
destinatie varchar(100),
plecare varchar(7),
data_plecare varchar(10)
)

INSERT INTO deplasare VALUES(2,5, 'Roma', '20:30', '10.02.2025')
INSERT INTO deplasare VALUES(1,4, 'Cluj-Napoca', '17:00', '16.02.2025')
INSERT INTO deplasare VALUES(2,2, 'Dubai', '19:45', '25.02.2025')

DROP TABLE deplasare
SELECT * FROM deplasare

DELETE FROM avion WHERE id_avion = 2
SELECT * FROM avion

UPDATE deplasare SET plecare = '17:05' WHERE id_aeroport = 4
SELECT * FROM deplasare
