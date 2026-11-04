select * from sales;
select * from products;
select * from people;
select * from geo;

select s.pid, s.amount, s.boxes, p.product 
from sales s left join products p on s.pid = p.pid
where s.saledate >= 2022-01-08;

-- display product categories sold by sp05
select s.SPID, s.amount, s.boxes, p.Category 
from sales s left join products p on s.pid = p.pid
where s.SPID = 'sp05'; -- 304

-- display cost per box and boxes for all sales
select s.SPID, p.Cost_per_box, s.Boxes
from sales s left join products p on s.pid = p.pid; -- 7617

-- highest sale of eclairs in 2021 and 2022
select s.SPID, s.amount, p.product, s.SaleDate
from sales s left join products p on s.pid = p.pid
where p.Product = 'eclairs' and year(s.saledate)= 2022 order by s.amount desc; -- 73
select s.SPID, s.amount, p.product, s.SaleDate
from sales s left join products p on s.pid = p.pid
where p.Product = 'eclairs' and year(s.saledate)= 2021 order by s.amount desc; -- 20384

-- highest sale made team of 2021 and 2022
select s.SPID, s.amount, s.boxes, p.team
from sales s left join people p on s.spid = p.spid
where year(saledate)= 2021 order by amount desc; -- yummies

select s.SPID, s.amount, s.boxes, p.team
from sales s left join people p on s.spid = p.spid
where year(saledate)= 2022 order by amount desc; -- delish

-- overall highest sold boxes in for which product
select s.SPID, s.amount, s.boxes, p.product
from sales s left join products p on s.pid = p.pid order by boxes desc; -- 1939

-- available lowest sale made team
select s.SPID, s.amount, s.boxes, p.team
from sales s left join people p on s.spid = p.spid order by amount; -- yummies, delish

-- which is the highest sale made team and what is the customer count
select s.SPID, s.amount, s.boxes, p.team, s.customers
from sales s 
left join people p 
on s.spid = p.spid 
order by s.amount desc; 

-- lowest customer count in which geo and region
select s.SPID, s.amount, g.Region, g.geo, s.customers
from sales s 
left join geo g
on s.GeoID = g.GeoID 
order by s.customer;

-- 5 most sold products in category bars and category bites

-- highest sold category

-- sales person and geo for each sales
select s.SPID,p.salesperson,g.geo,pr.product
from sales s
left join people p
on s.spid=p.spid
left join geo g
on s.geoid=g.geoid
left join products pr
on s.pid=pr.pid;


select * from people where team = '';
-- identify each sale present in india new zealand
select s.spid, g.geo, s.Amount
from sales s 
left join geo g
on s.GeoID = g.GeoID
where g.geo in ('India','new zealand');

select s.spid, g.geo, s.Amount
from sales s 
left join geo g
on s.GeoID = g.GeoID
where g.geo = 'India' or g.geo = 'new zealand';