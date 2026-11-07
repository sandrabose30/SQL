select * from geo;
select * from people;
select * from products;

-- 4. EXISTS

-- EXISTS checks whether the subquery returns at least one row.



-- Find salespeople who have made at least one sale.

SELECT
    p.SPID,
    p.Salesperson
FROM people p
WHERE EXISTS (
    SELECT 1
    FROM sales s
    WHERE s.SPID = p.SPID
);

-- For each salesperson:

-- John
--  ↓
-- Does a sale exist for John?
--  ↓
-- YES → include John
-- Mary
--  ↓
-- Does a sale exist for Mary?
--  ↓
-- NO → don't include Mary



-- 5. NOT EXISTS

-- This is extremely useful.

-- Question

-- Find salespeople who have NEVER made a sale.

SELECT
    p.SPID,
    p.Salesperson
FROM people p
WHERE NOT EXISTS (
    SELECT 1
    FROM sales s
    WHERE s.SPID = p.SPID
);


-- Does a sale exist?
--        ↓
--       NO
--        ↓
-- Return salesperson


-- manually creating null values


select * from sales;

INSERT INTO sales (SaleDate, SPID, PID, Amount, Boxes)
VALUES ('2024-01-01', 'SP110', 'P110', NULL, NULL);



select * from sales;


-- Basic null handling
SELECT *
FROM sales
WHERE Amount IS NULL;

-- COALESCE is a function used to handle NULL values.

-- It returns the first non-NULL value from a list of values.

-- Using COALESCE (replace NULL values)

SELECT Amount,COALESCE(Amount, 0) AS Clean_Amount
FROM sales;

-- Replace NULL Boxes with 0

SELECT SaleDate, Amount, COALESCE(Boxes, 0) AS Boxes
FROM sales;



select * from people;

INSERT INTO people ( Salesperson,SPID, Team,Location)
VALUES ("Kenny",'SP220', NULL, NULL);

-- Replace NULL Team with 'No Team'


select * from people;

SELECT Salesperson, COALESCE(Team, 'No Team') AS Team
FROM people
order by Salesperson;


-- WHERE → filters rows before grouping
-- HAVING → filters groups after aggregation

-- HAVING = filter results after applying aggregate functions (SUM, AVG, COUNT, etc.)-- 

-- Shows only salespersons with total sales > 1500000

SELECT SPID, SUM(Amount) AS Total_Sales
FROM sales
GROUP BY SPID
HAVING SUM(Amount) > 1500000;-- 15 lkh

-- Count number of sales per SPID-- 
SELECT SPID, COUNT(*) AS Total_Orders
FROM sales
GROUP BY SPID
HAVING COUNT(*) > 300;

-- treating null values in amount column with 0
SELECT SPID, SUM(COALESCE(Amount, 0)) AS Total_Sales
FROM sales
GROUP BY SPID
HAVING SUM(COALESCE(Amount, 0)) > 1500000;

select * from sales;

SELECT SPID,SUM(Amount) AS Total_Sales
FROM sales
WHERE Boxes > 5
GROUP BY SPID
HAVING SUM(Amount) > 200000;




-- LIMIT
-- Show first 5 rows from sales


SELECT *
FROM sales
LIMIT 10;


-- lowest first 5 sales
SELECT *
FROM sales
ORDER BY Amount 
LIMIT 20;


-- highest 5 sales
SELECT *
FROM sales
ORDER BY Amount DESC
LIMIT 5;


-- skipping first 5 and extracting next 5 rows
SELECT *
FROM sales
ORDER BY Amount 
LIMIT 5 OFFSET 5;

-- What is a Window Function?

-- A window function performs a calculation across a group of related rows without combining those rows into one row.

-- This is the key difference:

-- GROUP BY


SELECT
    SPID,
    SUM(Amount) AS total_sales
FROM sales
GROUP BY SPID;


SELECT
    SPID,
    SaleDate,
    Amount,
    SUM(Amount) OVER(PARTITION BY SPID) AS total_sales
FROM sales;



-- FUNCTION() OVER(
--     PARTITION BY ...
--     ORDER BY ...
-- )



-- 1. ROW_NUMBER()

-- ROW_NUMBER() gives every row a unique sequential number.

-- Example

-- Number all sales based on sale date.



SELECT
    SaleDate,
    SPID,
    Amount,
    ROW_NUMBER() OVER(
        ORDER BY SaleDate
    ) AS row_num
FROM sales;



-- ROW_NUMBER with PARTITION BY ⭐

-- Number each salesperson's sales separately.



SELECT
    SPID,
    SaleDate,
    Amount,
    ROW_NUMBER() OVER(
        PARTITION BY SPID
        ORDER BY SaleDate
    ) AS sale_number
FROM sales;




-- 2. RANK()

-- RANK() assigns the same rank to tied values.

-- Rank sales based on Amount.


SELECT
    SaleDate,
    SPID,
    Amount,
    RANK() OVER(
        ORDER BY Amount DESC
    ) AS sales_rank
FROM sales;



-- 3. DENSE_RANK()

-- DENSE_RANK() also gives the same rank to ties, but doesn't skip the next rank.

SELECT
    SaleDate,
    SPID,
    Amount,
    DENSE_RANK() OVER(
        ORDER BY Amount DESC
    ) AS sales_rank
FROM sales;



-- Values:     50000  40000  40000  30000

-- RANK:          1      2      2      4

-- DENSE_RANK:    1      2      2      3



-- 5. NTILE()

-- NTILE() divides rows into a specified number of groups/buckets.



-- Divide sales into 4 performance groups.

SELECT
    SPID,
    Amount,
    NTILE(4) OVER(
        ORDER BY Amount DESC
    ) AS sales_quartile
FROM sales;

-- 6. LAG()

-- LAG() lets you access a value from a previous row.

-- This is extremely useful for time-series analysis.


-- Compare today's sale with the previous sale.

SELECT
    SaleDate,
    Amount,
    LAG(Amount) OVER(
        ORDER BY SaleDate
    ) AS previous_amount
FROM sales;


SELECT
    SaleDate,
    Amount,
    LEAD(Amount) OVER(
        ORDER BY SaleDate
    ) AS next_amount
FROM sales;



