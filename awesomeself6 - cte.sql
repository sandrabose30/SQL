-- CTE
-- What is a CTE?

-- A CTE (Common Table Expression) is a temporary result set that exists only for the execution of a single SQL statement. 
-- It makes complex queries easier to read and maintain.

WITH HighSales AS
(
    SELECT
        SPID,
        Amount,
        Boxes
    FROM sales
    WHERE Amount > 5000
)

SELECT *
FROM HighSales;

-- midhun
with salesdata as
(select p.Salesperson,sum(amount) as 'total_sales'
from sales s
join people p on s.spid = p.spid
group by p.Salesperson)


select * from
salesdata
where total_sales>200000
order by total_sales desc;


WITH SalesPersonTotal AS
(
    SELECT
        SPID,
        SUM(Amount) AS Total_Sales
    FROM sales
    GROUP BY SPID
)

SELECT *
FROM SalesPersonTotal
WHERE Total_Sales > 200000;

-- Write a CTE to calculate the total sales amount for each salesperson. Display salesperson name and total sales.
with total_salesperson as
(
	select p.Salesperson, sum(amount) as 'total_sales'
	from sales s
	join people p 
	on s.spid = p.spid
    group by p.Salesperson
)
select * 
from total_salesperson;

-- Create a CTE to find the total number of boxes sold by each product.
with total_boxes_product as
(
	select sum(s.boxes) as total_boxes, pr.product
    from sales s
    left join products pr
    on s.pid=pr.pid
)
-- Using a CTE, find all sales transactions where the sales amount is greater than 5,000.

-- Create a CTE to calculate the average sales amount for each country.

-- Using a CTE, find the total number of transactions handled by each salesperson.

-- Create a CTE to calculate total sales for each salesperson and display only those whose total sales exceed 50,000.

-- Write a CTE to find the top 5 products based on total boxes sold.

-- Using a CTE, calculate the total sales amount for each country and identify countries whose sales are above the overall average country sales.

-- Create a CTE to calculate monthly sales for each month. Display the month and total sales.

-- Write a CTE to find salespeople whose total boxes sold are greater than the average boxes sold per salesperson.

-- Using a CTE, find the highest-selling product in each country based on total sales amount.

-- Create a CTE to calculate total sales for each salesperson and join it with the People table to display their team.

-- Write a CTE to identify products whose total sales amount is greater than the average product sales amount.

-- Using a CTE, calculate the total sales and total boxes sold for each salesperson. Display only salespeople who sold more than 1,000 boxes.

-- Create a CTE to find the country with the highest average sales amount per transaction.
