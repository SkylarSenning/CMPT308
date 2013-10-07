-- 1. Get the cities of agents booking an order for customer c002. Use a subquery.
SELECT city
FROM agents
WHERE aid IN 
	(SELECT aid 
	 FROM orders
	 WHERE cid = 'c002')
ORDER BY city;

-- 2. Get the cities of agents booking an order for customer c002. Use joins.
SELECT a.city
FROM orders o, agents a , customers c
WHERE c.aid = o.aid 
	AND o.cid = c.cid 
	AND c.cid = 'c002'

-- 3. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use subqueries.
SELECT cid, name
FROM customers
WHERE cid NOT IN (SELECT cid
		FROM orders
		WHERE aid = 'a03'
		)


-- 4. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use joins.
SELECT distinct o2.pid
FROM  orders o1, 
	  orders o2,
	  agents a, 
	  customers c
WHERE o1.aid = o2.aid 
	AND o1.cid = c.cid 
	AND c.city = 'Kyoto'
ORDER by pid asc
--
---Class Example
select distinct pid
from orders
where aid in (select aid
				from orders o,
					customers c
				where o.cid = c.cid 
				and c.city = 'Kyoto')
order by pid asc

-- 5. Get the names of customers who have never placed an order. Use a subquery.
SELECT c.name 
FROM customers c
WHERE c.cid NOT IN (SELECT cid 
					FROM orders
					)

--6.Get	the	names of customers who have never placed an	order. Use an outer join.
SELECT c.name 
FROM customers c full outer join orders o  on c.cid = o.cid 
WHERE o.cid IS null 


--7.Get the	names of customers who placed at least one order through an	agent in their city, along with	those agent(s) names.
SELECT distinct c.name as "Customer", a.name as "Agent"
FROM customers c, agents a, orders o 
WHERE c.cid = o.cid
	AND a.aid = o.aid 
	AND c.city = a.city

--8. Get the names	of customers and agents in the same	city, along	with the name of the city, regardless of whether or not the	customer has ever	
--placed an	order with	that agent.
SELECT DISTINCT c.name AS "Customer", a.name AS "Agent", c.city AS "City"
FROM customers c, agents a
WHERE c.city = a.city 

--9.Get	the	name and city of customers who live	in the city	where THE least number of products are made.
SELECT c.name, c.city
FROM customers c 
WHERE c.city  IN (SELECT city
				FROM products p 
				GROUP BY p.city
				ORDER BY count(quantity) ASC 
				LIMIT 1);

--10.Get the name and city	of customers who live in a city	where the most number of products are made.
SELECT c.name, c.city
FROM customers c 
WHERE c.city  IN (SELECT city
				FROM products p
				GROUP BY p.city
				ORDER BY count(quantity) DESC
				LIMIT 1);

--11. Get the name and city of customers who live in any city where the most number of products are made.
SELECT c.name, c.city
FROM customers c 
WHERE c.city  IN (SELECT city
				FROM products
				WHERE quantity = (SELECT max(quantity)
									FROM products))
ORDER BY c.city ASC;

-- 12. List the products whose priceUSD is above the average priceUSD.
SELECT name
FROM products p
WHERE priceUSD > (SELECT avg(priceUSD)
					FROM products)
ORDER BY name ASC;

-- 13. Show the customer name, pid ordered, and the dollars for all customer orders, sorted by dollars from high to low.
SELECT DISTINCT c.name, o.pid, o.dollars 
FROM customers c, orders o, products p
WHERE c.cid = o.cid 
ORDER BY dollars DESC;

-- 14. Show all customer names (in order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs.
SELECT c.name AS "Customer" , coalesce(sum(o.dollars), 0.00)
FROM customers c
left join on orders on c.cid= o.cid
GROUP by cid
ORDER BY name ASC

--15. Show the names of all customers who bought products from agents based in New York along with the names of
--     the products they ordered, and the names of the agents who sold it to them.
SELECT c.name, p.name, a.name
FROM customers c, 
	 products p, 
	 agents a, 
	 orders o
WHERE c.cid = o.cid 
	AND p.pid = o.pid
	AND a.aid = o.aid 
	AND p.city = 'New York'

-- 16. Write a query to check the accuracy of the dollars column in the Orders table. This means calculating
--     Orders.dollars from other data in other tables and then comparing those values to the values in Orders.dollars.
-- This query, if it finds any errors, displays the ordno of where the error occurs, the given price and calculated price.
SELECT o.ordno AS "Order Number" , o.dollars "Price" , ((p.priceUSD * o.qty) - (c.discount / 100) * (p.priceUSD * o.qty)) AS "Price Check"
FROM orders o, products p, customers c 
WHERE o.cid = c.cid 
	AND o.pid = p.pid
ORDER BY o.ordno ASC;

---- 17. Create an error in the dollars column of the Orders table so that you can verify your accuracy checking query.
UPDATE Orders
SET dollars = dollars - 1
WHERE ordno = 1017;
























