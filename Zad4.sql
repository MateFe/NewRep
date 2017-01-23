
CREATE TABLE DYPLOMANCI (
	ID_DYPL    		 	INTEGER 		PRIMARY KEY,
	ID_TEMAT 			INTEGER			NOT NULL,
	IMIE_DYPL           VARCHAR(30) 	NOT NULL,
	NAZWISKO_DYPL       VARCHAR(30)		NOT NULL,
	SPECIALNOSC	        VARCHAR(40)		NOT NULL,
	ADRES_DYPL          VARCHAR(60),
	TELEFON_DYPL        VARCHAR(12),
	DATA_UR          	DATE,
	MIEJSCE_UR			VARCHAR(30),
);
	
CREATE TABLE TEMATY (
	ID_TEMAT			INTEGER			PRIMARY KEY,
	ID_ZAKR				INTEGER			NOT NULL,
	ID_DYPL				INTEGER			NOT NULL,
	NAZW_TEM			VARCHAR(30)		NOT NULL,
	DATA_WYD			DATE,
	DATA_ZLOZ			DATE,
	DATA_OBR			DATE,
	OPIS_PRAC			VARCHAR(120),
);

CREATE TABLE PROMOTORZY (
	ID_TEMAT			INTEGER			NOT NULL,
	ID_PRAC				INTEGER			NOT NULL,
	DATA_OP				DATE,
	CONSTRAINT PK_TABLE PRIMARY KEY (ID_TEMAT)
);	

CREATE TABLE ZAKRESY (
	ID_ZAKR				INTEGER			NOT NULL,
	NAZWA_ZAKR			VARCHAR(40),
	CONSTRAINT PK_TABLE PRIMARY KEY (ID_ZAKR)
);

CREATE TABLE PRACOWNICY (
	ID_PRACOW			INTEGER			NOT NULL,
	NAZWISKO_PR			VARCHAR(30)		NOT NULL,
	IMIE_PR				VARCHAR(30)		NOT NULL,
	ST_NAUK				VARCHAR(30),
	KATEDRA				VARCHAR(40),
	NR_POK				VARCHAR(10),
	WYNAGRODZENIA		NUMERIC(8,2),
	NADGODZINY			NUMERIC(8,2),
	PRIMARY KEY (ID_PRACOW)
);

CREATE TABLE RECENZENCI (
	ID_TEMAT			INTEGER			REFERENCES TEMATY(ID_TEMAT),
	ID_PRAC				INTEGER			REFERENCES PRACOWNICY(ID_PRACOW),
	DATA_REC			DATE,
	PRIMARY KEY (ID_TEMAT)

);

ALTER TABLE DYPLOMANCI
ADD FOREIGN KEY "FK_DYPLOMANCI_ID_TEMAT_TEMATY" (ID_TEMAT)
REFERENCES TEMATY (ID_TEMAT)
ON UPDATE RESTRICT
ON DELETE RESTRICT;

ALTER TABLE TEMATY
ADD FOREIGN KEY "FK_TEMATY_ID_ZAKR_ZAKRESY" (ID_ZAKR)
REFERENCES ZAKRESY (ID_ZAKR)
ON UPDATE RESTRICT
ON DELETE RESTRICT;


ALTER TABLE PROMOTORZY
ADD FOREIGN KEY "FK_TEMATY_ID_TEMAT_tematy" (ID_TEMAT)
REFERENCES tematy (ID_TEMAT)
ON UPDATE RESTRICT
ON DELETE RESTRICT;

ALTER TABLE PROMOTORZY
ADD FOREIGN KEY "FK_PRACOWNICY_ID_PRAC_PRACOWNICY" (ID_PRAC)
REFERENCES PRACOWNICY (ID_PRACOW)
ON UPDATE RESTRICT
ON DELETE RESTRICT;


INSERT INTO ZAKRESY
	VALUES (1,'informatyka');
INSERT INTO ZAKRESY
	VALUES(2,'elektronika');

INSERT INTO PRACOWNICY
	VALUES	(1,'Bulgaj','Aneta','mag inz.','IwZ','122',1200.00,NULL);
INSERT INTO PRACOWNICY
	VALUES	(2,'Nalecki','Iwan','dr inz.','IwZ','123',2500.00,1000.00);
INSERT INTO PRACOWNICY
	VALUES	(3,'Zinczuk','Jaroslaw','dr hab. inz.','IwZ','120',4000.00,6000.00);
INSERT INTO PRACOWNICY
	VALUES	(4,'Majorska','Joanna','dr hab.','IK','200',4500.00,2000.00);
INSERT INTO PRACOWNICY
	VALUES	(5,'Kosinski','Tomasz','dr inz.','IK','201',2600.00,2000.00);
INSERT INTO PRACOWNICY
	VALUES	(6,'Dmytrzak','Jakub','mag inz.','IK','200',1500.00,2000.00);
INSERT INTO PRACOWNICY
	VALUES	(7,'Winczur','Radoslaw','dr hab. inz.','TC','321',5000.00,NULL);
INSERT INTO PRACOWNICY
	VALUES	(8,'Kuzmicz','Joanna','dr inz.','TC','326',2500.00,2000.00);
INSERT INTO PRACOWNICY
	VALUES	(9,'Doczekalski','Zbigniew','dr hab.inz.','SE','432',4500.00,8000.00);
INSERT INTO PRACOWNICY
	VALUES	(10,'Janda','Krystyna','mag inz.','SE','433',1500.00,2000.00);

INSERT	INTO TEMATY
	VALUES (1,1,1,'system internetowy','2004-04-04','2005-05-25',NULL,'system internetowy hoteli');
INSERT	INTO TEMATY
	VALUES (2,1,2,'system internetowy','2004-04-04','2005-05-20',NULL,'system internetowy hoteli');
INSERT	INTO TEMATY
	VALUES (3,1,3,'system bazodanowy','2004-04-04',NULL,NULL,NULL);
INSERT	INTO TEMATY
	VALUES (4,1,4,'system do zarzadzania','2004-03-05','2005-05-25','2005-06-30','system do zarzadzania hoteli');
INSERT	INTO TEMATY
	VALUES (5,1,5,'system do zarzadzania','2004-03-05','2005-04-15',NULL,'system do zarzadzania hoteli');
INSERT	INTO TEMATY
	VALUES (6,1,6,'system informatyczny','2004-03-05',NULL,NULL,NULL);
INSERT	INTO TEMATY
	VALUES (7,2,7,'mala centrala','2004-04-10','2005-06-25','2005-07-30','system do zarzadzania mala centrala');
INSERT	INTO TEMATY
	VALUES (8,2,8,'mala centrala','2004-04-10','2005-06-25','2005-07-30','system do zarzadzania mala centrala');
INSERT	INTO TEMATY
	VALUES (9,2,9,'sieci telekomunikacyjne','2004-04-10','2005-06-01',NULL,NULL);
INSERT	INTO TEMATY
	VALUES (10,2,10,'odbiornik superheterodynowy','2004-04-10','2005-05-25','2005-06-30',NULL);
INSERT	INTO TEMATY
	VALUES (11,2,11,'urzadzenia akwizycji','2004-04-10','2005-06-25','2005-07-08','urzadzenia akwizycji danych ');

INSERT INTO DYPLOMANCI
	VALUES (1,1,'Michalski','Piotr','IwZ','Koszalin, Rejtana 5a, p.1','3478-678','1985-02-27','Wroclaw');
INSERT INTO DYPLOMANCI
	VALUES (2,2,'Kaczorowski','Pawel','IwZ','Koszalin, Rejtana 5a, p.1','3478-678','1984-01-01','Wroclaw');
INSERT INTO DYPLOMANCI
	VALUES (3,3,'Cieslik','Anna','IwZ','Bialogard,  Koszalinska 24','3456-456','1985-04-09','Bialogard');
INSERT INTO DYPLOMANCI
	VALUES (4,4,'Dolmatynska','Mariola','PKiSI','Koszalin, Rejtana 5a, p.123','3478-978','1985-08-09','Bobolice');
INSERT INTO DYPLOMANCI
	VALUES (5,5,'Majewska','Ludmila','PKiSI','Koszalin, Gdanska 32, m.13','3443-412','1984-02-27','Koszalin');
INSERT INTO DYPLOMANCI
	VALUES (6,6,'Pawlak','Waldemar','PKiSI','Koszalin, Rejtana 5a, p.32','3478-778','1984-03-27','Bialogard');
INSERT INTO DYPLOMANCI
	VALUES (7,7,'Kozlowski','Marek','TC','Koszalin, Rejtana 5a, p.23','3478-999','1985-02-09','Wroclaw');
INSERT INTO DYPLOMANCI
	VALUES (8,8,'Konrad','Michal','TC','Koszalin, Rejtana 5a, p.23','3478-999','1984-02-28','Wroclaw');
INSERT INTO DYPLOMANCI
	VALUES (9,9,'Wieliczko','Natalia','TC','Koszalin, Wagnera 34, m.23','3434-991','1985-01-29','Koszalin');
INSERT INTO DYPLOMANCI
	VALUES (10,10,'Babiszewska','Magdalena','SE','Koszalin, Rejtana 5a, p.145','3478-889','1985-10-09','Lodz');
INSERT INTO DYPLOMANCI
	VALUES (11,11,'Rutkowski','Konrad','SE','Koszalin, Wolinska 35','3413-444','1984-11-25','Koszalin');

	
INSERT INTO PROMOTORZY
	VALUES (1,4,'2005-05-27');
INSERT INTO PROMOTORZY
	VALUES (2,2,'2005-05-27');
INSERT INTO PROMOTORZY
	VALUES (3,5,NULL);
INSERT INTO PROMOTORZY
	VALUES (4,5,'2005-05-29');
INSERT INTO PROMOTORZY
	VALUES (5,3,'2005-04-17');
INSERT INTO PROMOTORZY
	VALUES (6,2,NULL);
INSERT INTO PROMOTORZY
	VALUES (7,8,'2005-06-28');
INSERT INTO PROMOTORZY
	VALUES (8,7,'2005-06-28');
INSERT INTO PROMOTORZY
	VALUES (9,9,'2005-06-08');
INSERT INTO PROMOTORZY
	VALUES (10,7,'2005-05-27');
INSERT INTO PROMOTORZY
	VALUES (11,8,'2005-06-30');
	
	
INSERT INTO RECENZENCI
	VALUES (1,2,'2005-05-30');
INSERT INTO RECENZENCI
	VALUES (2,3,'2005-05-30');
INSERT INTO RECENZENCI
	VALUES (3,2,NULL);
INSERT INTO RECENZENCI
	VALUES (4,4,'2005-06-01');
INSERT INTO RECENZENCI
	VALUES (5,5,'2005-04-20');
INSERT INTO RECENZENCI
	VALUES (6,5,NULL);
INSERT INTO RECENZENCI
	VALUES (7,7,'2005-06-30');
INSERT INTO RECENZENCI
	VALUES (8,8,'2005-06-30');
INSERT INTO RECENZENCI
	VALUES (9,8,'2005-06-10');
INSERT INTO RECENZENCI
	VALUES (10,9,'2005-05-29');
INSERT INTO RECENZENCI
	VALUES (11,9,'2005-07-01');


-- //CW4
	
SELECT * 
	FROM TEMATY;
--1--
SELECT IMIE_PR, NAZWISKO_PR 
	FROM PRACOWNICY;
--2--
SELECT IMIE_PR, NAZWISKO_PR, ST_NAUK  
	FROM PRACOWNICY  
	WHERE WYNAGRODZENIA=2500 ;
--3--
SELECT IMIE_PR, NAZWISKO_PR 
	FROM PRACOWNICY 
	WHERE KATEDRA='IK';
--4--
SELECT ID_TEMAT 
	FROM TEMATY
	WHERE OPIS_PRAC IS NULL;
--5--
SELECT * 
	FROM PRACOWNICY 
	ORDER BY WYNAGRODZENIA DESC;
--6--
SELECT IMIE_DYPL || 'MARCIN ' 
	FROM DYPLOMANCI 
	WHERE MIEJSCE_UR<> 'Wroclaw';
--7--
SELECT * 
	FROM PRACOWNICY 
	WHERE NADGODZINY IS NULL;
--8--
SELECT DISTINCT MIEJSCE_UR 
	FROM DYPLOMANCI;
--9--
SELECT * 
	FROM PRACOWNICY 
	WHERE (KATEDRA='IK'  OR KATEDRA='IwZ' ) 
	AND ST_NAUK='dr inz.';
--10--
SELECT * 
	FROM PRACOWNICY 
	WHERE (KATEDRA='IK' OR KATEDRA='IwZ') 
	AND ST_NAUK='dr hab.';
--11--
SELECT *
	FROM PRACOWNICY
	WHERE ST_NAUK IN ('dr inz.', 'dr hab.', 'inz');
--12--
SELECT * 
	FROM TEMATY 
	WHERE DATA_WYD BETWEEN 2005-01-01 AND 2006-01-01;
--13--
SELECT IMIE_PR, NAZWISKO_PR 
	FROM PRACOWNICY 
	WHERE NAZWISKO_PR='K%';
--14--
	
-- //CW5	
SELECT IMIE_PR, COUNT(NADGODZINY)
	FROM PRACOWNICY
	GROUP BY IMIE_PR;

--1--	
SELECT IMIE_PR, NAZWISKO_PR
	FROM PRACOWNICY
	WHERE NAZWISKO_PR LIKE '%K%A%';
--2--	
SELECT DYPLOMANCI.IMIE_DYPL, DYPLOMANCI.NAZWISKO_DYPL, TEMATY.NAZW_TEM
	FROM DYPLOMANCI
	INNER JOIN TEMATY
	ON TEMATY.ID_DYPL=DYPLOMANCI.ID_DYPL;
--3--	
SELECT PRACOWNICY.IMIE_PR AS IMIE, PRACOWNICY.NAZWISKO_PR AS NAZWISKO, TEMATY.NAZW_TEM AS TEMAT
	FROM PRACOWNICY
	JOIN RECENZENCI
	ON RECENZENCI.ID_PRAC=PRACOWNICY.ID_PRACOW
	JOIN TEMATY
	ON RECENZENCI.ID_TEMAT=TEMATY.ID_TEMAT
	WHERE PRACOWNICY.KATEDRA='IK';
--4--
SELECT * 
	FROM TEMATY
	JOIN RECENZENCI
	ON RECENZENCI.ID_TEMAT=TEMATY.ID_TEMAT
	WHERE TEMAT.DATA_WYD BETWEEN '2004-01-01' AND '2005-01-01';
--5--
SELECT NR_POK AS NUMER_POKOJU
	FROM PRACOWNICY;
--6--
SELECT count(NR_POK) AS ZLICZONE_POKOJE
	FROM PRACOWNICY;
--7--
SELECT NAZWISKO_PR, IMIE_PR, WYNAGRODZENIA+NADGODZINY
	FROM PRACOWNICY;
--8--	
SELECT IMIE_DYPL, NAZWISKO_DYPL, DATEPART(year, DATA_UR) AS ROK, 
	DATEPART(month, DATA_UR) AS MIESIAC, 
	DATEPART(day, DATA_UR) AS DZIEN
	FROM DYPLOMANCI;
--9--
SELECT DYPLOMANCI.NAZWISKO_DYPL, 
	TEMATY.NAZW_TEM, 
	DATEDIFF(day, TEMATY.DATA_ZLOZ, TEMATY.DATA_OBR)
	FROM TEMATY
	INNER JOIN DYPLOMANCI
	ON TEMATY.ID_DYPL=DYPLOMANCI.ID_DYPL;
--10--
SELECT TEMATY.DATA_OBR, RECENZENCI.DATA_REC,
	LEFT(PRACOWNICY.IMIE_PR, 5)
	FROM TEMATY
	INNER JOIN RECENZENCI
	INNER JOIN PRACOWNICY
	WHERE TEMATY.DATA_OBR IS NOT NULL;
--11--	
SELECT AVG(PRACOWNICY.WYNAGRODZENIA),
	MAX(PRACOWNICY.WYNAGRODZENIA),
	MIN(PRACOWNICY.WYNAGRODZENIA),
	COUNT(PRACOWNICY.IMIE_PR),
	KATEDRA
	FROM PRACOWNICY
	GROUP BY KATEDRA;
--12--
SELECT KATEDRA
	FROM PRACOWNICY
	GROUP BY KATEDRA;
	
--//CW6

SELECT AVG(PRACOWNICY.WYNAGRODZENIA),
	MAX(PRACOWNICY.WYNAGRODZENIA),
	MIN(PRACOWNICY.WYNAGRODZENIA),
	COUNT(PRACOWNICY.IMIE_PR),
	IMIE_PR, NAZWISKO_PR
	FROM PRACOWNICY
	WHERE SUM(WYNAGRODZENIA)>8000;

SELECT IMIE_PR
	FROM PRACOWNICY;
