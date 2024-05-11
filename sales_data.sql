

-- 1. Retrieve all columns for all transactions in the table.
select * from sales_data;

-- 2. Calculate the total quantity sold across all transactions.
 select sum(quantity) as sum_of_quantity
 from sales_data;

-- 3. Calculate the average unit price of products sold.
select avg(unit_price) as avg_unitprice
from sales_data;

-- 4. Find the maximum total price among all transactions.
select max(total_price) as "maximum total price"
from sales_data;

-- 5. Retrieve the transactions where the product category is 'Electronics'
select * from sales_data
where product_category = 'Electronics';

-- 6. Count the number of transactions for each product category.
select product_category ,count(*) as "number of transactions"
from sales_data
group by product_category;

-- 7. Calculate the total revenue generated from all transactions.
select sum(total_price) as total_price
from sales_data;

-- 8. Find the transaction with the highest quantity of products purchased.
select *
from sales_data
where quantity = (select max(quantity) from sales_data);

-- 9. Retrieve the transactions with a total price greater than $250.
select * from
sales_data
where total_price > 250;

-- 10. Calculate the average total price per quantity for each product.
select product_name , avg(total_price/quantity) as avg_price_per_quantity
from sales_data 
group by product_name;

-- 11. Retrieve the top 5 transactions with the highest total price.
select * from sales_data
order by total_price desc
limit 5;

-- 12. Calculate the total revenue generated from transactions in the 'Electronics' product category.
select product_category , sum(total_price) as sum_of_profit
from sales_data
where product_category = 'Electronics';

-- 13. Find the average unit price of products sold in transactions with a quantity greater than 5.
select avg(unit_price) 
from sales_data
where quantity  > 5;

-- 14. Retrieve the transactions where the total price is within the range of $100 to $500.
select * from sales_data
where total_price between 100 and 500;

-- 15. Find the average quantity of products purchased per transaction.
select avg(quantity)as avg_qunatiyty
from sales_data;

-- 16. Retrieve the transactions where the product name contains the word 'Sneakers'.
select * from 
sales_data
where product_name like 'Sneakers';

-- 17. Identify the product category with the highest total revenue.
select product_category , sum(total_price) as higest_total_revenue
from sales_data
group by product_category
order by sum(total_price) desc
limit 1;

-- 18. Calculate the average total price per quantity for transactions in the 'Apparel' product category.
select product_category , avg(total_price/unit_price) as "average total price per quantity"
from sales_data
where product_category = 'Apparel';

-- 19. Retrieve the top 3 transactions with the highest quantity of products purchased.
select * from sales_data 
order by quantity desc 
limit 3;

-- 20. Retrieve the transactions where the unit price is higher than the average unit price of all transactions.
select * from 
sales_data
where unit_price > (select avg(unit_price) from sales_data);
