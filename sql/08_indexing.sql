CREATE INDEX idx_orders_customer_id
ON orders (customer_id)

CREATE INDEX idx_order_details_order_id
ON order_details (order_id)

CREATE INDEX idx_products_subcategory
ON products (subcategory_id)

CREATE INDEX idx_orders_order_date
ON orders (order_date)

