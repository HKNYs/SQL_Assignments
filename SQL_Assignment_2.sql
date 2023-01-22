/* Q1 */
--You need to create a report on whether customers who purchased the product named '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD' buy the product below or not.
--'Polk Audio - 50 W Woofer - Black' -- (other_product)

SELECT
c.customer_id, c.first_name, c.last_name,
CASE
WHEN EXISTS (SELECT 1 FROM sale.order_item oi
JOIN sale.orders o ON oi.order_id = o.order_id
JOIN product.product p ON oi.product_id = p.product_id
WHERE p.product_name = 'Polk Audio - 50 W Woofer - Black' AND o.customer_id = c.customer_id) THEN 'Yes' ELSE 'No'
END AS other_product
FROM sale.orders o
JOIN sale.customer c ON o.customer_id = c.customer_id
JOIN sale.order_item oi ON o.order_id = oi.order_id
JOIN product.product p ON oi.product_id = p.product_id
WHERE p.product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY c.customer_id;

------------------------------------------------------------------------

/* Q2 */

CREATE TABLE ECommerce (Visitor_ID INT IDENTITY (1, 1) PRIMARY KEY,	Adv_Type VARCHAR (255) NOT NULL, Action1 VARCHAR (255) NOT NULL);
INSERT INTO ECommerce (Adv_Type, Action1)
	VALUES ('A', 'Left'),('A', 'Order'),('B', 'Left'),('A', 'Order'),('A', 'Review'),('A', 'Left'),('B', 'Left'),('B', 'Order'),('B', 'Review'),('A', 'Review');

SELECT Adv_Type,
ROUND(CAST(COUNT(CASE WHEN Action1 = 'Order' THEN 1 END) AS FLOAT) / COUNT(*), 2) AS Conversion_Rate
FROM dbo.ECommerce
GROUP BY Adv_Type;


 
