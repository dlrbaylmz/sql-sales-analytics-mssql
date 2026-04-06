DROP TABLE IF EXISTS raw_superstore

CREATE TABLE raw_superstore (
    row_id INT,
    order_id NVARCHAR(50),
    order_date NVARCHAR(50),
    ship_date NVARCHAR(50),
    ship_mode NVARCHAR(100),
    customer_id NVARCHAR(50),
    customer_name NVARCHAR(100),
    segment NVARCHAR(50),
    country NVARCHAR(100),
    city NVARCHAR(100),
    state NVARCHAR(100),
    postal_code NVARCHAR(50),
    region NVARCHAR(50),
    product_id NVARCHAR(50),
    category NVARCHAR(100),
    sub_category NVARCHAR(100),
    product_name NVARCHAR(255),
    sales NVARCHAR(50),
    quantity NVARCHAR(50),
    discount NVARCHAR(50),
    profit NVARCHAR(50)
)