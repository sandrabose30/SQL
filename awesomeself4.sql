-- EXISTS
select * from geo;
select * from people;
select * from products;

SELECT p.salesperson
FROM people p
where Exists
(
	SELECT * 
)