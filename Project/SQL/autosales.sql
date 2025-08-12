/*Introduction:-

The Auto Sales Analysis Project aims to derive actionable insights from historical automobiles sales data using structured 
query language(SQL). This dataset, structured in a relational database, encompasses detailed order-level information such
as order number, product line, quantity ordered, price, customer demographics, order status, and sales figures.

To support strategic decision-making, a comprehensive SQL - based analytical approach is employed. The analysis begins with 
foundational quries such as filtering high-value transactions, identifying key customers, and examining temporal order trends.
It progresses to more advanced aggregations, including total and average sales by country, productline, and dealsize.

This data-driven approach reveales crucial business insights - highlighting top-performing markets, high-value customers 
profitable product categories, and operational efficiency in order fulfillment. The findings can support enhancements in 
marketing strategy, sales forecasting, inventory planning, and customer relationship management.

*/

show variables like 'secure_file_priv';

create database prac;
use prac;

create table autoSales(
ORDERNUMBER int,
QUANTITYORDERED int,
PRICEEACH decimal(5,2),
ORDERLINENUMBER int,
SALES int,
ORDERDATE varchar(25),
DAYS_SINCE_LASTORDER int,
STATUS varchar(20),
PRODUCTLINE varchar(40),
MSRP int,
PRODUCTCODE varchar(25),
CUSTOMERNAME varchar(40),
PHONE varchar(20),
ADDRESSLINE1 varchar(50),
CITY varchar(20),
POSTALCODE varchar(30),
COUNTRY varchar(25),
CONTACTLASTNAME varchar(30),
CONTACTFIRSTNAME varchar(30),
DEALSIZE varchar(20)
);

select * from autosales;

show variables like 'local_infile';
set global local_infile = 1;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Auto Sales data.csv'
into table autoSales
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from autosales;

-- =================================
-- Questions:- 

-- Basic SELECT and Filtering

-- 1. Retrieve all orders where the sales amount is greater than 3000.
select * from autosales
where sales > 3000;

-- 2. List all customers from the USA.
select customername, country from autosales
where country = 'USA';

-- 3. Show all orders placed in the year 2018.
select * from autosales
where substring(orderdate, 7,4) = '2018';
-- Note:- The SUBSTRING() function extracts some characters from a string. Syntax: SUBSTRING(string, start, length)

-- 4. Select the product code, quantity ordered, and price each for orders with status “Shipped”.
select quantityordered, productcode, priceeach, status from autosales
where status = 'Shipped';

-- 5. Find the unique product lines in the dataset.
select distinct productline from autosales;
-- Note:- DISTINCT keyword in SQL eliminates all duplicate records from the result returned by the SQL query.

-- Aggregation, Grouping and HAVING

-- 6. What are the top 5 orders with the highest sales?
select * from autosales
order by sales desc
limit 5;

-- 7. Find the total sales grouped by country.
select country, sum(sales) from autosales
group by country;

-- 8. Calculate the average sales per deal size.
select dealsize, avg(sales) from autosales
group by dealsize;

-- 9. How many orders were placed per status category?
select status, count(ordernumber) as ordercount from autosales
group by status;

-- 10. List the cities with more than 50 orders.
select city, count(ordernumber) as ordercount from autosales
group by city
having count(ordernumber) > 50
order by ordercount desc;

-- 11. Which product line has the highest total sales?
select productline, sum(sales) as Highest_Sale from autosales
group by productline
order by Highest_Sale desc
limit 1;

-- 12. Find the total quantity ordered for each product line where the total is more than 4000 units.
select productline, sum(quantityordered) as Total_Quantity from autosales
group by productline
having sum(quantityordered) > 4000;

-- 13. Which product line has the most sales entries (most sold)?
select productline, count(*) as count from autosales
group by productline
order by count desc
limit 1;

-- 14 Which customers place the most frequent orders?
select customername, count(*) as count_order from autosales
group by customername
order by count_order desc;

-- 15 What is the relationship between quantity and sales?
select quantityordered, avg(sales) as Avg_sales from autosales
group by quantityordered
order by quantityordered desc;

-- String Functions

-- 16. Find all customer names that contain the word "Toys".
select customername from autosales
where customername like '%Toys%';

-- 17. Get the first 5 characters of all product codes.
select productcode, left(productcode, 5) as first_5_char from autosales;

-- 18. Find the customers who have placed orders with sales above the average sales.
select customername from autosales
where sales > (
select avg(sales) from autosales
);

-- 19. What's the average sales per product line per country?
select country, productline, avg(sales) as Sales_avg from autosales
group by productline, country
order by Sales_avg desc;

-- 20. Which product codes have the highest total revenue?
select productcode, sum(sales) as Total_Revenue from autosales
group by productcode
order by Total_Revenue desc;

-- ============================

/* INSIGHTS

--> A significant number of orders exceed 3000, indicating a healthy segment of high value transactions.
    
-->	It contributes a large share of the customer base, This highlights the USA as a key market.

--> There are 5,494 individual order line records, indicating detailed transactional data.

--> The SALES column reflects total revenue per order line, calculated as QUANTITYORDERED × PRICEEACH.

--> Most sales transactions fall under small or medium DEALSIZE categories, showing a concentration in low-to-mid ticket items.

-->	A few large orders contribute disproportionalitely to total sales. These might come from B2B customers or bulk buyers.
    
-->	Sales are concentrated in a few countries, with the USA and France likely leading. It can be inform distribution 
    strategies and localize marketing

-->	Larger deal sizes yield higher average sales, justifying efforts to move customers up the value.
    
-->	Most orders fall under "Shipped", confirming successful operations. A small percentage may be "On Hold" or "Cancelled".
 
-->	Urban centers like Madrid, San Rafael and NYC have higher order volumes, indicating dense customer populations or B2B hubs.

-->	Classic cars are likely the top earners, showing strong consumer interest these lines.
    
-->	Only a few productlines exceed this threshold, which could inform production and inventory priorities.
    
-->	Classic cars are the most frequently sold, It suggesting strong market demand across customers types.
    
-->	Higher quantity ordered do not translate to proportionally higher revenue, hinting at volume discount and lower-priced product category.
    
These High-revenue customers should be prioritized for pretention efforts to new products.

Some combinations of country and productline perform better than others, suggesting local preferences or effective regional strategies.

A small set of products drive most revenue. Focused promotions or bundling strategies can maximize the impact of these high-performing items.

*/