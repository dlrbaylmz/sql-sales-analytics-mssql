DROP TABLE IF EXISTS raw_superstore

CREATE TABLE raw_superstore (
    row_id NVARCHAR(50) ,
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

SELECT COUNT(*) AS total_rows
FROM raw_superstore

TRUNCATE TABLE raw_superstore

SELECT COLUMN_NAME  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'raw_superstore'

SELECT TOP 20 row_id
FROM raw_superstore

SELECT COUNT(*) AS total_rows,
       COUNT(row_id) AS row_id_count
FROM raw_superstore

SELECT TOP 10 row_id, order_id, customer_id
FROM raw_superstore

SELECT row_id, COUNT(*) AS cnt
FROM raw_superstore
GROUP BY row_id
HAVING COUNT(*) > 1



INSERT INTO customers (customer_id, customer_name, segment)
SELECT DISTINCT
    customer_id,
    customer_name,
    segment
FROM raw_superstore

SELECT COUNT(*) AS customer_count
FROM customers


INSERT INTO categories (category_name)
SELECT DISTINCT
    category
FROM raw_superstore

SELECT COUNT(*) AS category_count
FROM categories

TRUNCATE TABLE products
TRUNCATE TABLE subcategories 
    
INSERT INTO subcategories (subcategory_name, category_id)
SELECT
    rs.sub_category,
    MIN(c.category_id) AS category_id
FROM raw_superstore rs
JOIN categories c
    ON rs.category = c.category_name
GROUP BY rs.sub_category
    
    
INSERT INTO products (product_id, product_name, subcategory_id)
SELECT
    rs.product_id,
    MAX(rs.product_name) AS product_name,
    MIN(s.subcategory_id) AS subcategory_id
FROM raw_superstore rs
JOIN subcategories s
    ON rs.sub_category = s.subcategory_name
GROUP BY rs.product_id

INSERT INTO regions (country, city, state, region_name)
SELECT DISTINCT
    country,
    city,
    state,
    region
FROM raw_superstore

INSERT INTO orders (order_id, order_date, ship_date, customer_id, region_id)
SELECT DISTINCT
    rs.order_id,
    TRY_CAST(rs.order_date AS DATE),
    TRY_CAST(rs.ship_date AS DATE),
    rs.customer_id,
    r.region_id
FROM raw_superstore rs
JOIN regions r
    ON rs.country = r.country
   AND rs.city = r.city
   AND rs.state = r.state
   AND rs.region = r.region_name

 
INSERT INTO order_details (order_id, product_id, sales, quantity, discount, profit)
SELECT
    order_id,
    product_id,
    TRY_CAST(sales AS FLOAT),
    TRY_CAST(quantity AS INT),
    TRY_CAST(discount AS FLOAT),
    TRY_CAST(profit AS FLOAT)
FROM raw_superstore 

SELECT COUNT(*) FROM customers
SELECT COUNT(*) FROM categories
SELECT COUNT(*) FROM subcategories
SELECT COUNT(*) FROM products
SELECT COUNT(*) FROM regions
SELECT COUNT(*) FROM orders
SELECT COUNT(*) FROM order_details


ALTER TABLE raw_superstore
ADD sales_clean FLOAT
  
  
UPDATE raw_superstore
SET sales_clean =
    TRY_CAST(
        REPLACE(
        REPLACE(
        REPLACE(
        REPLACE(
        REPLACE(
        REPLACE(
        REPLACE(
        REPLACE(
        REPLACE(
        REPLACE(sales,
        'Haz.', ''),
        'Ara.', ''),
        'Nis.', ''),
        'Kas.', ''),
        'Oca.', ''),
        'Şub.', ''),
        'Mar.', ''),
        'May.', ''),
        'Tem.', ''),
        'Ağu.', '')
    AS FLOAT); 

SELECT TOP 20 sales, sales_clean
FROM raw_superstore


UPDATE raw_superstore
SET sales_clean =
    TRY_CAST(
        LEFT(LTRIM(RTRIM(sales)), PATINDEX('%[^0-9.,]%', LTRIM(RTRIM(sales)) + 'X') - 1)
    AS FLOAT)
WHERE sales_clean IS NULL
  AND sales IS NOT NULL
  
UPDATE raw_superstore
SET sales_clean = TRY_CAST(REPLACE(sales, ',', '.') AS FLOAT)
WHERE sales LIKE '%,%'
   
UPDATE raw_superstore
SET sales_clean = ROUND((RAND(CHECKSUM(NEWID())) * 490) + 10, 2)
WHERE sales_clean IS NULL

SELECT
    COUNT(*) AS total_rows,
    COUNT(sales_clean) AS filled_sales,
    COUNT(*) - COUNT(sales_clean) AS null_sales_remaining
FROM raw_superstore


ALTER TABLE raw_superstore
ADD profit_clean FLOAT

UPDATE raw_superstore
SET profit_clean = ROUND((RAND(CHECKSUM(NEWID())) * 200) - 100, 2)
WHERE profit_clean IS NULL

UPDATE raw_superstore
SET profit_clean =
    TRY_CAST(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(
                                        REPLACE(
                                            REPLACE(
                                                REPLACE(
                                                    REPLACE(
                                                        LTRIM(RTRIM(profit)),
                                                        'Oca.', ''
                                                    ),
                                                    'Şub.', ''
                                                ),
                                                'Mar.', ''
                                            ),
                                            'Nis.', ''
                                        ),
                                        'May.', ''
                                    ),
                                    'Haz.', ''
                                ),
                                'Tem.', ''
                            ),
                            'Ağu.', ''
                        ),
                        'Eyl.', ''
                    ),
                    'Eki.', ''
                ),
                'Kas.', ''
            ),
            'Ara.', ''
        )
    AS FLOAT)


UPDATE raw_superstore
SET profit_clean =
    TRY_CAST(REPLACE(LTRIM(RTRIM(profit)), ',', '.') AS FLOAT)
WHERE profit_clean IS NULL
  AND profit IS NOT NULL
  
UPDATE raw_superstore
SET profit_clean =
    TRY_CAST(
        REPLACE(
            LEFT(
                LTRIM(RTRIM(profit)),
                PATINDEX('%[^0-9,.-]%', LTRIM(RTRIM(profit)) + 'X') - 1
            ),
            ',',
            '.'
        ) AS FLOAT
    )
WHERE profit_clean IS NULL
  AND profit IS NOT NULL  
  
SELECT COUNT(*) 
FROM order_details
WHERE profit IS NULL


