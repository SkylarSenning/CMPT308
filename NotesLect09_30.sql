select avg(dollars)
from orders 
group by pid 
order by pid asc

select avg(dollars)
from orders 

select pid as "Product ID", avg(dollars)
from orders 
group by pid
having avg(dollars) > 559 
order by pid asc 



select p.name, avg(o.dollars)
from orders o,
		products p 
where o.pid = p.pid
group by o.pid 
having avg(dollars) > (select avg(dollars)
						from orders)
order by o.name asc




select p.name, avg(o.dollars)
from orders o inner join products p 
	on o.pid = p.pid
group by o.pid 
having avg(dollars) > (select avg(dollars)
						from orders)
order by o.name asc

select *
from orders o, products p
where o.pid = p.pid 

--TWO WAYS OF DOING THE SAME THING
select *
from orders o,
		products p,
		agents a,
		customers c
where o.pid = p.pid
and	  o.aid = a.aid
and   o.cid = c.cid

select *
from orders o inner join products p  on o.pid = p.pid
			  inner join agents a    on o.aid = a.aid
			  inner join customers c on o.cid = c.cid
where o.pid = p.pid
and	  o.aid = p.aid
and   o.cid = c.cid


--customers that live in the same city (INNER JOIN ON CUSTOMERS TWICE)
select c1.name, c2.name
from customers c1, 
		customers c2
where 	c1.city = c2.city 
	and c1.cid <> c2.city
	and c1.cid <  c2.cid 


--All the customers who have made a order 
select distinct o.cid 
from customers c, orders o 
where cid in (select cid 
				from orders)

select * --disinct o.cid
from customers c full outer join orders o 
	on o.cid = c.cid 
order by c.cid  


CREATE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition


