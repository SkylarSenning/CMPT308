
-- departments --
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
  did     	char(1) not null,
  name    	varchar(16),
  dateFormed    date,
  
 primary key(did)
);        

DROP TABLE IF EXISTS people;
CREATE TABLE people (
  pid     		char(1) not null,
  firstName     	varchar(16),
  lastName     		varchar(20),
  hireDate     		date,
  did	       		char(1) not null references departments(did),
  
primary key(pid)
);

-- FY --
DROP TABLE IF EXISTS FY;
CREATE TABLE fy (
  year      	int not null,
  startDate    	date,
  endDate     	date,
  
 primary key(year)
);

INSERT INTO departments( did, name, dateFormed )
  VALUES('A', 'CS', '6/30/2010');

INSERT INTO departments( did, name, dateFormed )
  VALUES('B', 'IT', '1/1/2013');

INSERT INTO departments( did, name, dateFormed )
  VALUES('C', 'IS', '7/4/2014');
  
  
INSERT INTO people( pid, firstName, lastName, hireDate, did )
  VALUES('1', 'John', 'Smith', '1/23/2008', 'A');

INSERT INTO people( pid, firstName, lastName, hireDate, did )
  VALUES('2', 'Skylar', 'Senning', '9/28/2006', 'A');


INSERT INTO people( pid, firstName, lastName, hireDate, did )
  VALUES('3', 'Jack', 'Rockefeller', '4/4/2012', 'B');
  
INSERT INTO people( pid, firstName, lastName, hireDate, did )
  VALUES('4', 'Chris', 'Pic', '11/11/2013', 'B');

INSERT INTO people( pid, firstName, lastName, hireDate, did )
  VALUES('5', 'Kevin', 'Jackson', '11/11/2014', 'B');


INSERT INTO fy( year, startDate, endDate )
  VALUES(2012, '07/01/2011', '06/30/2012');

INSERT INTO fy( year, startDate, endDate )
  VALUES(2013, '07/01/2012', '06/30/2013');

INSERT INTO fy( year, startDate, endDate )
  VALUES(2014, '07/01/2013', '06/30/2014');
  
INSERT INTO fy( year, startDate, endDate )
  VALUES(2015, '07/01/2014', '06/30/2015');


select *
from departments;

select *
from people;

select *
from fy;


---Query 
select p.firstname, p.lastname, p.hiredate, d.name
from people p, departments d 
where p.did = d.did


----2
select distinct p.pid, p.firstName, p.lastName, p.did, fy.year
from people p, departments, fy
where hireDate >= startDate
	and hiredate <= endDate

---3
select d.name, count(p.pid)
from departments d, people p 
where p.did = d.did
group by d.name

---4
select fy.year, count(p.pid) 
from people p, fy
where p.hireDate >= fy.startDate	
	and p.hiredate <= fy.endDate
group by fy.year

---5
select fy.year, count(d.did) 
from departments d, fy
where d.dateFormed >= fy.startDate	
	and d.dateFormed <= fy.endDate
group by fy.year
---6
select distinct d.name
from departments d, people p 
where d.name NOT IN (select name
				from departments d, people p
				where p.did = d.did
				group by d.name
				)
--7
select *
from people
where did is null

--8


