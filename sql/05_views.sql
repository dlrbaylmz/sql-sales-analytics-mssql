CREATE VIEW vw_sales_summary AS
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(*) AS total_orders
FROM order_details


CREATE VIEW vw_sales_by_category AS
SELECT 
    c.category_name,
    SUM(od.sales) AS total_sales,
    SUM(od.profit) AS total_profit
FROM order_details od
JOIN products p ON od.product_id = p.product_id
JOIN subcategories s ON p.subcategory_id = s.subcategory_id
JOIN categories c ON s.category_id = c.category_id
GROUP BY c.category_name

CREATE VIEW vw_profit_by_city AS
SELECT 
    r.city,
    SUM(od.profit) AS total_profit
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN regions r ON o.region_id = r.region_id
GROUP BY r.city

CREATE VIEW vw_monthly_sales AS
SELECT 
    FORMAT(o.order_date, 'yyyy-MM') AS month,
    SUM(od.sales) AS total_sales
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
GROUP BY FORMAT(o.order_date, 'yyyy-MM')


SELECT * FROM vw_sales_summary
SELECT * FROM vw_sales_by_category
SELECT * FROM vw_profit_by_city
SELECT * FROM vw_monthly_sales