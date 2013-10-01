SELECT *
FROM students
ORDER BY name ASC 

SELECT name
FROM students 
WHERE sid in (SELECT sid
		FROM grades
		WHERE tid in (SELECT tid
				FROM teachers 
				WHERE name = 'Adams')
		);

SELECT *
FROM teachers
WHERE tid in (SELECT tid
		FROM grades
		WHERE cid in (SELECT cid
				FROM subjects
				WHERE name = 'Biology')
		);


SELECT name
FROM teachers
WHERE tid NOT IN ( SELECT tid 
		FROM grades 
		);

SELECT name
FROM students 
WHERE sid NOT IN (SELECT sid
		  FROM grades
		  )
--Names of students in the same class
select name
from students 
where sid in
	(select sid
	from grades g1
	where (select count(*)
		from grades g2
		where g1.sid = g2.sid
		and   g1.tid = g2.tid) > 1
	order by sid
	);
---------
select t.name		as "Teacher",
	sub.name	as "Subject",
	s.name		as "Student",
	g1.grade 
from students s,
     grades g1,
     teachers t,
     subjects sub,
     grades g2
where g1.sid = s.sid
 and  g1.tid = t.tid
 and g1.cid = sub.cid
 and g1.tid = g2.tid
 and g1.sid = g2.sid
 and g1.sid <> g2.sid
 order by t.name, sub.name, s.name
---------


create table (
	fiscalYear	int		not null check (fiscalYear > 999,
	startDate 	timestamp	not null,
	endDate		timestamp 	not null unique check (endDate > startDate),	
  primary key(fiscalYear)
)

--------
select 
-----
SELECT *
INTO people
FROM  students 

UPDATE people
SET NAME = 'Anthony'
WHERE sid = '7'

SELECT *
UPDATE people
SET NAME = 'Amelia'
WHERE sid = '6'

SELECT *
FROM people

UPDATE people 
SET NAME = NULL
wheere name like 'A%'

Drop table people


---------
select *
from grades

update grades 
set sid = sid + 1; 


