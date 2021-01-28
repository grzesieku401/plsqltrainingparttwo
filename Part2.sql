--1
CREATE TABLE WYDAWNICTWA( id_wydawnictwa NUMBER(4,0) primary key, nazwa VARCHAR2(10), miejscowosc VARCHAR2(20));

--2
desc wydawnictwa;

--3
ALTER TABLE WYDAWNICTWA MODIFY (nazwa VARCHAR2(30) NOT NULL);

--4
INSERT INTO WYDAWNICTWA VALUES(1,'Helion','Gliwice');

INSERT INTO WYDAWNICTWA(ID_WYDAWNICTWA, NAZWA, MIEjSCOWOSC) VALUES(1,'Helion','Gliwice');

--5
INSERT INTO WYDAWNICTWA(ID_WYDAWNICTWA, NAZWA, MIEJSCOWOSC) VALUES (1,'PWN','Warszawa');

--6
INSERT INTO WYDAWNICTWA(ID_WYDAWNICTWA, NAZWA, MIEJSCOWOSC) VALUES (2, null,'Warszawa');

--7
select * from wydawnictwa;

--8
INSERT INTO WYDAWNICTWA(ID_WYDAWNICTWA,NAZWA, MIEJSCOWOSC) 
SELECT 2, 'MAG','Warszawa'
FROM DUAL
UNION
SELECT 3, 'Gandalf','Kraków'
FROM DUAL
UNION
SELECT 4, 'Gildia','Gdañsk'
FROM DUAL
UNION
SELECT 5, 'KUL','Lublin'
FROM DUAL;

--9
select nazwa
from wydawnictwa
order by nazwa desc;

--10
select nazwa
from wydawnictwa 
where miejscowosc like 'L%';
