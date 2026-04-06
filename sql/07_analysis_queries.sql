SELECT 
    SUM(sales) AS total_sales
FROM order_details

SELECT 
    SUM(profit) AS total_profit
FROM order_details

SELECT 
    c.category_name,
    SUM(od.sales) AS total_sales
FROM order_details od
JOIN products p ON od.product_id = p.product_id
JOIN subcategories s ON p.subcategory_id = s.subcategory_id
JOIN categories c ON s.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_sales DESC


SELECT 
    r.city,
    SUM(od.profit) AS total_profit
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN regions r ON o.region_id = r.region_id
GROUP BY r.city
ORDER BY total_profit DESC


SELECT 
    FORMAT(o.order_date, 'yyyy-MM') AS month,
    SUM(od.sales) AS total_sales
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
GROUP BY FORMAT(o.order_date, 'yyyy-MM')
ORDER BY month






