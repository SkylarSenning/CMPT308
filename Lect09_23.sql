select distinct city
from customers 
union all
select distinct city
from agents

select max(qty)
from orders

select count(*)
from orders 

select *
from orders 
where qty <
	(select avg(qty)
	from orders)

select aid, count(*) as "Number of orders"
from orders
group by aid
order by "Number of orders" desc
limit 2

select aid, count(*) as "Number of orders"
from orders
group by aid
having count(*) in 
(select "Number of orders"
from
(select aid, count (*) as "Number of orders"