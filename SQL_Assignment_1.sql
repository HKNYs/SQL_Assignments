/* Q1 */
--How many customers are in each city? Your solution should include the city name and the number of customers sorted from highest to lowest.

SELECT city, COUNT(customer_id) AS num_of_customers
FROM sale.customer
GROUP BY city
ORDER BY num_of_customers DESC;

/* Q2 */
--Find the total product quantity of the orders. Your solution should include order ids and quantity of products.

SELECT order_id, SUM(quantity) AS quantity_of_product
FROM sale.order_item
GROUP BY order_id;

/* Q3 */
--Find the first order date for each customer_id.

SELECT customer_id, MIN(order_date) AS first_order_date
FROM sale.orders
GROUP BY customer_id

/* Q4 */
--Find the total amount of each order. Your solution should include order id and total amount sorted from highest to lowest.

SELECT order_id, SUM(list_price * quantity * (1 - discount)) AS total_amount
FROM sale.order_item
GROUP BY order_id
ORDER BY total_amount DESC;

/* Q5 */
--Find the order id that has the maximum average product price. Your solution should include only one row with the order id and average product price.

SELECT TOP 1 order_id, AVG(list_price) AS avg_product_price
FROM sale.order_item
GROUP BY order_id
ORDER BY avg_product_price DESC;

/* Q6 */
--Write a query that displays brand_id, product_id and list_price sorted first by brand_id (in ascending order), and then by list_price  (in descending order).

SELECT brand_id, product_id, list_price
FROM product.product
ORDER BY brand_id ASC, list_price DESC;

/* Q7 */
--Write a query that displays brand_id, product_id and list_price, but this time sorted first by list_price (in descending order), and then by brand_id (in ascending order).

SELECT brand_id, product_id, list_price
FROM product.product
ORDER BY list_price DESC, brand_id ASC;

/* Q8 */
--Write a query to pull the first 10 rows and all columns from the product table that have a list_price greater than or equal to 3000.

SELECT TOP 10 *
FROM product.product
WHERE list_price >= 3000;

/* Q9 */
--Write a query to pull the first 5 rows and all columns from the product table that have a list_price less than 3000.

SELECT TOP 5 *
FROM product.product
WHERE list_price < 3000;

/* Q10 */
--Find all customer last names that start with 'B' and end with 's'.

SELECT last_name 
FROM sale.customer
WHERE last_name LIKE 'B%s';

/* Q11 */
--Use the customer table to find all information regarding customers whose address is Allen or Buffalo or Boston or Berkeley.

SELECT * 
FROM sale.customer
WHERE city IN ('Allen', 'Buffalo', 'Boston', 'Berkeley');