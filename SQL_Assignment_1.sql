
/* Q1 */
SELECT city, COUNT(customer_id) AS num_of_customers
FROM [SampleRetail].[sale].[customer]
GROUP BY city
ORDER BY num_of_customers DESC;

/* Q2 */
SELECT order_id, COUNT(quantity) AS quantity_of_product
FROM [SampleRetail].[sale].[order_item]
GROUP BY order_id;

/* Q3 */
SELECT customer_id, MIN(order_date) as first_order_date
FROM [SampleRetail].[sale].[orders]
GROUP BY customer_id

/* Q4 */
SELECT order_id, SUM(list_price * quantity * (1 - discount)) AS total_amount
FROM [SampleRetail].[sale].[order_item]
GROUP BY order_id
ORDER BY total_amount DESC;

/* Q5 */
SELECT TOP 1 order_id, AVG(list_price) AS total_amount
FROM [SampleRetail].[sale].[order_item]
GROUP BY order_id
ORDER BY total_amount DESC;

/* Q6 */
SELECT brand_id, product_id, list_price
FROM [SampleRetail].[product].[product]
ORDER BY brand_id ASC, list_price DESC;

/* Q7 */
SELECT brand_id, product_id, list_price
FROM [SampleRetail].[product].[product]
ORDER BY list_price DESC, brand_id ASC;

/* Q9 */
SELECT TOP 10 *
FROM [SampleRetail].[product].[product]
WHERE list_price >= 3000;

/* Q10 */
SELECT TOP 5 *
FROM [SampleRetail].[product].[product]
WHERE list_price < 3000;

/* Q11 */
SELECT last_name 
FROM [SampleRetail].[sale].[customer]
WHERE last_name LIKE 'B%s';

/* Q12 */
SELECT * 
FROM [SampleRetail].[sale].[customer]
WHERE city IN ('Allen', 'Buffalo', 'Boston', 'Berkeley');