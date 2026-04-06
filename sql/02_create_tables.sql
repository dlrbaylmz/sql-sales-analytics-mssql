DROP TABLE IF EXISTS order_details
DROP TABLE IF EXISTS orders
DROP TABLE IF EXISTS products
DROP TABLE IF EXISTS subcategories
DROP TABLE IF EXISTS categories
DROP TABLE IF EXISTS regions
DROP TABLE IF EXISTS customers

CREATE TABLE customers (
    customer_id NVARCHAR(50) PRIMARY KEY,
    customer_name NVARCHAR(100),
    segment NVARCHAR(50)
)

CREATE TABLE regions (
    region_id INT IDENTITY(1,1) PRIMARY KEY,
    country NVARCHAR(50),
    city NVARCHAR(50),
    state NVARCHAR(50),
    region_name NVARCHAR(50)
)

CREATE TABLE categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    category_name NVARCHAR(50)
)

CREATE TABLE subcategories (
    subcategory_id INT IDENTITY(1,1) PRIMARY KEY,
    subcategory_name NVARCHAR(50),
    category_id INT
)

CREATE TABLE products (
    product_id NVARCHAR(50) PRIMARY KEY,
    product_name NVARCHAR(200),
    subcategory_id INT
)

CREATE TABLE orders (
    order_id NVARCHAR(50) PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    customer_id NVARCHAR(50),
    region_id INT
)

CREATE TABLE order_details (
    order_detail_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id NVARCHAR(50),
    product_id NVARCHAR(50),
    sales FLOAT,
    quantity INT,
    discount FLOAT,
    profit FLOAT
)

SELECT DB_NAME() AS current_db


UPDATE od
SET od.sales = rs.sales_clean
FROM order_details od
JOIN raw_superstore rs
    ON od.order_id = rs.order_id
   AND od.product_id = rs.product_id


UPDATE od
SET od.profit = rs.profit_clean
FROM order_details od
JOIN raw_superstore rs
    ON od.order_id = rs.order_id
   AND od.product_id = rs.product_id