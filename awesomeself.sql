select * from sales;
select * from geo;
select * from people;
select * from products;
select SaleDate, Amount from sales;
select Salesperson, Team from people;
-- Adding a calculated column with SQL
select saledate, amount, boxes, amount/boxes from sales;

-- Adding a calculated column with SQL
select saledate, amount, boxes, amount/boxes as 'Amount per boxes' from sales;

-- Using WHERE Clause in SQL
select * from sales where amount>10000;

-- no of sales with customers <50
select * from sales where customers<50;

-- no of sales with boxes >250
select * from sales where boxes>250;

-- sales made by sp10
select * from sales where spid = 'sp10';

-- total sales of product p22
select * from sales where pid = 'p22';

-- Showing sales data where amount is greater than 10,000 by ascending order
select * from sales where amount>10000 order by amount;

-- Showing sales data where amount is greater than 10,000 by descending order
select * from sales where amount>10000 order by amount desc; 

-- Showing sales data where geography is g1 by product ID &
-- descending order of amounts
select * from sales where Geoid = 'g1' order by pid,Amount desc;

-- logical operators
select * from sales where amount>10000 and SaleDate>='2022-01-01';

-- customers<100 ,  boxes>500
select * from sales where Customers<100 and Boxes>500;

-- identify the products which has either amount<1000 or boxes <100
select pid from sales where amount<1000 or boxes<100;

-- Using year() function to select all data in a specific year
select saledate, amount from sales where amount>10000 and year(saledate)=2022 order by amount desc;

-- BETWEEN condition in SQL with < & > operators
select * from sales
where Boxes>0 and Boxes<50;

-- Using the between operator in SQL 
select * from sales
where Boxes between 0 and 50;

select * from sales
where Boxes>=0 and Boxes<=50;

-- Using weekday() function in SQL
select SaleDate,Amount,Boxes,weekday(saledate) as 'Dayofweek' 
from sales
where weekday(saledate)=4;

--  weekend sales
select spid,SaleDate, weekday(saledate) as 'weekno'
from sales
order by weekday(saledate); 

-- sales of product p02 in wednesday
select pid,weekday(saledate) as 'weekno'
from sales
where pid='p02' and weekday(saledate)=2; -- 82

-- total sales made by sales person sp20 in monday
select spid,weekday(saledate) as 'weekno'
from sales
where spid='sp20' and weekday(saledate)=0;-- 54

-- identify highest sale made in tuesday and lowest sale made in friday

select amount,weekday(saledate) as 'weekno'
from sales
where weekday(saledate)=1
order by Amount desc; -- 24367



select amount,weekday(saledate) as 'weekno'
from sales
where weekday(saledate)=4
order by Amount ; -- 21


-- Working with People table
select * from people;

-- OR operator in SQL
select * from people
where team='Delish' or Team='jucies';-- 19

-- IN operator in SQL

select * from people
where team in ('Delish','jucies');-- 19



-- LIKE operator in SQL
select * from people
where Salesperson like 'B%';-- 4

select * from people
where Salesperson like '%y';-- 6

select * from people
where Salesperson like '%i%';

select * from people
where Salesperson like 'an%'; -- Andria Kimpton

select * from people
where Salesperson like '%n_';
-- Barr Faughny
-- Gigi Bohling
-- Curtice Advani
-- Rafaelita Blaksland

select * from people
where Salesperson like '_e%';



select * from sales;

-- Using CASE to create branching logic in SQL
select SaleDate,Amount,
	case when Amount<1000 then 'under 1k'
		when Amount<5000 then 'under 5k'
        when Amount<10000 then 'under 10k'
	    else '10k and more'
	end as 'amount_category'
		
 from sales
 order by Amount;