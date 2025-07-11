-- SQL Retail Sale Analysis - P1


-- CREATE DATA BASE 
CREATE DATABASE MYSQL_PROJECT_1;

-- CREATE TABLE 
CREATE TABLE RETAIL_SALES(
	transactions_id INT PRIMARY KEY,
	sale_date date,
	sale_time time,
	customer_id INT,
	gender VARCHAR(15) ,
	age INT,
	category VARCHAR(15),
	quantiy INT,
	price_per_unit float,
	cogs float,
	total_sale float
);

-- COUNT HOW MUCH DATA IS IMPORTED 
SELECT COUNT(*) FROM MYSQL_PROJECT_1.retail_sales;

-- CHECK IF THERE IS ANY NULL VALUE 
SELECT COUNT(*) FROM MYSQL_PROJECT_1.retail_sales
WHERE transactions_id is null
OR sale_date is null
OR sale_time is null
OR customer_id is null
OR gender is null
OR age is null
OR category is null
OR quantiy is null
OR price_per_unit is null
OR cogs is null
OR total_sale is null
;

-- DELETE ANY NULL DATA IF THERE IS ANY 
DELETE FROM MYSQL_PROJECT_1.retail_sales
WHERE transactions_id is null
OR sale_date is null
OR sale_time is null
OR customer_id is null
OR gender is null
OR age is null
OR category is null
OR quantiy is null
OR price_per_unit is null
OR cogs is null
OR total_sale is null
;

-- DATA EXPLORATION 

-- HOW MANY SALES WE HAVE?
SELECT COUNT(*) FROM retail_sales;

-- HOW MANY CUSTOMERS WE HAVE?
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

-- HOW MANY CATEGORY WE HAVE?
SELECT category, COUNT( category) FROM retail_sales
GROUP BY category
ORDER BY COUNT( category);

-- DATA ANALYSIS 

-- Q1 Write a SQL to retrieve all column for the sale made on '2022-11-05'.:
SELECT * FROM retail_sales
 WHERE sale_date = '2022-11-05';

-- Q2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT * FROM retail_sales
WHERE quantiy < 4 
and sale_date between '2022-11-1' AND '2022-12-1'
ORDER BY sale_date;

-- Q3 Write a SQL query to calculate the total sales (total_sale) for each category.:
SELECT category, SUM(total_sale) FROM retail_sales
GROUP BY category
ORDER BY category DESC ;

-- Q4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.: 
SELECT category, AVG(age) FROM retail_sales
WHERE category = "BEAUTY";

--  Q5 Write a SQL query to find all transactions where the total_sale is greater than 1000.:
SELECT * FROM retail_sales
WHERE total_sale > '1000'
ORDER BY total_sale ;

-- Q6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
SELECT GENDER, 
COUNT(transactions_id) FROM retail_sales
GROUP BY GENDER; 

-- Q7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
SELECT month(sale_date) as month,
 ROUND(avg(total_sale), 2) as average_sale from retail_sales
 GROUP BY month(sale_date) 
 ORDER BY average_sale DESC;
 
 -- Q8 Write a SQL query to find the top 5 customers based on the highest total sales.:
 SELECT customer_id, SUM(total_sale) as total_sale FROM retail_sales 
 GROUP BY customer_id
 ORDER BY total_sale DESC 
 LIMIT 5;
 
 
 -- Q9 Write a SQL query to find the number of unique customers who purchased items from each category.:
 SELECT category,
 COUNT(DISTINCT customer_id)
 FROM retail_sales
 GROUP BY category;
 
 -- Q10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
SELECT COUNT(quantiy),
CASE 
WHEN hour(sale_time)< 12 THEN "MORNING"
WHEN HOUR(sale_time) between 12 AND 17 THEN "AFTERNOON"
ELSE "EVENING" 
END 
AS SHIFT 
FROM retail_sales
GROUP BY SHIFT
ORDER BY COUNT(quantiy) DESC ; 

-- END OF PROJECT 
 
 
 
 
 
 