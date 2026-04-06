CREATE PROCEDURE sp_sales_by_category
AS
BEGIN
    SELECT 
        c.category_name,
        SUM(od.sales) AS total_sales,
        SUM(od.profit) AS total_profit
    FROM order_details od
    JOIN products p ON od.product_id = p.product_id
    JOIN subcategories s ON p.subcategory_id = s.subcategory_id
    JOIN categories c ON s.category_id = c.category_id
    GROUP BY c.category_name
    ORDER BY total_profit DESC
END


CREATE PROCEDURE sp_monthly_sales
AS
BEGIN
    SELECT 
        FORMAT(o.order_date, 'yyyy-MM') AS month,
        SUM(od.sales) AS total_sales
    FROM order_details od
    JOIN orders o ON od.order_id = o.order_id
    GROUP BY FORMAT(o.order_date, 'yyyy-MM')
    ORDER BY month
END


EXEC sp_sales_by_category
EXEC sp_monthly_sales