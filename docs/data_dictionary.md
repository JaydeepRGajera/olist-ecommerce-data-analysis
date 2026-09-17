# Data Dictionary

## Orders
One row per order.

Key fields:
- order_id
- customer_id
- order_status
- order_purchase_timestamp
- order_approved_at
- order_delivered_carrier_date
- order_delivered_customer_date
- order_estimated_delivery_date

## Order Items
One row per product-seller combination within an order.

Key fields:
- order_id
- product_id
- seller_id
- price
- freight_value

## Customers
Customer information linked to orders.

Key fields:
- customer_id
- customer_unique_id
- customer_city
- customer_state

## Products
Product-level information.

Key fields:
- product_id
- product_category_name

## Sellers
Seller-level information.

Key fields:
- seller_id
- seller_city
- seller_state

## Payments
Payment records for orders.

Important:
Multiple payment rows can exist for the same order.

## Reviews
Customer review information.

Important:
Review records should be aggregated carefully before joining to other order-level tables.

## Geolocation
Brazilian ZIP-code prefix and geographic information.

## Product Category Translation
Portuguese-to-English product category mapping.
