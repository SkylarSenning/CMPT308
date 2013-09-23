SELECT *
FROM students
ORDER BY name 

SELECT s.name
FROM students s, teachers t, grades g 
WHERE (s.sid = g.sid)
	AND (t.tid = g.tid)
	AND (t.name = 'Adams')

SELECT t.name
FROM subjects c, teachers t, grades g
WHERE (c.cid = g.cid)
	AND (t.tid = g.tid)
	AND (c.name = 'Biology')


SELECT name
FROM teachers
WHERE tid NOT IN ( SELECT tid 
		FROM grades 
		)

SELECT name
FROM students 
WHERE sid NOT IN (SELECT sid
		  FROM grades
		  )
