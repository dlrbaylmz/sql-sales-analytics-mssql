-- PRODUCTS → SUBCATEGORIES
ALTER TABLE products
ADD CONSTRAINT fk_products_subcategory
FOREIGN KEY (subcategory_id)
REFERENCES subcategories(subcategory_id);

-- SUBCATEGORIES → CATEGORIES
ALTER TABLE subcategories
ADD CONSTRAINT fk_subcategories_category
FOREIGN KEY (category_id)
REFERENCES categories(category_id);

-- ORDERS → CUSTOMERS
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

-- ORDERS → REGIONS
ALTER TABLE orders
ADD CONSTRAINT fk_orders_region
FOREIGN KEY (region_id)
REFERENCES regions(region_id);

-- ORDER_DETAILS → ORDERS
ALTER TABLE order_details
ADD CONSTRAINT fk_orderdetails_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- ORDER_DETAILS → PRODUCTS
ALTER TABLE order_details
ADD CONSTRAINT fk_orderdetails_product
FOREIGN KEY (product_id)
REFERENCES products(product_id);