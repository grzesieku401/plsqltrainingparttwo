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

--11
select miejscowosc, count(*)
from wydawnictwa
group by miejscowosc
order by miejscowosc desc;

--12
create table KSIAZKI(id_ksiazki number(4,0) primary key, tytul VARCHAR2(30), autor VARCHAR2(20), strony NUMBER(4,0), cena NUMBER(6,2), id_wydawnictwa REFERENCES wydawnictwa(id_wydawnictwa));

--13
alter table ksiazki add constraint cena_wieksza_niz_zero check (cena > 0);
alter table ksiazki modify autor VARCHAR2(50 char) not null;

--14
select *
from SYS.user_constraints
where table_name = 'KSIAZKI';

--15
select *
from wydawnictwa;
INSERT INTO ksiazki (
    id_ksiazki,
    tytul,
    autor,
    strony,
    cena,
    id_wydawnictwa
)
select 1, 'Czas Pogardy', 'Andrzej Sapkowski',359, 39.99, 3
from dual
union
select 2, 'Wie¿a Jaskólki', 'Andrzej Sapkowski',403, 39.99, 3
from dual
union
select 3, 'Droga Królów', 'Brandon Sanderson',980, 49.99, 2
from dual
union
select 4, 'Slowa Swiatlosci', 'Brandon Sanderson',941, 49.99, 2
from dual
union
select 5, 'Trylogia ciagu', 'William Gibson',706, 44.99, 2
from dual
union
select 6, 'Bramy Œwiatloœci', 'Maja Lidia Kossakowska',380, 29.99,1
from dual
union
select 7, 'Kroniki Czarnej Kompani', 'Glen Cook',468, 25.99, 4
from dual
union
select 8, 'Harry Potter', 'JK Rowling',319, 37.99, 5
from dual;

--16
select *
from ksiazki;

--17
select sum(cena) wynik, 'Suma' rodzaj
from ksiazki
union
select avg(cena) wynik, 'Œrednia' rodzaj
from ksiazki;

--18
select k.tytul, w.nazwa
from ksiazki k
natural join wydawnictwa w;

--19
select autor, tytul
from ksiazki k
order by tytul;

--20
SELECT *
from ksiazki k
where k.strony = (select max(kk.strony) from ksiazki kk);

--21
select ksiazki.autor, tytul
from ksiazki
where (tytul like 'B%' or tytul like 'T%');