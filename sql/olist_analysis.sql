-- -- -- ========================================================================================
-- -- --                                TASK 1 : DATA AUDIT
-- -- -- ========================================================================================

-- -- -- total rows \\ unique column values (table_name)
-- -- -- 99441 \\ customer_id - 99441 \\ customer_unique_id - 96096               (customers)
-- -- -- 99441 \\ order_id - 99441 \\ customer_id - 99441                         (orders)
-- -- -- 112650 \\ order_id - 98666 \\ product_id - 32951 \\  seller_id - 3095    (order_items)
-- -- -- 103886 \\ order_id - 99440                                               (order_payments)
-- -- -- 99224 \\ review_id - 98410 \\ order_id - 98673                           (order_review)
-- -- -- 1000163 \\ geolocation_zip_code_prefix - 19015 \\ lat - 717372 \\ 
-- -- --    long - 717615 \\ geolocation_city - 8011 \\ geolocation_state - 27    (geolocation)
-- -- -- 71                                                                       (product_category_name_translation)
-- -- -- 32951 \\ product_id - 32951                                              (products)
-- -- -- 3095 \\ seller_id - 3095 \\ seller_zip_code_prefix - 2246                (sellers)
-- -- -- ----------------------------------------------------------------------------------------
-- -- -- select *
-- -- -- from olist.order_items
-- -- -- right join olist.order_reviews
-- -- -- using (order_id)

-- -- -- select count(*)
-- -- -- from olist.orders
-- -- -- where order_approved_at is null

-- -- -- select count(*)
-- -- -- from olist.orders
-- -- -- where order_delivered_carrier_date is null

-- -- -- select count(*)
-- -- -- from olist.orders
-- -- -- where order_delivered_customer_date is null
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- (orders) null values : approved_n - 160 \\ carrier_n - 1783 \\ delivered_n - 2965
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- select count(*)
-- -- -- from olist.products
-- -- -- where product_category_name is null

-- -- -- select count(*)
-- -- -- from olist.products
-- -- -- where product_name_lenght is null

-- -- -- select count(*)
-- -- -- from olist.products
-- -- -- where product_description_lenght is null

-- -- -- select count(*)
-- -- -- from olist.products
-- -- -- where product_photos_qty is null

-- -- -- select count(*)
-- -- -- from olist.products
-- -- -- where product_weight_g is null

-- -- -- select count(*)
-- -- -- from olist.products
-- -- -- where product_length_cm is null

-- -- -- select count(*)
-- -- -- from olist.products
-- -- -- where product_height_cm is null

-- -- -- select count(*)
-- -- -- from olist.products
-- -- -- where product_width_cm is null
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- (products) null values ::
-- -- -- product_name_lenght/product_category_name/product_description_lenght/product_photos_qty - 610
-- -- -- product_weight_g_n/product_length_cm_n/product_height_cm_n/product_width_cm_n - 2
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- select count(*)
-- -- -- from olist.order_reviews
-- -- -- where review_comment_title is null

-- -- -- select count(*)
-- -- -- from olist.order_reviews
-- -- -- where review_comment_message is null
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- comment_t_n - 87656 \\ comment_m_n - 58247
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- select product_category_name
-- -- -- from olist.products
-- -- -- where product_category_name is not null
-- -- -- except
-- -- -- select product_category_name
-- -- -- from olist.product_category_name_translation
-- -- -- where product_category_name is not null
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- 2 product category were not in translation table 
-- -- -- portateis_cozinha_e_preparadores_de_alimentos : Kitchen Appliances & Food Prep
-- -- -- pc_gamer : gaming pc
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- select customer_unique_id, count(customer_unique_id)
-- -- -- from olist.customers
-- -- -- join olist.orders
-- -- -- on customers.customer_id = orders.customer_id
-- -- -- group by customer_unique_id
-- -- -- having count(order_id) > 1
-- -- -- order by count(order_id) desc;
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- -- 2997 unique customers who have repeat orders
-- -- -- {how many time ordered - customer number} ::
-- -- -- {1-93099}{2-2775}{3-203}{4-30}{5-8}{6-6}{7-3}{9-1}{17-1}
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- select count(*)
-- -- -- from olist.orders
-- -- -- group by order_id

-- -- -- select sum(order_item_id)
-- -- -- from olist.order_items
-- -- -- group by order_id
-- -- -- order by sum(order_item_id) desc

-- -- -- select order_id, count(seller_id)
-- -- -- from olist.order_items
-- -- -- group by order_id
-- -- -- select distinct *
-- -- -- from olist.order_items
-- -- -- where order_id = '8272b63d03f5f79c56e9e4120aec44ef'

-- -- -- select order_id, order_item_id
-- -- -- from olist.order_items
-- -- -- group by order_id, order_item_id

-- -- -- select *
-- -- -- from olist.order_payments
-- -- -- order by order_id

-- -- -- select order_status, count(*)
-- -- -- from olist.orders
-- -- -- group by order_status

-- -- -- select order_status, count(*)
-- -- -- from olist.orders as o
-- -- -- left join olist.order_items as oi
-- -- -- using (order_id)
-- -- -- where oi.order_id is null
-- -- -- group by order_status
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- 775 order_id not in order_items which were available in orders table
-- -- -- order_items table contain order_id which have 'approved','processing','delivered' status 
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- select order_id, count(*)
-- -- -- from olist.order_payments
-- -- -- group by order_id
-- -- -- having count(*) > 1
-- -- -- order by count(*) desc

-- -- -- select 
-- -- 	-- p.order_id,
-- -- 	-- p.payment_type, 
-- -- 	-- p.payment_installments,
-- -- 	-- i.product_id, 
-- -- 	-- p.payment_value, 
-- -- 	-- i.price,
-- -- 	-- i.freight_value, 
-- -- 	-- o.order_status
-- -- -- from olist.order_payments as p
-- -- -- join olist.order_items as i
-- -- -- using (order_id)
-- -- -- join olist.orders as o
-- -- -- using (order_id)
-- -- -- where p.order_id = 'fa65dad1b0e818e3ccc5cb0e39231352'
-- -- -- order by p.payment_sequential

-- -- -- select max(payment_installments)
-- -- -- from olist.order_payments
-- -- -- select order_id, count(*)
-- -- -- from olist.order_reviews
-- -- -- group by order_id
-- -- -- having count(*) > 1
-- -- -- order by count(*) desc

-- -- -- select *
-- -- -- from olist.order_reviews as r
-- -- -- join olist.order_items as i
-- -- -- using (order_id)
-- -- -- where r.order_id  = '03c939fd7fd3b38f8485a0f95798f1f6' 

-- -- -- select  review_id,count(order_id)
-- -- -- from olist.order_reviews
-- -- -- group by review_id
-- -- -- having count(order_id) > 1
-- -- -- order by count(order_id) desc

-- -- -- select *
-- -- -- from olist.order_reviews
-- -- -- where review_id = '08528f70f579f0c830189efc523d2182'

-- -- -- select r.review_id, c.customer_unique_id
-- -- -- from olist.order_reviews as r
-- -- -- left join olist.orders as o
-- -- -- using (order_id)
-- -- -- join olist.customers as c
-- -- -- using (customer_id)
-- -- -- where r.review_id = '4d0e6dd087008d1f992d25ef6e1f619f'

-- -- -- select 
-- -- -- 	min(product_width_cm), max(product_width_cm), 
-- -- -- 	percentile_cont(0.5) within group (order by product_width_cm)
-- -- -- from olist.products

-- -- -- select 
-- -- 	-- s.seller_id, 
-- -- 	-- s.seller_zip_code_prefix, 
-- -- 	-- s.seller_city, 
-- -- 	-- s.seller_state
-- -- -- from olist.sellers as s
-- -- -- right join olist.geolocation as g
-- -- -- on s.seller_zip_code_prefix = g.geolocation_zip_code_prefix
-- -- -- and s.seller_city = g.geolocation_city
-- -- -- and s.seller_state = g.geolocation_state
-- -- -- group by s.seller_id,s.seller_zip_code_prefix, s.seller_city, s.seller_state

-- -- -- ==========================================================================================
-- -- --                           TASK 2 : GRAIN INVESTIGATION
-- -- -- =======================================================================================

-- -- -- TABLE_NAMES                                        GRAIN

-- -- -- customers :   -1 row = 1 customer detail  (1 customer_id per order)
-- -- -- 			  -customer_unique_id is unique id for 1 unique customer.
-- -- -- orders    :   -1 row : 1 order detail  per customer (not unique customer)
-- -- -- order_items: -1 row : 1 order per 1 product/1 seller
-- -- --              -one order can have 1 item
-- -- -- 			 -maximun 21 items belong to one unique order_id
-- -- -- 			 -one order can have 1 product from 1 seller
-- -- -- 			 -same product can appear more than once in one unique order id
-- -- -- 			 -grouping by order_id, order_item_id columns shows an individual item record
-- -- -- order_payments:-1 row = 1 payment record associated with an order.
-- -- --               -one unique order id can have multiple payment records
-- -- -- 			  -2961 order_id have more than 1 payment record
-- -- -- 			  -max = 29 record for an unique order id
-- -- -- 			  -there are 2 reasons for why an order have multiple payment records
-- -- -- 			  1) customers can pay in installments
-- -- -- 			  2) customers can use different payment method for one transaction
-- -- -- order reviews: -1 row = 1 review record associated with an order
-- -- --               -an order can have multiple reviews
-- -- -- 			  -547 orders have more than 1 reviews
-- -- -- 			  -max 3 reviews per order
-- -- -- 			  -there are 98410 unique review id in 99224 rows
-- -- -- 			  -there are 98673 unique order id in 99224 rows
-- -- -- products    : -1 row = 1 product detail
-- -- --               -product name length, category name, description, photos have 610 null values 
-- -- -- 			  while product weight, length, height, width have 2 null values
-- -- -- 			  -product name length is of product name and not product category name
-- -- -- product_category_name_translation:
-- -- --               1 row = englist name of 1 product_category
-- -- -- sellers     : 1 row = 1 seller detail
-- -- --               -zip codes map cleanly to geolocation with zip-city-state but it results 
-- -- -- 			  in multiple longitude, latitude rows which doesn't suggest exact location
-- -- -- geolocation : 1 row = 1 geolocation record associated with a ZIP-code/city/state and coordinates

-- -- -- ===========================================================================================
-- -- --                             TASK 3 : CARDINALITY
-- -- -- ===========================================================================================

-- -- -- | Relationship                | Cardinality | Evidence |
-- -- -- | --------------------------- | ----------- | -------- |
-- -- -- | customer_id → orders        | 1-many        | customer_id are unique in both table |
-- -- -- | customer_unique_id → orders | 1-many        | unique customer have multiple orders |
-- -- -- | orders → order_items        | 1-many        | 1 order have multiple items |
-- -- -- | products → order_items      | 1-many        | 1 product have multiple orders |
-- -- -- | sellers → order_items       | 1-many        | 1 seller have multiple orders  |
-- -- -- | orders → payments           | 1-many        | 1 order have multiple payment methods/installments |
-- -- -- | orders → reviews            | 1-many        | 1 order have multiple review records |
-- -- -- | category → translation      | 1-0/1         | 1 category name have 1 translation record|
-- -- -- | ZIP prefix → geolocation    | 1-many        | 1 zip prefix can have multiple coordinates |
-- -- -- | orders → products           | many-many     | 1 order have multiple products and viceversa |
-- -- -- | orders → sellers            | many-many     | 1 order have multiple sellers  and viceversa |
-- -- -- -----------------------------------------------------------------------------------------

-- -- -- ============================================================================================
-- -- --                             TASK 4 : JOIN-RISK INVESTIGATION
-- -- -- ============================================================================================

-- -- -- select *
-- -- -- from olist.customers
-- -- -- select review_id, count(order_id)
-- -- -- from olist.order_reviews
-- -- -- group by review_id
-- -- -- order by count(order_id) desc

-- -- -- select order_id, review_id
-- -- -- from olist.order_reviews
-- -- -- where review_id = '4219a80ab469e3fc9901437b73da3f75'

-- -- -- select order_id, count(distinct seller_id)
-- -- -- from olist.order_items
-- -- -- group by order_id
-- -- -- order by count(distinct seller_id) desc

-- -- -- select order_id, seller_id
-- -- -- from olist.order_items
-- -- -- where order_id = '1c11d0f4353b31ac3417fbfa5f0f2a8a'88863 9803

-- -- -- select count(*)
-- -- -- from olist.order_items
-- -- -- group by order_id
-- -- -- having count(*) <> 1
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- Total number of orders with 1 item : 88863
-- -- -- Total orders with more than 1 item : 9803
-- -- -- Maximum items in one order — 21
-- -- -- What percentage of orders contain multiple items - 9.94%
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- select order_id,count(*)
-- -- -- from olist.order_payments
-- -- -- where payment_installments <> 1
-- -- -- group by order_id
-- -- -- order by count(*) desc

-- -- -- select *
-- -- -- from olist.order_payments
-- -- -- where order_id = '47bd07d647eeb63f437e58a1ee3b3733'
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- Orders with exactly 1 payment record : 96479
-- -- -- Orders with more than 1 payment record : 2961
-- -- -- Maximum payment records for one order : 29
-- -- -- What percentage of orders have multiple payment records? : 2.97%
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- select count(*)
-- -- -- from olist.order_reviews
-- -- -- group by order_id
-- -- -- having count(*) = 1

-- -- select review_id, count(*)
-- -- from olist.order_reviews
-- -- group by review_id
-- -- having count(*) = 1
-- -- order by count(*) desc

-- -- -- select 
-- -- 	-- 	r.order_id, 
-- -- 	-- r.review_id, 
-- -- 	-- c.customer_unique_id, 
-- -- 	-- o.order_status, 
-- -- 	-- oi.price, 
-- -- 	-- oi.product_id,
-- -- -- 	order_purchase_timestamp
-- -- -- from olist.order_reviews as r
-- -- -- left join olist.order_items as oi
-- -- -- using (order_id)
-- -- -- join olist.orders as o
-- -- -- using (order_id)
-- -- -- join olist.customers as c
-- -- -- using (customer_id)
-- -- -- where review_id = '44e9f871226d8a130de3fc39dfbdf0c5'

-- -- select count(*)
-- -- from olist.orders
-- -- join olist.order_reviews
-- -- using (order_id)
-- -- group by order_id 
-- -- order by count(*) desc
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- Orders with exactly 1 review record : 98126
-- -- -- Orders with >1 review record : 547
-- -- -- Maximum review records per order —  3
-- -- -- What percentage of orders have multiple review records? : 0.6%
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- select order_id, count(distinct seller_id)
-- -- -- from olist.order_items
-- -- -- group by order_id
-- -- -- having count(distinct seller_id) <> 1
-- -- -- order by count(distinct seller_id) desc
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- Number of sellers per order : 97388 orders = 1 seller | 1278 orders > 1 seller
-- -- -- Maximum sellers associated with one order : 5
-- -- -- Percentage of orders involving multiple sellers : 1.30%
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- select order_id, count(distinct product_id)
-- -- -- from olist.order_items
-- -- -- group by order_id
-- -- -- having count(distinct product_id) <> 1
-- -- -- order by count(distinct product_id) desc

-- -- -- select *
-- -- -- from olist.order_items
-- -- -- where order_id = '8272b63d03f5f79c56e9e4120aec44ef'
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- Number of distinct products per order : 3236 orders > 1 product | 95430 orders = 1 product
-- -- -- Maximum distinct products in one order : 8
-- -- -- Compare this with your 21 maximum order-item records : 10/10/1 quanitity in 3 products
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- select *
-- -- -- from olist.orders as o
-- -- -- join olist.order_items as oi
-- -- -- using (order_id)
-- -- -- join olist.order_payments as p
-- -- -- using (order_id)
-- -- -- join olist.order_reviews as r
-- -- -- using (order_id)
-- -- -- -----------------------------------------------------------------------------------------
-- -- -- When multiple one-to-many tables are joined at the same time using order_id, 
-- -- -- rows can multiply across relationships. Aggregating after such a join can produce 
-- -- -- inflated metrics. Each metric should therefore be calculated at an appropriate grain 
-- -- -- before combining results.
-- -- -- -----------------------------------------------------------------------------------------

-- -- -- ============================================================================================
-- -- --                             TASK 5 : DATE INVESTIGATION
-- -- -- ============================================================================================

-- -- select min(order_purchase_timestamp)
-- -- from olist.orders

-- -- select max(order_purchase_timestamp)
-- -- from olist.orders
-- -- -----------------------------------------------------------------------------------------
-- -- earliest order purchase timestamp : 2016-09-04 21:15:19+05:30
-- -- latest order purchase timestamp : 2018-10-17 17:30:18+05:30
-- -- -----------------------------------------------------------------------------------------
-- -- select 
-- -- 	order_id,
-- -- 	order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_approved_at,order_delivered_carrier_date,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_delivered_carrier_date,order_delivered_customer_date,
-- -- 	order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where (order_estimated_delivery_date - order_delivered_customer_date)::text like '-%'
-- -- -------------------------------------------------------------------------------------------
-- -- Purchase date was always first than approved date which is logical
-- -- 1359 orders have early carrier date than approved date
-- -- 23 orders have been delivered to customers before order was carried which is logically not possible
-- -- 7827 orders have late delivery than estimated time
-- -- --------------------------------------------------------------------------------------------
-- -- select *
-- -- from olist.orders
-- -- where (order_approved_at is null) 
-- -- ------------------------------------------------------------------------------------------
-- -- when order_approved_at is null : order_status {canceled,created,delivered}
-- -- when order_delivered_carrier_date is null : order_status {unavailable,invoiced,canceled,
-- --                                             created,delivered,approved,processing}
-- -- when order_delivered_customer_date is null : order_status {shipped,unavailable,invoiced, 
-- --                                              canceled,created,delivered,approved,processing}
-- -- ----------------------------------------------------------------------------------------------
-- -- select count(order_id)
-- -- from olist.orders
-- -- where order_status = 'delivered'

-- -- select 
-- -- 	order_id,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where 
-- -- 	order_status = 'delivered' AND 
-- -- 	(order_estimated_delivery_date - order_delivered_customer_date)::text not like '-%'
-- -- order by customer_estimate_diff asc
-- -- ---------------------------------------------------------------------------------------------
-- -- How many orders were delivered? : 96478
-- -- How many delivered orders arrived after the estimated delivery date? : 7826
-- -- How many arrived on or before the estimated date? : 88644
-- -- What percentage were late? : 8.11%
-- -- ----------------------------------------------------------------------------------------------
-- -- order_purchase_timestamp // order_approved_at // order_delivered_carrier_date 
-- -- order_delivered_customer_date // order_estimated_delivery_date
-- -- select 
-- -- 	order_id,
-- -- 	order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_approved_at,order_delivered_carrier_date,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_delivered_carrier_date,order_delivered_customer_date,
-- -- 	order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where (order_estimated_delivery_date - order_delivered_customer_date)::text like '-%'
-- -- and order_status = 'delivered'
-- -- order by customer_estimate_diff desc

-- -- select *
-- -- from olist.orders
-- -- where order_status = 'delivered'
-- -- AND order_approved_at IS NULL

-- -- select *
-- -- from olist.orders
-- -- where order_status = 'delivered'
-- -- AND order_delivered_carrier_date IS NULL

-- -- select *
-- -- from olist.orders
-- -- where order_status = 'delivered'
-- -- AND order_delivered_customer_date IS NULL
-- -- ---------------------------------------------------------------------------------------------
-- -- 1)1359 orders have early carrier date than approved date
-- -- -1350 order delivered
-- -- -9 order shipped
-- -- -1 order with 171 days difference, other 1358 orders ranging from 9 days to 21 seconds
-- -- 2)23 orders have been delivered to customers before order was carried which is logically not possible
-- -- -23 order delivered
-- -- -1 order with 16 days difference, other 22 orders ranging from 7 days to 23 minutes
-- -- 3)7827 orders have late delivery than estimated time
-- -- -1 order cancelled
-- -- -7826 order delivered
-- -- -7826 orders ranging from 188 days to 3 minutes
-- -- 4)Delivered orders with order_approved_at IS NULL
-- -- 14 orders
-- -- purchase happened during 2018-01-19 to 2018-02-19
-- -- 5)Delivered orders where order_delivered_carrier_date IS NULL
-- -- 2 orders - only 1 order have registered delivered date.
-- -- 6)Delivered orders where order_delivered_customer_date IS NULL
-- -- 8 orders
-- -- only 1 order have missing carrier date
-- -- --------------------------------------------------------------------------------------------
-- -- select 
-- -- 	order_id,
-- -- 	order_approved_at,order_delivered_carrier_date,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where (order_delivered_carrier_date - order_approved_at)::text like '-%'
-- -- order by approve_carrier_diff asc

-- -- select 
-- -- 	order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	*
-- -- from olist.orders
-- -- join olist.order_items
-- -- using (order_id)
-- -- join olist.order_reviews
-- -- using (order_id)
-- -- where order_id = '7c48bb55e8e4f7e56d412e9653db37bc'
-- -- --------------------------------------------------------------------------------------------
-- -- }Investigate the 1,359 approval/carrier anomalies.
-- -- -all 1350 delivered orders 1349 have 9 or less late approval date before shipping,
-- -- while one stand out at 178 days.
-- -- -order_id = '7c48bb55e8e4f7e56d412e9653db37bc'
-- -- -order was purchased on 2018-07-16 and approved within next 10 minutes.
-- -- -while carrier date is 2018-01-26, which is a type of logical error because carrier date 
-- -- cannot be ahead of purchase date. it has a possibility of a typing error.  
-- -- -it reached 14 days before estimated date and customer review score is 5
-- -- ------------------------------------------------------------------------------------
-- -- select r.review_score,
-- -- 	r.review_comment_title,
-- -- 	r.review_comment_message,
-- -- 	r.review_creation_date,
-- -- 	order_id,
-- -- 	order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,
-- -- 	order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders as o
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_delivered_customer_date - order_delivered_carrier_date)::text like '-%'
-- -- order by carrier_customer_diff asc
-- -- ------------------------------------------------------------------------------------
-- -- }Investigate the 23 carrier/customer-delivery anomalies.
-- -- -23 orders reached customers before giving for shipping.
-- -- -5 customers gave review score of 5 while did not comment.
-- -- -other 18 customers gave review score of less than 4.
-- -- -[review score : 4) I recommend it.||Delivery was fast, but one of the pot lids 
-- -- 					arrived with a cut in it.I need to exchange it.
-- --   review score : 3) I’m still waiting for one product to be delivered; 
-- --   					I’ll give a better review once it arrives.||It was good, thanks.
-- -- 					||Only the cushions were delivered; I didn't receive the VW 
-- -- 					Beetle miniature. And I	can't get in touch with anyone at Stark.
-- --   review score : 2) The shipping cost is really high—it could be lower, haha.||
-- -- 					I only received one of the items I ordered!!!||Of the products 
-- -- 					mentioned above, I only received the shampoo; I’m still waiting 
-- -- 					for the thermal cap...
-- --   review score : 1) One of the products marked as delivered was not received. || 
-- --   					I only received the hammock; the hooks weren't sent. Please get 
-- -- 					in touch. || My order shows as delivered, but it actually wasn't.
-- -- 					And the store hasn't responded to my inquiry about the 
-- -- 					non-delivery.|| The traditional-style lampshade is missing from 
-- -- 					the delivery.|| So far, only one product has arrived, and it's 
-- -- 					the wrong color—I ordered green and got pink. However, since 
-- -- 					I'm moving, I had to use it anyway. Meanwhile, the other item 
-- -- 					is marked as delivered but hasn't arrived.]

-- -- -Out of 13 comments 10 comments are about not receiving part of a product or 
-- -- different product and some customers are complaining about not getting response of 
-- -- the non-delivery inquiry.
-- -- -This carrier date have a range of 23 minutes to 16 days after giving product to 
-- -- customer, which has a possibility of registering new date of shipping as right 
-- -- product is being delivered to customer again.
-- -- ------------------------------------------------------------------------------------
-- -- select 
-- -- 	r.review_score,
-- -- 	r.review_comment_title,
-- -- 	r.review_comment_message,
-- -- 	r.review_creation_date,
-- -- 	order_id,
-- -- 	order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,
-- -- 	order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_approved_at is null and order_status = 'delivered'

-- -- select avg(r.review_score)
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)

-- -- select min(order_purchase_timestamp), max(order_purchase_timestamp) 
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_approved_at is null and order_status = 'delivered'

-- -- select 
-- -- 	distinct order_delivered_carrier_date as a
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_approved_at is null and order_status = 'delivered'

-- -- select *
-- -- from olist.orders
-- -- where order_purchase_timestamp 
-- -- 	between '2017-01-19 12:48:08+05:30' and '2017-02-19 01:28:47+05:30'
-- -- ------------------------------------------------------------------------------------
-- -- }Investigate the 14 delivered orders with missing approval dates.
-- -- -average review score is 4.1
-- -- -all products have been delivered before estimated date ranging from 15 days to 37
-- -- days.
-- -- ------------------------------------------------------------------------------------
-- -- select 
-- -- 	r.review_score,
-- -- 	r.review_comment_title,
-- -- 	r.review_comment_message,
-- -- 	r.review_creation_date,
-- -- 	order_id,
-- -- 	order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,
-- -- 	order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_delivered_carrier_date is null and order_status = 'delivered'
-- -- ------------------------------------------------------------------------------------
-- -- }Investigate the 2 delivered orders with missing carrier dates.
-- -- - both orders have been given 5 review_score even though one delivery reached after
-- -- 6 days of estimated time. 
-- -- ------------------------------------------------------------------------------------
-- -- select 
-- -- 	r.review_score,
-- -- 	r.review_comment_title,
-- -- 	r.review_comment_message,
-- -- 	r.review_creation_date,
-- -- 	order_id,
-- -- 	order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,
-- -- 	order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_delivered_customer_date is null and order_status = 'delivered'
-- -- ------------------------------------------------------------------------------------
-- -- }Investigate the 8 delivered orders with missing customer-delivery dates.
-- -- -7 orders were given 5 score while 1 was given 1 score which wasn not delivered to
-- -- home; customers had to pick the product from post-office.
-- -- ------------------------------------------------------------------------------------
-- -- select 
-- -- 	order_id,
-- -- 	order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,
-- -- 	order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where order_status = 'delivered' and
-- --   (order_estimated_delivery_date - order_delivered_customer_date)::text like '-%'
-- -- order by customer_estimate_diff desc

-- -- select 
-- -- 	r.review_score,
-- -- 	r.review_comment_title,
-- -- 	r.review_comment_message,
-- -- 	r.review_creation_date,
-- -- 	order_id,
-- -- 	order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,
-- -- 	order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_status = 'delivered' and
-- --   (order_estimated_delivery_date - order_delivered_customer_date)::text like '-%'
-- -- order by customer_estimate_diff

-- -- select 
-- -- 	r.review_score,
-- -- 	r.review_comment_title,
-- -- 	r.review_comment_message,
-- -- 	r.review_creation_date,
-- -- 	order_id,
-- -- 	order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,
-- -- 	order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_status = 'delivered' and
-- -- 	r.review_comment_message ilike any 
-- -- 	(array[
-- --   '%não recebi%','%atrasou%','%atrasaria%',
-- --   '%atraso%','%ultrapassou%','%extrapolou%',
-- --   '%não chegou%','não entregam',
-- --   '%não entregue%','sem estoque%',
-- --   '%mal para atender%','%falta de contato%',
-- --   '%falta de confiabilidade%',
-- --   '%estorno%','%metade%','%não veio%',
-- --   '%nenhuma resposta%',
-- --   '%demorou%','%demora%','%retraso%',
-- --   '%prazo vencido%','%fora do prazo%','%estourou o prazo%',
-- --   '%entrega atrasada%','%pedido atrasado%','%mercadoria atrasada%',
-- --   '%ainda não foi entregue%','%esperando a entrega%','%cansei de esperar%',
-- --   '%dias de atraso%','%semanas de atraso%','%atrasados%',
-- --   '%não atualiza%','%objeto parado%','%status parado%',
-- --   '%retido%','%extraviado%','%extravio%',
-- --   '%falta de respeito%','%palhaçada%','%desrespeito%',
-- --   '%propaganda enganosa%','%fui enganado%','%enganação%',
-- --   '%reclamação%','%insatisfeito%','%frustrado%'
-- -- ]) 
-- -- and
-- --   (order_estimated_delivery_date - order_delivered_customer_date)::text like '-%'
-- -- order by customer_estimate_diff

-- -- select 1715::numeric/7700::numeric

-- -- select 
-- -- 	review_score, 
-- -- 	round((count(*)::numeric/7700)*100,2) as percentage
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_status = 'delivered' and
-- --   (order_estimated_delivery_date - order_delivered_customer_date)::text like '-%'
-- -- group by review_score

-- -- select 
-- -- 	order_id,
-- -- 	order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,
-- -- 	order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where order_status = 'delivered' and
-- --   (order_estimated_delivery_date - order_delivered_customer_date)::text not like '-%'
-- -- order by customer_estimate_diff

-- -- select 
-- -- 	r.review_score,
-- -- 	r.review_comment_title,
-- -- 	r.review_comment_message,
-- -- 	r.review_creation_date,
-- -- 	order_id,
-- -- 	order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,
-- -- 	order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_status = 'delivered' and
-- --   (order_estimated_delivery_date - order_delivered_customer_date)::text not like '-%'
-- -- order by customer_estimate_diff

-- -- select 
-- -- 	review_score, 
-- -- 	round((count(*)::numeric/88653)*100,2) as percentage
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_status = 'delivered' and
-- --   (order_estimated_delivery_date - order_delivered_customer_date)::text not like '-%'
-- -- group by review_score
-- -- ------------------------------------------------------------------------------------
-- -- }Reconcile the 96,478 delivered orders against your late/on-time counts.
-- -- -7826 orders were delivered late.
-- -- -345 orders were late ranging from 31 days to 188 days,
-- -- -7481 orders were late ranging from 30 days to 3 and a half minutes.
-- -- -7700 orders of the 7826 were given review score.
-- -- -review score in percentage : {1:46.2 | 2:7.9 | 3:11.4 | 4:12.4 | 5:22.2}
-- -- -54% of the customer gave 1 and 2 score, 22% of them had complaints about not
-- -- receiving product on time.

-- -- -88644 delivery were before estimated time, while remaining 8 delivery of the
-- -- total 96478 had missing customer delivered date which were not suspicious as 7 of
-- -- them received 5 score and 1 had to pick product from post-office.
-- -- -2352 orders were early ranging from 146 days to 31 days,
-- -- -86292 orders were early ranging from 30 days to 5 seconds.
-- -- -88653 orders of the 96478 were given review score.
-- -- -review score in percentage : {1:6.60 | 2:2.63 | 3:7.99 | 4:20.34 | 5:62.43}
-- -- -only 9% of the customers gave 1 and 2 score, while majority were satisfied with 
-- -- the service.
-- -- ----------------------------------------------------------------------------------
-- -- >>shipped before purchase
-- -- select 
-- -- 	order_id,
-- -- 	order_purchase_timestamp,
-- -- 	-- order_approved_at,
-- -- 	order_delivered_carrier_date,
-- -- 	-- order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	-- order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	-- order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	-- order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where (order_delivered_carrier_date - order_purchase_timestamp)::text like '-%'
-- -- order by carrier_purchase_diff desc

-- -- select 
-- -- 	r.review_score,r.review_comment_message,
-- -- 	order_id,
-- -- 	order_purchase_timestamp,
-- -- 	-- order_approved_at,
-- -- 	order_delivered_carrier_date,
-- -- 	-- order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	-- order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	-- order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	-- order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_delivered_carrier_date - order_purchase_timestamp)::text like '-%'
-- -- 	and r.review_score in (1,2)
-- -- order by carrier_purchase_diff desc

-- -- select r.review_score, (count(*)::numeric/165)*100
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_delivered_carrier_date - order_purchase_timestamp)::text like '-%'
-- -- group by r.review_score

-- -- >>shipped before approved
-- -- select 
-- -- 	order_id,
-- -- 	-- order_purchase_timestamp,
-- -- 	order_approved_at,
-- -- 	order_delivered_carrier_date,
-- -- 	-- order_delivered_customer_date,
-- -- 	-- order_estimated_delivery_date,
-- -- 	-- order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	-- order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	-- order_estimated_delivery_date - order_purchase_timestamp as delivered_purchase_diff,
-- -- 	order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	-- order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	-- order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where (order_delivered_carrier_date - order_approved_at)::text like '-%'
-- --  -- and order_status <> 'delivered'
-- -- order by approve_carrier_diff 

-- -- select *
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_delivered_carrier_date - order_approved_at)::text like '-%'
-- -- and order_status = 'delivered'

-- -- select r.review_score, (count(*)::numeric/1345)*100
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_delivered_carrier_date - order_approved_at)::text like '-%'
-- -- and order_status = 'delivered'
-- -- group by r.review_score

-- -- select r.review_score, (count(*)::numeric/8)*100
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_delivered_carrier_date - order_approved_at)::text like '-%'
-- -- and order_status <> 'delivered'
-- -- group by r.review_score

-- -- >>delivered before approved
-- -- select 
-- -- 	order_id,
-- -- 	-- order_purchase_timestamp,
-- -- 	order_approved_at,
-- -- 	-- order_delivered_carrier_date,
-- -- 	order_delivered_customer_date,
-- -- 	order_estimated_delivery_date,
-- -- 	-- order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	-- order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	-- order_estimated_delivery_date - order_purchase_timestamp as delivered_purchase_diff,
-- -- 	-- order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	order_delivered_customer_date - order_approved_at as approve_customer_diff,
-- -- 	-- order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where (order_delivered_customer_date - order_approved_at)::text like '-%'
-- --  -- and order_status <> 'delivered'
-- -- order by approve_customer_diff

-- -- select *
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_delivered_customer_date - order_approved_at)::text like '-%'
-- -- and r.review_score in (1,2)
-- -- -- and order_status = 'delivered'

-- -- select r.review_score, (count(*)::numeric/59)*100
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_delivered_customer_date - order_approved_at)::text like '-%'
-- -- -- and order_status = 'delivered'
-- -- group by r.review_score

-- -- >>estimated before approved
-- -- select 
-- -- 	order_id,
-- -- 	-- order_purchase_timestamp,
-- -- 	order_approved_at,
-- -- 	-- order_delivered_carrier_date,
-- -- 	-- order_delivered_customer_date,
-- -- 	order_estimated_delivery_date,
-- -- 	-- order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	-- order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	-- order_estimated_delivery_date - order_purchase_timestamp as delivered_purchase_diff,
-- -- 	-- order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	-- order_delivered_customer_date - order_approved_at as approve_customer_diff,
-- -- 	order_estimated_delivery_date - order_approved_at as approve_estimated_diff,
-- -- 	-- order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	-- order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where (order_estimated_delivery_date - order_approved_at)::text like '-%'
-- --  -- and order_status = 'delivered'
-- -- order by approve_estimated_diff

-- -- select *
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_estimated_delivery_date - order_approved_at)::text like '-%'
-- -- -- and r.review_score in (1,2)
-- -- and order_status <> 'delivered'

-- -- select r.review_score, (count(*)::numeric/59)*100
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_estimated_delivery_date - order_approved_at)::text like '-%'
-- -- -- and order_status = 'delivered'
-- -- group by r.review_score

-- -- >>delivered before shipped
-- -- select 
-- -- 	order_id,
-- -- 	-- order_purchase_timestamp,
-- -- 	-- order_approved_at,
-- -- 	order_delivered_carrier_date,
-- -- 	order_delivered_customer_date,
-- -- 	-- order_estimated_delivery_date,
-- -- 	-- order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	-- order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	-- order_estimated_delivery_date - order_purchase_timestamp as delivered_purchase_diff,
-- -- 	-- order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	-- order_delivered_customer_date - order_approved_at as approve_customer_diff,
-- -- 	-- order_estimated_delivery_date - order_approved_at as approve_estimated_diff,
-- -- 	order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	-- order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where (order_delivered_customer_date - order_delivered_carrier_date)::text like '-%'
-- --  -- and order_status = 'delivered'
-- -- order by carrier_customer_diff

-- -- select *
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_delivered_customer_date - order_delivered_carrier_date)::text like '-%'
-- -- and r.review_score not in (1,2)
-- -- -- and order_status <> 'delivered'

-- -- >>estimated before shipped
-- -- select 
-- -- 	order_id,
-- -- 	-- order_purchase_timestamp,
-- -- 	-- order_approved_at,
-- -- 	order_delivered_carrier_date,
-- -- 	-- order_delivered_customer_date,
-- -- 	order_estimated_delivery_date,
-- -- 	-- order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	-- order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	-- order_estimated_delivery_date - order_purchase_timestamp as delivered_purchase_diff,
-- -- 	-- order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	-- order_delivered_customer_date - order_approved_at as approve_customer_diff,
-- -- 	-- order_estimated_delivery_date - order_approved_at as approve_estimated_diff,
-- -- 	-- order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_carrier_date as carrier_estimate_diff,
-- -- 	-- order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where (order_estimated_delivery_date - order_delivered_carrier_date)::text like '-%'
-- --  and order_status <> 'delivered'
-- -- order by carrier_estimate_diff

-- -- select *
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_estimated_delivery_date - order_delivered_carrier_date)::text like '-%'
-- -- -- and r.review_score not in (1,2)
-- -- and order_status <> 'delivered'

-- -- select 
-- -- 	order_id,
-- -- 	-- order_purchase_timestamp,
-- -- 	-- order_approved_at,
-- -- 	order_delivered_carrier_date,
-- -- 	-- order_delivered_customer_date,
-- -- 	order_estimated_delivery_date,
-- -- 	-- order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	-- order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	-- order_estimated_delivery_date - order_purchase_timestamp as delivered_purchase_diff,
-- -- 	-- order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	-- order_delivered_customer_date - order_approved_at as approve_customer_diff,
-- -- 	-- order_estimated_delivery_date - order_approved_at as approve_estimated_diff,
-- -- 	-- order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	order_estimated_delivery_date - order_delivered_carrier_date as carrier_estimate_diff,
-- -- 	-- order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where (order_estimated_delivery_date - order_delivered_carrier_date)::text like '-%'
-- --  and order_status = 'delivered'
-- -- order by carrier_estimate_diff

-- -- select order_delivered_customer_date - review_creation_date as a,
-- -- 	order_estimated_delivery_date - order_delivered_carrier_date,*
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_estimated_delivery_date - order_delivered_carrier_date)::text like '-%'
-- -- -- and r.review_score in (1,2)
-- -- and order_status = 'delivered'
-- -- order by order_delivered_customer_date - review_creation_date

-- -- select r.review_score, (count(*)::numeric/465)*100
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where (order_estimated_delivery_date - order_delivered_carrier_date)::text like '-%'
-- -- and order_status = 'delivered'
-- -- group by r.review_score

-- -- select 
-- -- 	r.review_score,
-- -- 	-- r.review_comment_title,
-- -- 	r.review_comment_message,
-- -- 	r.review_creation_date,
-- -- 	order_id,
-- -- 	-- order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,
-- -- 	-- order_delivered_customer_date,order_estimated_delivery_date,
-- -- 	-- order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	-- order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	-- order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	-- order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	-- order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_estimated_delivery_date - order_delivered_carrier_date as carrier_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_status = 'delivered' and
-- -- 	r.review_comment_message ilike any 
-- -- 	(array[
-- --   '%não recebi%','%atrasou%','%atrasaria%',
-- --   '%atraso%','%ultrapassou%','%extrapolou%',
-- --   '%não chegou%','não entregam',
-- --   '%não entregue%','sem estoque%',
-- --   '%mal para atender%','%falta de contato%',
-- --   '%falta de confiabilidade%',
-- --   '%estorno%','%metade%','%não veio%',
-- --   '%nenhuma resposta%',
-- --   '%demorou%','%demora%','%retraso%',
-- --   '%prazo vencido%','%fora do prazo%','%estourou o prazo%',
-- --   '%entrega atrasada%','%pedido atrasado%','%mercadoria atrasada%',
-- --   '%ainda não foi entregue%','%esperando a entrega%','%cansei de esperar%',
-- --   '%dias de atraso%','%semanas de atraso%','%atrasados%',
-- --   '%não atualiza%','%objeto parado%','%status parado%',
-- --   '%retido%','%extraviado%','%extravio%',
-- --   '%falta de respeito%','%palhaçada%','%desrespeito%',
-- --   '%propaganda enganosa%','%fui enganado%','%enganação%',
-- --   '%reclamação%','%insatisfeito%','%frustrado%'
-- -- ]) 
-- -- and
-- --   (order_estimated_delivery_date - order_delivered_carrier_date)::text like '-%'
-- -- order by carrier_estimate_diff

-- -- select 
-- -- 	order_id,
-- -- 	-- order_purchase_timestamp,
-- -- 	-- order_approved_at,
-- -- 	-- order_delivered_carrier_date,
-- -- 	order_delivered_customer_date,
-- -- 	order_estimated_delivery_date,
-- -- 	-- order_approved_at - order_purchase_timestamp as purchase_approve_diff,
-- -- 	-- order_delivered_carrier_date - order_purchase_timestamp as carrier_purchase_diff,
-- -- 	-- order_estimated_delivery_date - order_purchase_timestamp as delivered_purchase_diff,
-- -- 	-- order_delivered_carrier_date - order_approved_at as approve_carrier_diff,
-- -- 	-- order_delivered_customer_date - order_approved_at as approve_customer_diff,
-- -- 	-- order_estimated_delivery_date - order_approved_at as approve_estimated_diff,
-- -- 	-- order_delivered_customer_date - order_delivered_carrier_date as carrier_customer_diff,
-- -- 	-- order_estimated_delivery_date - order_delivered_carrier_date as carrier_estimate_diff,
-- -- 	order_estimated_delivery_date - order_delivered_customer_date as customer_estimate_diff,
-- -- 	order_status
-- -- from olist.orders
-- -- where (order_estimated_delivery_date - order_delivered_customer_date)::text like '-%'
-- --  -- and order_status <> 'delivered'
-- -- order by customer_estimate_diff
-- -- ----------------------------------------------------------------------------------
-- -- }Check for any other obvious impossible date sequence.
-- -- >>approved before purchase
-- -- ]not happened

-- -- >>shipped before purchase
-- -- ]164 out of 165 delievered orders were within 2 and a half hour while 1 was 
-- -- registered 4 days shipped before purchase.
-- -- ]1 remaining deilvered order was registered shipped 171 days before purchase.
-- -- ]86% of orders were given 4 and 5 score which suggests date was registered
-- -- incorrectly.
-- -- ]The timestamp sequence is inconsistent with the expected order lifecycle. 
-- -- The high proportion of positive reviews does not explain the anomaly, so the 
-- -- cause cannot be established from the available data.

-- -- >>delivered before purchase
-- -- ]not happened

-- -- >>estimated before purchase
-- -- ]not happened

-- -- >>shipped before approved
-- -- ]out of 1359 orders 1350 had delivered status while 9 had shipping as status.
-- -- ]1345 delivered orders were given 84% score of 4 and 5, which suggests registered 
-- -- incorrectly.
-- -- ]out of 8 shipping reviewed orders 5 were given less than 3 score, which suggests
-- -- customers were not happy with still not receiving product.
-- -- ]The timestamp sequence is inconsistent with the expected order lifecycle. 
-- -- The high proportion of positive reviews does not explain the anomaly, so the 
-- -- cause cannot be established from the available data.

-- -- >>delivered before approved
-- -- ]61 delivered orders ranging from 61 days to 5 minutes were delivered before 
-- -- approval.
-- -- ]59 reviewed orders were given 89% score of 4 and 5, while 11% had complains
-- -- about product quality, which suggests late approval date was registered incorrectly.
-- -- ]The timestamp sequence is inconsistent with the expected order lifecycle. 
-- -- The high proportion of positive reviews does not explain the anomaly, so the 
-- -- cause cannot be established from the available data.

-- -- >>estimated before approved
-- -- ]out of 12 orders 6 were delivered,while other 6 were either unavailable or 
-- -- cancelled.
-- -- ]6 delivered order were given 4 score of 4 and 5.
-- -- ]5 other orders were given 1 score because of not getting the product, it 
-- -- questions why product were approved in the first place.

-- -- >>delivered before shipped
-- -- ]23 orders were delivered before shipped ranging from 16 days to 23 minutes,
-- -- which seems suspicious.
-- -- ]out of 23 orders, except 5 review score, all review score had complain about 
-- -- either not getting the right product or missing part of the product. which has a 
-- -- possibility of new shpping date of replaced product resulting in showing
-- -- delivered date before shipping date.
-- -- ]The review comments suggest some records may involve partial deliveries, 
-- -- replacements, or delivery disputes, which could explain unusual timestamp sequences.

-- -- >>estimated before shipped
-- -- ]out of 473 orders, 8 were not delivered, in which 6 orders were given 1 score
-- -- because of not getting the product.
-- -- ]out of other 465 delivered orders, 66% customers who had given less than 3 score,
-- -- were complaining about not receiveing the product before delivered date was
-- -- registered, and there were 68 customers who received the product but were 
-- -- unsatisfied with the product.
-- -- ]this conclusion demands more accurate estimated dates. 

-- -- >>estimated before delivery
-- -- ]out of 7827 orders, 1 order was cancelled, while other 7826 were delivered late
-- -- than estimated time.
-- -- ]Among 7700 reviewed orders 54% of the customer gave 1 and 2 score, 22% of them
-- -- had complaints about not receiving product on time.

-- -- -- ============================================================================================
-- -- --                             TASK 5 : ORDER STATUS
-- -- -- ============================================================================================
-- -- select 
-- -- 	order_status, 
-- -- 	count(*) as total, 
-- -- 	round((count(*)::numeric/99441)*100,3) as perc
-- -- from olist.orders
-- -- group by order_status
-- -- order by total desc
-- --  ------------------------------------------------------------------------------------
-- -- >>>>>>>>>Order status distribution

-- -- >>number of orders for every order_status
-- -- delivered     :    96478
-- -- shipped       :    1107
-- -- canceled      :    625
-- -- unavailable   :    609
-- -- invoiced      :    314
-- -- processing    :    301
-- -- created       :    5
-- -- approved      :    2

-- -- >>percentage of total orders represented by each status
-- -- delivered     :    97.02%
-- -- shipped       :    1.11%
-- -- canceled      :    0.63%
-- -- unavailable   :    0.61%
-- -- invoiced      :    0.32%
-- -- processing    :    0.30%
-- -- created       :    0.005%
-- -- approved      :    0.002%

-- -- ---------------------------------------------------------------------------------
-- -- select *
-- -- from olist.orders
-- -- where order_status = 'delivered'
-- -- -- and order_purchase_timestamp is not null
-- -- -- and order_approved_at is null
-- -- -- and order_delivered_carrier_date is null
-- -- -- and order_delivered_customer_date is null
-- -- and order_estimated_delivery_date is null

-- -- select *
-- -- from olist.orders
-- -- where order_status = 'shipped'
-- -- -- and order_purchase_timestamp is null
-- -- -- and order_approved_at is null
-- -- -- and order_delivered_carrier_date is null
-- -- -- and order_delivered_customer_date is null
-- -- and order_estimated_delivery_date is null

-- -- select *
-- -- from olist.orders
-- -- where order_status = 'canceled'
-- -- -- and order_purchase_timestamp is null
-- -- -- and order_approved_at is null
-- -- -- and order_delivered_carrier_date is null
-- -- -- and order_delivered_customer_date is null
-- -- and order_estimated_delivery_date is null

-- -- select *
-- -- from olist.orders
-- -- where order_status = 'unavailable'
-- -- -- and order_purchase_timestamp is null
-- -- -- and order_approved_at is null
-- -- -- and order_delivered_carrier_date is null
-- -- -- and order_delivered_customer_date is null
-- -- and order_estimated_delivery_date is null

-- -- select *
-- -- from olist.orders
-- -- where order_status = 'invoiced'
-- -- -- and order_purchase_timestamp is null
-- -- -- and order_approved_at is null
-- -- -- and order_delivered_carrier_date is null
-- -- -- and order_delivered_customer_date is null
-- -- and order_estimated_delivery_date is null

-- -- select *
-- -- from olist.orders
-- -- where order_status = 'processing'
-- -- -- and order_purchase_timestamp is null
-- -- -- and order_approved_at is null
-- -- -- and order_delivered_carrier_date is null
-- -- -- and order_delivered_customer_date is null
-- -- and order_estimated_delivery_date is null

-- -- select *
-- -- from olist.orders
-- -- where order_status = 'created'
-- -- -- and order_purchase_timestamp is null
-- -- -- and order_approved_at is null
-- -- -- and order_delivered_carrier_date is null
-- -- -- and order_delivered_customer_date is null
-- -- and order_estimated_delivery_date is null

-- -- select *
-- -- from olist.orders
-- -- where order_status = 'approved'
-- -- -- and order_purchase_timestamp is null
-- -- and order_approved_at is null
-- -- -- and order_delivered_carrier_date is null
-- -- -- and order_delivered_customer_date is null
-- -- and order_estimated_delivery_date is null

-- -- select avg(r.review_score)
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_status = 'delivered'
-- -- -- and order_purchase_timestamp is not null
-- -- and order_approved_at is null
-- -- -- and order_delivered_carrier_date is null
-- -- -- and order_delivered_customer_date is null
-- -- -- and order_estimated_delivery_date is null

-- -- select avg(r.review_score)
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_status = 'delivered'
-- -- -- and order_purchase_timestamp is not null
-- -- -- and order_approved_at is null
-- -- and order_delivered_carrier_date is null
-- -- -- and order_delivered_customer_date is null
-- -- -- and order_estimated_delivery_date is null

-- -- select avg(r.review_score)
-- -- from olist.orders
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where order_status = 'delivered'
-- -- -- and order_purchase_timestamp is not null
-- -- -- and order_approved_at is null
-- -- -- and order_delivered_carrier_date is null
-- -- and order_delivered_customer_date is null
-- -- -- and order_estimated_delivery_date is null
-- -- ---------------------------------------------------------------------------------
-- -- >>>>>>>>>>>>STATUS x TIMELINE<<<<<<<<<<<<<<

-- -- >>order status : delivered {96478 orders}
-- -- purchase : no missing 
-- -- approval : 14 missing (avg score : 4.16)
-- -- carrier : 2 missing (avg score : 5.0)
-- -- customer delivery : 8 missing (avg score : 4.5)
-- -- estimated delivery : no missing

-- -- >>order status : shipped {1107 orders}
-- -- purchase : no missing 
-- -- approval : no missing
-- -- carrier : no missing
-- -- customer delivery : 1107 missing 
-- -- estimated delivery : no missing
-- -- ]delivered date missing is logical as product is on its way to customer.

-- -- >>order status :  cancelled {625 orders}
-- -- purchase : no missing 
-- -- approval : 141 missing
-- -- carrier : 550 missing
-- -- customer delivery : 619 missing
-- -- estimated delivery : no missing

-- -- >>order status : unavailable {609 orders}
-- -- purchase : no missing 
-- -- approval : no missing
-- -- carrier : 609 missing 
-- -- customer delivery : 609 missing 
-- -- estimated delivery : no missing
-- -- ]shipping and delivered date missing is logical as product was not available.

-- -- >>order status : invoiced {314 orders}
-- -- purchase : no missing 
-- -- approval : no missing
-- -- carrier : 314 missing 
-- -- customer delivery : 314 missing 
-- -- estimated delivery : no missing
-- -- ]shipping and delivered date missing is logical as seller/store had approved the billing
-- -- and waiting for payment.

-- -- >>order status : processing {301 orders}
-- -- purchase : no missing 
-- -- approval : no missing
-- -- carrier : 301 missing
-- -- customer delivery : 301 missing
-- -- estimated delivery : no missing
-- -- ]shipping and delivered date missing is logical as seller/store is doing packing of the
-- -- product for shipment after receiveing the payment.

-- -- >>order status : created {5 orders}
-- -- purchase : no missing 
-- -- approval : 5 missing
-- -- carrier : 5 missing
-- -- customer delivery : 5 missing
-- -- estimated delivery : no missing
-- -- ]approval, shipping and delivered date missing is logical as purchase has been
-- -- registered but seller/store has not yet processed the order. 

-- -- >>order status : approved {2 orders}
-- -- purchase : no missing 
-- -- approval : no missing
-- -- carrier : 2 missing
-- -- customer delivery : 2 missing
-- -- estimated delivery : no missing
-- -- ]shipping and delivered date missing is logical as all internal process of the 
-- -- store is complete and product is ready to be shipped.

-- -- ----------------------------------------------------------------------------------

-- -- select order_status, round((count(*)::numeric/99224)*100,3) as per
-- -- from olist.orders as o
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- -- where order_status = 'delivered'
-- -- -- where order_status = 'shipped'
-- -- -- where order_status = 'canceled'
-- -- -- where order_status = 'unavailable'
-- -- -- where order_status = 'invoiced'
-- -- -- where order_status = 'processing'
-- -- -- where order_status = 'created'
-- -- -- where order_status = 'approved'
-- -- where r.review_comment_message is not null
-- -- group by o.order_status
-- -- order by per desc

-- -- select *
-- -- from olist.orders as o
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- -- join olist.order_payments as p
-- -- -- using (order_id)
-- -- -- join olist.order_items as oi
-- -- -- using (order_id)
-- -- -- where order_status = 'delivered'
-- -- where order_status = 'shipped'
-- -- -- where order_status = 'canceled'
-- -- -- where order_status = 'unavailable'
-- -- -- where order_status = 'invoiced'
-- -- -- where order_status = 'processing'
-- -- -- where order_status = 'created'
-- -- -- where order_status = 'approved'
-- -- and r.review_comment_message is not null
-- -- group by r.review_score
-- -- -- order by per desc

-- -- select review_score, count(*), count(*)::numeric/634
-- -- select avg(r.review_score)
-- -- from olist.orders as o
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- -- join olist.order_payments as p
-- -- -- using (order_id)
-- -- -- join olist.order_items as oi
-- -- -- using (order_id)
-- -- -- where order_status = 'delivered'
-- -- where order_status = 'shipped'
-- -- -- where order_status = 'canceled'
-- -- -- where order_status = 'unavailable'
-- -- -- where order_status = 'invoiced'
-- -- -- where order_status = 'processing'
-- -- -- where order_status = 'created'
-- -- -- where order_status = 'approved'
-- -- and r.review_comment_message is not null
-- -- group by r.review_score
-- -- -- order by per desc

-- -- select string_agg(comments, ' || ') 
-- -- from(
-- -- 	select r.review_comment_message as comments
-- -- 	from olist.orders as o
-- -- 	join olist.order_reviews as r
-- -- 	using (order_id)
-- -- 	-- join olist.order_payments as p
-- -- 	-- using (order_id)
-- -- 	-- join olist.order_items as oi
-- -- 	-- using (order_id)
-- -- 	where o.order_status = 'delivered'
-- -- 	-- where order_status = 'shipped'
-- -- 	-- where order_status = 'canceled'
-- -- 	-- where order_status = 'unavailable'
-- -- 	-- where order_status = 'invoiced'
-- -- 	-- where order_status = 'processing'
-- -- 	-- where order_status = 'created'
-- -- 	-- where order_status = 'approved'
-- -- 	and r.review_comment_message is not null
-- -- 	and r.review_score in (1,2)
-- -- 	and (o.order_estimated_delivery_date - r.review_creation_date)::text not like '-%'
-- -- 	-- group by r.review_score
-- -- 	-- order by per desc
-- -- 	limit 12 offset 12)

-- -- select r.review_score,r.review_comment_message,
-- -- 	o.order_estimated_delivery_date - r.review_creation_date as comment_before_delivery
-- -- -- select o.order_id
-- -- from olist.orders as o
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- -- where
-- -- -- join olist.order_payments as p
-- -- -- using (order_id)
-- -- -- join olist.order_items as oi
-- -- -- using (order_id)
-- -- -- where order_status = 'delivered'
-- -- -- where order_status = 'shipped'
-- -- -- where order_status = 'canceled'
-- -- -- where order_status = 'unavailable'
-- -- -- where order_status = 'invoiced'
-- -- where o.order_status = 'processing'
-- -- -- where order_status = 'created'
-- -- -- where order_status = 'approved'
-- -- and 
-- -- 	r.review_score is not null
-- -- -- and oi.order_id is null
-- -- order by comment_before_delivery desc offset 4393

-- -- select avg(r.review_score),count(*)
-- -- from olist.orders as o
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where
-- -- -- join olist.order_payments as p
-- -- -- using (order_id)
-- -- -- join olist.order_items as oi
-- -- -- using (order_id)
-- -- -- where order_status = 'delivered'
-- -- -- where order_status = 'shipped'
-- -- -- where order_status = 'canceled'
-- -- -- where order_status = 'unavailable'
-- -- -- where order_status = 'invoiced'
-- -- -- where o.order_status = 'processing'
-- -- -- where order_status = 'created'
-- -- -- where order_status = 'approved'
-- -- -- and 
-- -- 	r.review_score is not null

-- -- select o.order_status, count(*)::numreric/
-- -- from olist.orders as o
-- -- join olist.order_reviews as r
-- -- using (order_id)
-- -- where r.review_score is not null
-- -- group by o.order_status
-- -- ----------------------------------------------------------------------------------
-- -- >>>>>>>>>>STATUS x CUSTOMER REVIEWS<<<<<<<<<<<<<<<

-- -- Determine how many orders in each status have a review

-- -- total reviews :    99224/99441 (avg rating : 4.1)

-- -- delivered     :    96361/96478 (avg rating : 4.2)
-- -- ]out of 39099 comments, 34706 were done before estimated date ranging from 21 days
-- -- to last estimated date of the delivery, while other 4393 were done after estimated
-- -- date ranging from 16 days to 1 day late of the estimated date and there were some
-- -- outliers ranging from 96 days to 43 days.
-- -- ]comments before estimated date complained about incomplete, incorrect and damaged
-- -- items, while comments done after estimated date complained about delayed deliveries.

-- -- shipped       :    1043/1107 (avg rating : 2.0)
-- -- ]out of 634 comments, 597 were done after under 7 days of estimated date which 
-- -- were about not getting product and were trying to cancel the product because
-- -- of delay while 37 comments were done before estimated date and were about receiveing
-- -- product after cancellation and still not getting product.

-- -- canceled      :    609/625 (avg rating : 1.8)
-- -- ]out of 406 comments, 67 were done before estimated date and were about replacing
-- -- and reshipping products while other 339 were about refund and cancel without reason.

-- -- unavailable   :    597/609 (avg rating : 1.5)
-- -- ]out of 415 comments, 3 were provided the product before estimated date which is 
-- -- suspicious due to unavailable status, while 412 comments suggest that there were
-- -- refund problems and not receiveing any reason for cancellation.

-- -- invoiced      :    313/314 (avg rating : 1.7)
-- -- ]out of 214 comments 2 were done before estimated date because they got the product
-- -- and were satisfied with the product, while other 212 were done under 7 days after 
-- -- estimated date. 
-- -- ]2 orders were missing from the order_items,in which 1 did not receive the product
-- -- and other was complaining about not receiving the product while still paying
-- -- installments.
-- -- ]The review comments suggest that either customer have not been informed about there
-- -- order status or there is a technical problem in the store which could explain stuck
-- -- invoiced status.

-- -- processing    :    296/301 (avg rating : 1.3)
-- -- ]out of 207 comments 2 were done before estimated date because they got the product
-- -- and were satisfied with the product, while other 205 were done under 8 days after 
-- -- estimated date. which is logical as customers were eager to get their product.

-- -- created       :    3/5 (avg rating : 2.3)
-- -- ]1 customer was informed by the store to cancel the order, while other complained 
-- -- of not receiveing the product and was not informed about anything.

-- -- approved      :    2/2 (avg rating : 2.5)
-- -- ]no comments

-- -- total review_score : 99.8%
-- -- delivered     :    99.9%
-- -- shipped       :    94.2%
-- -- canceled      :    97.4%
-- -- unavailable   :    98.0%
-- -- invoiced      :    99.7%
-- -- processing    :    98.3%
-- -- created       :    60.0%
-- -- approved      :    100%

-- -- ---------------------------------------------------------------------------------
-- -- select *
-- -- from olist.orders
-- -- where order_status = 'canceled'

-- -- select *
-- -- from olist.orders
-- -- where order_status = 'canceled'
-- -- -- and order_approved_at is not null
-- -- -- and order_delivered_carrier_date is not null
-- -- and order_delivered_customer_date is not null

-- -- select *
-- -- from olist.orders
-- -- join olist.order_Reviews
-- -- using (order_id)
-- -- where order_status = 'canceled'
-- -- and review_score is not null

-- -- select review_score, count(*)::numeric/609
-- -- from olist.orders
-- -- join olist.order_Reviews
-- -- using (order_id)
-- -- where order_status = 'canceled'
-- -- and review_score is not null
-- -- group by review_score
-- -- ---------------------------------------------------------------------------------
-- -- >>>>>>>>>>CANCELLED ORDERS<<<<<<<<<<<<<<

-- -- -total cancelled orders : 625
-- -- -how many have approval dates : 484
-- -- -how many have carrier dates : 75
-- -- -how many have customer delivery dates : 6
-- -- -how many have reviews : 609
-- -- -review-score distribution, if reviews exist;
-- -- 1 : 69.3%
-- -- 2 : 7.2%
-- -- 3 : 7.9%
-- -- 4 : 4.3%
-- -- 5 : 11.3%

-- -- ---------------------------------------------------------------------------------

-- -- >>>>>>>>>>>>>>>>>>BUSINESS CLASSIFICATION<<<<<<<<<<<<<<<<<<<<<

-- -- }CLASSIFICATION
-- -- >Completed : delievered 
-- -- >In progress : created | invoiced | processing | approved | shipped
-- -- >Cancelled : canceled
-- -- >Unavailable : unavailable

-- -- >completed orders tells about daily-monthly-yearly revenues, purchase trends, 
-- -- product performance and trends, and areas to improve on.
-- -- > in progress orders:
-- -- current fulfillment backlog
-- -- operational pipeline
-- -- potential future deliveries
-- -- orders stuck at particular stages
-- -- possible fulfillment problems
-- -- >cancelled orders tells about Identifying patterns associated with cancellations 
-- -- across customers, sellers, products, categories, payment methods and order 
-- -- timelines.
-- -- >unavailable orders :identify products/categories associated with unavailable 
-- -- orders.

-- -- --------------------------------------------------------------------------------

-- -- >>>>>>>>>>>>>>>>>>>>DEFINE BUSINESS QUESTIONS<<<<<<<<<<<<<<<<<<<<<<

-- -- 1.revenue by year,month,product,seller,geography,on festival dates over the years.
-- -- >helps management understand yearly,monthly growth/decline
-- -- >helps management understand which product and sellers contribute most and least to
-- -- revenue.
-- -- >helps management understand if they are taking advantages of festival seasons over
-- -- time.
-- -- 2.which product sells the highest,lowest
-- -- >helps management understand which products are best/worst performer 
-- -- 3.product demand trends
-- -- >helps management understand which products are in demand or no demand over time
-- -- 4.which seller sells the highest,lowest
-- -- >helps management understand which seller sells most/least product 
-- -- 5.seller revenue by year,month
-- -- >helps management understand which seller sells most/least over time
-- -- 6.order status trend by year,month,geography
-- -- >helps management understand if order status are improving/declining over time like
-- -- cancellation and unavailability and if there are trends over geography
-- -- 7.payment method trend by geography
-- -- >helps management understand if there is technical/cultural trend in payment method
-- -- from different states and city
-- -- 8.repeat customers
-- -- >helps management understand what percentage of customers are regular and if that
-- -- number is improving/declining over time
-- -- 9.review score by seller
-- -- >helps management understand which seller gives most/least customer satisfaction.
-- -- 10.review score by repeat customers
-- -- >helps management understand if repeat customers are staying satisfied or if there
-- -- is trend that contributes to repeat customers leaving. 
-- -- 11.review score by product
-- -- >helps management understand which products satisfies the customer most/least.
-- -- 12.review score by geography
-- -- >helps management understand if there is trend in satisfaction by geography, and if
-- -- certain geography like certain category of products most/least.
-- -- 13.most/least cancelled product
-- -- >helps management understand which products are cancelled most/least and how to 
-- -- improve that.
-- -- 14.most/least cancelled seller
-- -- >helps management understand if the seller of the products have anything to do with
-- -- most/least cancelled product.
-- -- 15.cancellation rate by month,year,geography
-- -- >helps management understand if cancellation rate are growing/declining over time
-- -- and location.

-- -- >>>In business language

-- -- #Category A — Sales & Revenue Performance
-- -- 1.How does revenue vary across years, months, products, sellers, geographic
-- -- regions, and festival periods, and what are the key patterns in revenue growth,
-- -- decline, and seasonal performance?
-- -- 2.Which products generate the highest and lowest sales volumes, and which 
-- -- products are the strongest and weakest performers?
-- -- 3.How does demand for individual products change over time, and which products
-- -- show increasing, declining, stable, or consistently low demand?
-- -- 4.Which sellers generate the highest and lowest sales volumes, and which sellers
-- -- are the strongest and weakest performers?
-- -- 5.How does revenue generated by individual sellers change across months and years,
-- -- and which sellers demonstrate sustained growth or decline?

-- -- #Category B — Order & Operational Performance
-- -- 6.How do order statuses change over time and across geographic regions, and are
-- -- cancellation, unavailability, and other unsuccessful order outcomes improving 
-- -- or deteriorating?
-- -- 7.How do customer payment-method preferences vary across geographic regions, 
-- -- and how do these preferences change over time?

-- -- #Category C — Customer Retention & Behavior
-- -- 8.What proportion of customers make repeat purchases, how does customer retention 
-- -- change over time, and is the business becoming more or less successful at retaining
-- -- customers?

-- -- #Category D — Customer Satisfaction
-- -- 9.How does customer satisfaction vary across sellers, and which sellers consistently
-- -- receive higher or lower customer review scores?
-- -- 10.How does satisfaction among repeat customers change over time, and are lower review
-- -- scores associated with reduced customer retention?
-- -- 11.Which products receive the highest and lowest customer review scores, and which
-- -- products may require improvement based on customer feedback?
-- -- 12.How does customer satisfaction vary across geographic regions, and are there 
-- -- geographic differences in satisfaction for particular product categories?

-- -- #Category E — Cancellation Performance
-- -- 13.Which products experience the highest and lowest cancellation levels, and what
-- -- product-level patterns may help explain or reduce cancellations?
-- -- 14.Which sellers experience the highest and lowest cancellation levels, and is seller
-- -- performance associated with differences in product cancellations?
-- -- 15.How does the cancellation rate vary across months, years, and geographic regions,
-- -- and is the cancellation problem improving or worsening over time?

-- -- -----------------------------------------------------------------------------------

-- -- ############ 7 strategic business questions ##############

-- -- 1. How is the business performing financially and commercially?

-- -- >How has the business's revenue and sales performance evolved over time, and 
-- -- how do products, sellers, geographic regions, and festival periods contribute 
-- -- to overall business performance?

-- -- Supporting questions:

-- -- Revenue growth/decline
-- -- Monthly and yearly performance
-- -- Product contribution
-- -- Seller contribution
-- -- Geographic contribution
-- -- Festival/seasonal performance

-- -- (Covers: Q1, Q4, Q5)

-- -- 2. Which products are driving or weakening business performance?

-- -- Which products and product categories are the strongest and weakest performers,
-- -- and how is their sales demand changing over time?

-- -- Supporting questions:

-- -- Highest/lowest-selling products
-- -- Product demand trends
-- -- Growing products
-- -- Declining products
-- -- Consistently low-demand products
-- -- Customer satisfaction by product

-- -- (Covers: Q2, Q3, Q11, part of Q13)

-- -- 3. How are sellers performing across sales and customer outcomes?

-- -- Which sellers are contributing most and least to business performance, and how do differences in seller sales, revenue, cancellations, delivery performance, and customer satisfaction compare?

-- -- Supporting questions:

-- -- Seller sales
-- -- Seller revenue
-- -- Seller growth/decline
-- -- Seller cancellations
-- -- Seller reviews
-- -- Seller operational performance

-- -- (Covers: Q4, Q5, Q9, Q14)

-- -- 4. How effectively is the business retaining customers?

-- -- How strong is customer retention, what proportion of customers make repeat purchases, and how does the behavior and satisfaction of repeat customers change over time?

-- -- Supporting questions:

-- -- New vs repeat customers
-- -- Repeat-customer rate
-- -- Retention trend
-- -- Repeat purchasing behavior
-- -- Repeat-customer satisfaction
-- -- Potential relationship between satisfaction and retention

-- -- (Covers: Q8, Q10)

-- -- 5. How well is the order and delivery operation performing?

-- -- How effectively is the business fulfilling orders, and how do order outcomes, delivery performance, and operational issues vary across time, sellers, products, and geographic regions?

-- -- Supporting questions:

-- -- Order-status trends
-- -- Successful vs unsuccessful orders
-- -- Delivery performance
-- -- Late deliveries
-- -- Seller differences
-- -- Product differences
-- -- Geographic differences

-- -- (Covers: Q6 + delivery-related analysis)

-- -- 6. What factors are associated with cancellations and unsuccessful orders?

-- -- What patterns are associated with order cancellations and other unsuccessful order outcomes, and how do these vary across products, sellers, time periods, and geographic regions?

-- -- Supporting questions:

-- -- Cancellation rate
-- -- Cancellation trend
-- -- Product cancellation
-- -- Seller cancellation
-- -- Geographic cancellation
-- -- Monthly/yearly changes
-- -- Potential operational causes

-- -- (Covers: Q6, Q13, Q14, Q15)

-- -- 7. What factors are associated with customer satisfaction?

-- -- What factors are associated with higher or lower customer satisfaction, and how do review scores vary across products, sellers, delivery performance, customer types, and geographic regions?

-- -- Supporting questions:

-- -- Overall review performance
-- -- Product satisfaction
-- -- Seller satisfaction
-- -- Repeat-customer satisfaction
-- -- Geographic differences
-- -- Delivery vs satisfaction
-- -- Potential relationship between satisfaction and retention

-- -- (Covers: Q9, Q10, Q11, Q12 + delivery analysis)

-- -- -- ========================================================================================
-- -- --                             TASK 6 : METRIC GRAIN
-- -- -- ========================================================================================

-- -- -- ========================================================================================
-- -- --               TASK 6 : Data Preparation & Analytical Tables
-- -- -- '========================================================================================
-- -- Core Business Question ||	Required Tables ||	Primary Grain
-- -- 1. Financial & Commercial Performance || orders,order_items,products,sellers,customers || overall,product,seller
-- -- 2. Product Performance & Demand ||	Orders,order_items, products ||	product
-- -- 3. Seller Performance ||	Orders,order_items, sellers || seller
-- -- 4. Customer Retention ||	customers,orders ||	customer
-- -- 5. Order & Delivery Operations	|| orders, products, sellers, customers	|| order
-- -- 6. Cancellation & Unsuccessful Orders ||orders, products, sellers, customers ||	order
-- -- 7. Customer Satisfaction ||	orders,products,sellers,customers,order_reviews,order_items ||order,product,seller

-- -- -----------------------------------------------------------------------------------
-- -- Base Analytical Table |	What should 1 row represent? |	Main source tables|	Key information it should contain
-- -- Order-level |	1 order | 	orders |	order_id, order_status, time and date for purchase, approved, carrier, delivered, estimated date 
-- -- Order-item-level |	1 order item |	Order-items |	order_id,order_item,product_id,seller_id,price,freight
-- -- Customer-level |	1 customer unique id | customers |	customer_id,customer_unique_id,zip_code,state,city
-- -- Review-level |	1 review record associated with an order | order_reviews | review_id,order_id,review_score,review_title,review_message,review_creation_time
-- -- Payment-level |	1 payment record associated with an order. | order_payments | order_id,payment_type,payment_installments,payment_value

-- -- -----------------------------------------------------------------------------------

-- -- CREATE TABLE order_level AS
-- -- SELECT
-- --     order_id,
-- --     customer_id,
-- --     order_status,
-- --     order_purchase_timestamp,
-- --     order_approved_at,
-- --     order_delivered_carrier_date,
-- --     order_delivered_customer_date,
-- --     order_estimated_delivery_date
-- -- FROM olist.orders;

-- -- CREATE TABLE order_item_level AS
-- -- SELECT
-- --     order_id,
-- --     order_item_id,
-- --     product_id,
-- --     seller_id,
-- --     price,
-- --     freight_value
-- -- FROM olist.order_items;

-- -- CREATE TABLE customer_level AS
-- -- SELECT
-- --     c.customer_unique_id,
-- --     MIN(c.customer_zip_code_prefix) AS zip_code,
-- --     MIN(c.customer_city) AS city,
-- --     MIN(c.customer_state) AS state
-- -- FROM olist.customers c
-- -- GROUP BY c.customer_unique_id;

-- -- CREATE TABLE review_level AS
-- -- SELECT
-- --     review_id,
-- --     order_id,
-- --     review_score,
-- --     review_comment_title,
-- --     review_comment_message,
-- --     review_creation_date
-- -- FROM olist.order_reviews;

-- -- CREATE TABLE payment_level AS
-- -- SELECT
-- --     order_id,
-- --     payment_sequential,
-- --     payment_type,
-- --     payment_installments,
-- --     payment_value
-- -- FROM olist.order_payments;

-- -- ----------------------------------------------------------------------------------
-- -- ===================================================================================
-- -- >>>Business Question 1 — Revenue Performance

-- -- Objective

-- Management wants to understand how revenue has changed over time and where that
-- revenue is coming from.
-- -- ==================================================================================
-- -- Using the Olist dataset, determine:
-- -- ----------------------------------------------------------------------------------
-- select sum(price + freight_value) as overall_revenue
-- from olist.orders as o
-- join olist.order_items as oi
-- using (order_id)
-- where o.order_status = 'delivered'
-- and order_delivered_customer_date is not null


-- create view olist.monthly_revenue as
-- with a as(
-- 	select 
-- 		*,
-- 		extract(year from order_purchase_timestamp) as year,
-- 		extract(month from order_purchase_timestamp) as month,
-- 		TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	where o.order_status = 'delivered'
-- 	and order_delivered_customer_date is not null),

-- b as(select a.year,sum(a.price + a.freight_value)
-- 	from a
-- 	group by a.year),

-- c as(select 
-- 		a.year,
-- 		a.month,
-- 		a.year_month,
-- 		sum(a.price + a.freight_value) as revenue,
-- 		count(*) as delivered_items
-- 	from a
-- 	group by a.year,a.month,a.year_month
-- 	order by year,month asc),

-- d as(select 
-- 			*,
-- 			extract(year from order_estimated_delivery_date) as year,
-- 			extract(month from order_estimated_delivery_date) as month,
-- 			TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	where o.order_status <> 'delivered'
-- 	or order_delivered_customer_date is null),

-- e as(select d.year,d.month,d.year_month,count(*) as non_delivered_items
-- 	from d
-- 	group by d.year,d.month,d.year_month
-- 	order by year,month asc)

-- select year_month,revenue
-- from c
-- left join e
-- using(year,month,year_month);

-- -- ----------------------------------------------------------------------------------
-- -- 1. Overall revenue trend

-- -- Find total revenue for each year,month.
-- -- The result should allow management to see whether revenue is increasing or 
-- -- decreasing over time.

-- -- >>Overall revenue : 15418394.83

-- -- >>Yearly revenue
-- -- 2016  :	46653.74
-- -- 2017  :	6921206.41
-- -- 2018  :	8450534.68

-- -- }Yearly revenue is increasing overtime.
-- -- }2016 to 2017 Growth: 14,735.27%
-- -- }2017 to 2018 Growth: 22.10%

-- >>Monthly revenue
-- year   month  revenue  delivered_items  non_delivered_items
-- 2016	9	143.46	    3	               0
-- 2016	10	46490.66	313	               4
-- 2016	12	19.62	    1	               27
-- 2017	1	127482.37	913	               0
-- 2017	2	271239.32	1858	           9
-- 2017	3	414330.95	2897	           142
-- 2017	4	390812.40	2569	           90
-- 2017	5	566657.40	4003	           127
-- 2017	6	490050.37	3489	           128
-- 2017	7	566299.08	4416	           100
-- 2017	8	645832.36	4797	           105
-- 2017	9	701077.49	4737	           119
-- 2017	10	751117.01	5214	           95
-- 2017	11	1153229.37	8474	           119
-- 2017	12	843078.29	6187	           180
-- 2018	1	1077887.46	8037	           106
-- 2018	2	966168.41	7518	           148
-- 2018	3	1120598.24	8017	           205
-- 2018	4	1132878.93	7827	           190
-- 2018	5	1128774.52	7810	           165
-- 2018	6	1011448.96	7007	           78
-- 2018	7	1027286.52	6960	           96
-- 2018	8	985491.64	7142	           202

-- -- ----------------------------------------------------------------------------------
-- create view olist.product_revenue as 
-- WITH product_revenue AS (
--     SELECT 
--         product_id, 
--         SUM(price + freight_value) AS revenue
--     FROM olist.orders AS o 
--     JOIN olist.order_items AS oi USING (order_id) 
--     WHERE o.order_status = 'delivered' 
--       AND order_delivered_customer_date IS NOT NULL 
--     GROUP BY product_id
-- ),
-- quartiles AS (
--     SELECT 
--         revenue,
--         NTILE(4) OVER (ORDER BY revenue DESC) AS nb,
--         SUM(revenue) OVER () AS total_revenue
--     FROM product_revenue
-- )
-- SELECT 
--     CASE 
--         WHEN nb = 1 THEN 'Top 25%' 
--         WHEN nb IN (2, 3) THEN 'Middle 50%' 
--         WHEN nb = 4 THEN 'Bottom 25%' 
--     END AS product_revenue_bucket,
--     ROUND((SUM(revenue) / MAX(total_revenue)) * 100, 2) AS revenue_percentage_share
-- FROM quartiles
-- GROUP BY 
--     CASE 
--         WHEN nb = 1 THEN 'Top 25%' 
--         WHEN nb IN (2, 3) THEN 'Middle 50%' 
--         WHEN nb = 4 THEN 'Bottom 25%' 
--     END
-- ORDER BY 
--     MIN(nb);


-- with a as(
-- 	select 
-- 		product_id, 
-- 		sum(price + freight_value) as revenue,
-- 		count(*) as n_items,
-- 		count(distinct o.order_id) as n_orders
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	where o.order_status = 'delivered'
-- 	and order_delivered_customer_date is not null
-- 	group by product_id
-- 	order by revenue desc
-- 	),

-- b as(select 
-- 		product_id, 
-- 		sum(price + freight_value) as revenue,
-- 		count(*) as n_items,
-- 		count(distinct o.order_id) as n_orders
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	where o.order_status = 'delivered'
-- 	and order_delivered_customer_date is not null
-- 	group by product_id
-- 	order by revenue asc
-- 	),

-- c as(select 
-- 		product_id,
-- 		product_category_name_english,
-- 		revenue,
-- 		n_items, n_orders
-- 	from a 
-- 	join olist.products as p
-- 	using (product_id)
-- 	join olist.product_category_name_translation as t
-- 	using (product_category_name)),

-- d as(select product_id,product_category_name_english,revenue,n_items, n_orders
-- 	from b
-- 	join olist.products as p
-- 	using (product_id)
-- 	join olist.product_category_name_translation as t
-- 	using (product_category_name)),

-- e as(select *,
-- 	ntile(4) over(order by revenue desc) as nb
-- from a),

-- f as(select nb , round((sum(revenue)/15418394.83)*100,2) as revenue_percentage
-- from e
-- group by nb
-- order by nb)

-- -- ---------------------------------------------------------------------------------
-- -- 2. Revenue by product

-- -- Which products generated the highest total revenue?
-- -- product : bb50f2e236e5eea0100680137654686c
-- -- category : health_beauty
-- -- total revenue : 67258.03
-- -- number of items : 194
-- -- number of orders : 186

-- -- Which products generated the lowest total revenue?
-- -- product : 46fce52cef5caa7cc225a5531c946c8b/d51e0a7f437c0d14f560082ed007fd85/310dc32058903b6416c71faff132df9e
-- -- category : health_beauty/perfumery/stationery
-- -- total revenue : 9.59/9.95/10.07
-- -- number of items : 1/1/1
-- -- number of orders : 1/1/1

-- -- ---------------------------------------------------------------------------------

-- create view olist.seller_revenue as
-- WITH seller_revenue AS (
--     SELECT 
--         seller_id, 
--         SUM(price + freight_value) AS revenue
--     FROM olist.orders AS o 
--     JOIN olist.order_items AS oi USING (order_id) 
--     WHERE o.order_status = 'delivered' 
--       AND order_delivered_customer_date IS NOT NULL 
--     GROUP BY seller_id
-- ),
-- quartiles AS (
--     SELECT 
--         revenue,
--         NTILE(4) OVER (ORDER BY revenue DESC) AS nb,
--         SUM(revenue) OVER () AS total_revenue
--     FROM seller_revenue
-- )
-- SELECT 
--     CASE 
--         WHEN nb = 1 THEN 'Top 25%' 
--         WHEN nb IN (2, 3) THEN 'Middle 50%' 
--         WHEN nb = 4 THEN 'Bottom 25%' 
--     END AS seller_revenue_bucket,
--     ROUND((SUM(revenue) / MAX(total_revenue)) * 100, 2) AS revenue_percentage_share
-- FROM quartiles
-- GROUP BY 
--     CASE 
--         WHEN nb = 1 THEN 'Top 25%' 
--         WHEN nb IN (2, 3) THEN 'Middle 50%' 
--         WHEN nb = 4 THEN 'Bottom 25%' 
--     END
-- ORDER BY 
--     MIN(nb);


-- with a as(
-- 	select 
-- 		seller_id, 
-- 		sum(price + freight_value) as revenue,
-- 		count(*) as n_items,
-- 		count(distinct o.order_id) as n_orders
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	where o.order_status = 'delivered'
-- 	and order_delivered_customer_date is not null
-- 	group by seller_id
-- 	order by revenue desc
-- 	),

-- b as(select 
-- 		seller_id, 
-- 		sum(price + freight_value) as revenue,
-- 		count(*) as n_items,
-- 		count(distinct o.order_id) as n_orders
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	where o.order_status = 'delivered'
-- 	and order_delivered_customer_date is not null
-- 	group by seller_id
-- 	order by revenue asc
-- 	)
-- select sum(revenue) from b
-- select *
-- from a
-- union all
-- select *
-- from b


-- -- --------------------------------------------------------------------------------

-- -- 3. Revenue by seller

-- -- Determine:

-- -- Which sellers generated the highest total revenue?
-- -- seller : 4869f7a5dfa277a7dca6462dcf3b52b2
-- -- total revenue : 247007.06
-- -- number of items : 1148
-- -- number of orders : 1124

-- -- Which sellers generated the lowest total revenue?
-- -- seller : 77128dec4bec4878c37ab7d6169d6f26/1fa2d3def6adfa70e58c276bb64fe5bb
-- -- total revenue : 15.22/15.90
-- -- number of items : 1/1
-- -- number of orders : 1/1

-- -- ---------------------------------------------------------------------------------

-- create view olist.geography_revenue as
-- WITH city_revenue AS (
--     SELECT 
--         c.customer_state,
--         c.customer_city,
--         SUM(oi.price + oi.freight_value) AS revenue,
--         SUM(SUM(oi.price + oi.freight_value)) OVER () AS total_revenue
--     FROM olist.customers AS c
--     JOIN olist.orders AS o USING (customer_id)
--     JOIN olist.order_items AS oi USING (order_id)
--     WHERE o.order_status = 'delivered'
--       AND o.order_delivered_customer_date IS NOT NULL
--     GROUP BY c.customer_state, c.customer_city
-- )
-- SELECT 
--     customer_state,
--     customer_city,
--     ROUND(revenue, 2) AS revenue,
--     ROUND((revenue / total_revenue) * 100, 4) AS revenue_share_percentage
-- FROM city_revenue
-- ORDER BY 
--     revenue DESC;


-- with a as(select customer_state, sum(price + freight_value) as revenue
-- from olist.customers as c
-- join olist.orders as o
-- using (customer_id)
-- join olist.order_items as oi
-- using (order_id)
-- where o.order_status = 'delivered'
-- 	and order_delivered_customer_date is not null
-- group by customer_state
-- order by revenue desc
-- ),

-- b as(select customer_state, sum(price + freight_value) as revenue
-- from olist.customers as c
-- join olist.orders as o
-- using (customer_id)
-- join olist.order_items as oi
-- using (order_id)
-- where o.order_status = 'delivered'
-- 	and order_delivered_customer_date is not null
-- group by customer_state
-- order by revenue
-- ),

-- c as(select customer_state,customer_city, sum(price + freight_value) as revenue
-- from olist.customers as c
-- join olist.orders as o
-- using (customer_id)
-- join olist.order_items as oi
-- using (order_id)
-- where o.order_status = 'delivered'
-- 	and order_delivered_customer_date is not null
-- group by customer_state,customer_city
-- order by revenue desc
-- ),

-- d as(select customer_city, sum(price + freight_value) as revenue
-- from olist.customers as c
-- join olist.orders as o
-- using (customer_id)
-- join olist.order_items as oi
-- using (order_id)
-- where o.order_status = 'delivered'
-- 	and order_delivered_customer_date is not null
-- group by customer_city
-- order by revenue
-- )

-- select sum(revenue), round((sum(revenue)::numeric/15418394.83)*100,2) from a union all
-- select sum(revenue), round((sum(revenue)::numeric/15418394.83)*100,2) from b union all
-- select sum(revenue), round((sum(revenue)::numeric/15418394.83)*100,2) from c union all
-- select sum(revenue), round((sum(revenue)::numeric/15418394.83)*100,2) from d 

-- -- ----------------------------------------------------------------------------------
-- -- 4. Revenue by geography

-- -- Determine revenue by customer geography, particularly:

-- -- state name : SP (São Paulo)
-- -- most revenue : 5768518.23

-- -- state name : RR (Roraima)
-- -- least revenue : 9039.52

-- -- city name : sao paulo
-- -- most revenue : 2107960.17

-- -- city name : sabaudia
-- -- least revenue : 20.42

-- -- ----------------------------------------------------------------------------------

-- -- with a as(
-- -- 	select 
-- -- 		order_purchase_timestamp::date as date, sum(price + freight_value) as revenue
-- -- 	from olist.orders as o
-- -- 	join olist.order_items 
-- -- 	using (order_id)
-- -- 	where o.order_status = 'delivered'
-- -- 		and order_delivered_customer_date is not null
-- -- 	group by order_purchase_timestamp::date 
-- -- 	order by revenue desc
-- -- 	limit 10)

-- -- select date
-- -- from a 
-- -- order by date
-- -- ---------------------------------------------------------------------------------

-- -- 5. Revenue during festival periods

-- -- Compare revenue during relevant Brazilian/major shopping festival periods across
-- -- different years.
-- -- >dataset contains 3 years, of which 1 contains 12 months. therefore it is not
-- -- possible to follow festival period over years.
-- -- >Below dates are top 10 revenue dates from the dataset, in which metric is purchase
-- -- date.

-- -- "2017-11-24" : 175178.46
-- -- "2017-11-25" : 70683.26
-- -- "2018-05-16" : 63957.96
-- -- "2018-08-06" : 62728.22
-- -- "2018-05-07" : 60805.36
-- -- "2018-05-14" : 60753.87
-- -- "2018-06-11" : 57313.28
-- -- "2018-05-10" : 56936.61
-- -- "2017-11-27" : 55887.39
-- -- "2017-11-28" : 55855.47

-- -- }most revenue when customers registered purchasing of the product was 175178,
-- -- which is more than double of the second highest revenue (70683).
-- -- }Last friday of the november was 'Black Friday', which is considered 
-- -- 'the undisputed king of brazilian retail'. it drives the single highest shopping
-- -- volume of the entire year.

-- -- ----------------------------------------------------------------------------------

-- -- ==================================================================================
-- -- Business Question 2 — Product Performance & Demand
-- -- Objective

-- -- Which products and product categories are the strongest and weakest performers,
-- and how is their sales demand changing over time?

-- -- ===================================================================================

-- select count(order_item_id) as overall_items_sold
-- from olist.orders as o
-- join olist.order_items 
-- using (order_id)
-- where o.order_status = 'delivered'
-- 	and order_delivered_customer_date is not null

-- create view olist.product_sales_volume as 
-- with ai as(
-- 	select product_id, count(order_item_id) as n_items
-- 	from olist.orders as o
-- 	join olist.order_items 
-- 	using (order_id)
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 	group by product_id
-- 	order by n_items desc),

-- bi as(select *,
-- 		FLOOR(n_items / 50) AS items_,
--     	CONCAT(FLOOR(n_items / 50) * 50, '-', (FLOOR(n_items / 50) * 50) + 49) AS n_items_range
-- 	from ai),

-- ci as(select *,
-- 		FLOOR(n_items / 10) AS items_,
--     	CONCAT(FLOOR(n_items / 10) * 10, '-', (FLOOR(n_items / 10) * 10) + 9) AS n_items_range
-- 	from ai),

-- di as(select *,
-- 		FLOOR(n_items / 1) AS items_,
--     	CONCAT(FLOOR(n_items / 1) * 1) AS n_items_range
-- 	from ai)

-- select 
-- 	product_id as Products,
-- 	n_items as Sales_Volume
-- from ai order by n_items desc

-- select n_items_range,count(product_id) as n_products
-- from ci
-- group by n_items_range
-- order by n_products desc



-- with ao as(
-- 	select product_id, count(distinct oi.order_id) as n_orders
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 	group by product_id
-- 	order by n_orders desc),

-- bo as(select *,
--     	CONCAT(FLOOR(n_orders / 50) * 50, '-', (FLOOR(n_orders / 50) * 50) + 49) AS n_orders_range
-- 	from ao),

-- co as(select *,
--     	CONCAT(FLOOR(n_orders / 10) * 10, '-', (FLOOR(n_orders / 10) * 10) + 9) AS n_orders_range
-- 	from ao),

-- doo as(select *,
--     	CONCAT(FLOOR(n_orders / 1) * 1) AS n_orders_range
-- 	from ao)

-- select * from ao order by n_orders desc

-- select n_orders_range, count(product_id) as n_products
-- from do
-- group by n_orders_range
-- order by n_products desc
-- -- -----------------------------------------------------------------------------------

-- 1. Product sales volume

-- For each product, determine:

-- >>Number of items sold
-- ]overall items sold : 110189

-- >>number of products containing range of items 
-- n_item_range:  n_products            n_item_range :  n_products        n_item_range :  n_products
-- "0-49"      :    32040 -------------->   "0-9"    :   30330 ----------->  "1"       :   17716                                
-- "50-99"     :    118  ----------|        "10-19"  :   1195                "2"       :   5667               
-- "100-149"   :    31             |        "20-29"  :   313                 "3"       :   2606              
-- "150-199"   :    12             |        "30-39"  :   126                 "4"       :   1494              
-- "250-299"   :    3              |        "40-49"  :   76                  "5"       :   973            
-- "350-399"   :    3              |----->  "50-59"  :   46                  "6"       :   717
-- "450-499"   :    2                       "60-69"  :   26                  "7"       :   504
-- "300-349"   :    2                       "80-89"  :   18                  "8"       :   370
-- "200-249"   :    2                       "70-79"  :   17                  "9"       :   283
-- "500-549"   :    1                       "90-99"  :   11
-- }99.5% of products have sold less than 50 items.

-- >>Number of distinct orders containing the product
-- n_orders_range:  n_products n_orders_range:  n_products  n_orders_range:  n_products 
-- "0-49"      :    32069---->    "0-9"    :    30571------->     "1"     :    19115
-- "50-99"     :    94            "10-19"  :    1039              "2"     :    5323
-- "100-149"   :    30            "20-29"  :    272               "3"     :    2346
-- "150-199"   :    9             "30-39"  :    115               "4"     :    1321
-- "250-299"   :    5             "40-49"  :    72                "5"     :    874
-- "300-349"   :    3             "50-59"  :    36                "6"     :    584
-- "400-449"   :    1             "60-69"  :    21                "7"     :    450
-- "450-499"   :    1             "80-89"  :    17                "8"     :    308
-- "200-249"   :    1             "70-79"  :    13                "9"     :    250
-- "350-399"   :    1             "90-99"  :    7
-- }99.6% of products have been part of less than 50 orders.


-- >>Products with the highest number of items sold: 
-- ]items : 520
-- ]product_id : aca2eb7d00ea1a7b8ebd4e68314663af

-- >>Products with the lowest number of items sold: 
-- ]there are 17716 products with 1 item sold, which is 55% of total products.
-- ]there are 30330 products with less than 10 items sold, which is 94.2% of total products.

-- >>Products appearing in the highest number of distinct orders
-- ]orders : 456
-- ]product_id : 99a4788cb24856965c36a24e339b6058

-- >>Products appearing in the lowest number of distinct orders
-- ]there are 19115 products with 1 order, which is 59.3% of total products.
-- ]there are 30571 products with less than 10 orders, which is 95% of total products.

-- -- -------------------------------------------------------------------------------------------------

-- -- select product_id, sum(price + freight_value) as revenue
-- -- from olist.orders as o
-- -- join olist.order_items 
-- -- using (order_id)
-- -- where o.order_status = 'delivered'
-- -- 	and order_delivered_customer_date is not null
-- -- group by product_id
-- -- order by revenue desc

-- -- -------------------------------------------------------------------------------------------------
-- -- 2. Product revenue

-- -- >>Highest-revenue products: 
-- -- revenue : 67258.03
-- -- product_id : bb50f2e236e5eea0100680137654686c

-- -- >>Lowest-revenue products :
-- -- revenue : 9.59
-- -- product_id : 46fce52cef5caa7cc225a5531c946c8b

-- -- -------------------------------------------------------------------------------------------------

-- -- -- 2 product category were not in translation table 
-- -- -- portateis_cozinha_e_preparadores_de_alimentos : Kitchen Appliances & Food Prep
-- -- -- pc_gamer : gaming pc

-- -- INSERT INTO 
-- -- 	olist.product_category_name_translation (product_category_name, product_category_name_english)
-- -- VALUES 
-- --     ('portateis_cozinha_e_preparadores_de_alimentos', 'Kitchen Appliances & Food Prep'),
-- --     ('pc_gamer', 'gaming pc');

-- -- select count(distinct product_category_name)
-- -- from olist.product_category_name_translation

-- -- select 
-- -- 	count(distinct o.order_id),count(order_item_id),count(distinct product_category_name)
-- -- from olist.orders as o
-- -- join olist.order_items as oi 
-- -- using (order_id)
-- -- join olist.products as p
-- -- using (product_id)
-- -- join olist.product_category_name_translation as t
-- -- using (product_category_name)
-- -- where o.order_status = 'delivered'
-- -- 	and order_delivered_customer_date is not null
-- -- 	and t.product_category_name is null

-- -- select distinct seller_id
-- -- from olist.orders as o
-- -- join olist.order_items as oi 
-- -- using (order_id)
-- -- join olist.products as p
-- -- using (product_id)
-- -- join olist.sellers
-- -- using (seller_id)
-- -- where o.order_status = 'delivered'
-- -- 	and order_delivered_customer_date is not null 
-- -- 	and product_category_name is null

-- -- select distinct seller_id from olist.sellers

-- create view olist.product_category_performance as
-- select 
-- 	product_category_name_english as product_category, 
-- 	count(order_item_id) as sales_volume,
-- 	sum(price + freight_value) as revenue,
-- 	round((sum(price + freight_value)::numeric/15418394.83)*100,2) as revenue_share
-- from olist.orders as o
-- join olist.order_items as oi 
-- using (order_id)
-- join olist.products as p
-- using (product_id)
-- left join olist.product_category_name_translation as t
-- using (product_category_name)
-- where o.order_status = 'delivered'
-- 	and order_delivered_customer_date is not null
-- group by product_category_name, product_category_name_english
-- order by revenue desc


-- with ai as(
-- 	select 
-- 		product_category_name_english as product_category, 
-- 		count(order_item_id) as sales_volume,
-- 		sum(price + freight_value) as revenue,
-- 		round((sum(price + freight_value)::numeric/15418394.83)*100,2) as revenue_share
-- 	from olist.orders as o
-- 	join olist.order_items as oi 
-- 	using (order_id)
-- 	join olist.products as p
-- 	using (product_id)
-- 	left join olist.product_category_name_translation as t
-- 	using (product_category_name)
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 	group by product_category_name, product_category_name_english
-- 	order by revenue desc),

-- bi as(select *,
--     	CONCAT(FLOOR(total_items / 1000) * 1000, '-', (FLOOR(total_items / 1000) * 1000) + 999) AS n_items_range
-- 	from ai),

-- ci as(select *,
--     	CONCAT(FLOOR(total_items / 100) * 100, '-', (FLOOR(total_items / 100) * 100) + 99) AS n_items_range
-- 	from ai),

-- di as(select *,
--     	CONCAT(FLOOR(total_items / 10) * 10, '-', (FLOOR(total_items / 10) * 10) + 9) AS n_items_range
-- 	from ai)

-- select * 
-- from ai
	
-- select n_items_range, count(*) as n_p_category
-- from ci
-- group by n_items_range
-- order by n_p_category desc

-- with ao as(
-- 	select product_category_name,product_category_name_english,
-- 		count(distinct o.order_id) as n_orders
-- 	from olist.orders as o
-- 	join olist.order_items as oi 
-- 	using (order_id)
-- 	join olist.products as p
-- 	using (product_id)
-- 	left join olist.product_category_name_translation as t
-- 	using (product_category_name)
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 	group by product_category_name, product_category_name_english
-- 	order by n_orders desc),

-- bo as(select *,
--     	CONCAT(FLOOR(n_orders / 1000) * 1000, '-', (FLOOR(n_orders / 1000) * 1000) + 999) AS n_order_range
-- 	from ao),

-- co as(select *,
--     	CONCAT(FLOOR(n_orders / 100) * 100, '-', (FLOOR(n_orders / 100) * 100) + 99) AS n_order_range
-- 	from ao),

-- doo as(select *,
--     	CONCAT(FLOOR(n_orders / 10) * 10, '-', (FLOOR(n_orders / 10) * 10) + 9) AS n_order_range
-- 	from ao)

-- select * 
-- from ao
	
-- select n_order_range, count(*) as n_p_category
-- from doo
-- group by n_order_range
-- order by n_p_category desc

-- -- select product_category_name, product_category_name_english,sum(price+freight_value) as revenue
-- -- from olist.orders as o
-- -- join olist.order_items as oi 
-- -- using (order_id)
-- -- join olist.products as p
-- -- using (product_id)
-- -- left join olist.product_category_name_translation as t
-- -- using (product_category_name)
-- -- where o.order_status = 'delivered'
-- -- 	and order_delivered_customer_date is not null
-- -- group by product_category_name, product_category_name_english
-- -- order by revenue desc
-- -- --------------------------------------------------------------------------------------------------

-- -- 3. Product category performance 

-- -- For each category, determine:

-- -- >>total category : 73 + 1(null included)

-- -- ]category : null
-- -- ]products : 584 (under top 20 products)
-- -- ]items sold : 1537 (20th category))
-- -- ]orders : 1392 (under top 20 category)
-- -- ]revenue : 197696 (0.013% of total revenue)
-- -- }inclusion of unknown category is subject to more investigation, but here it is included.

-- -- >>Total items sold: 110189

-- -- n_item_range  :n_category
-- -- "0-999"       : 52 ----> "0-99"    : 20 --->  "0-9"	 :  3
-- -- "1000-1999"   : 6       "100-199"  : 9       "10-19" :	3
-- -- "4000-4999"   : 4       "200-299"  : 10      "20-29" :	2
-- -- "2000-2999"   : 3       "300-399"  : 4       "30-39" :	5
-- -- "8000-8999"   : 2       "400-499"  : 3       "40-49" :	2
-- -- "3000-3999"   : 2       "500-599"  : 2       "50-59" :	1
-- -- "6000-6999"   : 1       "600-699"  : 2       "60-69" :	1
-- -- "9000-9999"   : 1       "700-799"  : 1       "70-79" :	2
-- -- "10000-10999" : 1       "900-999"  : 1       "80-89" :	1
-- -- "7000-7999"   : 1
-- -- "5000-5999"   : 1

-- -- >>highest items category: 
-- -- ]items : 10953
-- -- ]category : cama_mesa_banho (bed_bath_table)

-- -- >>lowest items category:
-- -- ]items : 2
-- -- ]category : seguros_e_servicos (security_and_services)
-- -- ]15 categories have less than 50 items sold, which is 20% of total categories.
-- -- ]26 categories have less than 500 items sold, which is 35% of total categories.


-- -- >>Total distinct orders: 96470

-- -- n_order_range : n_category
-- -- "0-999"       :  52 ------->   "0-99"	22  ---->   "0-9"	3
-- -- "1000-1999"   :  6          "100-199"	9         "10-19"	3
-- -- "3000-3999"   :  5          "200-299"	11        "20-29"	5
-- -- "2000-2999"   :  3          "300-399"	2         "30-39"	4
-- -- "6000-6999"   :  2          "400-499"	4         "50-59"	2
-- -- "5000-5999"   :  2          "600-699"	2         "60-69"	1
-- -- "9000-9999"   :  1          "700-799"	2         "70-79"	2
-- -- "7000-7999"   :  1                                "90-99"	2
-- -- "8000-8999"   :  1                                
-- -- "4000-4999"   :  1

-- -- >>highest orders category: 
-- -- ]orders : 9272
-- -- ]category : cama_mesa_banho (bed_bath_table)

-- -- >>lowest orders category:
-- -- ]orders : 2/7/7
-- -- ]category : seguros_e_servicos (security_and_services)/fashion_childrens_clothes/gaming pc
-- -- ]15 categories have less than 50 orders sold, which is 20% of total categories.
-- -- ]42 categories have less than 300 orders sold, which is 57% of total categories.


-- -- >>Total revenue: 15418394.83

-- -- >>highest revenue by category:
-- -- category : health_beauty
-- -- revenue : 1412089.53

-- -- >>lowest revenue by category:
-- -- category : security_and_services/fashion_childrens_clothes/cds_dvds_musicals
-- -- revenue : 324.51/598.67/954.99

-- -- -----------------------------------------------------------------------------------------------

-- WITH RECURSIVE calendar_base AS (
--     SELECT CAST('2017-01-01' AS TIMESTAMPTZ) AS month_date
--     UNION ALL
--     SELECT DATE_ADD(month_date, INTERVAL '1 MONTH')
--     FROM calendar_base
--     WHERE month_date < CAST('2018-08-01' AS TIMESTAMPTZ)
-- ),

-- ordered_months AS (
--     SELECT 
--         ROW_NUMBER() OVER (ORDER BY month_date) AS month_index,
--         TO_CHAR(month_date, 'YYYY.MM') AS formatted_month
--     FROM calendar_base
-- ),

-- product_catalog AS (
--     SELECT product_id 
--     FROM olist.orders as o
--     JOIN olist.order_items as oi
--     USING (order_id)
--     WHERE o.order_status = 'delivered'
--       AND order_delivered_customer_date IS NOT NULL
-- 	GROUP BY product_id
-- ),

-- master_zero_grid AS (
--     SELECT p.product_id, m.month_index, m.formatted_month
--     FROM product_catalog p
--     CROSS JOIN ordered_months m
-- ),

-- am AS (
 --    SELECT 
 --        product_id,
 --        COUNT(order_item_id) AS items_sold,
 --        TO_CHAR(order_purchase_timestamp,'YYYY.MM') AS year_month,
 --        SUM(price) AS revenue
 --    FROM olist.orders as o
 --    JOIN olist.order_items as oi
 --    USING (order_id)
 --    WHERE o.order_status = 'delivered' 
 --      AND order_delivered_customer_date IS NOT NULL
 --    GROUP BY 
 --        product_id,
 --        TO_CHAR(order_purchase_timestamp,'YYYY.MM')
	-- order by product_id, year_month
-- ),
	
-- bm AS (
--     SELECT 
--         g.product_id,
--         g.month_index,       
--         g.formatted_month,    
--         COALESCE(SUM(am.revenue), 0) AS revenue 
--     FROM master_zero_grid g
--     LEFT JOIN am
--       ON g.product_id = am.product_id 
--      AND am.year_month = g.formatted_month
--     GROUP BY g.product_id, g.month_index, g.formatted_month
-- ),

-- first_purchases AS (
--     SELECT product_id, MIN(formatted_month) AS first_month
--     FROM bm
--     WHERE revenue > 0
--     GROUP BY product_id
-- ),
-- -----------------------------------------------------
-- cm as (
--     SELECT 
-- 	    bm.product_id,
-- 	    bm.month_index,
-- 	    bm.formatted_month,
-- 	    bm.revenue
-- 	FROM bm
-- 	JOIN first_purchases f 
-- 	  ON bm.product_id = f.product_id
-- 	WHERE bm.formatted_month >= f.first_month
-- ),

-- ca as (
-- 	SELECT product_id, count(*) as sales_months
-- 	FROM cm
-- 	WHERE revenue > 0
-- 	GROUP BY product_id
-- ),

-- cb as (
-- 	SELECT product_id, count(*) as total_months
-- 	FROM cm
-- 	GROUP BY product_id
-- ),

-- sp AS (
-- 	select 
-- 		product_id,
-- 		round(total_months::numeric / NULLIF(sales_months, 0)::numeric, 2) as adi
-- 	from cb
-- 	join ca using (product_id)
-- 	where total_months between 4 and 25 
-- ),

-- mia as (
-- 	select *
-- 	from cm
-- 	join sp
-- 	using (product_id)
-- 	where adi >= 1.32
-- ),

-- mib as (
-- 	select product_id, count(*) as zero_months
-- 	from mia
-- 	where revenue = 0
-- 	group by product_id
-- ),

-- mic as (
-- 	SELECT product_id, count(*) as total_months
-- 	FROM mia
-- 	GROUP BY product_id
-- ),

-- mi as (
-- 	select *
-- 	from mia
-- 	join mib
-- 	using (product_id)
-- 	join mic
-- 	using (product_id)
-- ),

-- mc as (
-- 	select *
-- 	from cm
-- 	join sp
-- 	using (product_id)
-- 	where adi < 1.32
-- ),
-- ----------------------------------------------------------
-- nip AS (
-- 	select product_id from cb where total_months <= 3
-- ),

-- latest_system_month AS (
--     SELECT MAX(formatted_month) AS max_month 
-- 	FROM ordered_months
-- ),

-- launch_months as (
--     select 
-- 		cm.product_id,
-- 		cm.month_index,
-- 		cm.formatted_month,
-- 		cm.revenue,
--         DENSE_RANK() OVER (PARTITION BY cm.product_id ORDER BY cm.month_index) as launch_month_sequence
--     from cm
-- 	join nip using (product_id)
-- ),

-- lm as (
--     select 
--         product_id,
--         count(*) as total_active_months,
-- 		max(case when launch_month_sequence = 1 then formatted_month end) as launch_calendar_month,
--         max(case when launch_month_sequence = 1 then revenue end) as month_1_revenue,
-- 		coalesce(max(case when launch_month_sequence = 2 then revenue end), 0) as month_2_revenue,
-- 		coalesce(max(case when launch_month_sequence = 3 then revenue end), 0) as month_3_revenue
--     from launch_months
--     group by product_id
-- ),

-- finale_nip as(
-- 	select 
-- 		lm.product_id,
-- 		lm.total_active_months,
-- 		lm.launch_calendar_month,
-- 		lm.month_1_revenue,
-- 		lm.month_2_revenue,
-- 		lm.month_3_revenue,
		
-- 	    round(
-- 	        ((lm.month_2_revenue - lm.month_1_revenue) / NULLIF(lm.month_1_revenue, 0) * 100)::numeric, 
-- 	        2
-- 	    ) as simple_launch_velocity_pct,
	    
-- 	    round(
-- 	        ((((lm.month_2_revenue + lm.month_3_revenue) / 2.0) - lm.month_1_revenue) / NULLIF(lm.month_1_revenue, 0) * 100)::numeric, 
-- 	        2
-- 	    ) as cumulative_launch_velocity_pct,
	
-- 		case 
-- 			when lm.total_active_months = 1 and lm.launch_calendar_month = lsm.max_month 
-- 				then 'Active Launch (Current Cohort)'
-- 			when lm.total_active_months = 1 and lm.launch_calendar_month < lsm.max_month 
-- 				then 'One-Hit Wonder (Historical Churn)'
-- 			when lm.total_active_months = 2 and lm.month_2_revenue > lm.month_1_revenue 
-- 				then 'Explosive Launch (2M)'
-- 			when lm.total_active_months = 2 and lm.month_2_revenue <= lm.month_1_revenue 
-- 				then 'Slowing Launch (2M)'
-- 			when lm.total_active_months = 3 and (((lm.month_2_revenue + lm.month_3_revenue) / 2.0) > lm.month_1_revenue) 
-- 				then 'Sustained Launch Trend (3M)'
-- 			else 'Post-Launch Drop (3M)'
-- 		end as launch_address_status
	
-- 	from lm
-- 	cross join latest_system_month lsm),

-- fnip as(
-- 	select 
-- 		product_id,
-- 		launch_calendar_month,
-- 		total_active_months,
-- 		month_1_revenue,
-- 		month_2_revenue,
-- 		month_3_revenue,
-- 		launch_address_status,
-- 		case 
-- 		    when total_active_months = 1 then 'Active Pipeline'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct < -50 then 'Critical Drop'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct >= -50 and simple_launch_velocity_pct < -15 then 'Slowing Launch'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct >= -15 and simple_launch_velocity_pct <= 15 then 'Stable Baseline'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct > 15 then 'Breakout Traction'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct < -40 then 'Failed Launch Curve'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct >= -40 and cumulative_launch_velocity_pct < 0 then 'Flat/Lower Tier'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct >= 0 and cumulative_launch_velocity_pct <= 30 then 'Sustained Growth'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct > 30 then 'Core Portfolio Driver'
-- 			else 'confusing'
-- 		end as interpretation_status
-- 	from finale_nip),
	
-- ---------------------------------------------------

-- mix as(
-- 	select 
-- 		*,
-- 		round((zero_months::numeric/total_months::numeric)*100,2) as zdf
-- 	from mi
-- ),

-- miy as(
-- 	select 
-- 		*,
-- 		sum(revenue) over(partition by product_id) as t_revenue,
-- 		case 
-- 			when zdf < 20 then 'Everyday Seller'
-- 			when zdf between 20 and 50 then 'Occasional Seller'
-- 			when zdf > 50 then 'Slow Mover'
-- 		end as zdf_status
-- 	from mix
-- ),

-- fmi as(
-- 	select 
-- 		*,
-- 		ROUND(
-- 	        (t_revenue / NULLIF(15418394.83, 0) * 100)::numeric, 
-- 	        4
-- 	    ) AS revenue_share_pct
-- 	from miy),

-- -----------------------------------------------------------

-- mca as (
-- 	select 
-- 		*,
-- 		round(AVG(revenue) OVER(PARTITION BY product_id),2) AS average_revenue,
-- 		round(REGR_SLOPE(revenue::numeric, month_index) OVER(PARTITION BY product_id)::numeric,2) AS regression_slope,
-- 		round(STDDEV_SAMP(revenue) OVER(PARTITION BY product_id),2) AS std_dev
-- 	from mc
-- ),

-- fmc as (
-- 	select 
-- 		*,
-- 		round((regression_slope/NULLIF(average_revenue, 0))::numeric,2) as normalization,
-- 		round((std_dev/NULLIF(average_revenue, 0))::numeric,2) as cv,
-- 		case
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) > 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.3 then 'increasing'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) < -2
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.3 then 'decreasing'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) between -2 and 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) < 0.25 then 'relatively_consistent'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) between -2 and 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.6 then 'consistently_low'
-- 			else 'mixed/unclassified_trend' 
-- 		end as revenue_trejactory_status
-- 	from mca),
	
-- mom as(
-- 	select product_id, interpretation_status as moms
-- 	from fnip
-- 	union all
-- 	select product_id, zdf_status as moms
-- 	from fmi
-- 	group by product_id, zdf_status
-- 	union all
-- 	select product_id, revenue_trejactory_status as moms
-- 	from fmc
-- 	group by product_id, revenue_trejactory_status)

-- select moms,count(*) from mom group by moms

-- WITH RECURSIVE calendar_base AS (
--     SELECT CAST('2017-01-01' AS TIMESTAMPTZ) AS month_date
--     UNION ALL
--     SELECT DATE_ADD(month_date, INTERVAL '1 MONTH')
--     FROM calendar_base
--     WHERE month_date < CAST('2018-08-01' AS TIMESTAMPTZ)
-- ),

-- ordered_months AS (
--     SELECT 
--         ROW_NUMBER() OVER (ORDER BY month_date) AS month_index,
--         TO_CHAR(month_date, 'YYYY.MM') AS formatted_month
--     FROM calendar_base
-- ),

-- product_catalog AS (
--     SELECT product_id 
--     FROM olist.orders as o
--     JOIN olist.order_items as oi
--     USING (order_id)
--     WHERE o.order_status = 'delivered'
--       AND order_delivered_customer_date IS NOT NULL
-- 	GROUP BY product_id
-- ),

-- master_zero_grid AS (
--     SELECT p.product_id, m.month_index, m.formatted_month
--     FROM product_catalog p
--     CROSS JOIN ordered_months m
-- ),

-- am AS (
--     SELECT 
--         product_id,
--         COUNT(order_item_id) AS items_sold,
--         TO_CHAR(order_purchase_timestamp,'YYYY.MM') AS year_month,
--         SUM(price + freight_value) AS revenue
--     FROM olist.orders as o
--     JOIN olist.order_items as oi
--     USING (order_id)
--     WHERE o.order_status = 'delivered' 
--       AND order_delivered_customer_date IS NOT NULL
--     GROUP BY 
--         product_id,
--         TO_CHAR(order_purchase_timestamp,'YYYY.MM')
-- ),
	
-- bm AS (
--     SELECT 
--         g.product_id,
--         g.month_index,       
--         g.formatted_month,    
--         COALESCE(SUM(am.revenue), 0) AS revenue 
--     FROM master_zero_grid g
--     LEFT JOIN am
--       ON g.product_id = am.product_id 
--      AND am.year_month = g.formatted_month
--     GROUP BY g.product_id, g.month_index, g.formatted_month
-- ),

-- first_purchases AS (
--     SELECT product_id, MIN(formatted_month) AS first_month
--     FROM bm
--     WHERE revenue > 0
--     GROUP BY product_id
-- ),
-- -----------------------------------------------------
-- cm as (
--     SELECT 
-- 	    bm.product_id,
-- 	    bm.month_index,
-- 	    bm.formatted_month,
-- 	    bm.revenue
-- 	FROM bm
-- 	JOIN first_purchases f 
-- 	  ON bm.product_id = f.product_id
-- 	WHERE bm.formatted_month >= f.first_month
-- ),

-- ca as (
-- 	SELECT product_id, count(*) as sales_months
-- 	FROM cm
-- 	WHERE revenue > 0
-- 	GROUP BY product_id
-- ),

-- cb as (
-- 	SELECT product_id, count(*) as total_months
-- 	FROM cm
-- 	GROUP BY product_id
-- ),

-- sp AS (
-- 	select 
-- 		product_id,
-- 		round(total_months::numeric / NULLIF(sales_months, 0)::numeric, 2) as adi
-- 	from cb
-- 	join ca using (product_id)
-- 	where total_months between 4 and 25 
-- ),

-- mia as (
-- 	select *
-- 	from cm
-- 	join sp
-- 	using (product_id)
-- 	where adi >= 1.32
-- ),

-- mib as (
-- 	select product_id, count(*) as zero_months
-- 	from mia
-- 	where revenue = 0
-- 	group by product_id
-- ),

-- mic as (
-- 	SELECT product_id, count(*) as total_months
-- 	FROM mia
-- 	GROUP BY product_id
-- ),

-- mi as (
-- 	select *
-- 	from mia
-- 	join mib
-- 	using (product_id)
-- 	join mic
-- 	using (product_id)
-- ),

-- mc as (
-- 	select *
-- 	from cm
-- 	join sp
-- 	using (product_id)
-- 	where adi < 1.32
-- ),
-- ----------------------------------------------------------
-- nip AS (
-- 	select product_id from cb where total_months <= 3
-- ),

-- latest_system_month AS (
--     SELECT MAX(formatted_month) AS max_month 
-- 	FROM ordered_months
-- ),

-- launch_months as (
--     select 
-- 		cm.product_id,
-- 		cm.month_index,
-- 		cm.formatted_month,
-- 		cm.revenue,
--         DENSE_RANK() OVER (PARTITION BY cm.product_id ORDER BY cm.month_index) as launch_month_sequence
--     from cm
-- 	join nip using (product_id)
-- ),

-- lm as (
--     select 
--         product_id,
--         count(*) as total_active_months,
-- 		max(case when launch_month_sequence = 1 then formatted_month end) as launch_calendar_month,
--         max(case when launch_month_sequence = 1 then revenue end) as month_1_revenue,
-- 		coalesce(max(case when launch_month_sequence = 2 then revenue end), 0) as month_2_revenue,
-- 		coalesce(max(case when launch_month_sequence = 3 then revenue end), 0) as month_3_revenue
--     from launch_months
--     group by product_id
-- ),

-- finale_nip as(
-- 	select 
-- 		lm.product_id,
-- 		lm.total_active_months,
-- 		lm.launch_calendar_month,
-- 		lm.month_1_revenue,
-- 		lm.month_2_revenue,
-- 		lm.month_3_revenue,
		
-- 	    round(
-- 	        ((lm.month_2_revenue - lm.month_1_revenue) / NULLIF(lm.month_1_revenue, 0) * 100)::numeric, 
-- 	        2
-- 	    ) as simple_launch_velocity_pct,
	    
-- 	    round(
-- 	        ((((lm.month_2_revenue + lm.month_3_revenue) / 2.0) - lm.month_1_revenue) / NULLIF(lm.month_1_revenue, 0) * 100)::numeric, 
-- 	        2
-- 	    ) as cumulative_launch_velocity_pct,
	
-- 		case 
-- 			when lm.total_active_months = 1 and lm.launch_calendar_month = lsm.max_month 
-- 				then 'Active Launch (Current Cohort)'
-- 			when lm.total_active_months = 1 and lm.launch_calendar_month < lsm.max_month 
-- 				then 'One-Hit Wonder (Historical Churn)'
-- 			when lm.total_active_months = 2 and lm.month_2_revenue > lm.month_1_revenue 
-- 				then 'Explosive Launch (2M)'
-- 			when lm.total_active_months = 2 and lm.month_2_revenue <= lm.month_1_revenue 
-- 				then 'Slowing Launch (2M)'
-- 			when lm.total_active_months = 3 and (((lm.month_2_revenue + lm.month_3_revenue) / 2.0) > lm.month_1_revenue) 
-- 				then 'Sustained Launch Trend (3M)'
-- 			else 'Post-Launch Drop (3M)'
-- 		end as launch_address_status
	
-- 	from lm
-- 	cross join latest_system_month lsm),

-- fnip as(
-- 	select 
-- 		product_id,
-- 		launch_calendar_month,
-- 		total_active_months,
-- 		month_1_revenue,
-- 		month_2_revenue,
-- 		month_3_revenue,
-- 		launch_address_status,
-- 		case 
-- 		    when total_active_months = 1 then 'Active Pipeline'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct < -50 then 'Critical Drop'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct >= -50 and simple_launch_velocity_pct < -15 then 'Slowing Launch'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct >= -15 and simple_launch_velocity_pct <= 15 then 'Stable Baseline'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct > 15 then 'Breakout Traction'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct < -40 then 'Failed Launch Curve'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct >= -40 and cumulative_launch_velocity_pct < 0 then 'Flat/Lower Tier'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct >= 0 and cumulative_launch_velocity_pct <= 30 then 'Sustained Growth'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct > 30 then 'Core Portfolio Driver'
-- 			else 'confusing'
-- 		end as interpretation_status
-- 	from finale_nip),
	
-- ---------------------------------------------------

-- mix as(
-- 	select 
-- 		*,
-- 		round((zero_months::numeric/total_months::numeric)*100,2) as zdf
-- 	from mi
-- ),

-- miy as(
-- 	select 
-- 		*,
-- 		sum(revenue) over(partition by product_id) as t_revenue,
-- 		case 
-- 			when zdf < 20 then 'Everyday Seller'
-- 			when zdf between 20 and 50 then 'Occasional Seller'
-- 			when zdf > 50 then 'Slow Mover'
-- 		end as zdf_status
-- 	from mix
-- ),

-- fmi as(
-- 	select 
-- 		*,
-- 		ROUND(
-- 	        (t_revenue / NULLIF(15418394.83, 0) * 100)::numeric, 
-- 	        4
-- 	    ) AS revenue_share_pct
-- 	from miy),

-- -----------------------------------------------------------

-- mca as (
-- 	select 
-- 		*,
-- 		round(AVG(revenue) OVER(PARTITION BY product_id),2) AS average_revenue,
-- 		round(REGR_SLOPE(revenue::numeric, month_index) OVER(PARTITION BY product_id)::numeric,2) AS regression_slope,
-- 		round(STDDEV_SAMP(revenue) OVER(PARTITION BY product_id),2) AS std_dev
-- 	from mc
-- ),

-- fmc as (
-- 	select 
-- 		*,
-- 		round((regression_slope/NULLIF(average_revenue, 0))::numeric,2) as normalization,
-- 		round((std_dev/NULLIF(average_revenue, 0))::numeric,2) as cv,
-- 		case
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) > 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.3 then 'increasing'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) < -2
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.3 then 'decreasing'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) between -2 and 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) < 0.25 then 'relatively_consistent'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) between -2 and 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.6 then 'consistently_low'
-- 			else 'mixed/unclassified_trend' 
-- 		end as revenue_trejactory_status
-- 	from mca),
	
-- mom as(
-- 	select product_id, interpretation_status as moms
-- 	from fnip
-- 	union all
-- 	select product_id, zdf_status as moms
-- 	from fmi
-- 	group by product_id, zdf_status
-- 	union all
-- 	select product_id, revenue_trejactory_status as moms
-- 	from fmc
-- 	group by product_id, revenue_trejactory_status)

-- select moms,count(*) from mom group by moms
-- select 
-- 	zdf_status,
-- 	count(distinct product_id),
-- 	sum(revenue) as rev,
-- 	round(sum(revenue)::numeric/(15371741.09),2) as revenue_share
-- from fmi
-- group by zdf_status
-- select revenue_trejactory_status, count(distinct product_id)
-- from fmc
-- group by revenue_trejactory_status
-- select sum(price+freight_value)
-- FROM olist.orders as o
-- JOIN olist.order_items as oi
-- USING (order_id)
-- WHERE o.order_status = 'delivered' 
--   AND order_delivered_customer_date IS NOT NULL
--   and order_purchase_timestamp::date between '2017-01-01' and '2018-09-30'

-- create view olist.product_revenue_trajectory as
-- SELECT 
-- 	product_id as products,
-- 	TO_CHAR(order_purchase_timestamp,'YYYY.MM') AS year_month,
-- 	SUM(price + freight_value) AS revenue
-- FROM olist.orders as o
-- JOIN olist.order_items as oi
-- USING (order_id)
-- WHERE o.order_status = 'delivered' 
--   AND order_delivered_customer_date IS NOT NULL
-- GROUP BY 
-- 	product_id,
-- 	TO_CHAR(order_purchase_timestamp,'YYYY.MM')
-- order by products, year_month

-- -------------------------------------------------------------------------------------------------

-- 4. Product sales and revenue trejactory over time

-- product trajectory status :   Sales T : Revenue T : T_Impact
-- "Active Pipeline"	            2066  2066       : 0
-- "Occasional Seller"	            1878  1878       : 0
-- "Slow Mover"	                    23690 23690      : 0

-- "Critical Drop"	                1753  1770       : +17
-- "Slowing Launch"	                46    39         : -7
-- "Stable Baseline"	            145   121        : -24
-- "Breakout Traction"	            81    95         : +14

-- "Failed Launch Curve"	        1749  1750       : +1
-- "Flat/Lower Tier"                39    55         : +16
-- "Sustained Growth"	            55    38         : -17
-- "Core Portfolio Driver"	        53    53         : 0

-- "increasing"	                    202   203        : +1
-- "decreasing"	                    242   244        : +2
-- "consistently_low"	            47    48         : +1
-- "mixed/unclassified_trend"	    29    27         : -2
-- "relatively_consistent"	        4     2          : -2


-- ]olist dataset containes 3 years of data, of which only 1 year of data is in complete form 
-- while other 2 years have data of 3 and 8 months, which does not help in measuring product
-- growth over years.
-- ]for month over month analysis, we have data of 26 months ranging from september 2016 to 
-- october 2018. 2016 have missing month data of november and inconsistent data of december,
-- and 2018 have no delivered orders after 29th august.
-- ]for those reasons, we will take data from january 2017 to august 2018.

-- ]for month over month analysis, there are few factors which need to be considered.
-- ]to get accurate results from formulas, we will have to divide data into 3 sets.
-- >1)New Intermittent Products : 
-- ]products which have only 3 or less than 3 month of data will be measured by simple and cumulative 
-- velocity. products which are launched in active month and are still new to the market.

-- }products with 1 month data
-- "Active Pipeline"	       :       2066

-- }products with 2 month data
-- "Critical Drop"	           :       1770
-- "Slowing Launch"	           :       39
-- "Stable Baseline"	       :       121
-- "Breakout Traction"         :       95

-- }products with 3 month data
-- "Failed Launch Curve"	   :       1750
-- "Flat/Lower Tier"	       :       55
-- "Sustained Growth"	       :       38
-- "Core Portfolio Driver"	   :       53

-- >2)Mature Intermittent Products :
-- ]products which have more than 3 months of data, but have zero demand frequency of >= 1.32 that 
-- simply means too many months of zero revenue(no orders) in between revenue generating months.
-- ]we can measure it's growth by analysing what percentage of revenue share are these products
-- part of.

-- "everyday seller"      :  0 
-- "Occasional Seller"    :  1878 (19% revenue_share)
-- "Slow Mover"           :  23690 (56% revenue share)

-- >3)Mature Consistent Products :
-- ]products which have more than 3 months of data, and have zero demand frequency of < 1.32 that
-- simply means too few instances of zero revenue months, which suggests data is consistent 
-- throughout all months.
-- ]it is measured by comparing normalization of linear regression slope with coefficient of 
-- variation.


-- "decreasing"                :  244
-- "increasing"                :  203
-- "consistently_low"          :  48
-- "mixed/unclassified_trend"  :  27
-- "relatively_consistent"     :  2

-- ------------------------------------------------------------------------------------------------

-- WITH RECURSIVE calendar_base AS (
--     SELECT CAST('2017-01-01' AS TIMESTAMPTZ) AS month_date
--     UNION ALL
--     SELECT DATE_ADD(month_date, INTERVAL '1 MONTH')
--     FROM calendar_base
--     WHERE month_date < CAST('2018-08-01' AS TIMESTAMPTZ)
-- ),

-- ordered_months AS (
--     SELECT 
--         ROW_NUMBER() OVER (ORDER BY month_date) AS month_index,
--         TO_CHAR(month_date, 'YYYY.MM') AS formatted_month
--     FROM calendar_base
-- ),

-- category_catalog AS (
--     SELECT product_category_name
--     FROM olist.orders as o
--     JOIN olist.order_items as oi
--     USING (order_id)
-- 	JOIN olist.products as p
-- 	USING (product_id)
--     WHERE o.order_status = 'delivered'
--       AND order_delivered_customer_date IS NOT NULL
-- 	GROUP BY product_category_name
-- ),

-- master_zero_grid AS (
--     SELECT c.product_category_name, m.month_index, m.formatted_month
--     FROM category_catalog c
--     CROSS JOIN ordered_months m
-- ),

-- a AS (
--     SELECT 
--         product_category_name,
--         COUNT(order_item_id) AS items_sold,
--         TO_CHAR(order_purchase_timestamp,'YYYY.MM') AS year_month,
--         SUM(price + freight_value) AS revenue
--     FROM olist.orders as o
--     JOIN olist.order_items as oi
--     USING (order_id)
-- 	JOIN olist.products as p
-- 	USING (product_id)
--     WHERE o.order_status = 'delivered' 
--       AND order_delivered_customer_date IS NOT NULL
--     GROUP BY 
--         product_category_name,
--         TO_CHAR(order_purchase_timestamp,'YYYY.MM')
-- ),
	
-- b AS (
--     SELECT 
--         g.product_category_name,
--         g.month_index,       
--         g.formatted_month,    
--         COALESCE(SUM(a.revenue), 0) AS revenue 
--     FROM master_zero_grid g
--     LEFT JOIN a
--       ON g.product_category_name = a.product_category_name
--      AND a.year_month = g.formatted_month
--     GROUP BY g.product_category_name, g.month_index, g.formatted_month
-- ),

-- first_purchases AS (
--     SELECT product_category_name, MIN(formatted_month) AS first_month
--     FROM b
--     WHERE revenue > 0
--     GROUP BY product_category_name
-- ),
-- -----------------------------------------------------
-- c as (
--     SELECT 
-- 	    b.product_category_name,
-- 	    b.month_index,
-- 	    b.formatted_month,
-- 	    b.revenue
-- 	FROM b
-- 	JOIN first_purchases f 
-- 	  ON b.product_category_name = f.product_category_name
-- 	WHERE b.formatted_month >= f.first_month
-- ),

-- ca as (
-- 	SELECT product_category_name, count(*) as sales_months
-- 	FROM c
-- 	WHERE revenue > 0
-- 	GROUP BY product_category_name
-- ),

-- cb as (
-- 	SELECT product_category_name, count(*) as total_months
-- 	FROM c
-- 	GROUP BY product_category_name
-- ),

-- sp AS (
-- 	select 
-- 		product_category_name,
-- 		round(total_months::numeric / NULLIF(sales_months, 0)::numeric, 2) as adi
-- 	from cb
-- 	join ca using (product_category_name)
-- 	where total_months between 4 and 25 
-- ),

-- mia as (
-- 	select *
-- 	from c
-- 	join sp
-- 	using (product_category_name)
-- 	where adi >= 1.32
-- ),

-- mib as (
-- 	select product_category_name, count(*) as zero_months
-- 	from mia
-- 	where revenue = 0
-- 	group by product_category_name
-- ),

-- mic as (
-- 	SELECT product_category_name, count(*) as total_months
-- 	FROM mia
-- 	GROUP BY product_category_name
-- ),

-- mi as (
-- 	select *
-- 	from mia
-- 	join mib
-- 	using (product_category_name)
-- 	join mic
-- 	using (product_category_name)
-- ),

-- mc as (
-- 	select *
-- 	from c
-- 	join sp
-- 	using (product_category_name)
-- 	where adi < 1.32
-- ),
-- ----------------------------------------------------------
-- nip AS (
-- 	select product_category_name from cb where total_months <= 3
-- ),

-- latest_system_month AS (
--     SELECT MAX(formatted_month) AS max_month 
-- 	FROM ordered_months
-- ),

-- launch_months as (
--     select 
-- 		c.product_category_name,
-- 		c.month_index,
-- 		c.formatted_month,
-- 		c.revenue,
--         DENSE_RANK() OVER (PARTITION BY c.product_category_name ORDER BY c.month_index) as launch_month_sequence
--     from c
-- 	join nip using (product_category_name)
-- ),

-- lm as (
--     select 
--         product_category_name,
--         count(*) as total_active_months,
-- 		max(case when launch_month_sequence = 1 then formatted_month end) as launch_calendar_month,
--         max(case when launch_month_sequence = 1 then revenue end) as month_1_revenue,
-- 		coalesce(max(case when launch_month_sequence = 2 then revenue end), 0) as month_2_revenue,
-- 		coalesce(max(case when launch_month_sequence = 3 then revenue end), 0) as month_3_revenue
--     from launch_months
--     group by product_category_name
-- ),

-- finale_nip as(
-- 	select 
-- 		lm.product_category_name,
-- 		lm.total_active_months,
-- 		lm.launch_calendar_month,
-- 		lm.month_1_revenue,
-- 		lm.month_2_revenue,
-- 		lm.month_3_revenue,
		
-- 	    round(
-- 	        ((lm.month_2_revenue - lm.month_1_revenue) / NULLIF(lm.month_1_revenue, 0) * 100)::numeric, 
-- 	        2
-- 	    ) as simple_launch_velocity_pct,
	    
-- 	    round(
-- 	        ((((lm.month_2_revenue + lm.month_3_revenue) / 2.0) - lm.month_1_revenue) / NULLIF(lm.month_1_revenue, 0) * 100)::numeric, 
-- 	        2
-- 	    ) as cumulative_launch_velocity_pct,
	
-- 		case 
-- 			when lm.total_active_months = 1 and lm.launch_calendar_month = lsm.max_month 
-- 				then 'Active Launch (Current Cohort)'
-- 			when lm.total_active_months = 1 and lm.launch_calendar_month < lsm.max_month 
-- 				then 'One-Hit Wonder (Historical Churn)'
-- 			when lm.total_active_months = 2 and lm.month_2_revenue > lm.month_1_revenue 
-- 				then 'Explosive Launch (2M)'
-- 			when lm.total_active_months = 2 and lm.month_2_revenue <= lm.month_1_revenue 
-- 				then 'Slowing Launch (2M)'
-- 			when lm.total_active_months = 3 and (((lm.month_2_revenue + lm.month_3_revenue) / 2.0) > lm.month_1_revenue) 
-- 				then 'Sustained Launch Trend (3M)'
-- 			else 'Post-Launch Drop (3M)'
-- 		end as launch_address_status
	
-- 	from lm
-- 	cross join latest_system_month lsm),

-- fnip as(
-- 	select 
-- 		product_category_name,
-- 		launch_calendar_month,
-- 		total_active_months,
-- 		month_1_revenue,
-- 		month_2_revenue,
-- 		month_3_revenue,
-- 		launch_address_status,
-- 		case 
-- 		    when total_active_months = 1 then 'Active Pipeline'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct < -50 then 'Critical Drop'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct >= -50 and simple_launch_velocity_pct < -15 then 'Slowing Launch'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct >= -15 and simple_launch_velocity_pct <= 15 then 'Stable Baseline'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct > 15 then 'Breakout Traction'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct < -40 then 'Failed Launch Curve'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct >= -40 and cumulative_launch_velocity_pct < 0 then 'Flat/Lower Tier'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct >= 0 and cumulative_launch_velocity_pct <= 30 then 'Sustained Growth'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct > 30 then 'Core Portfolio Driver'
-- 			else 'confusing'
-- 		end as interpretation_status
-- 	from finale_nip),
	
-- ---------------------------------------------------

-- mix as(
-- 	select 
-- 		*,
-- 		round((zero_months::numeric/total_months::numeric)*100,2) as zdf
-- 	from mi
-- ),

-- miy as(
-- 	select 
-- 		*,
-- 		sum(revenue) over(partition by product_category_name) as t_revenue,
-- 		case 
-- 			when zdf < 20 then 'Everyday category'
-- 			when zdf between 20 and 50 then 'Occasional category'
-- 			when zdf > 50 then 'Slow category'
-- 		end as zdf_status
-- 	from mix
-- ),

-- fmi as(
-- 	select 
-- 		*,
-- 		ROUND(
-- 	        (t_revenue / NULLIF(15418394.83, 0) * 100)::numeric, 
-- 	        4
-- 	    ) AS revenue_share_pct
-- 	from miy),

-- -----------------------------------------------------------

-- mca as (
-- 	select 
-- 		*,
-- 		round(AVG(revenue) OVER(PARTITION BY product_category_name),2) AS average_revenue,
-- 		round(REGR_SLOPE(revenue::numeric, month_index) OVER(PARTITION BY product_category_name)::numeric,2) AS regression_slope,
-- 		round(STDDEV_SAMP(revenue) OVER(PARTITION BY product_category_name),2) AS std_dev
-- 	from mc
-- ),

-- fmc as (
-- 	select 
-- 		*,
-- 		round((regression_slope/NULLIF(average_revenue, 0))::numeric,2) as normalization,
-- 		round((std_dev/NULLIF(average_revenue, 0))::numeric,2) as cv,
-- 		case
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) > 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.3 then 'increasing'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) < -2
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.3 then 'decreasing'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) between -2 and 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) < 0.25 then 'relatively_consistent'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) between -2 and 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.6 then 'consistently_low'
-- 			else 'mixed/unclassified_trend' 
-- 		end as revenue_trejactory_status
-- 	from mca),

-- mom as(
-- 	select product_category_name, interpretation_status as moms
-- 	from fnip
-- 	union all
-- 	select product_category_name, zdf_status as moms
-- 	from fmi
-- 	group by product_category_name, zdf_status
-- 	union all
-- 	select product_category_name, revenue_trejactory_status as moms
-- 	from fmc
-- 	group by product_category_name, revenue_trejactory_status)

-- select moms,count(*) from mom group by moms

-- select 
-- 	interpretation_status,
-- 	count(distinct product_category_name) 
-- from fnip 
-- group by interpretation_status

-- select 
-- 	zdf_status,
-- 	count(distinct product_category_name),
-- 	sum(revenue) as rev,
-- 	round(sum(revenue)::numeric/(15371741.09),2) as revenue_share
-- from fmi
-- group by zdf_status

-- select revenue_trejactory_status, count(distinct product_category_name)
-- from fmc
-- group by revenue_trejactory_status

-- select sum(price+freight_value)
-- FROM olist.orders as o
-- JOIN olist.order_items as oi
-- USING (order_id)
-- WHERE o.order_status = 'delivered' 
--   AND order_delivered_customer_date IS NOT NULL
--   and order_purchase_timestamp::date between '2017-01-01' and '2018-09-30'

-- ------------------------------------------------------------------------------------------------

-- 5. Category sales and revenue trejactory over time

-- category trajectory   : sales_T:revenue_T
-- "decreasing"	                6   6 
-- "Occasional category"	    9   9 
-- "consistently_low"	        1   1
-- "increasing"	                46  46
-- "mixed/unclassified_trend"	6   6
-- "Slow category"	            5   5

-- "Occasional Seller" : 9
-- "Slow Mover"        : 5 

-- "consistently_low"          :  1 (fashion_underwear_e_moda_praia)
-- "decreasing"                :  6
-- "increasing"                :  46
-- "mixed/unclassified_trend"  :  6

-- --------------------------------------------------------------------------------------------------


-- CREATE TABLE olist.category_freight_benchmarks (
--     product_category VARCHAR(255) PRIMARY KEY,
--     max_freight_ratio_pct NUMERIC(4, 2)
-- );

-- INSERT INTO olist.category_freight_benchmarks (product_category, max_freight_ratio_pct) VALUES
-- ('gaming pc', 4.00),
-- ('watches_gifts', 5.00),
-- ('perfumery', 6.00),
-- ('health_beauty', 7.00),
-- ('telephony', 7.00),
-- ('auto', 8.00),
-- ('tablets_printing_image', 8.00),
-- ('computers', 8.00),
-- ('computers_accessories', 8.00),
-- ('electronics', 9.00),
-- ('audio', 9.00),
-- ('consoles_games', 9.00),
-- ('fashion_underwear_beach', 9.00),
-- ('fashio_female_clothing', 10.00),
-- ('fashion_male_clothing', 10.00),
-- ('fashion_sport', 10.00),
-- ('fashion_bags_accessories', 10.00),
-- ('cool_stuff', 10.00),
-- ('stationery', 11.00),
-- ('books_general_interest', 11.00),
-- ('books_imported', 12.00),
-- ('books_technical', 12.00),
-- ('baby', 12.00),
-- ('toys', 12.00),
-- ('fixed_telephony', 12.00),
-- ('fashion_shoes', 12.00),
-- ('luggage_accessories', 13.00),
-- ('party_supplies', 14.00),
-- ('art', 14.00),
-- ('sports_leisure', 15.00),
-- ('market_place', 15.00),
-- ('music', 15.00),
-- ('cds_dvds_musicals', 15.00),
-- ('dvds_blu_ray', 15.00),
-- ('cine_photo', 15.00),
-- ('pet_shop', 16.00),
-- ('diapers_and_hygiene', 16.00),
-- ('kitchen_dining_laundry_garden_furniture', 17.00),
-- ('costruction_tools_tools', 17.00),
-- ('construction_tools_safety', 17.00),
-- ('housewares', 18.00),
-- ('construction_tools_lights', 18.00),
-- ('small_appliances', 18.00),
-- ('small_appliances_home_oven_and_coffee', 18.00),
-- ('Kitchen Appliances & Food Prep', 18.00),
-- ('food', 18.00),
-- ('la_cuisine', 19.00),
-- ('drinks', 19.00),
-- ('food_drink', 19.00),
-- ('flowers', 20.00),
-- ('bed_bath_table', 20.00),
-- ('home_confort', 20.00),
-- ('home_comfort_2', 20.00),
-- ('arts_and_craftmanship', 20.00),
-- ('fashion_childrens_clothes', 20.00),
-- ('musical_instruments', 22.00),
-- ('garden_tools', 22.00),
-- ('costruction_tools_garden', 22.00),
-- ('office_furniture', 22.00),
-- ('furniture_bedroom', 22.00),
-- ('furniture_living_room', 24.00),
-- ('furniture_decor', 24.00),
-- ('furniture_mattress_and_upholstery', 25.00),
-- ('air_conditioning', 25.00),
-- ('home_appliances', 25.00),
-- ('home_appliances_2', 25.00),
-- ('home_construction', 25.00),
-- ('construction_tools_construction', 25.00),
-- ('signaling_and_security', 25.00),
-- ('christmas_supplies', 25.00),
-- ('agro_industry_and_commerce', 25.00),
-- ('industry_commerce_and_business', 25.00),
-- ('security_and_services', 0.00);

-- a as (
-- 	SELECT *
-- 	FROM olist.orders as o
-- 	JOIN olist.order_items as oi
-- 	USING (order_id)
-- 	JOIN olist.products as p
-- 	USING (product_id)
-- 	LEFT JOIN olist.product_category_name_translation as t
-- 	USING (product_category_name)
-- 	LEFT JOIN olist.category_freight_benchmarks as f
-- 	ON t.product_category_name_english = f.product_category
-- 	WHERE o.order_status = 'delivered' 
-- 	  AND order_delivered_customer_date IS NOT NULL
-- 	  and order_purchase_timestamp::date between '2017-01-01' and '2018-09-30'	  
-- ),

-- b as(
-- 	select 
-- 		product_id,
-- 		count(distinct order_id) as total_orders,
-- 		sum(price) as total_sales,
-- 		sum(freight_value) as total_freight,
-- 		sum(price + freight_value) as total_revenue,
-- 		round((sum(price + freight_value)/count(distinct order_id)),2) as aov,
-- 		round(((sum(freight_value))/(sum(price + freight_value)))*100,2) as ftsr,
-- 		max_freight_ratio_pct
-- 	from a
-- 	group by product_id,max_freight_ratio_pct
-- ),

-- c as(select 
-- 		*,
-- 		case 
-- 			when ftsr <= max_freight_ratio_pct then 'High Revenue'
-- 			when ftsr > max_freight_ratio_pct then 'Low Revenue'
-- 		end as revenue_status,
-- 		ntile(4) over(order by total_sales desc) as sales_tiers
-- 	from b
-- 	order by total_sales desc
-- 	),

-- d as(select 
-- 		*,
-- 		case 
-- 			when sales_tiers = 1 and revenue_status = 'High Revenue' then 'HS-HR'
-- 			when sales_tiers = 1 and revenue_status = 'Low Revenue' then 'HS-LR'
-- 			when sales_tiers in (2,3) and revenue_status = 'High Revenue' then 'AS-HR'
-- 			when sales_tiers in (2,3) and revenue_status = 'Low Revenue' then 'AS-LR'
-- 			when sales_tiers = 4 and revenue_status = 'High Revenue' then 'LS-HR'
-- 			when sales_tiers = 4 and revenue_status = 'Low Revenue' then 'LS-LR'
-- 		end as sales_by_revenue_status
-- 	from c),

-- sbrs as(select 
-- 		product_id,
-- 		sales_by_revenue_status 
-- 		from d),

-- pf as(SELECT 
--     product_id, 
--     moms, 
--     sales_by_revenue_status,
--     CASE 
--         -- 1. The High Value Stars
--         WHEN moms IN ('Core Portfolio Driver','Breakout Traction','Sustained Growth') 
--             AND sales_by_revenue_status IN ('HS-HR','AS-HR') THEN 'High-Value Rising Stars'
            
--         -- 2. Core Breadwinners
--         WHEN moms IN ('increasing','relatively_consistent') 
--             AND sales_by_revenue_status IN ('HS-HR') THEN 'Core Breadwinners'
            
--         -- 3. Margin Traps (Any High/Avg sales product with Low Revenue status)
--         WHEN sales_by_revenue_status IN ('HS-LR','AS-LR') THEN 'Efficiency & Margin Traps'
            
--         -- 4. New / Nurture Pipeline (Any fresh product that is not failing)
--         WHEN moms IN ('Active Pipeline','Stable Baseline','Slowing Launch') THEN 'Nurture / Wait-and-See'
            
--         -- 5. Long-Tail (Low sales but high margin - profitable to keep around)
--         WHEN moms IN ('Occasional Seller','Slow Mover') 
--             AND sales_by_revenue_status IN ('LS-HR','AS-HR') THEN 'Long-Tail / Buffer Stock'
            
--         -- 6. Dead Weight (Low sales and low revenue, OR completely failed launches)
--         WHEN sales_by_revenue_status = 'LS-LR' 
--             OR moms IN ('Critical Drop','Failed Launch Curve','Flat/Lower Tier') THEN 'Weak Performers / Dead Weight'
            
--         -- 7. Catch-All for anything else (The remaining mix of decreasing or unclassified trends)
--         ELSE 'Areas Requiring Investigation'
--     END AS final_product_status
-- FROM mom
-- JOIN sbrs USING (product_id)
-- )

-- -- select moms
-- -- from mom
-- -- group by moms
-- select final_product_status, count(*), round((count(*)::numeric/32079)*100,2)
-- from pf
-- group by final_product_status;
-- select product_id, aov, total_sales, total_revenue, ftsr, max_freight_ratio_pct
-- from d
-- where sales_by_revenue_status = 'LS-LR'

-- select sales_by_revenue_status, count(*),round((count(*)::numeric/32079)*100,2)
-- from d
-- group by sales_by_revenue_status
-- select 
-- 	sales_tiers, 
-- 	round((sum(total_revenue)/15371741.09)*100,2) 
-- from c 
-- group by sales_tiers
-- select sales_tiers, sum(total_sales)/13179777.95 from c group by sales_tiers

-- with a as (
-- 	SELECT *
-- 	FROM olist.orders as o
-- 	JOIN olist.order_items as oi
-- 	USING (order_id)
-- 	JOIN olist.products as p
-- 	USING (product_id)
-- 	LEFT JOIN olist.product_category_name_translation as t
-- 	USING (product_category_name)
-- 	LEFT JOIN olist.category_freight_benchmarks as f
-- 	ON t.product_category_name_english = f.product_category
-- 	WHERE o.order_status = 'delivered' 
-- 	  AND order_delivered_customer_date IS NOT NULL
-- 	  and order_purchase_timestamp::date between '2017-01-01' and '2018-09-30'	  
-- ),

-- b as(
-- 	select 
-- 		product_category_name_english,
-- 		count(distinct order_id) as total_orders,
-- 		sum(price) as total_sales,
-- 		sum(freight_value) as total_freight,
-- 		sum(price + freight_value) as total_revenue,
-- 		round((sum(price + freight_value)/count(distinct order_id)),2) as aov,
-- 		round(((sum(freight_value))/(sum(price + freight_value)))*100,2) as ftsr,
-- 		max_freight_ratio_pct
-- 	from a
-- 	group by product_category_name_english,max_freight_ratio_pct
-- ),

-- c as(select 
-- 		*,
-- 		case 
-- 			when ftsr <= max_freight_ratio_pct then 'High Revenue'
-- 			when ftsr > max_freight_ratio_pct then 'Low Revenue'
-- 		end as revenue_status,
-- 		ntile(4) over(order by total_sales desc) as sales_tiers
-- 	from b
-- 	order by total_sales desc
-- 	),

-- d as(select 
-- 		*,
-- 		case 
-- 			when sales_tiers = 1 and revenue_status = 'High Revenue' then 'HS-HR'
-- 			when sales_tiers = 1 and revenue_status = 'Low Revenue' then 'HS-LR'
-- 			when sales_tiers in (2,3) and revenue_status = 'High Revenue' then 'AS-HR'
-- 			when sales_tiers in (2,3) and revenue_status = 'Low Revenue' then 'AS-LR'
-- 			when sales_tiers = 4 and revenue_status = 'High Revenue' then 'LS-HR'
-- 			when sales_tiers = 4 and revenue_status = 'Low Revenue' then 'LS-LR'
-- 		end as sales_by_revenue_status
-- 	from c)

-- select product_id, aov, total_sales, total_revenue, ftsr, max_freight_ratio_pct
-- from d
-- where sales_by_revenue_status = 'LS-LR'

-- select sales_by_revenue_status, count(*),round((count(*)::numeric/73)*100,2)
-- from d
-- group by sales_by_revenue_status

-- select sales_tiers, round((sum(total_sales)/13179777.95)*100,2) 
-- from c 
-- group by sales_tiers

-- select 
-- 	sales_tiers, 
-- 	round((sum(total_revenue)/15371741.09)*100,2) 
-- from c 
-- group by sales_tiers
-- --------------------------------------------------------------------------------------------------

-- 6. Compare sales volume with revenue

-- >>to compare sales volume with revenue for products and categories, sales and
-- categories are measured here by Quartile Segmentation.
-- >>both products and categories have showed 'pareto principle (80/20 rule)'
-- and that's why products are segmented into 3 parts rather than 2 which is 
-- called 'ABC segmentation'.

--> products_%  :   sales_%  : revenue_%
--] TOP 25%     :   79.3%    :  77.53%
--] MIDDLE 50%  :   18.5%    :  19.67%
--] BOTTOM 25%  :   2.17%    :  2.80%

-->  sales_volume   ::  revenue_volume :: products :: products_%
--] High sales      -> high revenue  ->     4708    -> 14.68 %
--] High sales      -> low revenue   ->     3217    -> 10.03 %
--] Average sales   -> high revenue  ->     6032    -> 18.80 %
--] Average sales   -> low revenue   ->     9771    -> 30.46 %
--] Low sales       -> high revenue  ->     541     -> 1.69 %
--] Low sales       -> low revenue   ->     7226    -> 22.53 %
--]                                  ->     null    -> 1.81 %

--> category_%  :   sales_%  :  revenue_%
--] TOP 25%     :   82.69 %  :  82.64 %
--] MIDDLE 50%  :   16.94 %  :  16.97 %
--] BOTTOM 25%  :   0.37 %   :  0.39 %

-->  sales_volume   ::  revenue_volume :: category :: category_%
--] High sales      -> high revenue  ->     8      ->   10.96 %
--] High sales      -> low revenue   ->     11     ->   15.07 %
--] Average sales   -> high revenue  ->     19     ->   26.03 %
--] Average sales   -> low revenue   ->     17     ->   23.29 %
--] Low sales       -> high revenue  ->     5      ->   6.85 %
--] Low sales       -> low revenue   ->     13     ->   17.81 %
--]                                  ->    null    ->   1.37 %


-------------------------------------------------------------------------------------------------

-- WITH RECURSIVE calendar_base AS (
--     SELECT CAST('2017-01-01' AS TIMESTAMPTZ) AS month_date
--     UNION ALL
--     SELECT DATE_ADD(month_date, INTERVAL '1 MONTH')
--     FROM calendar_base
--     WHERE month_date < CAST('2018-08-01' AS TIMESTAMPTZ)
-- ),

-- ordered_months AS (
--     SELECT 
--         ROW_NUMBER() OVER (ORDER BY month_date) AS month_index,
--         TO_CHAR(month_date, 'YYYY.MM') AS formatted_month
--     FROM calendar_base
-- ),

-- product_catalog AS (
--     SELECT product_id 
--     FROM olist.orders as o
--     JOIN olist.order_items as oi
--     USING (order_id)
--     WHERE o.order_status = 'delivered'
--       AND order_delivered_customer_date IS NOT NULL
-- 	GROUP BY product_id
-- ),

-- master_zero_grid AS (
--     SELECT p.product_id, m.month_index, m.formatted_month
--     FROM product_catalog p
--     CROSS JOIN ordered_months m
-- ),

-- am AS (
--     SELECT 
--         product_id,
--         COUNT(order_item_id) AS items_sold,
--         TO_CHAR(order_purchase_timestamp,'YYYY.MM') AS year_month,
--         SUM(price + freight_value) AS revenue
--     FROM olist.orders as o
--     JOIN olist.order_items as oi
--     USING (order_id)
--     WHERE o.order_status = 'delivered' 
--       AND order_delivered_customer_date IS NOT NULL
--     GROUP BY 
--         product_id,
--         TO_CHAR(order_purchase_timestamp,'YYYY.MM')
-- ),
	
-- bm AS (
--     SELECT 
--         g.product_id,
--         g.month_index,       
--         g.formatted_month,    
--         COALESCE(SUM(am.revenue), 0) AS revenue 
--     FROM master_zero_grid g
--     LEFT JOIN am
--       ON g.product_id = am.product_id 
--      AND am.year_month = g.formatted_month
--     GROUP BY g.product_id, g.month_index, g.formatted_month
-- ),

-- first_purchases AS (
--     SELECT product_id, MIN(formatted_month) AS first_month
--     FROM bm
--     WHERE revenue > 0
--     GROUP BY product_id
-- ),
-- -----------------------------------------------------
-- cm as (
--     SELECT 
-- 	    bm.product_id,
-- 	    bm.month_index,
-- 	    bm.formatted_month,
-- 	    bm.revenue
-- 	FROM bm
-- 	JOIN first_purchases f 
-- 	  ON bm.product_id = f.product_id
-- 	WHERE bm.formatted_month >= f.first_month
-- ),

-- ca as (
-- 	SELECT product_id, count(*) as sales_months
-- 	FROM cm
-- 	WHERE revenue > 0
-- 	GROUP BY product_id
-- ),

-- cb as (
-- 	SELECT product_id, count(*) as total_months
-- 	FROM cm
-- 	GROUP BY product_id
-- ),

-- sp AS (
-- 	select 
-- 		product_id,
-- 		round(total_months::numeric / NULLIF(sales_months, 0)::numeric, 2) as adi
-- 	from cb
-- 	join ca using (product_id)
-- 	where total_months between 4 and 25 
-- ),

-- mia as (
-- 	select *
-- 	from cm
-- 	join sp
-- 	using (product_id)
-- 	where adi >= 1.32
-- ),

-- mib as (
-- 	select product_id, count(*) as zero_months
-- 	from mia
-- 	where revenue = 0
-- 	group by product_id
-- ),

-- mic as (
-- 	SELECT product_id, count(*) as total_months
-- 	FROM mia
-- 	GROUP BY product_id
-- ),

-- mi as (
-- 	select *
-- 	from mia
-- 	join mib
-- 	using (product_id)
-- 	join mic
-- 	using (product_id)
-- ),

-- mc as (
-- 	select *
-- 	from cm
-- 	join sp
-- 	using (product_id)
-- 	where adi < 1.32
-- ),
-- ----------------------------------------------------------
-- nip AS (
-- 	select product_id from cb where total_months <= 3
-- ),

-- latest_system_month AS (
--     SELECT MAX(formatted_month) AS max_month 
-- 	FROM ordered_months
-- ),

-- launch_months as (
--     select 
-- 		cm.product_id,
-- 		cm.month_index,
-- 		cm.formatted_month,
-- 		cm.revenue,
--         DENSE_RANK() OVER (PARTITION BY cm.product_id ORDER BY cm.month_index) as launch_month_sequence
--     from cm
-- 	join nip using (product_id)
-- ),

-- lm as (
--     select 
--         product_id,
--         count(*) as total_active_months,
-- 		max(case when launch_month_sequence = 1 then formatted_month end) as launch_calendar_month,
--         max(case when launch_month_sequence = 1 then revenue end) as month_1_revenue,
-- 		coalesce(max(case when launch_month_sequence = 2 then revenue end), 0) as month_2_revenue,
-- 		coalesce(max(case when launch_month_sequence = 3 then revenue end), 0) as month_3_revenue
--     from launch_months
--     group by product_id
-- ),

-- finale_nip as(
-- 	select 
-- 		lm.product_id,
-- 		lm.total_active_months,
-- 		lm.launch_calendar_month,
-- 		lm.month_1_revenue,
-- 		lm.month_2_revenue,
-- 		lm.month_3_revenue,
		
-- 	    round(
-- 	        ((lm.month_2_revenue - lm.month_1_revenue) / NULLIF(lm.month_1_revenue, 0) * 100)::numeric, 
-- 	        2
-- 	    ) as simple_launch_velocity_pct,
	    
-- 	    round(
-- 	        ((((lm.month_2_revenue + lm.month_3_revenue) / 2.0) - lm.month_1_revenue) / NULLIF(lm.month_1_revenue, 0) * 100)::numeric, 
-- 	        2
-- 	    ) as cumulative_launch_velocity_pct,
	
-- 		case 
-- 			when lm.total_active_months = 1 and lm.launch_calendar_month = lsm.max_month 
-- 				then 'Active Launch (Current Cohort)'
-- 			when lm.total_active_months = 1 and lm.launch_calendar_month < lsm.max_month 
-- 				then 'One-Hit Wonder (Historical Churn)'
-- 			when lm.total_active_months = 2 and lm.month_2_revenue > lm.month_1_revenue 
-- 				then 'Explosive Launch (2M)'
-- 			when lm.total_active_months = 2 and lm.month_2_revenue <= lm.month_1_revenue 
-- 				then 'Slowing Launch (2M)'
-- 			when lm.total_active_months = 3 and (((lm.month_2_revenue + lm.month_3_revenue) / 2.0) > lm.month_1_revenue) 
-- 				then 'Sustained Launch Trend (3M)'
-- 			else 'Post-Launch Drop (3M)'
-- 		end as launch_address_status
	
-- 	from lm
-- 	cross join latest_system_month lsm),

-- fnip as(
-- 	select 
-- 		product_id,
-- 		launch_calendar_month,
-- 		total_active_months,
-- 		month_1_revenue,
-- 		month_2_revenue,
-- 		month_3_revenue,
-- 		launch_address_status,
-- 		case 
-- 		    when total_active_months = 1 then 'Active Pipeline'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct < -50 then 'Critical Drop'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct >= -50 and simple_launch_velocity_pct < -15 then 'Slowing Launch'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct >= -15 and simple_launch_velocity_pct <= 15 then 'Stable Baseline'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct > 15 then 'Breakout Traction'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct < -40 then 'Failed Launch Curve'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct >= -40 and cumulative_launch_velocity_pct < 0 then 'Flat/Lower Tier'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct >= 0 and cumulative_launch_velocity_pct <= 30 then 'Sustained Growth'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct > 30 then 'Core Portfolio Driver'
-- 			else 'confusing'
-- 		end as interpretation_status
-- 	from finale_nip),
	
-- ---------------------------------------------------

-- mix as(
-- 	select 
-- 		*,
-- 		round((zero_months::numeric/total_months::numeric)*100,2) as zdf
-- 	from mi
-- ),

-- miy as(
-- 	select 
-- 		*,
-- 		sum(revenue) over(partition by product_id) as t_revenue,
-- 		case 
-- 			when zdf < 20 then 'Everyday Seller'
-- 			when zdf between 20 and 50 then 'Occasional Seller'
-- 			when zdf > 50 then 'Slow Mover'
-- 		end as zdf_status
-- 	from mix
-- ),

-- fmi as(
-- 	select 
-- 		*,
-- 		ROUND(
-- 	        (t_revenue / NULLIF(15418394.83, 0) * 100)::numeric, 
-- 	        4
-- 	    ) AS revenue_share_pct
-- 	from miy),

-- -----------------------------------------------------------

-- mca as (
-- 	select 
-- 		*,
-- 		round(AVG(revenue) OVER(PARTITION BY product_id),2) AS average_revenue,
-- 		round(REGR_SLOPE(revenue::numeric, month_index) OVER(PARTITION BY product_id)::numeric,2) AS regression_slope,
-- 		round(STDDEV_SAMP(revenue) OVER(PARTITION BY product_id),2) AS std_dev
-- 	from mc
-- ),

-- fmc as (
-- 	select 
-- 		*,
-- 		round((regression_slope/NULLIF(average_revenue, 0))::numeric,2) as normalization,
-- 		round((std_dev/NULLIF(average_revenue, 0))::numeric,2) as cv,
-- 		case
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) > 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.3 then 'increasing'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) < -2
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.3 then 'decreasing'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) between -2 and 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) < 0.25 then 'relatively_consistent'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) between -2 and 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.6 then 'consistently_low'
-- 			else 'mixed/unclassified_trend' 
-- 		end as revenue_trejactory_status
-- 	from mca),
	
-- mom as(
-- 	select product_id, interpretation_status as moms
-- 	from fnip
-- 	union all
-- 	select product_id, zdf_status as moms
-- 	from fmi
-- 	group by product_id, zdf_status
-- 	union all
-- 	select product_id, revenue_trejactory_status as moms
-- 	from fmc
-- 	group by product_id, revenue_trejactory_status),

-- a as (
-- 	SELECT *
-- 	FROM olist.orders as o
-- 	JOIN olist.order_items as oi
-- 	USING (order_id)
-- 	JOIN olist.products as p
-- 	USING (product_id)
-- 	LEFT JOIN olist.product_category_name_translation as t
-- 	USING (product_category_name)
-- 	LEFT JOIN olist.category_freight_benchmarks as f
-- 	ON t.product_category_name_english = f.product_category
-- 	WHERE o.order_status = 'delivered' 
-- 	  AND order_delivered_customer_date IS NOT NULL
-- 	  and order_purchase_timestamp::date between '2017-01-01' and '2018-09-30'	  
-- ),

-- b as(
-- 	select 
-- 		product_id,
-- 		count(distinct order_id) as total_orders,
-- 		sum(price) as total_sales,
-- 		sum(freight_value) as total_freight,
-- 		sum(price + freight_value) as total_revenue,
-- 		round((sum(price + freight_value)/count(distinct order_id)),2) as aov,
-- 		round(((sum(freight_value))/(sum(price + freight_value)))*100,2) as ftsr,
-- 		max_freight_ratio_pct
-- 	from a
-- 	group by product_id,max_freight_ratio_pct
-- ),

-- c as(select 
-- 		*,
-- 		case 
-- 			when ftsr <= max_freight_ratio_pct then 'High Revenue'
-- 			when ftsr > max_freight_ratio_pct then 'Low Revenue'
-- 		end as revenue_status,
-- 		ntile(4) over(order by total_sales desc) as sales_tiers
-- 	from b
-- 	order by total_sales desc
-- 	),

-- d as(select 
-- 		*,
-- 		case 
-- 			when sales_tiers = 1 and revenue_status = 'High Revenue' then 'HS-HR'
-- 			when sales_tiers = 1 and revenue_status = 'Low Revenue' then 'HS-LR'
-- 			when sales_tiers in (2,3) and revenue_status = 'High Revenue' then 'AS-HR'
-- 			when sales_tiers in (2,3) and revenue_status = 'Low Revenue' then 'AS-LR'
-- 			when sales_tiers = 4 and revenue_status = 'High Revenue' then 'LS-HR'
-- 			when sales_tiers = 4 and revenue_status = 'Low Revenue' then 'LS-LR'
-- 		end as sales_by_revenue_status
-- 	from c),

-- sbrs as(select 
-- 		product_id,
-- 		sales_by_revenue_status 
-- 		from d),

-- pf as(SELECT 
--     product_id, 
--     moms, 
--     sales_by_revenue_status,
--     CASE 
--         -- 1. The High Value Stars
--         WHEN moms IN ('Core Portfolio Driver','Breakout Traction','Sustained Growth') 
--             AND sales_by_revenue_status IN ('HS-HR','AS-HR') THEN 'High-Value Rising Stars'
            
--         -- 2. Core Breadwinners
--         WHEN moms IN ('increasing','relatively_consistent') 
--             AND sales_by_revenue_status IN ('HS-HR') THEN 'Core Breadwinners'
            
--         -- 3. Margin Traps (Any High/Avg sales product with Low Revenue status)
--         WHEN sales_by_revenue_status IN ('HS-LR','AS-LR') THEN 'Efficiency & Margin Traps'
            
--         -- 4. New / Nurture Pipeline (Any fresh product that is not failing)
--         WHEN moms IN ('Active Pipeline','Stable Baseline','Slowing Launch') THEN 'Nurture / Wait-and-See'
            
--         -- 5. Long-Tail (Low sales but high margin - profitable to keep around)
--         WHEN moms IN ('Occasional Seller','Slow Mover') 
--             AND sales_by_revenue_status IN ('LS-HR','AS-HR') THEN 'Long-Tail / Buffer Stock'
            
--         -- 6. Dead Weight (Low sales and low revenue, OR completely failed launches)
--         WHEN sales_by_revenue_status = 'LS-LR' 
--             OR moms IN ('Critical Drop','Failed Launch Curve','Flat/Lower Tier') THEN 'Weak Performers / Dead Weight'
            
--         -- 7. Catch-All for anything else (The remaining mix of decreasing or unclassified trends)
--         ELSE 'Areas Requiring Investigation'
--     END AS final_product_status
-- FROM mom
-- JOIN sbrs USING (product_id)
-- ),

-- category_catalog AS (
--     SELECT product_category_name
--     FROM olist.orders as o
--     JOIN olist.order_items as oi
--     USING (order_id)
-- 	JOIN olist.products as p
-- 	USING (product_id)
--     WHERE o.order_status = 'delivered'
--       AND order_delivered_customer_date IS NOT NULL
-- 	GROUP BY product_category_name
-- ),

-- master_zero_gridc AS (
--     SELECT c.product_category_name, m.month_index, m.formatted_month
--     FROM category_catalog c
--     CROSS JOIN ordered_months m
-- ),

-- a AS (
--     SELECT 
--         product_category_name,
--         COUNT(order_item_id) AS items_sold,
--         TO_CHAR(order_purchase_timestamp,'YYYY.MM') AS year_month,
--         SUM(price + freight_value) AS revenue
--     FROM olist.orders as o
--     JOIN olist.order_items as oi
--     USING (order_id)
-- 	JOIN olist.products as p
-- 	USING (product_id)
--     WHERE o.order_status = 'delivered' 
--       AND order_delivered_customer_date IS NOT NULL
--     GROUP BY 
--         product_category_name,
--         TO_CHAR(order_purchase_timestamp,'YYYY.MM')
-- ),
	
-- b AS (
--     SELECT 
--         g.product_category_name,
--         g.month_index,       
--         g.formatted_month,    
--         COALESCE(SUM(a.revenue), 0) AS revenue 
--     FROM master_zero_gridc g
--     LEFT JOIN a
--       ON g.product_category_name = a.product_category_name
--      AND a.year_month = g.formatted_month
--     GROUP BY g.product_category_name, g.month_index, g.formatted_month
-- ),

-- first_purchases AS (
--     SELECT product_category_name, MIN(formatted_month) AS first_month
--     FROM b
--     WHERE revenue > 0
--     GROUP BY product_category_name
-- ),
-- -----------------------------------------------------
-- c as (
--     SELECT 
-- 	    b.product_category_name,
-- 	    b.month_index,
-- 	    b.formatted_month,
-- 	    b.revenue
-- 	FROM b
-- 	JOIN first_purchases f 
-- 	  ON b.product_category_name = f.product_category_name
-- 	WHERE b.formatted_month >= f.first_month
-- ),

-- ca as (
-- 	SELECT product_category_name, count(*) as sales_months
-- 	FROM c
-- 	WHERE revenue > 0
-- 	GROUP BY product_category_name
-- ),

-- cb as (
-- 	SELECT product_category_name, count(*) as total_months
-- 	FROM c
-- 	GROUP BY product_category_name
-- ),

-- sp AS (
-- 	select 
-- 		product_category_name,
-- 		round(total_months::numeric / NULLIF(sales_months, 0)::numeric, 2) as adi
-- 	from cb
-- 	join ca using (product_category_name)
-- 	where total_months between 4 and 25 
-- ),

-- mia as (
-- 	select *
-- 	from c
-- 	join sp
-- 	using (product_category_name)
-- 	where adi >= 1.32
-- ),

-- mib as (
-- 	select product_category_name, count(*) as zero_months
-- 	from mia
-- 	where revenue = 0
-- 	group by product_category_name
-- ),

-- mic as (
-- 	SELECT product_category_name, count(*) as total_months
-- 	FROM mia
-- 	GROUP BY product_category_name
-- ),

-- mi as (
-- 	select *
-- 	from mia
-- 	join mib
-- 	using (product_category_name)
-- 	join mic
-- 	using (product_category_name)
-- ),

-- mc as (
-- 	select *
-- 	from c
-- 	join sp
-- 	using (product_category_name)
-- 	where adi < 1.32
-- ),
-- ----------------------------------------------------------
-- nip AS (
-- 	select product_category_name from cb where total_months <= 3
-- ),

-- latest_system_month AS (
--     SELECT MAX(formatted_month) AS max_month 
-- 	FROM ordered_months
-- ),

-- launch_months as (
--     select 
-- 		c.product_category_name,
-- 		c.month_index,
-- 		c.formatted_month,
-- 		c.revenue,
--         DENSE_RANK() OVER (PARTITION BY c.product_category_name ORDER BY c.month_index) as launch_month_sequence
--     from c
-- 	join nip using (product_category_name)
-- ),

-- lm as (
--     select 
--         product_category_name,
--         count(*) as total_active_months,
-- 		max(case when launch_month_sequence = 1 then formatted_month end) as launch_calendar_month,
--         max(case when launch_month_sequence = 1 then revenue end) as month_1_revenue,
-- 		coalesce(max(case when launch_month_sequence = 2 then revenue end), 0) as month_2_revenue,
-- 		coalesce(max(case when launch_month_sequence = 3 then revenue end), 0) as month_3_revenue
--     from launch_months
--     group by product_category_name
-- ),

-- finale_nipc as(
-- 	select 
-- 		lm.product_category_name,
-- 		lm.total_active_months,
-- 		lm.launch_calendar_month,
-- 		lm.month_1_revenue,
-- 		lm.month_2_revenue,
-- 		lm.month_3_revenue,
		
-- 	    round(
-- 	        ((lm.month_2_revenue - lm.month_1_revenue) / NULLIF(lm.month_1_revenue, 0) * 100)::numeric, 
-- 	        2
-- 	    ) as simple_launch_velocity_pct,
	    
-- 	    round(
-- 	        ((((lm.month_2_revenue + lm.month_3_revenue) / 2.0) - lm.month_1_revenue) / NULLIF(lm.month_1_revenue, 0) * 100)::numeric, 
-- 	        2
-- 	    ) as cumulative_launch_velocity_pct,
	
-- 		case 
-- 			when lm.total_active_months = 1 and lm.launch_calendar_month = lsm.max_month 
-- 				then 'Active Launch (Current Cohort)'
-- 			when lm.total_active_months = 1 and lm.launch_calendar_month < lsm.max_month 
-- 				then 'One-Hit Wonder (Historical Churn)'
-- 			when lm.total_active_months = 2 and lm.month_2_revenue > lm.month_1_revenue 
-- 				then 'Explosive Launch (2M)'
-- 			when lm.total_active_months = 2 and lm.month_2_revenue <= lm.month_1_revenue 
-- 				then 'Slowing Launch (2M)'
-- 			when lm.total_active_months = 3 and (((lm.month_2_revenue + lm.month_3_revenue) / 2.0) > lm.month_1_revenue) 
-- 				then 'Sustained Launch Trend (3M)'
-- 			else 'Post-Launch Drop (3M)'
-- 		end as launch_address_status
	
-- 	from lm
-- 	cross join latest_system_month lsm),

-- fnipc as(
-- 	select 
-- 		product_category_name,
-- 		launch_calendar_month,
-- 		total_active_months,
-- 		month_1_revenue,
-- 		month_2_revenue,
-- 		month_3_revenue,
-- 		launch_address_status,
-- 		case 
-- 		    when total_active_months = 1 then 'Active Pipeline'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct < -50 then 'Critical Drop'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct >= -50 and simple_launch_velocity_pct < -15 then 'Slowing Launch'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct >= -15 and simple_launch_velocity_pct <= 15 then 'Stable Baseline'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct > 15 then 'Breakout Traction'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct < -40 then 'Failed Launch Curve'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct >= -40 and cumulative_launch_velocity_pct < 0 then 'Flat/Lower Tier'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct >= 0 and cumulative_launch_velocity_pct <= 30 then 'Sustained Growth'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct > 30 then 'Core Portfolio Driver'
-- 			else 'confusing'
-- 		end as interpretation_status
-- 	from finale_nipc),
	
-- ---------------------------------------------------

-- mix as(
-- 	select 
-- 		*,
-- 		round((zero_months::numeric/total_months::numeric)*100,2) as zdf
-- 	from mi
-- ),

-- miy as(
-- 	select 
-- 		*,
-- 		sum(revenue) over(partition by product_category_name) as t_revenue,
-- 		case 
-- 			when zdf < 20 then 'Everyday Seller'
-- 			when zdf between 20 and 50 then 'Occasional Seller'
-- 			when zdf > 50 then 'Slow Mover'
-- 		end as zdf_status
-- 	from mix
-- ),

-- fmic as(
-- 	select 
-- 		*,
-- 		ROUND(
-- 	        (t_revenue / NULLIF(15418394.83, 0) * 100)::numeric, 
-- 	        4
-- 	    ) AS revenue_share_pct
-- 	from miy),

-- -----------------------------------------------------------

-- mca as (
-- 	select 
-- 		*,
-- 		round(AVG(revenue) OVER(PARTITION BY product_category_name),2) AS average_revenue,
-- 		round(REGR_SLOPE(revenue::numeric, month_index) OVER(PARTITION BY product_category_name)::numeric,2) AS regression_slope,
-- 		round(STDDEV_SAMP(revenue) OVER(PARTITION BY product_category_name),2) AS std_dev
-- 	from mc
-- ),

-- fmcc as (
-- 	select 
-- 		*,
-- 		round((regression_slope/NULLIF(average_revenue, 0))::numeric,2) as normalization,
-- 		round((std_dev/NULLIF(average_revenue, 0))::numeric,2) as cv,
-- 		case
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) > 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.3 then 'increasing'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) < -2
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.3 then 'decreasing'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) between -2 and 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) < 0.25 then 'relatively_consistent'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) between -2 and 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.6 then 'consistently_low'
-- 			else 'mixed/unclassified_trend' 
-- 		end as revenue_trejactory_status
-- 	from mca),

-- momc as(
-- 	select product_category_name, interpretation_status as moms
-- 	from fnipc
-- 	union all
-- 	select product_category_name, zdf_status as moms
-- 	from fmic
-- 	group by product_category_name, zdf_status
-- 	union all
-- 	select product_category_name, revenue_trejactory_status as moms
-- 	from fmcc
-- 	group by product_category_name, revenue_trejactory_status),


-- az as (
-- 	SELECT *
-- 	FROM olist.orders as o
-- 	JOIN olist.order_items as oi
-- 	USING (order_id)
-- 	JOIN olist.products as p
-- 	USING (product_id)
-- 	LEFT JOIN olist.product_category_name_translation as t
-- 	USING (product_category_name)
-- 	LEFT JOIN olist.category_freight_benchmarks as f
-- 	ON t.product_category_name_english = f.product_category
-- 	WHERE o.order_status = 'delivered' 
-- 	  AND order_delivered_customer_date IS NOT NULL
-- 	  and order_purchase_timestamp::date between '2017-01-01' and '2018-09-30'	  
-- ),

-- bz as(
-- 	select 
-- 		product_category_name,
-- 		count(distinct order_id) as total_orders,
-- 		sum(price) as total_sales,
-- 		sum(freight_value) as total_freight,
-- 		sum(price + freight_value) as total_revenue,
-- 		round((sum(price + freight_value)/count(distinct order_id)),2) as aov,
-- 		round(((sum(freight_value))/(sum(price + freight_value)))*100,2) as ftsr,
-- 		max_freight_ratio_pct
-- 	from az
-- 	group by product_category_name,max_freight_ratio_pct
-- ),

-- cz as(select 
-- 		*,
-- 		case 
-- 			when ftsr <= max_freight_ratio_pct then 'High Revenue'
-- 			when ftsr > max_freight_ratio_pct then 'Low Revenue'
-- 		end as revenue_status,
-- 		ntile(4) over(order by total_sales desc) as sales_tiers
-- 	from bz
-- 	order by total_sales desc
-- 	),

-- dz as(select 
-- 		*,
-- 		case 
-- 			when sales_tiers = 1 and revenue_status = 'High Revenue' then 'HS-HR'
-- 			when sales_tiers = 1 and revenue_status = 'Low Revenue' then 'HS-LR'
-- 			when sales_tiers in (2,3) and revenue_status = 'High Revenue' then 'AS-HR'
-- 			when sales_tiers in (2,3) and revenue_status = 'Low Revenue' then 'AS-LR'
-- 			when sales_tiers = 4 and revenue_status = 'High Revenue' then 'LS-HR'
-- 			when sales_tiers = 4 and revenue_status = 'Low Revenue' then 'LS-LR'
-- 		end as sales_by_revenue_status
-- 	from cz),

-- sbrs as(select 
-- 		product_category_name,
-- 		sales_by_revenue_status 
-- 		from dz),

-- cf as(SELECT 
--     product_category_name, 
--     moms, 
--     sales_by_revenue_status,
--     CASE 
--         -- 1. The High Value Stars
--         WHEN moms IN ('Core Portfolio Driver','Breakout Traction','Sustained Growth') 
--             AND sales_by_revenue_status IN ('HS-HR','AS-HR') THEN 'High-Value Rising Stars'
            
--         -- 2. Core Breadwinners
--         WHEN moms IN ('increasing','relatively_consistent') 
--             AND sales_by_revenue_status IN ('HS-HR') THEN 'Core Breadwinners'
            
--         -- 3. Margin Traps (Any High/Avg sales product with Low Revenue status)
--         WHEN sales_by_revenue_status IN ('HS-LR','AS-LR') THEN 'Efficiency & Margin Traps'
            
--         -- 4. New / Nurture Pipeline (Any fresh product that is not failing)
--         WHEN moms IN ('Active Pipeline','Stable Baseline','Slowing Launch') THEN 'Nurture / Wait-and-See'
            
--         -- 5. Long-Tail (Low sales but high margin - profitable to keep around)
--         WHEN moms IN ('Occasional Seller','Slow Mover') 
--             AND sales_by_revenue_status IN ('LS-HR','AS-HR') THEN 'Long-Tail / Buffer Stock'
            
--         -- 6. Dead Weight (Low sales and low revenue, OR completely failed launches)
--         WHEN sales_by_revenue_status = 'LS-LR' 
--             OR moms IN ('Critical Drop','Failed Launch Curve','Flat/Lower Tier') THEN 'Weak Performers / Dead Weight'
            
--         -- 7. Catch-All for anything else (The remaining mix of decreasing or unclassified trends)
--         ELSE 'Areas Requiring Investigation'
--     END AS final_product_status
-- FROM momc
-- JOIN sbrs 
-- USING (product_category_name)
-- )


-- select 
-- 	final_product_status,
-- 	count(*),
-- 	round((count(*)::numeric/73)*100,2)
-- from cf 
-- group by final_product_status

-- select product_id, aov, total_sales, total_revenue, ftsr, max_freight_ratio_pct
-- from d
-- where sales_by_revenue_status = 'LS-LR'

-- select sales_by_revenue_status, count(*),round((count(*)::numeric/73)*100,2)
-- from d
-- group by sales_by_revenue_status

-- select sales_tiers, round((sum(total_sales)/13179777.95)*100,2) 
-- from c 
-- group by sales_tiers

-- select 
-- 	sales_tiers, 
-- 	round((sum(total_revenue)/15371741.09)*100,2) 
-- from c 
-- group by sales_tiers


-- prof as(
-- 	select final_product_status, count(*), round((count(*)::numeric/32079)*100,2)
-- 	from pf
-- 	group by final_product_status)

-- select * from prof


-------------------------------------------------------------------------------------------------

-- 7. Business conclusion

-->>>> Which products/categories should management consider strong performers, weak 
-- performers, growing opportunities, or areas requiring further investigation?

--> 41 products are scaling rapidly, healthy on margins, and capturing market share. 
-- management should Increase marketing spend, secure vendor supply lines, and move 
-- them into permanent inventory slots.
--> 44 products are Highly profitable, steady, high-volume products. management should ensure
-- 100% stock availability and Audit price occasionally to protect these crucial margins.
--> 12988 products are highly popular or scaling items, but freight costs are eating entire profit.
-- management should renegotiate shipping rates, bundle these items to spread freight costs, or
-- increase the retail price.
--> 1474 products are Early-stage products with healthy financial structures but haven't found 
-- massive volume yet. management should Run minor promotional tests or organic visibility boosts
-- to see if volume picks up.
--> 4615 products are Established products that are losing momentum, erratic, or structurally 
-- underperforming. Management should Check for new competitor listings, negative customer reviews,
-- or a permanent drop in market demand.
--> 5175 products are in Infrequent demand, but when they do sell, they are profitable. Management
-- should set very low minimum stock thresholds (Just-in-Time ordering) so they don't tie up 
-- capital.
--> 7742 products are New launches that failed to gain traction and are financially burning cash
-- on freight. Stop ordering, liquidate remaining inventory, and remove them from the active 
-- portfolio.

--> 7 categories are Highly profitable, steady, high-volume categories. management should ensure
-- 100% stock availability and Audit price occasionally to protect these crucial margins.
--> 28 categories are highly popular or scaling categories, but freight costs are eating entire profit.
-- management should renegotiate shipping rates, bundle these category items to spread freight costs, or
-- increase the retail price.
--> 18 categories are Established categories that are losing momentum, erratic, or structurally 
-- underperforming. Management should Check for new competitor listings, negative customer reviews,
-- or a permanent drop in market demand.
--> 7 categories are in Infrequent demand, but when they do sell, they are profitable. Management
-- should set very low minimum stock thresholds (Just-in-Time ordering) so they don't tie up 
-- capital.
--> 13 categories are New launches that failed to gain traction and are financially burning cash
-- on freight. Stop ordering, liquidate remaining inventory, and remove them from the active 
-- portfolio.

-- ==================================================================================================

-- Business Question 3 — Seller Performance

-- Objective

-- Which sellers are contributing most and least to business performance, and how does seller 
-- performance vary across sales, revenue, cancellations, delivery performance, and customer 
-- satisfaction?

-- ==================================================================================================


-- with main as(
-- 	select *
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	join olist.sellers as s
-- 	using (seller_id)
-- 	where o.order_status = 'delivered' 
-- 		and order_delivered_customer_date is not null),

-- -- select count(order_item_id)
-- -- from main

-- -- select count(distinct order_id)
-- -- from main

-- a as(
-- 	select seller_id,count(order_item_id) as total_items_sold
-- 	from main
-- 	group by seller_id
-- 	order by total_items_sold asc),

-- -- select total_items_sold, count(*) as n_sellers
-- -- from a
-- -- group by total_items_sold

-- b as(select *,
-- 	 		FLOOR(total_items_sold / 100) AS items_,
-- 	    	CONCAT(FLOOR(total_items_sold / 100) * 100, '-', (FLOOR(total_items_sold / 100) * 100) + 99) AS total_items_sold_range
-- 	from a),

-- c as(select *,
-- 	 		FLOOR(total_items_sold / 50) AS items_,
-- 	    	CONCAT(FLOOR(total_items_sold / 50) * 50, '-', (FLOOR(total_items_sold / 50) * 50) + 49) AS total_items_sold_range
-- 	from a),

-- d as(select *,
-- 	 		FLOOR(total_items_sold / 10) AS items_,
-- 	    	CONCAT(FLOOR(total_items_sold / 10) * 10, '-', (FLOOR(total_items_sold / 10) * 10) + 9) AS total_items_sold_range
-- 	from a),

-- e as(select *,
-- 	 		FLOOR(total_items_sold / 2) AS items_,
-- 	    	CONCAT(FLOOR(total_items_sold / 2) * 2, '-', (FLOOR(total_items_sold / 2) * 2) + 1) AS total_items_sold_range
-- 	from a)

-- select total_items_sold_range, count(seller_id), round((count(seller_id)::numeric/2970)*100,2)
-- from e
-- group by total_items_sold_range
-- order by count desc

-- create view olist.seller_sales_volume as
-- select seller_id as seller, count(order_item_id) as sales_volume
-- from olist.orders as o
-- join olist.order_items as oi
-- using (order_id)
-- join olist.sellers as s
-- using (seller_id)
-- where o.order_status = 'delivered' 
-- 	and order_delivered_customer_date is not null
-- group by seller_id
-- order by sales_volume desc
---------------------------------------------------------------------------------------------------
-- 1. Seller sales volume

-- For each seller, find:

-- >>total sellers : 2970 (who have sold atleast 1 item)

-- >>Total items sold : 110189

-- >>Number of distinct orders : 96470

-- >>Highest-performing sellers by sales volume:
-- "6560211a19b47992c3666cc44a7e94c0" : 1996
-- "4a3ca9315b744ce9f8e9374361493884" : 1949
-- "1f50f920176fa81dab994f9023523100" : 1926
-- "cc419e0650a3c5ba77189a1882b7556a" : 1719
-- "da8622b14eb17ae2831f4ac5b9dab84a" : 1548

-- >>lowest-performing sellers by sales volume
-- "63704069d9bd3a75c1cf59babe56004a" : 1
-- "f9bbdd976532d50b7816d285a22bd01e" : 1
-- "6b1c4d4d9ccf0be3d8544eb0e71e5318" : 1
-- "7816cd9c5b1238e320545f5bf7eb80e8" : 1
-- "34675b28b826facfde119785bf287dc1" : 1

-- i_sold  t_Sellers              i_sold  t_Sellers        i_sold  t_Sellers seller_%
-- "0-99"	    2734              "0-49"	2508            "0-9"	1628   :  54.81 
-- "100-199"	136              "50-99"	226            "10-19"	461   :  15.52
-- "200-299"	37              "100-149"	86            "20-29"	200   :  6.73
-- "300-399"	23              "150-199"	50            "30-39"	137   :  4.61
-- "400-499"	11              "200-249"	29            "40-49"	82   :  2.76
-- "500-599"	9              "300-349"	16            "50-59"	62   :  2.09
-- "600-699"	2              "400-449"	11            "60-69"	51   :  1.72
-- "700-799"	4              "250-299"	8            "80-89"	41   :  1.38
-- "800-899"	1              "350-399"	7            "70-79"	39   :  1.31
-- "1000-1099"	1              "500-549"	5            "90-99"	33   :  1.11
-- "1100-1199"	4              "550-599"	4          "100-109"	21   :  0.71
-- "1300-1399"	1
-- "1400-1499"	2
-- "1500-1599"	1
-- "1700-1799"	1
-- "1900-1999"	3

--::insights : 
-- 95% sellers have sold atleast 1 item. (2970/3095)
-- item sold range : min (1) | max (1996)
-- 92% sellers have sold less than 100 items. (2734/2970)
-- 84% sellers have sold less than 50 items. (2508/2970)
-- 55% sellers have sold less than 10 items. (1628/2970)
-- 16.5% sellers have sold 1 item. (489/2970).
-- 15.9% sellers have sold 2 and 3 items. (471/2970)
--------------------------------------------------------------------------------------------------

-- with main as(
-- 	select *
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	join olist.sellers as s
-- 	using (seller_id)
-- 	where o.order_status = 'delivered' 
-- 		and order_delivered_customer_date is not null),

-- -- select 
-- 	-- count(order_item_id),
-- 	-- sum(price) as total_sales,
-- 	-- sum(freight_value), 
-- 	-- sum(price+freight_value) as revenue
-- -- from main

-- a as(
-- 	select 
-- 		seller_id, 
-- 		sum(price+freight_value) as revenue
-- 	from main
-- 	group by seller_id
-- 	order by revenue ),

-- b as(select *,
-- 	 		FLOOR(revenue / 10000) AS items_,
-- 	    	CONCAT(FLOOR(revenue / 10000) * 10000, '-', (FLOOR(revenue / 10000) * 10000) + 9999) AS revenue_range
-- 	from a),


-- c as(select *,
-- 	 		FLOOR(revenue / 1000) AS items_,
-- 	    	CONCAT(FLOOR(revenue / 1000) * 1000, '-', (FLOOR(revenue / 1000) * 1000) + 999) AS revenue_range
-- 	from a),


-- d as(select *,
-- 	 		FLOOR(revenue / 100) AS items_,
-- 	    	CONCAT(FLOOR(revenue / 100) * 100, '-', (FLOOR(revenue / 100) * 100) + 99) AS revenue_range
-- 	from a)

-- select 
-- 	revenue_range,
-- 	count(seller_id),
-- 	round((count(seller_id)::numeric/2970)*100,2) as seller_perc
-- from b
-- group by revenue_range
-- order by count desc

-- create view olist.seller_revenue_ as
-- select 
-- 	seller_id as seller, 
-- 	sum(price+freight_value) as revenue,
-- 	round((sum(price+freight_value)::numeric/15418394.83)*100,2) as revenue_share
-- from olist.orders as o
-- join olist.order_items as oi
-- using (order_id)
-- join olist.sellers as s
-- using (seller_id)
-- where o.order_status = 'delivered' 
-- 	and order_delivered_customer_date is not null
-- group by seller_id
-- order by revenue desc

--------------------------------------------------------------------------------------------------


-- 2. Seller revenue

-- For each seller, calculate:

-- Total product sales (price) : 13220248.93
-- Total freight value : 2198145.90
-- Total revenue (price + freight_value) : 15418394.83

-- Highest revenue sellers:
-- "4869f7a5dfa277a7dca6462dcf3b52b2"	247007.06
-- "7c67e1448b00f6e969d365cea6b010ab"	237806.69
-- "4a3ca9315b744ce9f8e9374361493884"	231220.43
-- "53243585a1d6dc2643021fd1853d8905"	230797.02
-- "fa1c13f2614d7b5c4749cbc52fecda94"	200833.50

-- lowest revenue sellers:
-- "77128dec4bec4878c37ab7d6169d6f26"	15.22
-- "1fa2d3def6adfa70e58c276bb64fe5bb"	15.90
-- "4965a7002cca77301c82d3f91b82e1a9"	16.36
-- "702835e4b785b67a084280efca355756"	18.56
-- "ad14615bdd492b01b0d97922e87cb87f"	19.21


-- revenue_range sellers seller_% |revenue_range sellers seller_%|revenue_range sellers seller_%
--     "0-9999"       2629 88.52	    "0-999"	1465   : 49.33     "100-199"	289	     9.73
--     "10000-19999"	196	6.60	"1000-1999"	429	   : 14.44     "0-99"	    270	     9.09
--     "20000-29999"	48	1.62	"2000-2999"	193	   : 6.50     "200-299"	    212	     7.14
--     "30000-39999"	29	0.98	"3000-3999"	123	   : 4.14     "300-399"	    148	     4.98
--     "40000-49999"	21	0.71	"4000-4999"	116	   : 3.91     "400-499"	    123	     4.14
--     "50000-59999"	14	0.47	"5000-5999"	87	   : 2.93     "500-599"	    106	     3.57
--     "60000-69999"	8	0.27	"7000-7999"	63	   : 2.12     "700-799"	    85	     2.86
--     "70000-79999"	5	0.17	"6000-6999"	62	   : 2.09     "600-699"	    81	     2.73
--     "120000-129999"	4	0.13	"8000-8999"	53	   : 1.78     "800-899"	    77	     2.59
--     "230000-239999"	3	0.10	"9000-9999"	38	   : 1.28     "900-999"	    74	     2.49
--     							    "9999+"     341    : 11.48   "1000-1099"	55	     1.85

-- >insights::
-- revenue range : min(15.22) | max(247007.06)
-- number of sellers who generated less than 100 : 270 (9.73%)
-- number of sellers who generated less than 1000 : 1465 (49.33%)
-- number of sellers who generated less than 10000 : 2629 (88.52%)
-------------------------------------------------------------------------------------------------

-- with recursive calendar_base AS (
--     SELECT CAST('2017-01-01' AS TIMESTAMPTZ) AS month_date
--     UNION ALL
--     SELECT DATE_ADD(month_date, INTERVAL '1 MONTH')
--     FROM calendar_base
--     WHERE month_date < CAST('2018-08-01' AS TIMESTAMPTZ)
-- ),

-- ordered_months AS (
--     SELECT 
--         ROW_NUMBER() OVER (ORDER BY month_date) AS month_index,
--         TO_CHAR(month_date, 'YYYY.MM') AS formatted_month
--     FROM calendar_base
-- ),

-- seller_catalog AS (
--     select distinct seller_id
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	join olist.sellers as s
-- 	using (seller_id)
-- 	where o.order_status = 'delivered' 
-- 		and order_delivered_customer_date is not null
-- 	    and order_purchase_timestamp::date between '2017-01-01' and '2018-09-30'
-- ),

-- master_zero_grid AS (
--     SELECT s.seller_id, m.month_index, m.formatted_month
--     FROM seller_catalog s
--     CROSS JOIN ordered_months m
-- ),

-- am AS (
--     SELECT 
--         seller_id,
--         COUNT(order_item_id) AS items_sold,
--         TO_CHAR(order_purchase_timestamp,'YYYY.MM') AS year_month,
--         SUM(price + freight_value) AS revenue
--     from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	join olist.sellers as s
-- 	using (seller_id)
-- 	where o.order_status = 'delivered' 
-- 		and order_delivered_customer_date is not null
-- 	    and order_purchase_timestamp::date between '2017-01-01' and '2018-09-30'
--     group by seller_id,
--         TO_CHAR(order_purchase_timestamp,'YYYY.MM')),

-- bm AS (
--     SELECT 
--         g.seller_id,
--         g.month_index,       
--         g.formatted_month,    
--         COALESCE(SUM(am.revenue), 0) AS revenue 
--     FROM master_zero_grid g
--     LEFT JOIN am
--       ON g.seller_id = am.seller_id 
--      AND am.year_month = g.formatted_month
--     GROUP BY g.seller_id, g.month_index, g.formatted_month
-- ),

-- first_purchases AS (
--     SELECT seller_id, MIN(formatted_month) AS first_month
--     FROM bm
--     WHERE revenue > 0
--     GROUP BY seller_id
-- ),
-- -----------------------------------------------------
-- cm as (
--     SELECT 
-- 	    bm.seller_id,
-- 	    bm.month_index,
-- 	    bm.formatted_month,
-- 	    bm.revenue
-- 	FROM bm
-- 	JOIN first_purchases f 
-- 	  ON bm.seller_id = f.seller_id
-- 	WHERE bm.formatted_month >= f.first_month
-- ),

-- ca as (
-- 	SELECT seller_id, count(*) as sales_months
-- 	FROM cm
-- 	WHERE revenue > 0
-- 	GROUP BY seller_id
-- ),

-- cb as (
-- 	SELECT seller_id, count(*) as total_months
-- 	FROM cm
-- 	GROUP BY seller_id
-- ),

-- sp AS (
-- 	select 
-- 		seller_id,
-- 		round(total_months::numeric / NULLIF(sales_months, 0)::numeric, 2) as adi
-- 	from cb
-- 	join ca using (seller_id)
-- 	where total_months between 4 and 25 
-- ),

-- mia as (
-- 	select *
-- 	from cm
-- 	join sp
-- 	using (seller_id)
-- 	where adi >= 1.32
-- ),

-- mib as (
-- 	select seller_id, count(*) as zero_months
-- 	from mia
-- 	where revenue = 0
-- 	group by seller_id
-- ),

-- mic as (
-- 	SELECT seller_id, count(*) as total_months
-- 	FROM mia
-- 	GROUP BY seller_id
-- ),

-- mi as (
-- 	select *
-- 	from mia
-- 	join mib
-- 	using (seller_id)
-- 	join mic
-- 	using (seller_id)
-- ),

-- mc as (
-- 	select *
-- 	from cm
-- 	join sp
-- 	using (seller_id)
-- 	where adi < 1.32
-- ), 

-- ----------------------------------------------------------
-- nip AS (
-- 	select seller_id from cb where total_months <= 3
-- ),

-- latest_system_month AS (
--     SELECT MAX(formatted_month) AS max_month 
-- 	FROM ordered_months
-- ),

-- launch_months as (
--     select 
-- 		cm.seller_id,
-- 		cm.month_index,
-- 		cm.formatted_month,
-- 		cm.revenue,
--         DENSE_RANK() OVER (PARTITION BY cm.seller_id ORDER BY cm.month_index) as launch_month_sequence
--     from cm
-- 	join nip using (seller_id)
-- ),

-- lm as (
--     select 
--         seller_id,
--         count(*) as total_active_months,
-- 		max(case when launch_month_sequence = 1 then formatted_month end) as launch_calendar_month,
--         max(case when launch_month_sequence = 1 then revenue end) as month_1_revenue,
-- 		coalesce(max(case when launch_month_sequence = 2 then revenue end), 0) as month_2_revenue,
-- 		coalesce(max(case when launch_month_sequence = 3 then revenue end), 0) as month_3_revenue
--     from launch_months
--     group by seller_id
-- ),

-- finale_nip as(
-- 	select 
-- 		lm.seller_id,
-- 		lm.total_active_months,
-- 		lm.launch_calendar_month,
-- 		lm.month_1_revenue,
-- 		lm.month_2_revenue,
-- 		lm.month_3_revenue,
		
-- 	    round(
-- 	        ((lm.month_2_revenue - lm.month_1_revenue) / NULLIF(lm.month_1_revenue, 0) * 100)::numeric, 
-- 	        2
-- 	    ) as simple_launch_velocity_pct,
	    
-- 	    round(
-- 	        ((((lm.month_2_revenue + lm.month_3_revenue) / 2.0) - lm.month_1_revenue) / NULLIF(lm.month_1_revenue, 0) * 100)::numeric, 
-- 	        2
-- 	    ) as cumulative_launch_velocity_pct,
	
-- 		case 
-- 			when lm.total_active_months = 1 and lm.launch_calendar_month = lsm.max_month 
-- 				then 'Active Launch (Current Cohort)'
-- 			when lm.total_active_months = 1 and lm.launch_calendar_month < lsm.max_month 
-- 				then 'One-Hit Wonder (Historical Churn)'
-- 			when lm.total_active_months = 2 and lm.month_2_revenue > lm.month_1_revenue 
-- 				then 'Explosive Launch (2M)'
-- 			when lm.total_active_months = 2 and lm.month_2_revenue <= lm.month_1_revenue 
-- 				then 'Slowing Launch (2M)'
-- 			when lm.total_active_months = 3 and (((lm.month_2_revenue + lm.month_3_revenue) / 2.0) > lm.month_1_revenue) 
-- 				then 'Sustained Launch Trend (3M)'
-- 			else 'Post-Launch Drop (3M)'
-- 		end as launch_address_status
	
-- 	from lm
-- 	cross join latest_system_month lsm),

-- fnip as(
-- 	select 
-- 		seller_id,
-- 		launch_calendar_month,
-- 		total_active_months,
-- 		month_1_revenue,
-- 		month_2_revenue,
-- 		month_3_revenue,
-- 		launch_address_status,
-- 		case 
-- 		    when total_active_months = 1 then 'Active Pipeline'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct < -50 then 'Critical Drop'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct >= -50 and simple_launch_velocity_pct < -15 then 'Slowing Launch'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct >= -15 and simple_launch_velocity_pct <= 15 then 'Stable Baseline'
-- 			when total_active_months = 2 
-- 				and simple_launch_velocity_pct > 15 then 'Breakout Traction'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct < -40 then 'Failed Launch Curve'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct >= -40 and cumulative_launch_velocity_pct < 0 then 'Flat/Lower Tier'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct >= 0 and cumulative_launch_velocity_pct <= 30 then 'Sustained Growth'
-- 			when total_active_months = 3 
-- 				and cumulative_launch_velocity_pct > 30 then 'Core Portfolio Driver'
-- 			else 'confusing'
-- 		end as interpretation_status
-- 	from finale_nip),
	
-- -- select interpretation_status,count(seller_id)
-- -- from fnip 
-- -- group by interpretation_status

-- -- ---------------------------------------------------

-- mix as(
-- 	select 
-- 		*,
-- 		round((zero_months::numeric/total_months::numeric)*100,2) as zdf
-- 	from mi
-- ),

-- miy as(
-- 	select 
-- 		*,
-- 		sum(revenue) over(partition by seller_id) as t_revenue,
-- 		case 
-- 			when zdf < 20 then 'Everyday Seller'
-- 			when zdf between 20 and 50 then 'Occasional Seller'
-- 			when zdf > 50 then 'Slow Mover'
-- 		end as zdf_status
-- 	from mix
-- ),

-- fmi as(
-- 	select 
-- 		*,
-- 		ROUND(
-- 	        (t_revenue / NULLIF(15418394.83, 0) * 100)::numeric, 
-- 	        4
-- 	    ) AS revenue_share_pct
-- 	from miy),

-- -- -----------------------------------------------------------

-- mca as (
-- 	select 
-- 		*,
-- 		round(AVG(revenue) OVER(PARTITION BY seller_id),2) AS average_revenue,
-- 		round(REGR_SLOPE(revenue::numeric, month_index) OVER(PARTITION BY seller_id)::numeric,2) AS regression_slope,
-- 		round(STDDEV_SAMP(revenue) OVER(PARTITION BY seller_id),2) AS std_dev
-- 	from mc
-- ),

-- fmc as (
-- 	select 
-- 		*,
-- 		round((regression_slope/NULLIF(average_revenue, 0))::numeric,2) as normalization,
-- 		round((std_dev/NULLIF(average_revenue, 0))::numeric,2) as cv,
-- 		case
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) > 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.3 then 'increasing'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) < -2
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.3 then 'decreasing'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) between -2 and 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) < 0.25 then 'relatively_consistent'
-- 			when round(((regression_slope/NULLIF(average_revenue, 0))*100)::numeric,2) between -2 and 2 
-- 				and round((std_dev/NULLIF(average_revenue, 0))::numeric,2) > 0.6 then 'consistently_low'
-- 			else 'mixed/unclassified_trend' 
-- 		end as revenue_trejactory_status
-- 	from mca),
	
-- mom as(
-- 	select seller_id, interpretation_status as moms
-- 	from fnip
-- 	union all
-- 	select seller_id, zdf_status as moms
-- 	from fmi
-- 	group by seller_id, zdf_status
-- 	union all
-- 	select seller_id, revenue_trejactory_status as moms
-- 	from fmc
-- 	group by seller_id, revenue_trejactory_status)
	
-- select moms, count(*) from mom group by moms
-- select revenue_trejactory_status, count(distinct seller_id)
-- from fmc
-- group by revenue_trejactory_status

-- select *
-- from fmc
-- where revenue_trejactory_status = 'mixed/unclassified_trend'
-- order by seller_id, formatted_month

-- select *
-- from fmc
-- where seller_id = '1554a68530182680ad5c8b042c3ab563'
-- order by seller_id, formatted_month

-- create view olist.seller_revenue_trajectory as
-- select 
-- 	seller_id as seller, 
-- 	TO_CHAR(order_purchase_timestamp,'YYYY.MM') AS year_month,
-- 	sum(price+freight_value) as revenue
-- from olist.orders as o
-- join olist.order_items as oi
-- using (order_id)
-- join olist.sellers as s
-- using (seller_id)
-- where o.order_status = 'delivered' 
-- 	and order_delivered_customer_date is not null
-- group by seller_id, TO_CHAR(order_purchase_timestamp,'YYYY.MM') 
-- order by seller,revenue desc

---------------------------------------------------------------------------------------------------

-- 3. Seller revenue over time

-- t_month : 3	t_sellers : 189
-- "Failed Launch Curve"	95
-- "Flat/Lower Tier"	    21
-- "Sustained Growth"	    13
-- "Core Portfolio Driver"	60

-- t_month : 2	t_sellers : 184
-- "Critical Drop"	        104
-- "Slowing Launch"	        14
-- "Stable Baseline"	    16
-- "Breakout Traction"  	50

-- t_month : 1	t_sellers : 152 
-- "Active Pipeline"	    152

-- t_month : >3	t_sellers : 1665 
-- "Occasional Seller"	    522   (37% zero months - 4/5 months 0 revenue in a year)
-- "Slow Mover"	    	    1143  (79% zero months - 9/10 months 0 revenue in a year)

-- t_month : >3	t_sellers    : 755
-- "consistently_low"	       83
-- "decreasing"	               310
-- "increasing"	               318
-- "mixed/unclassified_trend"  43
-- "relatively_consistent"     1


-- trajectory status :   sales_t  : revenue_t : t_impact
-- "Active Pipeline"	       152       152      0
-- "Occasional Seller"	       522       522      0
-- "Slow Mover"	               1143      1143     0

-- "Critical Drop"	           107       104     -3
-- "Slowing Launch"	           11        14      +3
-- "Stable Baseline"	       16        16       0
-- "Breakout Traction"	       50        50       0

-- "Failed Launch Curve"	   95        95       0
-- "Flat/Lower Tier"	       20        21      +1 
-- "Sustained Growth"	       11        13      +2
-- "Core Portfolio Driver"	   63        60      -3

-- "increasing"	               311       318     +7
-- "decreasing"	               322       310     -12
-- "relatively_consistent"	   1         1        0
-- "consistently_low"	       78        83      +5
-- "mixed/unclassified_trend"  43        43       0

--------------------------------------------------------------------------------------------------
-- create view olist.seller_cancellation as
-- with cancelled as(
-- 	select seller_id, count(distinct order_id) as cancelled_orders
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	join olist.sellers as s
-- 	using (seller_id)
-- 	where o.order_status = 'canceled' 
-- 	group by seller_id
-- ),

-- cancelled_not_in_order_item as(
-- 	select distinct order_id
-- 	from olist.orders
-- 	where order_status = 'canceled'
-- 	except
-- 	select distinct order_id
-- 	from olist.orders
-- 	join olist.order_items
-- 	using (order_id)
-- 	join olist.sellers
-- 	using (seller_id)
-- 	where order_status = 'canceled'),

-- total as(
-- 	select seller_id, count(distinct order_id) as total_orders
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	join olist.sellers as s
-- 	using (seller_id)
-- 	group by seller_id
-- ),

-- a as(
-- 	select 
-- 		seller_id as sellers,
-- 		coalesce(round((cancelled_orders::numeric/total_orders::numeric)*100,2),0) as cancellation_rate,
-- 		coalesce(cancelled_orders,0) as cancelled_orders,
-- 		total_orders as eligible_orders
-- 	from total
-- 	left join cancelled
-- 	using (seller_id)
-- 	-- where cancelled_orders <> 0
-- 	order by cancellation_rate desc)

-- -- b as(select *,
-- -- 	 		FLOOR(cancel_rate / 10) AS items_,
-- -- 	    	CONCAT(FLOOR(cancel_rate / 10) * 10, '-', (FLOOR(cancel_rate / 10) * 10) + 9) AS cancel_rate_range
-- -- 	from a),

-- -- c as(select *,
-- -- 	 		FLOOR(cancel_rate / 2) AS items_,
-- -- 	    	CONCAT(FLOOR(cancel_rate / 2) * 2, '-', (FLOOR(cancel_rate / 2) * 2) + 1) AS cancel_rate_range
-- -- 	from a)
-- select * from a
-- -- select cancelled_orders,count(seller_id)
-- -- from a
-- -- group by cancelled_orders

-- select cancel_rate_range, count(seller_id) as n_sellers,
-- 		round((count(seller_id)::numeric/329)*100,2) as seller_p
-- from b
-- group by cancel_rate_range
-- order by n_sellers desc
--------------------------------------------------------------------------------------------------

-- 4. Seller cancellations

-- Number of sellers involved in canceled orders : 329

-- Sellers with the highest and lowest cancellation rates
--         seller_id                 order cancel cancel_rate
-- "001e6ad469a905060d959994f1b41e4f"	1	  1	     100.00
-- "1992f8fb6b19fcccd97ca819811e7267"	1	  1	     100.00
-- "1fddcb7b326905d3ad5efe82187db347"	1	  1	     100.00
-- "2078fe5066350e7d220c0ad3a3bbc6c1"	1	  1	     100.00
-- "278b6e0b20c4f61fefaa0577943d7a35"	1	  1	     100.00


--         seller_id                 order cancel cancel_rate
-- "1f50f920176fa81dab994f9023523100" 1404	1	     0.07
-- "955fee9216a65b617aa5c0531780ce60" 1287	1	     0.08
-- "4869f7a5dfa277a7dca6462dcf3b52b2" 1132	1	     0.09
-- "ea8482cd71df3c1969d7b9473ff13abc" 1146	1	     0.09
-- "7a67c85e85bb2ce8582c35f2203ad736" 1160	1	     0.09

-- cancel_rate_range      : number_of_sellers : seller_%
--     "0-9"	          : 189               :  57.45
--     "10-19"	          : 39               :  11.85
--     "100-109"          :	39               :  11.85
--     "50-59"	          : 26               :  7.90
--     "20-29"	          : 17               :  5.17
--     "30-39"	          : 17               :  5.17
--     "60-69"	          : 2                :  0.61

-- >insights::
-- 0.46% orders were cancelled out of all orders.(461/99441)
-- 11% of sellers were involved in atleat 1 cancelled order.(329/2970)
-- 45% sellers have less than 4 order cancelled. (149/329)
-- highest cancel rate is 100% with sellers who have total 1 order and that was
-- cancelled.
-- lowest cancel rate is 0.07. (1/1407)
-----------------------------------------------------------------------------------------------------

-- with a as(
-- 	select 
-- 		*,
-- 		order_estimated_delivery_date::date - order_delivered_customer_date::date as diff
-- 	from olist.order_items as oi
-- 	left join olist.orders as o
-- 	using (order_id)
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null),


-- ot as(
-- 	select seller_id, count(distinct order_id) as oto
-- 	from a
-- 	where diff >= 0
-- 	group by seller_id),
-- lt as(
-- 	select seller_id, count(distinct order_id) as lo
-- 	from a
-- 	where diff < 0
-- 	group by seller_id)

-- select distinct seller_id 
-- from olist.order_items 
-- join olist.orders
-- using (order_id)
-- where order_status = 'delivered'
-- 		and order_delivered_customer_date is not null 

-- select 
-- 	*,
-- 	oto+lo as total_o,
-- 	coalesce(round((oto::numeric/(oto+lo)::numeric)*100,2),0) as otop,
-- 	coalesce(round((lo::numeric/(oto+lo)::numeric)*100,2),0) as lop
-- from ot
-- left join lt
-- using (seller_id)
-- order by oto 
	
----------------------------------------------------------------------------------------------------

-- 5. Seller delivery performance

-- Compare sellers on:

-- Delivered orders :  96470/99441(97%)
--                    (out of 99441 orders, 96470 orders were delivered)
--						2970/3095(96%) 
--                    (out of 3095 sellers, 2970 sellers have atleat 1 delivered order)

-- On-time delivery : 89936/96470(93%)
--						(out of 96470 delivered orders, 89936 orders were on-time)

-- Late delivery : 6534/96470(7%)
--						(out of 96470 delivered orders, 6534 orders were late)

-- Late-delivery rate : 7%

--------------------------------------------------------------------------------------------------

-- with a as(
-- 	select 
-- 		seller_id,
-- 		count(distinct order_id) as total_o,
-- 		count(review_score) as total_r,
-- 		round(avg(review_score),1) as rating
-- 	from olist.orders
-- 	join olist.order_reviews
-- 	using (order_id)
-- 	join olist.order_items
-- 	using (order_id)
-- 	join olist.sellers
-- 	using (seller_id)
-- 	group by seller_id
-- 	order by rating desc, total_o desc),

-- b as(
-- 	select 
-- 		*,
-- 		order_estimated_delivery_date::date - order_delivered_customer_date::date as diff
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	join olist.sellers as s
-- 	using (seller_id)
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null),

-- c as(
-- 	select distinct seller_id
-- 	 from b
-- 	where diff < 0),

-- d as(
-- 	select rating, count(seller_id), round((count(seller_id)::numeric/2970)*100,2) as perc
-- 	from a
-- 	group by rating
-- 	order by rating)

-- select *
-- from a
-- where rating < 3.50  and total_o is not null
-- select sum(total_o),sum(total_r) from a

-- create view olist.seller_satisfaction as
-- select 
-- 	seller_id as seller,
-- 	round(avg(review_score),2) as average_review_score,
-- 	count(review_score) as review_count
-- from olist.orders
-- left join olist.order_reviews
-- using (order_id)
-- left join olist.order_items
-- using (order_id)
-- left join olist.sellers
-- using (seller_id)
-- where review_score is not null
-- group by seller_id
-- order by average_review_score desc, review_count desc

--------------------------------------------------------------------------------------------------

-- 6. Seller customer satisfaction

-- Determine:
--rating : sellers : seller_%    
--   1   :  155    :	5.22
--   2   :  98     :	3.30
--   3   :  332    :	11.18
--   4   :  1521   :	51.21
--   5   :  984    :	33.13

-- Sellers with highest/lowest average scores
--            seller_id             t_orders  t_reviews rating
-- "48efc9d94a9834137efd9ea76b065a38"	33	      34	  5.00
-- "2addf05f476d0637864454e93ba673d5"	12	      12	  5.00
-- "b2eecf5ea250510da76590ca79d60e5d"	9	      11	  5.00
-- "ec933281fb017b5020d06df29c3f77e8"	8	      8	      5.00
-- "404e1ba01358af4cd63f679b2c4d1fa1"	8	      12	  5.00

--            seller_id             t_orders  t_reviews rating
-- "dc120d932ddf9d4dfb6fd68beefda622"	1	       1	  1.00
-- "c7b7db6c8f3c64a7cc1afa634db21d50"	1	       1	  1.00
-- "c85d7b477a709c85a1e8b8f25aa1b270"	1	       2	  1.00
-- "c87abc38c8ed3240861729e1aeadf221"	1	       1	  1.00
-- "c88f62b4c386a59281014d677864d016"	1	       1	  1.00

-- Whether sellers with weaker delivery performance also show weaker review scores
-- 65/1271(5%) (out of 1274 late deliery seller_id, 1271 were given review score.)
--         (out of 1271 reviews, 65 had weaker review scores.)

-- >insights::
-- 3090/3095 sellers were given review.
-- 99.2% orders were given review score.(98673/99441)
-- 65% sellers were given >3.9 rating.
-- 16% sellers were given 3.5 to 3.9 rating.
-- 19% sellers were given <3.5 rating.

---------------------------------------------------------------------------------------------------

-- with a as(
-- 	select 
-- 		seller_id, 
-- 		sum(price) as sales, 
-- 		sum(price + freight_value) as revenue,
-- 		count(review_score) as t_r,
-- 		avg(review_score) as rating
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	join olist.sellers as s
-- 	using (seller_id)
-- 	left join olist.order_reviews as r
-- 	on oi.order_id = r.order_id
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 	group by seller_id
-- 	order by sales desc, revenue desc, rating desc),

-- b as(select 
-- 		*,
-- 		ntile(4) over(order by sales desc, revenue desc, rating desc) as nt
-- 	from a where t_r >= 5),
	
-- c as(
-- 	select 
-- 		nt, 
-- 		sum(sales) as sales, 
-- 		sum(revenue) as revenue, 
-- 		avg(rating) as rating,
-- 		round((sum(sales)::numeric/12841409.11)*100,2) as sales_p,
-- 		round((sum(revenue)::numeric/14996208.44)*100,2) as revenue_p
-- 	from b
-- 	group by nt),
	
-- d as(select 
-- 		seller_id,sales,revenue,t_r,rating,
-- 		case
-- 			when nt = 1 and rating >= 4 then 'Platform Champions'
-- 			when nt = 1 and rating < 4 then 'The Ticking Time Bombs'
-- 			when nt in (2,3) and rating >= 4 then 'Hidden Gems'
-- 			when nt in (2,3) and rating < 4 then 'Stagnant Sellers'
-- 			when nt = 4 and rating >= 4 then 'Rising Stars'
-- 			when nt = 4 and rating < 4 then 'Platform Clutter'
-- 		end as status
-- 	from b)
-- select * from d;
-- select 
-- 	status, 
-- 	count(seller_id) as ts, 
-- 	round((count(seller_id)::numeric/2970)*100,2) as sellerp,
-- 	round((sum(sales)::numeric/13278587.41)*100,2) as salesp,
-- 	round((sum(revenue)::numeric/15458286.63)*100,2) as revenuep,
-- 	round(avg(rating),2) as rating
-- from d
-- group by status

-- create view olist.overall_seller_segmentation as
-- with a as(
-- 	select 
-- 		seller_id, 
-- 		count(order_item_id) as sales_volume, 
-- 		sum(price + freight_value) as revenue,
-- 		avg(review_score) as rating,
-- 		count(review_score) as review_count
-- 	from olist.orders as o
-- 	left join olist.order_items as oi
-- 	using (order_id)
-- 	left join olist.sellers as s
-- 	using (seller_id)
-- 	left join olist.order_reviews as r
-- 	on oi.order_id = r.order_id
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 	group by seller_id
-- 	order by revenue desc, rating desc
-- 	),

-- b as(select 
-- 		*,
-- 		ntile(4) over(order by revenue desc, rating desc) as nt
-- 	from a),

-- d as(select 
-- 		seller_id as seller,
-- 		case
-- 			when review_count>=5 and nt = 1 and rating >= 4 then 'Platform Champions'
-- 			when review_count>=5 and nt = 1 and rating < 4 then 'The Ticking Time Bombs'
-- 			when review_count>=5 and nt in (2,3) and rating >= 4 then 'Hidden Gems'
-- 			when review_count>=5 and nt in (2,3) and rating < 4 then 'Stagnant Sellers'
-- 			when review_count>=5 and nt = 4 and rating >= 4 then 'Rising Stars'
-- 			when review_count>=5 and nt = 4 and rating < 4 then 'Platform Clutter'
-- 			when review_count<5 or review_count is null then 'Insufficient Reviews'
-- 		end as seller_segment,
-- 		revenue,
-- 		sales_volume,
-- 		round(rating,2) as average_review_score,
-- 		review_count
-- 	from b),

-- cancelled as(
-- 	select seller_id, count(distinct order_id) as cancelled_orders
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	join olist.sellers as s
-- 	using (seller_id)
-- 	where o.order_status = 'canceled' 
-- 	group by seller_id
-- ),

-- total as(
-- 	select seller_id, count(distinct order_id) as total_orders
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	join olist.sellers as s
-- 	using (seller_id)
-- 	group by seller_id
-- ),

-- ac as(
-- 	select 
-- 		seller_id as seller,
-- 		coalesce(round((cancelled_orders::numeric/total_orders::numeric)*100,2),0) as cancellation_rate,
-- 		coalesce(cancelled_orders,0) as cancelled_orders,
-- 		total_orders as eligible_orders
-- 	from total
-- 	left join cancelled
-- 	using (seller_id)
-- 	order by cancellation_rate desc)

-- select 
-- 	seller,
-- 	seller_segment,
-- 	revenue,
-- 	sales_volume,
-- 	cancellation_rate,
-- 	cancelled_orders,
-- 	average_review_score,
-- 	review_count
-- from d
-- join ac
-- using (seller)
-- order by sales_volume desc, cancellation_rate desc

-----------------------------------------------------------------------------------------------------

-- 7. Overall seller performance

--} filter: reviews >= 5 (37% sellers are out, while their contibution to sales was 3.29%)

-- High sales + high revenue : 322 (10.84%)(54.24){4.3}

-- High sales + poor operational/customer outcomes : 144 (4.85)(22.80){3.7}

-- average sales + high performance : 635 (21.38)(12.07){4.4}

-- average sales + low performance : 296 (9.97)(6.01){3.6}

-- Low sales + strong performance : 332 (11.18)(1.14){4.5}

-- Low sales + poor performance : 133 (4.48)(0.46){3.3}

-- Which sellers contribute strongly to the business, which present 
-- operational/customer risks, and which may require management attention?

--]nearly 1/3 of the sellers contribute strongly to 66% of sales.
--]nearly 15% of the sellers present customer risk as they provide 28% sales but 
-- have given below average customer satisfaction.
--]while there are 11% sellers who have contribute to 1% sales but have satisfied
-- customer's demand and a long tail of almost 40% sellers which have been unable
-- to sell considerable amount of products and have failed to satisfy customers
-- too, which requires management attention the most.

----------------------------------------------------------------------------------

--> Critical limitations
-- ]1. Revenue is used as the commercial performance measure because the dataset does
-- not provide seller profit/margin.
-- ]2.Seller contribution is measured absolutely, not normalized for seller tenure.
-- ]3.Cancellation, delivery, and review metrics use different denominators, so they 
-- should remain separate diagnostic dimensions rather than a formal weighted score.
-- ]4.Sellers with very low order volumes can produce extreme rates; management actions 
-- should therefore incorporate a minimum sample-size threshold.


---------------------------------------------------------------------------------

-- Which sellers contribute most and least to business performance, and how do 
-- seller differences in sales, revenue, cancellations, delivery performance, 
-- and customer satisfaction affect their overall performance?

-- ]what did you measure?
-- >total items sold
-- >total sales
-- >total revenue
-- >revenue over time
-- >cancellation rate
-- >late delivery rate
-- >customer satisfaction rate

-- ]what did you include?
-- >Included : delivered orders only
--            {total items sold, total sales, total revenue, late delivery rate,
--				customer satisfaction rate}
-- >Included : january 2017 to aughust 2018 - delivered orders only
--            {revenue over time}
-- >Included : whole dataset
--            {cancellation rate}

-- ]what grain did you use?
-- >total items sold : seller
-- >total sales : seller
-- >total revenue : seller
-- >revenue over time : seller-month
-- >cancellation rate : seller
-- >late delivery rate : seller
-- >Average customer review score : seller

-- ]why did you chose those methods?
-- >revenue over time::
-- >simple & cumulative velocity : separates sellers who have been on the site for
--  less than 4 months. their revenue cannot be measured accurately with usual
--  month over month calculation. they are separated into 3 parts and have been
--  given certain status to get idea of where they stand in revenue generation.
-- >average demand interval : for sellers who have been selling for more than 3
--  months, average demand interval separates sellers who have been selling almost
--  every month and sellers who have been selling items with empty period inbetween. 
--  The 1.32 ADI threshold is adopted from the Syntetos–Boylan demand-pattern 
-- classification framework and adapted here to distinguish sellers with intermittent
-- versus more regular monthly revenue activity.
-- >zero demand frequency : sellers who have big gaps between selling are divided
-- into 2 parts with zero demand frequency. zero-demand frequency below 20% is 
-- treated as regular activity, 20–50% as occasional activity, and above 50% as 
-- slow-moving activity.
-- >Normalization and CV : with the help of linear regression slope, average 
--  revenue and standard deviation, sellers with consistent selling is measured.

-- ]what should the management do?
-->The business should protect and expand its small group of high-value sellers, 
--urgently remediate high-revenue sellers with poor customer/operational outcomes, 
--and systematically phase out persistently low-value sellers who fail to generate 
-- sales or customer satisfaction.

-- FINAL BUSINESS RECOMMENDATION :
-- Prioritize seller portfolio management around economic concentration: protect the 
-- 322 sellers generating 54.24% of revenue, rehabilitate the 144 high-value sellers 
-- generating another 22.80% despite weak outcomes, selectively scale the 635 
-- high-satisfaction mid-tier sellers, review and rationalize the low-value long
-- tail, with phase-out considered only for persistently low-volume sellers that 
-- also demonstrate weak operational and customer outcomes.

----------------------------------------------------------------------------------
-- ==================================================================================

-- Business Question 4 — Customer Retention & Behavior
-- How strong is customer retention, what proportion of customers make repeat 
-- purchases, and what differences in purchasing behavior and satisfaction exist 
-- between one-time and repeat customers?

-- ===================================================================================
-----------------------------------------------------------------------------------

-- select customer_unique_id,count(*)
-- from olist.customers
-- join olist.orders
-- using (customer_id)
-- where order_status = 'delivered'
-- group by customer_unique_id
-- having count(*) > 1

-- create view olist.customer_base as
-- with a as(select customer_unique_id,
-- 	case when customer_unique_id is not null then 'One-Time' end as customer_type
-- from olist.customers
-- join olist.orders
-- using (customer_id)
-- where order_status = 'delivered'
-- group by customer_unique_id
-- having count(*) = 1),

-- b as(select customer_unique_id,
-- 	case when customer_unique_id is not null then 'Repeat' end as customer_type
-- from olist.customers
-- join olist.orders
-- using (customer_id)
-- where order_status = 'delivered'
-- group by customer_unique_id
-- having count(*) > 1),

-- c as (select * from a
-- union all
-- select * from b)

-- select
-- 	customer_type,
-- 	count(customer_unique_id) as customer_count,
-- 	round((count(customer_unique_id)::numeric/93358)*100,2) as customer_share
-- from c
-- group by customer_type

----------------------------------------------------------------------------------

-- 1. Customer base

-- Determine:

-- total unique customers : 96096 
-- Total unique customers involved in delivered orders : 93358/96096(97%)
-- Number of one-time customers : 90557 (97%)
-- Number of repeat customers : 2801 (3%)
-- Percentage of customers in each group : 97 : 3


------------------------------------------------------------------------------------

-- with a as(
-- 	select customer_unique_id,count(order_id) as n_orders
-- 	from olist.customers
-- 	join olist.orders
-- 	using (customer_id)
-- 	where order_status = 'delivered'
-- 	group by customer_unique_id
-- 	having count(order_id) > 1)

-- -- select avg(n_orders) as avg_order
-- -- from a

-- select n_orders, count(*) as tuc, round((count(*)::numeric/2801)*100,2)
-- from a
-- group by n_orders
-- order by n_orders

-- create view olist.repeat_purchasing_behaviour as
-- with a as(select customer_unique_id,count(order_id) as orders,
-- 	case when customer_unique_id is not null then 'One-Time' end as customer_type
-- from olist.customers
-- join olist.orders
-- using (customer_id)
-- where order_status = 'delivered'
-- group by customer_unique_id
-- having count(*) = 1),

-- b as(select customer_unique_id,count(order_id) as orders,
-- 	case when customer_unique_id is not null then 'Repeat' end as customer_type
-- from olist.customers
-- join olist.orders
-- using (customer_id)
-- where order_status = 'delivered'
-- group by customer_unique_id
-- having count(*) > 1),

-- c as (select * from a
-- union all
-- select * from b)

-- select
-- 	customer_type,
-- 	round(avg(orders),2) as average_orders_per_customer
-- from c
-- group by customer_type

-----------------------------------------------------------------------------------

-- 2. Repeat purchasing behavior

-- For repeat customers, determine:

-- Number of orders per customer : range(2,17)

-- Distribution of customers by number of orders :
-- n_orders : number of repeat customers
--     2	:      2573
--     3	:      181
--     4	:      28
--     5	:      9
--     6	:      5
--     7	:      3
--     9	:      1
--     15   :      1

-- Average number of orders among repeat customers : 2.11

-- Highest number of orders placed by one customer : 15

-----------------------------------------------------------------------------------

-- create view olist.repeat_customer_trend as
-- with a as(select 
-- 		customer_unique_id, 
-- 		customer_id, 
-- 		order_id,
-- 		order_purchase_timestamp,
-- 		TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month,
-- 		DATE_TRUNC('month', order_purchase_timestamp)::date AS year_month_date,
-- 		row_number() over(
-- 				partition by customer_unique_id order by order_purchase_timestamp asc
-- 					)
-- 	from olist.customers
-- 	join olist.orders
-- 	using(customer_id)
-- 	where order_status = 'delivered' 
-- 		-- and TO_CHAR(order_purchase_timestamp, 'YYYY:MM') not in ('2016:09','2016:12')
-- 	order by customer_unique_id, order_purchase_timestamp),

-- b as(select *,
-- 		case 
-- 			when row_number = 1 then 'NEW'
-- 			when row_number > 1 then 'REPEAT'
-- 		end as customer_group
-- 	from a ),

-- c as(
-- 	select 
-- 		year_month, customer_group,
-- 		count(order_id) as total_orders,
-- 		count(distinct customer_unique_id) as u_customer
-- 	from b
-- 	group by year_month, customer_group
-- 	order by year_month),

-- d as(select 
-- 		year_month,
-- 		sum(total_orders) as total_orders,
-- 		sum(u_customer) as total_customers,
-- 		max(case when customer_group = 'NEW' then u_customer end) as new_customer,
-- 		coalesce(max(case when customer_group = 'REPEAT' then u_customer end),0) as repeat_customer,
-- 		max(case when customer_group = 'NEW' then total_orders end) as new_orders,
-- 		coalesce(max(case when customer_group = 'REPEAT' then total_orders end),0) as repeat_orders
-- 	from c
-- 	group by year_month),

-- e as(select *, 
-- 		round((new_customer::numeric/total_customers)*100,2) as new_c,
-- 		round((repeat_customer::numeric/total_customers)*100,2) as repeat_c,
-- 		round((new_orders::numeric/total_orders)*100,2) as new_o,
-- 		round((repeat_orders::numeric/total_orders)*100,2) as repeat_o
-- 	from d)
	
-- select 
-- 	year_month, 
-- 	repeat_customer as repeat_customer_count,
-- 	repeat_c as repeat_customer_share
-- from e

-- select year_month, new_c, repeat_c, new_customer, repeat_customer from e
-----------------------------------------------------------------------------------

-- 3. Repeat customer trend

-- Analyze how repeat purchasing changes over time.

-- year:month :     new_%       :    repeat_%   :   new_c     :   repeat_c
-- "2016:09"  :    100.00       :     0.00      :    1	      :      0
-- "2016:10"  :    98.87	    :     1.13	    :    262	  :      3        
-- "2016:12"  :    100.00       :     0.00      :    1	      :      0
-- "2017:01"  :    96.76	    :     3.24	    :    717	  :      24
-- "2017:02"  :    98.67	    :     1.33	    :    1628	  :      22
-- "2017:03"  :    98.35	    :     1.65	    :    2503	  :      42
-- "2017:04"  :    98.13	    :     1.87	    :    2256	  :      43
-- "2017:05"  :    97.38	    :     2.62	    :    3451	  :      93
-- "2017:06"  :    97.03	    :     2.97	    :    3037	  :      93
-- "2017:07"  :    97.00	    :     3.00	    :    3752	  :      116
-- "2017:08"  :    96.96	    :     3.04	    :    4057	  :      127
-- "2017:09"  :    96.60	    :     3.40	    :    4004	  :      141
-- "2017:10"  :    96.78	    :     3.22	    :    4328	  :      144
-- "2017:11"  :    96.98	    :     3.02	    :    7060	  :      220
-- "2017:12"  :    96.97	    :     3.03	    :    5338	  :      167
-- "2018:01"  :    96.84	    :     3.16	    :    6842	  :      223
-- "2018:02"  :    96.15	    :     3.85	    :    6288	  :      252
-- "2018:03"  :    96.79	    :     3.21	    :    6774	  :      225
-- "2018:04"  :    96.89	    :     3.11	    :    6582	  :      211
-- "2018:05"  :    96.51	    :     3.49	    :    6506	  :      235
-- "2018:06"  :    96.47	    :     3.53	    :    5878	  :      215
-- "2018:07"  :    96.62	    :     3.38	    :    5949	  :      208
-- "2018:08"  :    96.85	    :     3.15	    :    6144	  :      200

-- Determine whether the proportion of repeat customers is:
-->Repeat purchasing remains low throughout the observed period, generally 
-- accounting for about 1–4% of monthly customers. The data suggests a persistently
-- small repeat-purchase base, but the monthly trend alone is insufficient to 
-- conclude that retention has stabilized because recent customers have shorter 
-- observation windows."

----------------------------------------------------------------------------------

-- create view olist.repeat_customer_commercial_contribution as
-- with a as(select 
-- 		customer_unique_id, 
-- 		customer_id, 
-- 		order_id,
-- 		order_purchase_timestamp,
-- 		TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month,
-- 		DATE_TRUNC('month', order_purchase_timestamp)::date AS year_month_date,
-- 		row_number() over(
-- 				partition by customer_unique_id order by order_purchase_timestamp asc
-- 					)
-- 	from olist.customers
-- 	join olist.orders
-- 	using(customer_id)
-- 	where order_status = 'delivered' 
-- 		-- and TO_CHAR(order_purchase_timestamp, 'YYYY:MM') not in ('2016:09','2016:12')
-- 	order by customer_unique_id, order_purchase_timestamp),

-- b as(select *,
-- 		case 
-- 			when row_number = 1 then 'NEW'
-- 			when row_number > 1 then 'REPEAT'
-- 		end as customer_group
-- 	from a ),

-- c as(select 
-- 		customer_unique_id, 
-- 		customer_id, 
-- 		order_id,
-- 		order_purchase_timestamp,
-- 		year_month,
-- 		year_month_date,
-- 	    row_number,
-- 		customer_group,
-- 		count(order_item_id) as total_items,
-- 		max(price) as max_price,
-- 		max(freight_value) as max_freight,
-- 		sum(price) as sales,
-- 		sum(price + freight_value) as revenue
-- 	from b 
-- 	join olist.order_items
-- 	using (order_id)
-- 	group by 
-- 		customer_unique_id, 
-- 		customer_id, 
-- 		order_id,
-- 		order_purchase_timestamp,
-- 		year_month,
-- 		year_month_date,
-- 	    row_number,
-- 		customer_group)

-- select 
-- 	customer_group as customer_type,
-- 	sum(revenue) as revenue,
-- 	round((sum(revenue)::numeric/15419773.75)*100,2) as revenue_share
-- from c
-- group by customer_group
		
-- select 
-- 	customer_group,
-- 	sum(revenue) as revenue,
-- 	round((sum(revenue)::numeric/15419773.75)*100,2) as revenue_P,
-- 	sum(sales) as sales,
-- 	round((sum(sales)::numeric/13221498.11)*100,2) as sales_P,
-- 	count(order_id) as orders,
-- 	round((count(order_id)::numeric/96478)*100,2) as orders_P
-- from c
-- group by customer_group

-- select 
-- 	round((sum(revenue)::numeric/count(order_id)::numeric),2) as AOV
-- from c
-- where customer_group = 'REPEAT'
	
-- select 
-- 	year_month,
-- 	round((sum(revenue)::numeric/count(order_id)::numeric),2) as AOV
-- from c
-- where customer_group = 'REPEAT'
-- group by 
-- 	year_month
-- order by 
-- 	year_month
----------------------------------------------------------------------------------

-- 4. Revenue contribution

-- Compare one-time and repeat customers on:

-- Total revenue
-- customer_group:revenue:revenue_%
-- "REPEAT"	    455823.38	  2.96
-- "NEW"	    14963950.37   97.04

-- Total sales
-- customer_group:sales:sales_%
-- "REPEAT"    383896.37	2.90
-- "NEW"	   12837601.74	97.10

-- Number of orders
-- customer_group:orders:order_%
-- "REPEAT"	    3120	3.23
-- "NEW"	    93358	96.77

-- Average order value
-- absolute_aov_new : 160.28
-- absolute_aov_repeat : 146.16

-- year_month      AOV_new        AOV_repeat
-- "2016:09"	    143.46         -
-- "2016:10"	    175.48         -
-- "2016:12"    	19.62          171.27
-- "2017:01"    	173.52         82.21
-- "2017:02"	    164.71         123.81
-- "2017:03"	    163.62         119.92
-- "2017:04"	    169.97         154.32
-- "2017:05"	    159.99         155.60
-- "2017:06"	    157.44         119.15
-- "2017:07"	    146.64         136.08
-- "2017:08"	    153.91         158.62
-- "2017:09"	    169.82         145.23
-- "2017:10"	    168.85         135.70
-- "2017:11"	    158.81         138.27
-- "2017:12"	    152.44         167.21
-- "2018:01"	    152.81         143.79
-- "2018:02"	    147.85         135.44
-- "2018:03"	    160.58         142.92
-- "2018:04"	    167.13         152.56
-- "2018:05"	    167.54         159.89
-- "2018:06"	    166.34         154.31
-- "2018:07"	    167.40         150.99
-- "2018:08"	    155.33         150.23

-- Determine whether repeat customers contribute disproportionately to business 
-- revenue.
-- >3% of repeat customers contribute to nearly 3%(2.96) revenue, nearly 3%(2.90) to
-- sales and nearly 3%(3.23) to orders.

------------------------------------------------------------------------------------

-- -- Step 1: Add the new column 'nd' to the table
-- ALTER TABLE olist.product_category_name_translation 
-- ADD COLUMN nd VARCHAR(20);

-- -- Step 2: Populate the column using a CASE statement based on category traits
-- UPDATE olist.product_category_name_translation
-- SET nd = CASE 
--     -- NEED: Consumables, utilities, daily essential care, and vital security
--     WHEN product_category_name_english IN (
--         'diapers_and_hygiene', 
--         'health_beauty', 
--         'perfumery', 
--         'baby', 
--         'food', 
--         'drinks', 
--         'food_drink', 
--         'pet_shop', 
--         'stationery', 
--         'telephony', 
--         'fixed_telephony', 
--         'security_and_services', 
--         'construction_tools_safety', 
--         'signaling_and_security'
--     ) THEN 'need'
    
--     -- DISCRETIONARY: Fashion, hobbies, electronics, furniture, and home aesthetics
--     ELSE 'discretion'
-- END;

-- create view olist.time_between_purchases as
-- with a as(select 
-- 		customer_unique_id, 
-- 		customer_id, 
-- 		order_id,
-- 		order_purchase_timestamp,
-- 		TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month,
-- 		DATE_TRUNC('month', order_purchase_timestamp)::date AS year_month_date,
-- 		row_number() over(
-- 				partition by customer_unique_id order by order_purchase_timestamp asc
-- 					)
-- 	from olist.customers
-- 	join olist.orders
-- 	using(customer_id)
-- 	where order_status = 'delivered' 
-- 		-- and TO_CHAR(order_purchase_timestamp, 'YYYY:MM') not in ('2016:09','2016:12')
-- 	order by customer_unique_id, order_purchase_timestamp),

-- b as(select distinct customer_unique_id
-- 	from olist.customers
-- 	join olist.orders
-- 	using(customer_id)
-- 	where order_status = 'delivered'
-- 	group by customer_unique_id
-- 	having count(*) > 1
-- 	),

-- c as(select *
-- 	from a
-- 	join b
-- 	using (customer_unique_id)),

-- d as(select 
-- 		customer_unique_id,
-- 		max(case when  row_number = 1 then order_purchase_timestamp end) as first_time,
-- 		max(case when  row_number = 2 then order_purchase_timestamp end) as second_time
-- 	from c
-- 	where row_number < 3
-- 	group by customer_unique_id),

-- e as(select 
-- 		*,
-- 		second_time - first_time as diff,
-- 		case when customer_unique_id is not null then 'First-to-Second' end as purchase_type
-- 	from d),

-- f as(select 
-- 		*,
-- 		order_purchase_timestamp - lag(order_purchase_timestamp,1,null) over(
-- 			partition by customer_unique_id order by row_number) as diff
-- 	from c),

-- g as(select *
-- 	from f
-- 	where row_number <> 1),

-- h as(select 
-- 		*,
-- 		lead(order_purchase_timestamp,1,null) over(partition by customer_unique_id order by row_number) 
-- 			- order_purchase_timestamp as diff,
-- 		case when customer_unique_id is not null then 'subsequent' end as purchase_type
-- 	from c),

-- i as(select purchase_type,
-- 		case 
-- 			when EXTRACT(EPOCH FROM diff) / 86400 <= 30 then '0-30' 
-- 			when EXTRACT(EPOCH FROM diff) / 86400 <= 60 then '31-60' 
-- 			when EXTRACT(EPOCH FROM diff) / 86400 <= 90 then '61-90' 
-- 			when EXTRACT(EPOCH FROM diff) / 86400 <= 180 then '91-180' 
-- 			when EXTRACT(EPOCH FROM diff) / 86400 > 180 then '180+' 
-- 		end as purchase_interval_group,
-- 		diff
-- 	from e),

-- j as(select purchase_type,
-- 		case 
-- 			when EXTRACT(EPOCH FROM diff) / 86400 <= 30 then '0-30' 
-- 			when EXTRACT(EPOCH FROM diff) / 86400 <= 60 then '31-60' 
-- 			when EXTRACT(EPOCH FROM diff) / 86400 <= 90 then '61-90' 
-- 			when EXTRACT(EPOCH FROM diff) / 86400 <= 180 then '91-180' 
-- 			when EXTRACT(EPOCH FROM diff) / 86400 > 180 then '180+' 
-- 		end as purchase_interval_group,
-- 		diff
-- 	from h),

-- k as(select * from i
-- 	union all
-- 	select * from j)

-- select 
-- 	purchase_type, 
-- 	purchase_interval_group,
-- 	count(diff) as customer_count,
-- 	round((EXTRACT(EPOCH FROM AVG(diff)) / 86400) ::numeric ,0)
-- 	    AS average_interval_days,
	
-- 	round((PERCENTILE_CONT(0.5)
-- 	WITHIN GROUP (
-- 	    ORDER BY EXTRACT(EPOCH FROM diff)
-- 	) / 86400)::numeric ,0)
-- 	    AS median_interval_days
-- from k 
-- where purchase_interval_group is not null
-- group by 
-- 	purchase_type, 
-- 	purchase_interval_group

-- select 
-- 	purchase_type,
-- 	avg(diff) as avg_time,
-- 	percentile_disc(0.5) within group (order by diff) as median_time
-- from e
-- group by purchase_type

-- select 
-- 	avg(diff),
-- 	percentile_disc(0.5) within group (order by diff) as median_time
-- from h


-- select 
-- 	avg(diff) as avg_time,
-- 	percentile_disc(0.5) within group (order by diff) as median_time
-- from g

-- select * from e

-- Customer
-- Purchase Type
-- Purchase Interval (Days)
-- Purchase Interval Group

-----------------------------------------------------------------------------------

-- 5. Time between purchases

-- For customers with multiple orders, analyze:

-- Time between first and second order : 
-- > average time : 80 days 28:57:37.550517
-- > median time : 28 days 23:31:29

-- Time between subsequent orders
-- > average time : 78 days 27:36:23.161539
-- > median time : 29 days 11:43:11

-- Typical purchase interval
-- > average time : 78 days 27:36:23.161539
-- > median time : 29 days 10:08:44

---------------------------------------------------------------------------------

-- with a as(select 
-- 		customer_unique_id, 
-- 		customer_id, 
-- 		order_id,
-- 		order_purchase_timestamp,
-- 		TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month,
-- 		DATE_TRUNC('month', order_purchase_timestamp)::date AS year_month_date,
-- 		row_number() over(
-- 				partition by customer_unique_id order by order_purchase_timestamp asc
-- 					)
-- 	from olist.customers
-- 	join olist.orders
-- 	using(customer_id)
-- 	where order_status = 'delivered' 
-- 		-- and TO_CHAR(order_purchase_timestamp, 'YYYY:MM') not in ('2016:09','2016:12')
-- 	order by customer_unique_id, order_purchase_timestamp),

-- b as(select distinct customer_unique_id
-- 	from olist.customers
-- 	join olist.orders
-- 	using(customer_id)
-- 	where order_status = 'delivered'
-- 	group by customer_unique_id
-- 	having count(*) = 1
-- 	),

-- c as(select 
-- 		*
-- 	from a
-- 	join b
-- 	using (customer_unique_id)
-- 	join olist.order_reviews
-- 	using (order_id)
-- 	)

-- select 
-- 	review_score, 
-- 	count(review_score), 
-- 	round((count(review_score)::numeric/90053)*100,2)  
-- from c
-- group by review_score
-- order by review_score
-- select avg(review_score) from c

---------------------------------------------------------------------------------

-- 6. Customer satisfaction

-- Compare one-time and repeat customers on:

-- Average review score
-- new : 4.15
-- repeat : 4.21

-- Review-score distribution

-- REPEAT CUSTOMERS::
-- score:n_reviews:n_review_%
-- 1	  568	     9.00
-- 2	  184	     2.92
-- 3	  514	     8.15
-- 4	  1117	     17.71
-- 5	  3925	     62.22

-- NEW CUSTOMERS::
-- score:n_reviews:n_review_%
-- 1	 8838	   9.81
-- 2	 2757	   3.06
-- 3	 7447	   8.27
-- 4	 17870	   19.84
-- 5	 53141     59.01

-- Proportion of low scores(1,2,3) / high scores(4,5)
-- REPEAT CUSTOMERS:: high:79.93 || low:20.07
-- NEW CUSTOMERS:: high:78.85 || low:21.14

--]Determine whether repeat customers appear more or less satisfied than one-time
-- customers.
-->Repeat customers show slightly higher observed satisfaction, but the difference
-- is small.

----------------------------------------------------------------------------------

-- 7. Business interpretation

-- Determine:

-- ]How dependent the business is on one-time versus repeat customers
-- >the business currently operates primarily as a one-time-purchase 
-- marketplace, not a repeat-purchase business.
-- ]Whether repeat customers are commercially more valuable
-- >They contribute approximately 3% of customers, 3.23% of orders, 2.96% of 
-- revenue, and 2.90% of sales. Therefore, the current repeat base is small rather 
-- than disproportionately valuable.
-- ]Whether satisfaction differs meaningfully between the two groups
-- >Repeat customers show slightly higher observed satisfaction than one-time 
-- customers.
-- ]Whether there are indications of weak customer retention
-- >>The marketplace has a very large acquisition base but currently weak repeat
-- purchasing.


-- 8. Business recommendation

-- Based on the evidence:

-- ]What should management do to increase repeat purchasing and strengthen
-- customer retention?

-- >what did you measure?
-- total revenue              : customer group
-- total sales                : customer group
-- average order value        : customer group / month
-- average time between orders: customer
-- median time between orders : customer
-- average review score       : customer group
-- total repeat customer      : customer
-- average order per customer : customer
-- repeat customer % over time: customer-month

-- >what data qualifies?
-- ]delivered orders only 
-- 	{total revenue,total sales,average order value,average review score
--   ,repeat customer% over time}
-- ]delivered orders only, repeat customers only
-- 	{total repeat customer,average order per customer,
-- 	average time between purchase,median time between purchase}

-- >what is the grain?
-- ]total repeat customer : customer
-- ]average order per customer : customer
-- ]repeat customer% over time : customer-month
-- ]total revenue : revenue
-- ]total sales : sales
-- ]average order value : order
-- ]average time between purchase : time
-- ]median time between purchase : time
-- ]average review score : review score

-- >>FINAL BUSINESS RECOMMENDATION:
-- >>Management should not pursue retention through blanket customer-discounting 
-- alone; it should identify customer segments, products, and purchase periods 
-- associated with higher observed repeat-purchase behavior.

----------------------------------------------------------------------------------
--===============================================================================

-- Business Question 5 — Order & Delivery Operations

-- Objective:
-- How effectively is Olist fulfilling orders, and how do delivery performance and 
-- order outcomes vary across time, sellers, products, and geographic markets?

--================================================================================
---------------------------------------------------------------------------------

-- select 
-- 	order_status, 
-- 	count(*) as total, 
-- 	round((count(*)::numeric/99441)*100,3) as perc
-- from olist.orders
-- group by order_status
-- order by total desc

--------------------------------------------------------------------------------


-- 1. Order outcome performance

-- Analyze the distribution of:

-- order-status: n_orders : n_order%
-- "delivered"	     96478	97.020
-- "shipped"	     1107	1.113
-- "canceled"        625	0.629
-- "unavailable"	 609	0.612
-- "invoiced"	     314	0.316
-- "processing"	     301	0.303
-- "created"	     5	    0.005
-- "approved"	     2	    0.002

-- Determine whether unsuccessful or incomplete order outcomes show meaningful 
-- patterns.
-->Order completion is strong at 97%, but the remaining cancellation/unavailability
-- failures warrant targeted investigation rather than broad operational intervention.

-- ---------------------------------------------------------------------------------

-- select 
-- 	avg(order_delivered_customer_date - order_purchase_timestamp) as avg_time,
-- 	percentile_disc(0.5) within group (order by order_delivered_customer_date - order_purchase_timestamp)
-- 		 as median_time,
-- 	max(order_delivered_customer_date - order_purchase_timestamp) as max_time,
-- 	min(order_delivered_customer_date - order_purchase_timestamp) as min_time
-- from olist.orders
-- where order_status = 'delivered'

-- select
-- 	*
-- from olist.orders
-- where order_status = 'delivered'
-- 	and (order_estimated_delivery_date - order_delivered_customer_date)::text not like '-%'

-- create view olist.delivery_time as
-- with a as(
-- 	select 
-- 		order_id,
-- 		round(extract(epoch from (order_delivered_customer_date - order_purchase_timestamp)) 
-- 		/ 86400.0,0) AS days
-- 	from olist.orders
-- 	where order_status = 'delivered'
-- 		and order_delivered_customer_date is not null),

-- b as(select 
-- 		*,
-- 		case 
-- 			when days <= 7 then '0-7 days' 
-- 			when days <= 14 then '8-14 days' 
-- 			when days <= 21 then '15-21 days' 
-- 			when days <= 30 then '22-30 days' 
-- 			when days > 30 then '30+ days' 
-- 		end as delivery_time_group
-- 	from a)

-- select 
-- 	delivery_time_group,
-- 	count(order_id) as order_count,
-- 	round(avg(days),0) AS average_interval_days,
-- 	PERCENTILE_CONT(0.5) WITHIN GROUP (order by days) AS median_interval_days
-- from b
-- group by delivery_time_group

-- --------------------------------------------------------------------------------


-- 2. Delivery performance

-- For eligible delivered orders, determine:

-- total delivered orders : 96470 
--                   {8 other deliveries which have delivery status doesn't have delivered date/time}
-- average delivery time : 12 days 13:23:49.957272
-- median delivery time : 10 days 05:13:08
-- max delivery time : 209 days 15:05:12
-- min delivery time : 12:48:07
-- early/on-time deliveries : 88644 (91.9%)
-- late deliveries : 7826 
-- late-delivery rate : 8.11%

-- ---------------------------------------------------------------------------------
-- create view olist.late_delivery_performance_over_time as
-- with a as(
-- 	select
-- 		*,TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month,
-- 		case when order_id is not null then 'late' end as delievered_time_status
-- 	from olist.orders
-- 	where order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 		and (order_estimated_delivery_date - order_delivered_customer_date)::text like '-%'),

-- b as(
-- 	select
-- 		*,TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month,
-- 		case when order_id is not null then 'on-time' end as delievered_time_status
-- 	from olist.orders
-- 	where order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 		and (order_estimated_delivery_date - order_delivered_customer_date)::text not like '-%'),
		
-- c as(select *
-- 	from a
-- 	union 
-- 	select *
-- 	from b),

-- d as(select 
-- 		year_month, delievered_time_status, count(*)
-- 	from c
-- 	group by year_month, delievered_time_status 
-- 	order by year_month, delievered_time_status),

-- e as(select year_month,
-- 		coalesce(max(case when delievered_time_status = 'on-time' then count end),0) as on_time,
-- 		coalesce(max(case when delievered_time_status = 'late' then count end),0) as late
-- 	from d
-- 	group by year_month),

-- f as(select *, on_time+late as total
-- 	from e ),
	
-- g as(select
-- 		*,
-- 		round((on_time::numeric/total::numeric)*100,2) as otp,
-- 		round((late::numeric/total::numeric)*100,2) as lp
-- 	from f)

-- select 
-- 	year_month,
-- 	total as delivered_orders,
-- 	late as late_delivered_orders,
-- 	lp as late_delivery_rate
-- from g

-- select *,
-- 	round(avg(lp) over(order by year_month rows between 2  preceding and current row),2) as rolling_3_month_avg
-- from g

-----------------------------------------------------------------------------------

-- 3. Delivery performance over time

-- Analyze delivery performance by:

-- month
-- year_month    :OT:     LATE:    Total:    OTP:   LP:   Rolling-3-month-avg
-- "2016:09"	  0	       1	   1   	    0.00	100.0	100.0
-- "2016:10"	  262	   3   	   265   	98.87	1.13	50.57
-- "2016:12"	  1	       0	   1   	    100.00	0.00	33.71
-- "2017:01"	  727	   23      750	    96.93	3.07	1.40
-- "2017:02"	  1600	   53	   1653	    96.79	3.21	2.09
-- "2017:03"	  2404	   142	   2546    	94.42	5.58	3.95
-- "2017:04"	  2122	   181	   2303    	92.14	7.86	5.55
-- "2017:05"	  3417	   128	   3545    	96.39	3.61	5.68
-- "2017:06"	  3014	   121	   3135    	96.14	3.86	5.11
-- "2017:07"	  3739	   133	   3872    	96.57	3.43	3.63
-- "2017:08"	  4054	   139	   4193    	96.68	3.32	3.54
-- "2017:09"	  3934	   216	   4150    	94.80	5.20	3.98
-- "2017:10"	  4241	   237	   4478    	94.71	5.29	4.60
-- "2017:11"	  6245	   1043    7288	    85.69	14.31	8.27
-- "2017:12"	  5051	   462	   5513    	91.62	8.38	9.33
-- "2018:01"	  6605	   464	   7069    	93.44	6.56	9.75
-- "2018:02"	  5507	   1048    6555	    84.01	15.99	10.31
-- "2018:03"	  5507	   1496    7003	    78.64	21.36	14.64
-- "2018:04"	  6437	   361	   6798    	94.69	5.31	14.22
-- "2018:05"	  6193	   556	   6749    	91.76	8.24	11.64
-- "2018:06"	  6013	   83	   6096	    98.64	1.36	4.97
-- "2018:07"	  5880	   276	   6156    	95.52	4.48	4.69
-- "2018:08"	  5691	   660	   6351    	89.61	10.39	5.41


-- Determine whether late delivery is improving, worsening, or relatively stable.
--::considered months with atleast 200 orders.
-- >good zone(<5% late):
-- 1,2,5,6,7,8(2017) | 6,7(2018)
-- >warning zone(between 5 and 10% late):
-- 3,4,9,10,12(2017) | 1,4,5(2018)
-- >danger zone(>10% late):
-- 11(2017) | 2,3,8(2018)

-- ---------------------------------------------------------------------------------

-- create view olist.seller_late_delivery_performance as
-- with a as(
-- 	select 
-- 		*,
-- 		order_estimated_delivery_date - order_delivered_customer_date as diff
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	join olist.sellers as s
-- 	using (seller_id)
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null),

-- b as(
-- 	select 
-- 		seller_id,order_id,diff
-- 	from a
-- 	group by seller_id,order_id,diff
-- 	order by seller_id,order_id,diff ),

-- c as(select *,
-- 		case when diff is not null then 'late' end as dts
-- 	from b
-- 	where diff::text like '-%'),

-- d as(select *,
-- 		case when diff is not null then 'on-time' end as dts
-- 	from b
-- 	where diff::text not like '-%'),

-- e as(select * from c
-- 	union
-- 	select * from d),

-- f as(select * 
-- 	from e 
-- 	order by seller_id,order_id,diff),

-- g as(select seller_id,dts,count(order_id) as orders, avg(diff) as avg_time	
-- 	from f
-- 	group by seller_id,dts
-- 	order by seller_id,dts),
	
-- h as(select seller_id,
-- 		coalesce(max(case when dts = 'on-time' then orders end),0) as oto,
-- 		coalesce(max(case when dts = 'late' then orders end),0) as lo
-- 	from g
-- 	group by seller_id)

-- select 
-- 	seller_id as seller,
-- 	oto+lo as delivered_orders,
-- 	lo as late_delivered_orders,
-- 	round((lo::numeric/(oto+lo)::numeric)*100,2) as late_delivery_rate
-- from h
	

-- -- select *, round((oto::numeric/(oto+lo)::numeric)*100,2) as otop,
-- -- 	round((lo::numeric/(oto+lo)::numeric)*100,2) as lop
-- -- from h
-- -- where oto+lo>=50
-- -- order by lop desc
-- select 
-- 	seller_id,count(order_id) as t_orders,
-- 	avg(order_delivered_customer_date - order_purchase_timestamp) as avg_time
-- from a
-- group by seller_id
-- having count(order_id) >= 50
-- order by avg_time desc

----------------------------------------------------------------------------------------------------


-- 4. Seller delivery performance

-- Determine which sellers have:
-- threshold :: atleast 50 order delivered 

-- highest late-delivery rates : 
--            seller_id               on-time-order late-order oto%      lo%
-- "54965bbe3e4f07ae045b90b0b8541f52"	51	            22	   69.86	30.14
-- "a49928bcdf77c55c6d6e05e09a9b4ca5"	71	            25	   73.96	26.04
-- "beadbee30901a7f61d031b6b686095ad"	48	            16	   75.00	25.00

-- lowest late-delivery rates : 
--            seller_id               on-time-order late-order oto%      lo%
-- "b92e3c8f9738272ff7c59e111e108d7c"	60	             0	   100.00	0.00
-- "9d5a9018aee56acb367ba9c3f05d1d6a"	65	             0	   100.00	0.00
-- "d921b68bf747894be13a97ae52b0f386"	76	             0	   100.00	0.00

-- highest average delivery time
--           seller_id               t_order    avg_time
-- "2a1348e9addc1af5aaa619b1a3679d6b"	51	"26 days 28:53:07"
-- "54965bbe3e4f07ae045b90b0b8541f52"	81	"26 days 17:28:14.358025"
-- "5058e8c1e82653974541e83690655b4a"	77	"25 days 34:33:52.22078"

-- lowest average delivery time
--           seller_id               t_order    avg_time
-- "d13e50eaa47b4cbe9eb81465865d8cfc"	68	"4 days 23:20:31.470588"
-- "d566c37fa119d5e66c4e9052e83ee4ea"	73	"5 days 19:52:16.794521"
-- "138dbe45fc62f1e244378131a6801526"	58	"5 days 29:02:19.603448"

-- ---------------------------------------------------------------------------------

-- create view olist.product_and_category_late_delivery_performance as
-- with a as(
-- 	select 
-- 		*, order_estimated_delivery_date - order_delivered_customer_date as diff
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	left join olist.products as p
-- 	using (product_id)
-- 	left join olist.product_category_name_translation as t
-- 	using (product_category_name)
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 		-- and t.nd = 'need'
-- 		),

-- b as(
-- 	select 
-- 		product_id,product_category_name_english,order_id,diff
-- 	from a
-- 	group by product_id,product_category_name_english,order_id,diff
-- 	order by product_id,product_category_name_english,order_id,diff ),

-- c as(select *,
-- 		case when diff is not null then 'late' end as dts
-- 	from b
-- 	where diff::text like '-%'),

-- d as(select *,
-- 		case when diff is not null then 'on-time' end as dts
-- 	from b
-- 	where diff::text not like '-%'),

-- e as(select * from c
-- 	union
-- 	select * from d),

-- f as(select * 
-- 	from e 
-- 	order by product_id,product_category_name_english,order_id,diff),

-- g as(select product_id,product_category_name_english,dts,count(order_id) as orders, avg(diff) as avg_time	
-- 	from f
-- 	group by product_id,product_category_name_english,dts
-- 	order by product_id,dts),
	
-- h as(select product_id,product_category_name_english,
-- 		coalesce(max(case when dts = 'on-time' then orders end),0) as oto,
-- 		coalesce(max(case when dts = 'late' then orders end),0) as lo
-- 	from g
-- 	group by product_id,product_category_name_english)

-- select 
-- 	product_id as product,product_category_name_english as product_category,
-- 	oto+lo as delivered_orders,
-- 	lo as late_delivered_orders,
-- 	round((lo::numeric/(oto+lo)::numeric)*100,2) as late_delivery_rate
-- from h
-- order by delivered_orders desc

-- -- select *, round((oto::numeric/(oto+lo)::numeric)*100,2) as otop,
-- -- 	round((lo::numeric/(oto+lo)::numeric)*100,2) as lop
-- -- from h
-- -- where oto+lo>=10
-- -- order by lop desc
-- select 
-- 	product_id,count(order_id) as t_orders,
-- 	avg(order_delivered_customer_date - order_purchase_timestamp) as avg_time
-- from a
-- group by product_id
-- having count(order_id) >= 30
-- order by avg_time desc

-- with a as(
-- 	select 
-- 		*, order_estimated_delivery_date - order_delivered_customer_date as diff
-- 	from olist.orders as o
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	left join olist.products as p
-- 	using (product_id)
-- 	left join olist.product_category_name_translation as t
-- 	using (product_category_name)
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 		-- and t.nd = 'discretion'
-- 		),

-- b as(
-- 	select 
-- 		product_category_name_english,order_id,diff
-- 	from a
-- 	group by product_category_name_english,order_id,diff
-- 	order by product_category_name_english,order_id,diff ),

-- c as(select *,
-- 		case when diff is not null then 'late' end as dts
-- 	from b
-- 	where diff::text like '-%'),

-- d as(select *,
-- 		case when diff is not null then 'on-time' end as dts
-- 	from b
-- 	where diff::text not like '-%'),

-- e as(select * from c
-- 	union
-- 	select * from d),

-- f as(select * 
-- 	from e 
-- 	order by product_category_name_english,order_id,diff),

-- g as(select product_category_name_english,dts,count(order_id) as orders, avg(diff) as avg_time	
-- 	from f
-- 	group by product_category_name_english,dts
-- 	having count(order_id) >= 3
-- 	order by product_category_name_english,dts),
	
-- h as(select product_category_name_english,
-- 		coalesce(max(case when dts = 'on-time' then orders end),0) as oto,
-- 		coalesce(max(case when dts = 'late' then orders end),0) as lo
-- 	from g
-- 	group by product_category_name_english)

-- -- select *, round((oto::numeric/(oto+lo)::numeric)*100,2) as otop,
-- -- 	round((lo::numeric/(oto+lo)::numeric)*100,2) as lop
-- -- from h
-- -- -- where oto+lo>=100
-- -- order by lop desc
-- select 
-- 	product_category_name_english,count(order_id) as t_orders,
-- 	avg(order_delivered_customer_date - order_purchase_timestamp) as avg_time
-- from a
-- group by product_category_name_english
-- having count(order_id) >= 30
-- order by avg_time desc


-- --------------------------------------------------------------------------------


-- 5. Product/category delivery performance

-- Determine whether certain products or categories experience:

-->>>> higher late-delivery rates

-->high-velocity products {minimum orders : 30}
--           product_id             on-time-order:late-order:oto%   :   lo%
-- "83b00325c13c44245b2c3a2befa62a0e"	24	       9	    72.73	    27.27
-- "3fbc0ef745950c7932d5f2a446189725"	105	       38    	73.43    	26.57
-- "2fea0f2cec6b6324a277d4a61c2ed2c6"	41	       14    	74.55    	25.45

-->low-velocity products {minimum orders : 5}
--           product_id             on-time-order:late-order:oto%   :  lo%
-- "1d4de03a6141ce2a2ae5a97f51cabb37"	6	        7	     46.15	   53.85
-- "a6621d4ee609f3f917d04c11ca8f0161"	7	        5	     58.33	   41.67
-- "d97cfa719a6198d4a66453e0c6ed596c"	7	        5	     58.33	   41.67

-->category
--     category                   on-time-order:late-order: oto%   :    lo% 
-- "home_comfort_2"	                    20	       4	    83.33	    16.67
-- "furniture_mattress_and_upholstery"	32	       5	    86.49	    13.51
-- "audio"	                            303	       45    	87.07    	12.93
-- "fashion_underwear_beach"	        102	       15    	87.18    	12.82
-- "books_technical"	                228	       28    	89.06    	10.94


-->>>> longer delivery times

-->high-velocity products {minimum orders : 30}
--        product_id                 t_order     longest_avg_time
-- "83b00325c13c44245b2c3a2befa62a0e"	33	"24 days 16:27:41.090909"
-- "3fbc0ef745950c7932d5f2a446189725"	149	"18 days 11:48:23.140939"
-- "25c38557cf793876c5abdd5931f922db"	38	"17 days 25:33:06.342105"

-->low-velocity products {minimum orders : 10}
--        product_id                 t_order     longest_avg_time
-- "1dec4c88c685d5a07bf01dcb0f8bf9f8"	35	"35 days 11:18:09.4"
-- "3eef0cb94ba82de806bb30ab743c7655"	58	"32 days 15:24:10.206897"
-- "90b58782fdd04cb829667fcc41fb65f5"	17	"31 days 19:33:03.823529"

-->category
--        category                   t_orders        longest_avg_time
-- "office_furniture"	                1668	"20 days 20:11:41.21163"
-- "christmas_supplies"	                150	    "15 days 17:46:35.093333"
-- "fashion_shoes"	                    257	    "14 days 34:35:32.964981"
-- "home_comfort_2"	                    30	    "14 days 13:45:52.6"
-- "furniture_mattress_and_upholstery"	37	    "13 days 34:23:28.567567"


-- ---------------------------------------------------------------------------------
-- create view olist.geographic_late_delivery_performance as
-- with a as(
-- 	select 
-- 		*, 
-- 		order_estimated_delivery_date - order_delivered_customer_date as diff
-- 	from olist.orders as o
-- 	join olist.customers as c
-- 	using (customer_id)
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 		),

-- b as(
-- 	select 
-- 		customer_state,customer_city,order_id,diff
-- 	from a
-- 	group by customer_state,customer_city,order_id,diff
-- 	order by customer_state,customer_city,order_id,diff ),

-- c as(select *,
-- 		case when diff is not null then 'late' end as dts
-- 	from b
-- 	where diff::text like '-%'),

-- d as(select *,
-- 		case when diff is not null then 'on-time' end as dts
-- 	from b
-- 	where diff::text not like '-%'),

-- e as(select * from c
-- 	union
-- 	select * from d),

-- f as(select * 
-- 	from e 
-- 	order by customer_state,customer_city,order_id,diff),

-- g as(select customer_state,customer_city,dts,count(order_id) as orders, avg(diff) as avg_time	
-- 	from f
-- 	group by customer_state,customer_city,dts
-- 	having count(order_id) >= 3
-- 	order by customer_state,customer_city,dts),
	
-- h as(select customer_state,customer_city,
-- 		coalesce(max(case when dts = 'on-time' then orders end),0) as oto,
-- 		coalesce(max(case when dts = 'late' then orders end),0) as lo
-- 	from g
-- 	group by customer_state,customer_city)

-- select 
-- 	customer_state,customer_city,
-- 	oto+lo as delivered_orders,
-- 	lo as late_delivered_orders,
-- 	round((lo::numeric/(oto+lo)::numeric)*100,2) as late_delivery_rate
-- from h

-- select *, round((oto::numeric/(oto+lo)::numeric)*100,2) as otop,
-- 	round((lo::numeric/(oto+lo)::numeric)*100,2) as lop
-- from h
-- -- where oto+lo>=100
-- order by lop desc
-- select 
-- 	customer_state,count(order_id) as t_orders,
-- 	avg(order_delivered_customer_date - order_purchase_timestamp) as avg_time
-- from a
-- group by customer_state
-- -- having count(order_id) >= 30
-- order by avg_time desc

-- with a as(
-- 	select 
-- 		*, order_estimated_delivery_date - order_delivered_customer_date as diff
-- 	from olist.orders as o
-- 	join olist.customers as c
-- 	using (customer_id)
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 		-- and customer_state in ('BA')
-- 		),
-- -- ('AL','MA','PI','CE','SE','BA','RJ','TO','PA','ES','RR','MS','PB','PE','RN')
-- b as(
-- 	select 
-- 		customer_city,order_id,diff
-- 	from a
-- 	group by customer_city,order_id,diff
-- 	order by customer_city,order_id,diff ),

-- c as(select *,
-- 		case when diff is not null then 'late' end as dts
-- 	from b
-- 	where diff::text like '-%'),

-- d as(select *,
-- 		case when diff is not null then 'on-time' end as dts
-- 	from b
-- 	where diff::text not like '-%'),

-- e as(select * from c
-- 	union
-- 	select * from d),

-- f as(select * 
-- 	from e 
-- 	order by customer_city,order_id,diff),

-- g as(select customer_city,dts,count(order_id) as orders, avg(diff) as avg_time	
-- 	from f
-- 	group by customer_city,dts
-- 	having count(order_id) >= 3
-- 	order by customer_city,dts),
	
-- h as(select customer_city,
-- 		coalesce(max(case when dts = 'on-time' then orders end),0) as oto,
-- 		coalesce(max(case when dts = 'late' then orders end),0) as lo
-- 	from g
-- 	group by customer_city)

-- select *, round((oto::numeric/(oto+lo)::numeric)*100,2) as otop,
-- 	round((lo::numeric/(oto+lo)::numeric)*100,2) as lop
-- from h
-- where oto+lo>=20
-- order by lop desc
-- select 
-- 	customer_city,count(order_id) as t_orders,
-- 	avg(order_delivered_customer_date - order_purchase_timestamp) as avg_time
-- from a
-- group by customer_city
-- having count(order_id) >= 20
-- order by avg_time desc

-- --------------------------------------------------------------------------------

-- 6. Geographic delivery performance

-- Analyze delivery performance by customer geography, particularly:

-- state-wise:::
-- high late-delivery rate 
--state : on-time-order : late-order :oto% : lo%
-- "AL"	   302	              95	 76.07	23.93
-- "MA"	   576	              141 	 80.33	19.67
-- "PI"	   400	              76	 84.03	15.97
-- "CE"	   1083	              196 	 84.68	15.32
-- "SE"	   284	              51	 84.78	15.22

-- longer delivery time 
-- state : t_orders : longest_avg_time
-- "RR"	      41	"28 days 33:18:03.97561"
-- "AP"	      67	"26 days 28:26:29.850746"
-- "AM"	      145	"25 days 34:13:25.613793"
-- "AL"	      397	"24 days 13:03:09.103275"
-- "PA"	      946	"23 days 18:33:00.021142"

-- city-wise:::
-- high late-delivery rate 
--  city :             on-time-order : late-order :oto%   :  lo%
-- "armacao dos buzios"	      15	       13      53.57    46.43
-- "santarem"	              28	       15	   65.12	34.88
-- "maracanau"	              21	       10	   67.74	32.26
-- "maceio"	                  166          70      70.34	29.66
-- "itaperuna"	              34	       12	   73.91	26.09

-- longer delivery time 
--   city   : t_orders: longest_avg_time
-- "santarem"	43	    "32 days 24:25:42.83721"
-- "boa vista"	40	    "29 days 15:55:00.05"
-- "altamira"	25	    "27 days 23:42:35.76"
-- "macapa"  	53	    "27 days 18:17:03.132076"
-- "manaus"	    137  	"26 days 11:09:27.372263"


-- Identify geographic areas with unusually high late-delivery rates or delivery times.

-- ---------------------------------------------------------------------------------

-- with a as(
-- 	select 
-- 		*, order_estimated_delivery_date - order_delivered_customer_date as diff
-- 	from olist.customers as c
-- 	join olist.orders as o
-- 	using (customer_id)
-- 	left join olist.order_reviews as r
-- 	using (order_id)
-- 	where o.order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 		)
-- -- select * from a where diff::text not like '-%' and review_score is not null
		
-- select review_score, count(*), round((count(*)::numeric/88653)*100,2)
-- from a
-- where diff::text not like '-%'
-- group by review_score

-- select avg(review_score)
-- from a
-- where diff::text not like '-%'
-- --------------------------------------------------------------------------------

-- 7. Relationship with customer satisfaction

-- Determine whether late delivery is associated with:

-- lower review scores : 
-- late delivery (avg rating : 2.6)
-- on-time delivery (avg rating : 4.3)

-- higher proportion of 1–2 star reviews : 54.03%
-->late-delivery rating
-- rating  n_reviews  proportion
-- 1	        3554	46.16
-- 2	        606	    7.87
-- 3	        875	    11.36
-- 4	        954	    12.39
-- 5	        1711	22.22

-->on-time delivery rating
-- rating  n_reviews  proportion
-- 1	        5851	6.60
-- 2	        2335	2.63
-- 3	        7086	7.99
-- 4	        18033	20.34
-- 5	        55348	62.43

-- ---------------------------------------------------------------------------------

-- 8. Business interpretation

-- Determine:

-- Where are the major delivery/fulfillment weaknesses, and which sellers, products,
-- time periods, or geographic markets require the most attention?
-->8.11% of delivered orders were late; late-delivery reviews averaged 2.6/5.
-->With ≥50 delivered orders, top late-rate sellers reached 30.14%, 26.04%, and 25.00%.
-->Several high-velocity products showed ~25–27% late rates; some lower-volume products exceeded 40–50%.
-->Office furniture averaged ~20.9 days; Christmas supplies ~15.7 days
-->Late rate reached 14.31% in Nov-2017, 15.99% in Feb-2018, and 21.36% in Mar-2018
-->AL: 23.93% late; MA: 19.67%; CE: 15.32%; some cities exceeded 30%.
-- ----------------------------------------------------------------------------------

-- 9. Business recommendation

-- Based on the evidence:

-- What operational actions should management prioritize to improve delivery reliability and customer 
-- experience?

-- >what did you measure?
-- ]order-status distribution
-- ]average/median delivery time
-- ]late delivery rate
-- ]on-time/late delivery order rate per month
-- ]on-time/late delivery order rate per month by seller
-- ]highest/lowest average delivery time by seller
-- ]higher on-time/late delivery order rate per product/category
-- ]longest average delivery time per product/category
-- ]higher on-time/late delivery order rate per state/city
-- ]longest average delivery time per state/city

-- >what data qualifies?
-- ]table:orders {order-status distribution}
-- ]table:orders (delivered orders only) 
-- 	{average/median delivery time,late delivery rate,on-time/late delivery order rate per month}
-- ]table:orders, order_items, sellers (delivered orders only)
-- 	{on-time/late delivery order rate per month by seller,highest/lowest average delivery time by seller}
-- ]table:orders, order_items (delivered orders only)
-- 	{higher on-time/late delivery order rate per product,longest average delivery time per product}
-- ]table:orders, order_items, products, product_category_name (delivered orders only)
-- 	{higher on-time/late delivery order rate per category,longest average delivery time per category}
-- ]table:orders, order_items, customers (delivered orders only)
-- 	{higher on-time/late delivery order rate per state/city,longest average delivery time per state/city}

-- >what is the grain?
-- >what is the grain?
-- ]order-status distribution : 1 row = 1 order-status category
-- ]average/median delivery time : 1 row = 1 eligible delivered order
-- ]late delivery rate : 1 row = 1 eligible delivered order, aggregated to overall rate
-- ]on-time/late delivery rate per month : 1 row = 1 month, calculated from eligible delivered orders
-- ]on-time/late delivery rate by seller : 1 row = 1 seller, calculated from eligible delivered orders
-- ]highest/lowest average delivery time by seller : 1 row = 1 seller, calculated from eligible delivered orders
-- ]on-time/late delivery rate by product : 1 row = 1 product, calculated from eligible delivered orders
-- ]longest average delivery time by product : 1 row = 1 product, calculated from eligible delivered orders
-- ]on-time/late delivery rate by category : 1 row = 1 product category, calculated from eligible delivered orders
-- ]longest average delivery time by category : 1 row = 1 product category, calculated from eligible delivered orders
-- ]on-time/late delivery rate by state/city : 1 row = 1 state/city, calculated from eligible delivered orders
-- ]longest average delivery time by state/city : 1 row = 1 state/city, calculated from eligible delivered orders

-- >why this method?
-- ]{<5% is good/between 5 and 10% is warning>10% is danger zone} this threshold was taken for measuring
-- late delivery rate by General Logistics and Supply Chain Benchmarks.
-- ]threshold of 50 minimum orders per seller was considered per standard of ebay/amazon.
-- ]threshold of 30 minimum orders for high-velocity goods and 10 orders for low-velocity goods were done
-- based on  supply chain forecasting, demand planning, and A/B testing..
-- ]threshold of 100 minimum orders per category was done by  supply chain forecasting, demand planning,
-- and A/B testing.

-- >Executive Summary
-- Management should make delivery reliability the primary operational priority by
-- targeting high-risk sellers first, then the products, markets, and high-volume periods
-- associated with late delivery, because late orders are strongly associated with severe 
-- customer dissatisfaction.
-- >Final Management Recommendation
-- Do not redesign the entire fulfillment operation; concentrate resources on the specific
-- sellers, products, geographies, and operating periods driving late deliveries, because only
-- 8.11% of delivered orders are late and late orders are associated with substantially lower customer
-- satisfaction.

----------------------------------------------------------------------------------
--===============================================================================

-- Business Question 6 — Cancellation & Unsuccessful Orders
-- Objective

-- What patterns are associated with order cancellations and other unsuccessful order
-- outcomes, and how do these patterns vary across products, sellers, time periods,
-- and geographic markets?

--==============================================================================================
-------------------------------------------------------------------------------------------------


-- select 
-- 	order_status, 
-- 	count(*) as total, 
-- 	round((count(*)::numeric/99441)*100,3) as perc
-- from olist.orders
-- group by order_status
-- order by total desc


--------------------------------------------------------------------------------------------------

-- 1. Overall cancellation performance

-- Determine:

-- total eligible orders :  99441

-- total canceled orders : 625	

-- cancellation rate : 0.629%

-- other unsuccessful/incomplete order statuses and their respective shares

--  order_status  orders   order_share
-- "delivered"	   96478	97.020
-- "shipped"	   1107	    1.113
-- "canceled"	   625	    0.629
-- "unavailable"   609	    0.612
-- "invoiced"	   314	    0.316
-- "processing"    301	    0.303
-- "created"	   5	    0.005
-- "approved"	   2	    0.002

-------------------------------------------------------------------------------------------------
-- create view olist.cancellation_trend_over_time as
-- with a as(
-- 	select
-- 		*,TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month
-- 	from olist.orders
-- 	),

-- b as(select 
-- 		year_month, 
-- 		count(*) as total_orders,
-- 		sum(case when order_status = 'canceled' then 1 else 0 end) as cancelled_orders,
-- 		sum(case when order_status <> 'canceled' then 1 else 0 end) as eligible_orders
-- 	from a
-- 	group by year_month
-- 	order by year_month)

-- select 
-- 	year_month,
-- 	total_orders,
-- 	cancelled_orders,
-- 	round((cancelled_orders::numeric/total_orders::numeric)*100,2) as cancellation_rate
-- from b

-- select 
-- 	year_month,
-- 	round((cancelled_orders::numeric/total_orders::numeric)*100,2) as cancel_rate,
-- 	round((eligible_orders::numeric/total_orders::numeric)*100,2) as eligible_rate
-- from b
-- limit 20 offset 3

--------------------------------------------------------------------------------------------------

-- 2. Cancellation trend over time

-- Analyze cancellation rate by:

-- month
-- year:month | cancel_rate | eligible_rate
-- "2017:01"	   0.38	      99.63
-- "2017:02"	   0.96	      99.04
-- "2017:03"	   1.23	      98.77
-- "2017:04"	   0.75	      99.25
-- "2017:05"	   0.78	      99.22
-- "2017:06"	   0.49	      99.51
-- "2017:07"	   0.70	      99.30
-- "2017:08"	   0.62	      99.38
-- "2017:09"	   0.47	      99.53
-- "2017:10"	   0.56	      99.44
-- "2017:11"	   0.49	      99.51
-- "2017:12"	   0.19	      99.81
-- "2018:01"	   0.47	      99.53
-- "2018:02"	   1.09	      98.91
-- "2018:03"	   0.36	      99.64
-- "2018:04"	   0.22	      99.78
-- "2018:05"	   0.35	      99.65
-- "2018:06"	   0.29	      99.71
-- "2018:07"	   0.65	      99.35
-- "2018:08"	   1.29	      98.71

-->included : 2017:01 to 2018:08 (orders table)
-- Determine whether cancellation is increasing, decreasing, or relatively stable.
-->it can be considered relatively stable with 3 instances(2017:03,2018:02,2018:08) going above 1%.

----------------------------------------------------------------------------------------------------
-- create view olist.product_cancellation_performance as
-- with a as(
-- 	select
-- 		 product_id, order_id, order_status, 
-- 		 TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month,
-- 		 count(order_item_id) as items
-- 	from olist.orders
-- 	join olist.order_items
-- 	using (order_id)
-- 	group by product_id, order_id, order_status, TO_CHAR(order_purchase_timestamp, 'YYYY:MM')
-- 	),

-- b as(select 
-- 		product_id,
-- 		count(distinct order_id) as total_orders,
-- 		sum(case when order_status = 'canceled' then 1 else 0 end) as cancelled_orders,
-- 		sum(case when order_status <> 'canceled' then 1 else 0 end) as eligible_orders
-- 	from a
-- 	group by product_id
-- 	order by product_id)

-- select 
-- 	product_id as product,
-- 	total_orders,
-- 	cancelled_orders,
-- 	round((cancelled_orders::numeric/total_orders::numeric)*100,2) as cancellation_rate
-- from b

-- select 
-- 	product_id,total_orders,cancelled_orders,eligible_orders,
-- 	round((cancelled_orders::numeric/total_orders::numeric)*100,2) as cancel_rate,
-- 	round((eligible_orders::numeric/total_orders::numeric)*100,2) as eligible_rate
-- from b
-- where total_orders >= 30
-- order by cancel_rate desc, total_orders desc

----------------------------------------------------------------------------------------------------

-- 3. Cancellation by product

-- For each product, determine:

-- Cancellation rate among orders containing the product:

--> orders >= 30 (total products = 335(1.01%))
--             product_id               TO  CO  EO  CR
-- "177d3d5bb9d4d29222a222e3b3554f41"	42	2	40	4.76
-- "b8a0d73b2a06e7910d9864dccdb0cda2"	30	1	29	3.33
-- "a0b7d5a992ccda646f2d34e418fff5a0"	33	1	32	3.03
-- "aa8d88eb4b9cb38894e33fa624c4287f"	33	1	32	3.03
-- "dc404a1496a08f9f5540c8b5d4b92925"	38	1	37	2.63

--> orders between 10 and 29 (total products = 1339(4.06%))
--             product_id               TO  CO  EO  CR
-- "83bfae859f4a37b048a3abcecb17c506"	10	1	9	10.00
-- "de17feec1983829fec4bc58cadaa43f3"	10	1	9	10.00
-- "bf128711128b70eaa9e07df69e9a75e2"	10	1	9	10.00
-- "6bd248f93425ceeb625a8a97e2404112"	21	2	19	9.52
-- "9c7bdf67b06b419aefb93cfdfc96c55d"	11	1	10	9.09	

--> orders < 10 (total products = 31277(95%))
--             product_id               TO  CO  EO  CR
-- "3db0b74faf0d26a6b252528659d6b849"	3	3	0	100.00
-- "361009da0572b0d1d961d347f10e09b1"	2	2	0	100.00
-- "cdad30e46a6fc84785a525ad6b5cf748"	2	2	0	100.00
-- "7174375d5bea2b7612929eae33df48d1"	2	2	0	100.00
-- "36c1e7a02219b5d1e56743473a92e895"	2	2	0	100.00

-- Identify products with unusually high cancellation rates, while considering minimum order volume.
-->in group of <10 orders, 216 products have 100% cancel rate in which, among orders containing products,
-- 6 products have 2 to 3 orders ,while other 200 products have 1 order.
-->in group of 10 to 29 orders, among orders containing products ,33 products have atleast 1 cancel order 
-- while maximum cancel order is 2 and cancel rate is 10%.
--> in group of >=30 orders, among orders containing products ,31 products have atleast 1 cancel order while 
-- maximum cancel order is 2 and cancel rate is 4.76%.

-----------------------------------------------------------------------------------------------------
-- create view olist.product_category_cancellation_performance as
-- with a as(
-- 	select
-- 		product_category_name_english, order_id, order_status,
--      TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month
-- 	from olist.orders
-- 	join olist.order_items
-- 	using (order_id)
-- 	left join olist.products as p
-- 	using (product_id)
-- 	left join olist.product_category_name_translation as t
-- 	using (product_category_name)
--  group by product_category_name_english, order_id, order_status, TO_CHAR(order_purchase_timestamp, 'YYYY:MM')
-- 	),

-- b as(select 
-- 		product_category_name_english,
-- 		count(*) as total_orders,
-- 		sum(case when order_status = 'canceled' then 1 else 0 end) as cancelled_orders,
-- 		sum(case when order_status <> 'canceled' then 1 else 0 end) as eligible_orders
-- 	from a
-- 	group by product_category_name_english
-- 	order by product_category_name_english)

-- select 
-- 	product_category_name_english as product_category,
-- 	total_orders,
-- 	cancelled_orders,
-- 	round((cancelled_orders::numeric/total_orders::numeric)*100,2) as cancellation_rate
-- from b

-- -- select * from a
-- select 
-- 	product_category_name_english,total_orders,cancelled_orders,eligible_orders,
-- 	round((cancelled_orders::numeric/total_orders::numeric)*100,2) as cancel_rate,
-- 	round((eligible_orders::numeric/total_orders::numeric)*100,2) as eligible_rate
-- from b
-- where total_orders > 100
-- order by cancel_rate desc, total_orders desc

----------------------------------------------------------------------------------------------------

-- 4. Cancellation by category

-- Determine:

--> orders < 30 (total category = 11(15%))
--          category_name               TO  CO  EO  CR
-- "gaming pc"	                        8	1	7	12.50
-- "Kitchen Appliances & Food Prep"	    14	1	13	7.14
-- "diapers_and_hygiene"	            27	1	26	3.70	

--> orders between 30 and 100 (total category = 11(15%))
--          category_name               TO  CO  EO  CR
-- "dvds_blu_ray"	                    59	2	57	3.39
-- "costruction_tools_tools"	        97	0	97	0.00
-- "furniture_bedroom"	                95	0	95	0.00

--> orders > 100 (total category = 52(71%))
--          category_name               TO  CO  EO  CR
-- "fixed_telephony"	                217	3	214	1.38
-- "books_general_interest"    	        512	7	505	1.37
-- "home_appliances_2"	                234	3	231	1.28
-- "small_appliances"	                630	8	622	1.27
-- "musical_instruments"	            628	8	620	1.27
-- "construction_tools_safety"	        167	2	165	1.20
-- "costruction_tools_garden"	        194	2	192	1.03

-- Identify categories with the highest and lowest meaningful cancellation rates.
-->in a group of <30 orders, The rate is high, but the estimate is based on very few orders.
-->in a group of 30 to 100 orders, maximun cancel rate is 3.39 and maximum order cancel is 2.
-->in a group of >100 orders, maximun cancel rate is 2.14 and maximum order cancel is 47 with 0.61
-- cancel rate.

------------------------------------------------------------------------------------------------------

-- with a as(
-- 	select
-- 		seller_id, order_id, order_status,
--      TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month
-- 	from olist.orders
-- 	join olist.order_items
-- 	using (order_id)
--  group by seller_id, order_id, order_status, TO_CHAR(order_purchase_timestamp, 'YYYY:MM')
-- 	),

-- b as(select 
-- 		seller_id,
-- 		count(*) as total_orders,
-- 		sum(case when order_status = 'canceled' then 1 else 0 end) as cancelled_orders,
-- 		sum(case when order_status <> 'canceled' then 1 else 0 end) as eligible_orders
-- 	from a
-- 	group by seller_id
-- 	order by seller_id)

-- select 
-- 	-- avg(total_orders),min(total_orders),max(total_orders),
-- 	-- percentile_disc(0.5) within group (order by total_orders)
-- 	seller_id,total_orders,cancelled_orders,eligible_orders,
-- 	round((cancelled_orders::numeric/total_orders::numeric)*100,2) as cancel_rate,
-- 	round((eligible_orders::numeric/total_orders::numeric)*100,2) as eligible_rate
-- from b
-- where total_orders > 100
-- order by cancel_rate desc, total_orders desc

-------------------------------------------------------------------------------------------------------

-- 5. Cancellation by seller

-- For each seller, determine:

--> orders < 10 (total category = 1824(59%))
--          seller_id                   TO  CO  EO  CR
-- "90d4125885ab6c86e8820a722be71974"	3	3	0	100.00
-- "f543ba3c973276f519d89d59bd46cead"	2	2	0	100.00
-- "3febca52652e7209509ccfe61cbde40e"	2	2	0	100.00

--> orders between 10 and 100 (total category = 1061(34.3%))
--          seller_id                   TO  CO  EO  CR
-- "81783131d2a97c8d44d406a4be81b5d9"	13	5	8	38.46
-- "ffff564a4f9085cd26170f4732393726"	20	4	16	20.00
-- "7bcd7c5f8631701474db233ccf1c094b"	11	2	9	18.18
-- "ea6b12bf9ffe2bac34602ec631d97a47"	11	2	9	18.18
-- "20b54c376b794ed028df09a3cd88e8dc"	11	2	9	18.18

--> orders > 100 (total category = 210(6.8%))
--          seller_id                   TO  CO  EO  CR
-- "1127b7f2594683f2510f1c2c834a486b"	114	4	110	3.51
-- "a416b6a846a11724393025641d4edd5e"	162	5	157	3.09
-- "0adac9fbd9a2b63cccaac4f8756c1ca8"	110	3	107	2.73
-- "f5a590cf36251cf1162ea35bef76fe84"	117	3	114	2.56
-- "c3867b4666c7d76867627c2f7fb22e21"	245	5	240	2.04

-- Identify sellers with high cancellation rates after applying an appropriate minimum-volume threshold.
-->in a group of <10 orders, 124 sellers have atleast 1 cancel order and maximum cancel order is 3.
-->in a group of 10 to 100 orders, 125 sellers have atleat 1 cancel order,maximum cancel order is 5,
-- while 43 sellers have more than 5% cancel rate and maximum cancel rate is 38.46%.
-->in a group of >100 orders, 80 sellers have atleat 1 cancel order, maximum cancel order is 6, and
-- maximin cancel rate is 3.51%.

------------------------------------------------------------------------------------------------------

-- with a as(
-- 	select
-- 		customer_state, order_id, order_status,TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month
-- 	from olist.orders
-- 	join olist.order_items
-- 	using (order_id)
-- 	join olist.customers
-- 	on olist.orders.customer_id = olist.customers.customer_id
-- 	group by customer_state,customer_city, order_id, order_status, TO_CHAR(order_purchase_timestamp, 'YYYY:MM')
-- 	),

-- b as(select 
-- 		customer_state,
-- 		count(*) as total_orders,
-- 		sum(case when order_status = 'canceled' then 1 else 0 end) as cancelled_orders,
-- 		sum(case when order_status <> 'canceled' then 1 else 0 end) as eligible_orders
-- 	from a
-- 	group by customer_state
-- 	order by customer_state)

-- select 
-- 	-- count(distinct customer_city)
-- 	-- avg(total_orders),min(total_orders),max(total_orders),
-- 	-- percentile_disc(0.5) within group (order by total_orders)
-- 	customer_state,total_orders,cancelled_orders,eligible_orders,
-- 	round((cancelled_orders::numeric/total_orders::numeric)*100,2) as cancel_rate,
-- 	round((cancelled_orders::numeric/625::numeric)*100,2) as cancel_concentrated
-- 	-- round((eligible_orders::numeric/total_orders::numeric)*100,2) as eligible_rate
-- from b
-- -- where round((cancelled_orders::numeric/total_orders::numeric)*100,2) <> 0.00
-- -- where total_orders > 30
-- -- and customer_state in ('RJ','SP','MG')
-- -- where customer_city like 'bom jesus%'
-- -- order by customer_state,customer_city
-- order by cancel_concentrated desc, total_orders desc

-- with a as(
-- 	select
-- 		customer_state,customer_city, order_id, order_status,TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month
-- 	from olist.orders
-- 	join olist.order_items
-- 	using (order_id)
-- 	join olist.customers
-- 	on olist.orders.customer_id = olist.customers.customer_id
-- 	group by customer_state,customer_city, order_id, order_status, TO_CHAR(order_purchase_timestamp, 'YYYY:MM')
-- 	),

-- b as(select 
-- 		customer_state,customer_city,
-- 		count(*) as total_orders,
-- 		sum(case when order_status = 'canceled' then 1 else 0 end) as cancelled_orders,
-- 		sum(case when order_status <> 'canceled' then 1 else 0 end) as eligible_orders
-- 	from a
-- 	group by customer_state,customer_city
-- 	order by customer_state,customer_city),

-- c as(select customer_city,count(*) from b group by customer_city having count(*) > 1)

-- -- select sum(count) from c

-- select 
-- 	-- count(distinct customer_city)
-- 	-- avg(total_orders),min(total_orders),max(total_orders),
-- 	-- percentile_disc(0.5) within group (order by total_orders)
-- 	customer_state,customer_city,total_orders,cancelled_orders,eligible_orders,
-- 	round((cancelled_orders::numeric/total_orders::numeric)*100,2) as cancel_rate,
-- 	round((cancelled_orders::numeric/625::numeric)*100,2) as cancel_concentrated,
-- 	round((eligible_orders::numeric/total_orders::numeric)*100,2) as eligible_rate
-- from b
-- -- where round((cancelled_orders::numeric/total_orders::numeric)*100,2) <> 0.00
-- where total_orders <= 30
-- -- and customer_state in ('SP','RJ','MG','RS','PR','BA','SC')
-- -- where customer_city like 'bom jesus%'
-- -- order by customer_state,customer_city
-- order by cancel_concentrated desc, total_orders desc

------------------------------------------------------------------------------------------------------

-- 6. Cancellation by geography
-- (total state = 27 )
--  state   TO      CO  EO       CR
-- "RR"	    46	    1	45	    2.17
-- "PI"	    493	    3	490	    0.61
-- "SP"	    41375	247	41128	0.60
-- "MA"	    740	    4	736	    0.54
-- "RJ"	    12762	64	12698	0.50
-- "GO"	    2007	9	1998	0.45
-- "BA"	    3358	14	3344	0.42
-- "MG"	    11544	47	11497	0.41
-- "RO"	    247	    1	246	    0.40
-- "SC"	    3612	13	3599	0.36

--  state   TO      CO  EO       CR      CC
-- "SP"	   41375    247	41128	0.60	39.52
-- "RJ"	   12762    64	12698	0.50	10.24
-- "MG"	   11544    47	11497	0.41	7.52
-- "RS"	   5432	    16	5416	0.29	2.56
-- "PR"	   4998	    16	4982	0.32	2.56
-- "BA"	   3358	    14	3344	0.42	2.24
-- "SC"	   3612	    13	3599	0.36	2.08
-- "GO"	   2007	    9	1998	0.45	1.44
-- "ES"	   2025	    7	2018	0.35	1.12
-- "DF"	   2125	    5	2120	0.24	0.80

--> orders > 30 
--state       city                  TO CO   EO   CR
-- "RJ"	  "barra do pirai"	        54	2	52	3.70
-- "RJ"	  "itaborai"	            60	2	58	3.33
-- "RJ"	  "santo antonio de padua"	31	1	30	3.23
-- "SP"	  "promissao"	            32	1	31	3.13
-- "RS"	  "cruz alta"	            32	1	31	3.13

--> orders <= 30 
--state       city                  TO CO   EO   CR
-- "RJ"	     "piao"	                1	1	0	100.00
-- "BA"	   "monte gordo"	        2	1	1	50.00
-- "MG"	   "vargem alegre"	        2	1	1	50.00

-- state   city              TO     CO   EO      CR      CC
-- "SP"	"sao paulo"	        15402	111	15291	0.72	17.76
-- "RJ"	"rio de janeiro"	6834	34	6800	0.50	5.44
-- "MG"	"belo horizonte"	2750	12	2738	0.44	1.92
-- "SP"	"guarulhos"	        1178	11	1167	0.93	1.76
-- "PR"	"curitiba"	        1510	8	1502	0.53	1.28

-- Identify geographic areas with unusually high cancellation rates.
-->out of 27 sates, 21 states have atleast 1 order, highest cancel rate is 2.17 and highest cancel order
-- is 247 with 0.60% cancel rate.
-->in cities, in a group of >30 orders, highest cancel rate is 3.70%, and maximun cancel order is 111 with 0.72% 
-- cancel rate.
-->in cities, in a group of <=30 orders, maximun cancel order is 1 out of 30 orders.

-------------------------------------------------------------------------------------------------------

-- with a as(
-- 	select
-- 		*,TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month
-- 	from olist.orders
-- 	),

-- b as(select 
-- 		year_month,
-- 		count(*) as total_orders,
-- 		sum(case when order_status = 'delivered' then 1 else 0 end) as delivered_orders,
-- 		sum(case when order_status = 'canceled' then 1 else 0 end) as cancelled_orders,
-- 		sum(case when order_status = 'shipped' then 1 else 0 end) as shipped_orders,
-- 		sum(case when order_status = 'unavailable' then 1 else 0 end) as unavailable_orders,
-- 		sum(case when order_status = 'invoiced' then 1 else 0 end) as invoiced_orders,
-- 		sum(case when order_status = 'processing' then 1 else 0 end) as processing_orders,
-- 		sum(case when order_status = 'created' then 1 else 0 end) as created_orders,
-- 		sum(case when order_status = 'approved' then 1 else 0 end) as approved_orders
-- 	from a
-- 	group by year_month
-- 	order by year_month)

-- select
-- 	year_month,total_orders,
-- 	round(((delivered_orders+shipped_orders)::numeric/total_orders::numeric)*100,2) as successful,
-- 	round(((cancelled_orders+unavailable_orders)::numeric/total_orders::numeric)*100,2) as failed,
-- 	round(((invoiced_orders+processing_orders+created_orders+approved_orders)::numeric/total_orders::numeric)*100,2)
-- 		as pipeline
-- from b
-- limit 20
-- offset 3

-- with a as(
-- 	select
-- 		*,TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month
-- 	from olist.orders
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	),

-- b as(select 
-- 		product_id,
-- 		count(*) as total_orders,
-- 		sum(case when order_status = 'delivered' then 1 else 0 end) as delivered_orders,
-- 		sum(case when order_status = 'canceled' then 1 else 0 end) as cancelled_orders,
-- 		sum(case when order_status = 'shipped' then 1 else 0 end) as shipped_orders,
-- 		sum(case when order_status = 'unavailable' then 1 else 0 end) as unavailable_orders,
-- 		sum(case when order_status = 'invoiced' then 1 else 0 end) as invoiced_orders,
-- 		sum(case when order_status = 'processing' then 1 else 0 end) as processing_orders,
-- 		sum(case when order_status = 'created' then 1 else 0 end) as created_orders,
-- 		sum(case when order_status = 'approved' then 1 else 0 end) as approved_orders
-- 	from a
-- 	group by product_id
-- 	order by product_id)

-- select
-- 	product_id,total_orders,
-- 	round(((delivered_orders+shipped_orders)::numeric/total_orders::numeric)*100,2) as successful,
-- 	round(((cancelled_orders+unavailable_orders)::numeric/total_orders::numeric)*100,2) as failed,
-- 	round(((invoiced_orders+processing_orders+created_orders+approved_orders)::numeric/total_orders::numeric)*100,2)
-- 		as pipeline
-- from b
-- -- where total_orders < 10 
-- -- order by successful 
-- -- order by failed desc
-- order by pipeline desc

-- with a as(
-- 	select
-- 		*,TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month
-- 	from olist.orders
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	),

-- b as(select 
-- 		seller_id,
-- 		count(*) as total_orders,
-- 		sum(case when order_status = 'delivered' then 1 else 0 end) as delivered_orders,
-- 		sum(case when order_status = 'canceled' then 1 else 0 end) as cancelled_orders,
-- 		sum(case when order_status = 'shipped' then 1 else 0 end) as shipped_orders,
-- 		sum(case when order_status = 'unavailable' then 1 else 0 end) as unavailable_orders,
-- 		sum(case when order_status = 'invoiced' then 1 else 0 end) as invoiced_orders,
-- 		sum(case when order_status = 'processing' then 1 else 0 end) as processing_orders,
-- 		sum(case when order_status = 'created' then 1 else 0 end) as created_orders,
-- 		sum(case when order_status = 'approved' then 1 else 0 end) as approved_orders
-- 	from a
-- 	group by seller_id
-- 	order by seller_id)

-- select
-- 	seller_id,total_orders,
-- 	round(((delivered_orders+shipped_orders)::numeric/total_orders::numeric)*100,2) as successful,
-- 	round(((cancelled_orders+unavailable_orders)::numeric/total_orders::numeric)*100,2) as failed,
-- 	round(((invoiced_orders+processing_orders+created_orders+approved_orders)::numeric/total_orders::numeric)*100,2)
-- 		as pipeline
-- from b
-- -- where total_orders < 10 
-- -- order by successful 
-- -- order by failed desc
-- order by pipeline desc

-- with a as(
-- 	select
-- 		*,TO_CHAR(order_purchase_timestamp, 'YYYY:MM') AS year_month
-- 	from olist.orders
-- 	join olist.order_items as oi
-- 	using (order_id)
-- 	join olist.customers
-- 	on olist.orders.customer_id = olist.customers.customer_id
-- 	),

-- b as(select 
-- 		customer_state,
-- 		count(*) as total_orders,
-- 		sum(case when order_status = 'delivered' then 1 else 0 end) as delivered_orders,
-- 		sum(case when order_status = 'canceled' then 1 else 0 end) as cancelled_orders,
-- 		sum(case when order_status = 'shipped' then 1 else 0 end) as shipped_orders,
-- 		sum(case when order_status = 'unavailable' then 1 else 0 end) as unavailable_orders,
-- 		sum(case when order_status = 'invoiced' then 1 else 0 end) as invoiced_orders,
-- 		sum(case when order_status = 'processing' then 1 else 0 end) as processing_orders,
-- 		sum(case when order_status = 'created' then 1 else 0 end) as created_orders,
-- 		sum(case when order_status = 'approved' then 1 else 0 end) as approved_orders
-- 	from a
-- 	group by customer_state
-- 	order by customer_state)

-- select
-- 	customer_state,total_orders,
-- 	round(((delivered_orders+shipped_orders)::numeric/total_orders::numeric)*100,2) as successful,
-- 	round(((cancelled_orders+unavailable_orders)::numeric/total_orders::numeric)*100,2) as failed,
-- 	cancelled_orders,
-- 	round(((cancelled_orders)::numeric/625::numeric)*100,2) as cancelled,
-- 	round(((invoiced_orders+processing_orders+created_orders+approved_orders)::numeric/total_orders::numeric)*100,2)
-- 		as pipeline
-- from b
-- where total_orders < 10 
-- order by successful 
-- order by failed desc
-- order by cancelled desc
-- order by pipeline desc

-- Order Status
-- Order Outcome
-- Order Count
-- Order Share (%)
--]sucessful orders (delivered_orders + shipped_orders) 
--]failed orders (cancelled_orders + unavailable_orders) 
--]pipeline orders (invoiced_orders + processing_orders + created_orders + approved_orders) 

-- create view olist.order_completion_status as
-- select
-- 	order_status,
-- 	case 
-- 		when order_status in ('delivered','shipped') then 'successful'
-- 		when order_status in ('canceled','unavailable') then 'unsuccessful'
-- 		when order_status in ('invoiced','processing','created','approved') then 'pipeline'
-- 	end as order_outcome,
-- 	count(*) as order_count,
-- 	round((count(*)::numeric/99441)*100,2) as order_share
-- from olist.orders
-- group by order_status
-- order by order_outcome
--------------------------------------------------------------------------------------------------------

-- 7. Other unsuccessful order outcomes 


--------------------------------------------------- 
-->successful and cancelled orders:: 

-- >>order status : delivered {96478 orders} 
-- purchase : no missing -- approval : 14 missing (avg score : 4.16) 
-- carrier : 2 missing (avg score : 5.0) 
-- customer delivery : 8 missing (avg score : 4.5) 
-- estimated delivery : no missing 

-- >>order status : cancelled {625 orders} 
-- purchase : no missing 
-- approval : 141 missing 
-- carrier : 550 missing 
-- customer delivery : 619 missing 
-- estimated delivery : no missing 
-------------------------------------------- 
-->Other unsuccessful order outcomes 

-- >>order status : shipped {1107 orders} 
-- purchase : no missing 
-- approval : no missing 
-- carrier : no missing 
-- customer delivery : 1107 missing 
-- estimated delivery : no missing 
-- ]delivered date missing is logical as product is on its way to customer. 

-- >>order status : unavailable {609 orders} 
-- purchase : no missing 
-- approval : no missing 
-- carrier : 609 missing 
-- customer delivery : 609 missing 
-- estimated delivery : no missing 
-- ]shipping and delivered date missing is logical as product was not available. 

-- >>order status : invoiced {314 orders} 
-- purchase : no missing 
-- approval : no missing 
-- carrier : 314 missing 
-- customer delivery : 314 missing 
-- estimated delivery : no missing 
-- ]shipping and delivered date missing is logical as seller/store had approved the billing 
-- and waiting for payment. 

-- >>order status : processing {301 orders} 
-- purchase : no missing 
-- approval : no missing 
-- carrier : 301 missing 
-- customer delivery : 301 missing
-- estimated delivery : no missing 
-- ]shipping and delivered date missing is logical as seller/store is doing packing of the 
-- product for shipment after receiveing the payment. 

-- >>order status : created {5 orders} 
-- purchase : no missing 
-- approval : 5 missing 
-- carrier : 5 missing 
-- customer delivery : 5 missing 
-- estimated delivery : no missing
-- ]approval, shipping and delivered date missing is logical as purchase has been 
-- registered but seller/store has not yet processed the order. 

-- >>order status : approved {2 orders} 
-- purchase : no missing 
-- approval : no missing 
-- carrier : 2 missing 
-- customer delivery : 2 missing 
-- estimated delivery : no missing
-- ]shipping and delivered date missing is logical as all internal process of the 
-- store is complete and product is ready to be shipped. 
---------------------------------------------------- 
--]sucessful orders (delivered_orders + shipped_orders) 
--]failed orders (cancelled_orders + unavailable_orders) 
--]pipeline orders (invoiced_orders + processing_orders + created_orders + approved_orders) 
----------------------------------------------------- 
--> by month:(2017:01 to 2018:08)(orders table) 

-- year_month t_order success failed pipeline 
-- "2017:01" 800  95.75 1.63 2.63 
-- "2017:02" 1780 94.04 3.48 2.47
-- "2017:03" 2682 96.61 2.42 0.97 
-- "2017:04" 2404 97.84 1.12 1.04 
-- "2017:05" 3700 97.32 1.62 1.05 
-- "2017:06" 3245 98.06 1.23 0.71 
-- "2017:07" 4026 97.57 1.99 0.45 
-- "2017:08" 4331 97.76 1.36 0.88 
-- "2017:09" 4285 97.74 1.35 0.91 
-- "2017:10" 4631 97.41 1.81 0.78 
-- "2017:11" 7544 97.57 1.60 0.82 
-- "2017:12" 5673 98.18 0.93 0.88 
-- "2018:01" 7269 98.27 1.13 0.61 
-- "2018:02" 6728 98.28 1.53 0.19 
-- "2018:03" 7211 98.96 0.60 0.44 
-- "2018:04" 6939 99.39 0.29 0.32 
-- "2018:05" 6873 98.98 0.58 0.44 
-- "2018:06" 6167 99.59 0.36 0.05 
-- "2018:07" 6292 98.84 0.94 0.22 
-- "2018:08" 6512 98.25 1.40 0.35 
-->>sucessful orders increased from 95 to 98%. 
-->>failed orders have showed improvement with 6 months having less than 1% failed orders 
-- in last 9 months. 
-->>pipeline too is getting more clear with time from 2.63% orders to 0.35% orders. 

------------------------------------------------- 

--:TO - total_orders | PO - pipelie orders | POC - pipeline order concentration 
--:                  | FO - Failed orders | FOC - failed order concentration 

-->by product::(orders, order_items table) 
-- product_id                         TO  PO   POC 
-- "0a57f7d2c983bcf8188589a5fea4a8da" 104 18 2.89 
-- "391a014a66920fa0ce468319264e0232" 12  7  1.13 
-- "192a2c0fed2f8bed34ad458a073ed376" 6   6  0.96 
-- "46ca9515def9ceb56e338c86ca765ba1" 7   6  0.96 
-- "986700c98805af229ab7ad51b95fa356" 7   6  0.96 
-- product_id                         TO  PO FOC
-- "5c3eaf54e8ee5d5378765ff16df7640b" 6   6 0.49 
-- "8397dc503d1a0c2ac7422701884de5a6" 6   6 0.49 
-- "7d4f932dd4fa16256c20de073329eacc" 5   5 0.41 
--]32430(98.4%) products have atleast 1 successful order, 442(1.34%) products have atleast 1 failed order and
-- 539(1.6%) products have atlest 1 in-pipeline order.  

-------------------------------------------------

-->by seller::(orders, order_items table) 
 
-- seller_id                           TO PO POC 
-- "18a349e75d307f4b4cc646a691ed4216" 148 18 2.89 
-- "4342d4b2ba6b161468c63a7e7cfce593" 20 18 2.89 
-- "2eb70248d66e0e3ef83659f71b244378" 212 14 2.25
-- "c3867b4666c7d76867627c2f7fb22e21" 259 11 1.77 
-- "ce27a3cc3c8cc1ea79d11e561e9bebb6" 164 11 1.77
-- seller_id                          TO FO FOC 
-- "620c87c171fb2a6dd6e8bb4dec959fc6" 798 9 0.73 
-- "cc419e0650a3c5ba77189a1882b7556a" 1775 9 0.73 
-- "6560211a19b47992c3666cc44a7e94c0" 2033 8 0.65 
-- "8a32e327fe2c1b3511609d81aaf9f042" 180 7 0.57 
-- "0adac9fbd9a2b63cccaac4f8756c1ca8" 142 7 0.57 

--]2977(96.2%) sellers have atleast 1 successful order, 334(10.8%) sellers have atleast 1 failed order and 
-- 348(11.2%) sellers have atlest 1 in-pipeline order. 

---------------------------------------------------- 

-->by Geography::(orders, order_items, customers table) 
-- state TO PO POC 
-- "SP" 47449 362 58.20 
-- "MG" 13129 80 12.86 
-- "RJ" 14579 60 9.65
-- "RS" 6235 38 6.11 
-- "PR" 5740 33 5.31 
-- state TO FO FOC 
-- "SP" 47449 296 23.99 
-- "RJ" 14579 70 5.67 
-- "MG" 13129 58 4.70 
-- "RS" 6235 24 1.94 
-- "PR" 5740 21 1.70 
-- state city TO PO POC 
-- "SP" "sao paulo" 17808 127 20.42 
-- "RJ" "rio de janeiro" 7837 31 4.98 
-- "MG" "belo horizonte" 3144 15 2.41 
-- "SP" "sao jose dos campos" 781 15 2.41
-- "RS" "porto alegre" 1612 12 1.93
-- state city TO FO FOC
-- "SP" "sao paulo" 17808 135 10.94 
-- "RJ" "rio de janeiro" 7837 34 2.76 
-- "MG" "belo horizonte" 3144 15 1.22 
-- "SP" "guarulhos" 1329 12 0.97 
-- "SP" "campinas" 1654 11 0.89 
--]27(100%) states have atleast 1 successful order, 21(77.8%) states have atleast 1 failed order and 
-- 24(88.9%) states have atlest 1 in-pipeline order. 
--]4097(99.7%) cities have atleast 1 successful order, 201(4.9%) cities have atleast 1 failed order and 
-- 286(7%) cities have atlest 1 in-pipeline order. 
--]SP,RJ and MJ state have almost 80% of in-pipeline orders and 34% failed orders concentrated. 67% 
-- cancel order concentration happened in these 3 states.
--]Like states, their main cities sao paulo, rio de janerio and belo horizonte have concentrated 28% 
-- in-pipeline orders and 15% failed orders. 
------------------------------------------------------------------------------------------------------- 
-- 8. Business interpretation 
-- Determine: 
-- Where is cancellation or order failure concentrated, and which products, sellers, time periods, or 
-- geographic markets appear to require the most attention? 
--> cancellation or order failure is 34% concentrated in SP,RJ and MJ state, while their main cities 
-- sao paulo, rio de janerio and belo horizonte accounts for 15% concentration. 
-->over time, cancel rate can be considered relatively stable with 3 months(2017:03,2018:02,2018:08) going 
-- above 1%. 
-->in group of <10 orders, 216 products have 100% cancel rate in which, 29 products have 2 to 6 orders 
-- while other 187 products have 1 order. 
-->in group of 10 to 29, 36 products have atleast 1 cancel order while maximum cancel order is 2 
-- and cancel rate is 18.18%. 
--> in group of >=30 orders, 34 products atleast 1 cancel order while maximum cancel order is 3 and
-- cancel rate is 95.24%. 
-->in a group of <10 orders, 117 sellers have atleast 1 cancel order and maximum cancel order is 5.
-->in a group of 10 to 100 orders, 127 sellers have atleat 1 cancel order,maximum cancel order is 6, 
-- while 47 sellers have more than 5% cancel rate. 
-->in a group of >100 orders, 329 sellers have atleat 1 cancel order, maximum cancel order is 9, and 
-- maximin cancel rate is 4.93%. 
--]27(100%) states have atleast 1 successful order, 21(77.8%) states have atleast 1 failed order and 
-- 24(88.9%) states have atleast 1 in-pipeline order. 67% cancel order concentration happened in these
-- 3 states.
--]4097(99.7%) cities have atleast 1 successful order, 201(4.9%) cities have atleast 1 failed order and 
-- 286(7%) cities have atleast 1 in-pipeline order.

---------------------------------------------------------------------------------------------------------

-- 9. Business recommendation

-- Based on the evidence:

-- What should management prioritize to reduce cancellations and other unsuccessful order outcomes, and 
-- where should intervention begin?

-- >what is the grain?
-- ]overall cancellation rate : 1 row = 1 eligible order
-- ]monthly cancellation rate : 1 row = 1 month, calculated from eligible orders
-- ]product cancellation rate : 1 row = 1 product, based on orders containing that product
-- ]category cancellation rate : 1 row = 1 product category, based on orders containing products in that category
-- ]seller cancellation rate : 1 row = 1 seller, based on orders associated with that seller
-- ]geographic cancellation rate : 1 row = 1 state/city, calculated from orders
-- ]successful/failed/pipeline order rate : 1 row = 1 month, calculated from orders
-- ]product successful/failed/pipeline rate : 1 row = 1 product, based on orders containing that product
-- ]seller successful/failed/pipeline rate : 1 row = 1 seller, based on orders associated with that seller
-- ]geographic successful/failed/pipeline rate : 1 row = 1 state/city, calculated from orders

-->Executive Summary:
-- Management should treat order failure as a targeted exception problem: first identify high-impact sellers
-- generating the largest number and severity of cancellations, then address product availability and 
-- concentrated geographic failures, while using automated controls for low-volume exceptions.

-->Final Management Recommendation:
-- Do not launch a marketplace-wide cancellation reduction program; concentrate intervention on the relatively
-- small set of sellers, products, and markets largest number and severity of cancellations, while using minimum-volume
-- thresholds to avoid false alarms from tiny samples.

--==============================================================================================
--------------------------------------------------------------------------------------------------

-- Business Question 7 — Customer Satisfaction
-- Objective

-- What factors are associated with higher or lower customer satisfaction, and how do review
-- scores vary across sellers, products, delivery performance, customer types, and geographic markets?

--==============================================================================================
--------------------------------------------------------------------------------------------------
-- create view olist.overall_customer_satisfaction as 
-- select 
-- 	review_score, 
-- 	count(*) as review_count, 
-- 	round((count(*)::numeric/96353)*100,2) as review_share
-- from olist.order_reviews
-- left join olist.orders as o
-- using (order_id)
-- where order_status = 'delivered'
-- 	and order_delivered_customer_date is not null
-- group by review_score
-- order by review_score


-- with a as(select review_score, count(*), round((count(*)::numeric/96353)*100,2)
-- 	from olist.order_reviews
-- 	left join olist.orders as o
-- 	using (order_id)
-- 	where order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 	group by review_score
-- 	order by review_score)

-- select avg(review_score)
-- from olist.order_reviews
-- left join olist.orders as o
-- using (order_id)
-- where order_status = 'delivered'
-- 	and order_delivered_customer_date is not null

------------------------------------------------------------------------------------------------------

-- 1. Overall customer satisfaction

-- Find:

-- included : delivered orders 

-- total review records : 99224
-- considered review records : 96353

-- average review score : 4.16

-- distribution of scores 1–5 : 
--RS     RR      RD
-- 1	9405	9.76
-- 2	2941	3.05
-- 3	7961	8.26
-- 4	18987	19.71
-- 5	57059	59.22

-- proportion of low scores (1–3) : 21.07%

-- proportion of high scores (4–5) : 78.93%

-------------------------------------------------------------------------------------------------------
-- create view olist.seller_satisfaction as
-- with a as(
-- 	select 
-- 		r.review_id,
-- 		r.order_id,
-- 		r.review_score,
-- 		r.review_comment_title,
-- 		r.review_comment_message,
-- 		r.review_creation_date,
-- 		r.review_answer_timestamp,
-- 		s.seller_id
-- 	from olist.order_reviews as r
-- 	left join olist.orders as o
-- 	using (order_id) 
-- 	left join olist.order_items as oi
-- 	using (order_id)
-- 	left join olist.sellers as s
-- 	using (seller_id)
-- 	where order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 	group by 
-- 		r.review_id,
-- 		r.order_id,
-- 		r.review_score,
-- 		r.review_comment_title,
-- 		r.review_comment_message,
-- 		r.review_creation_date,
-- 		r.review_answer_timestamp,
-- 		s.seller_id
-- 		),
	
-- b as(
-- 	select seller_id,count(*) as nr,round(avg(review_score),2) as avg_r
-- 	from a
-- 	group by seller_id
-- 	order by nr desc
-- 	),

-- c as(select *,CONCAT(FLOOR(nr / 100) * 100, '-', (FLOOR(nr / 100) * 100) + 99) AS review_range
-- 	from b),

-- d as(select *,CONCAT(FLOOR(nr / 10) * 10, '-', (FLOOR(nr / 10) * 10) + 9) AS review_range
-- 	from b),

-- e as(select *,CONCAT(FLOOR(nr / 2) * 2, '-', (FLOOR(nr / 2) * 2) + 1) AS review_range
-- 	from b),

-- f as(
-- 	select 
-- 		*,
-- 		round((((avg_r * nr::numeric) + (4.18 * 7))/(nr::numeric + 7)),2) as weighted_rating
-- 	from b 
-- 	order by weighted_rating desc
-- 	)
	
-- select 
-- 	seller_id as seller,
-- 	weighted_rating as weighted_review_score,
-- 	nr as review_count
-- from f

-- -- select review_range, count(seller_id) as ts, round((count(seller_id)::numeric/3091)*100,2) as tsp
-- -- from e
-- -- group by review_range
-- -- order by ts desc

-- -- select count(seller_id), min(weighted_rating),max(weighted_rating) from f

-- select round((count(seller_id)::numeric/2965)*100,2)
-- from f
-- where weighted_rating <= 3.90

-- -- select * from f

-- -- select avg(avg_r),avg(nr),percentile_disc(0.5) within group (order by nr) as median, max(nr), min(nr)
-- -- from b

-------------------------------------------------------------------------------------------------------

-- 2. Satisfaction by seller

-- For each seller, determine:

-- number of reviews:
-- review_range  total_sellers total_seller_%    RR     TS    TSP        RR     TS    TSP
-- "0-99"	            2756	89.1           "0-9"	1727  55.8      "0-1"	533	17.24
-- "100-199"	        123	    3.98           "10-19"	437	  14.1      "2-3"	514	16.63
-- "200-299"	        31	    1.00           "20-29"	175	  5.66      "4-5"	296	9.58
-- "300-399"	        25	    0.81           "30-39"	120	  3.88      "6-7"	208	6.73
-- "400-499"	        6	    0.19           "40-49"	86	  2.78      "8-9"	176	5.69
-- "500-599"	        6	    0.19           "60-69"	63	  2.04      "10-11"	134	4.34
-- "900-999"	        3	    0.10           "50-59"	56	  1.81      "12-13"	92	2.98
-- "700-799"	        3	    0.10           "80-89"	34	  1.10      "14-15"	78	2.52
-- "1100-1199"	        3	    0.10           "70-79"	30	  0.97      "16-17"	72	2.33
-- "600-699"	        2	    0.06           "90-99"	28	  0.91      "18-19"	61	1.97
-- "1300-1399"	        2	    0.06
-- "1700-1799"	        1	    0.03
-- "1800-1899"	        1	    0.03
-- "1600-1699"	        1	    0.03
-- "1000-1099"	        1	    0.03
-- "1200-1299"	        1	    0.03

--------------------------------------------------------

-- NR : number of reviews
-- AR : average rating
-- WR : weighted rating

-- average review score

--            seller_id                 NR   AR     WR
-- "48efc9d94a9834137efd9ea76b065a38"	33	5.00	4.86
-- "d13e50eaa47b4cbe9eb81465865d8cfc"	66	4.82	4.76
-- "41c2bad7229b0c25e6becf179ebf63ff"	20	4.95	4.75
-- "b1fecf4da1fa2689bccffa0121953643"	19	4.95	4.74
-- "d9bd94811c3338dceb4181f3dbc0c73e"	54	4.80	4.73
-- "83e197e95a1bbabc8c75e883ed016c47"	46	4.80	4.72
-- "b410bdd36d5db7a65dcd42b7ead933b8"	42	4.81	4.72
-- "02f5837340d7eb4f653d676c7256523a"	30	4.83	4.71
-- "2addf05f476d0637864454e93ba673d5"	12	5.00	4.70
-- "5a93f3ab0ef4c84ed5e1b5dbf23978bc"	38	4.79	4.70
--            seller_id                 NR   AR     WR
-- "1ca7077d890b907f89be8c954a02686a"	107	2.39	2.50
-- "b1b3948701c5c72445495bd161b83a4c"	14	1.93	2.68
-- "2eb70248d66e0e3ef83659f71b244378"	185	2.79	2.84
-- "5bc55dbe2f12b6af6d83ed46023e0dc8"	17	2.41	2.93
-- "973f21788dfab357250f69a8dcb7ddee"	9	2.11	3.02
-- "30c7f28fd3a5897b2c82d152bb760c17"	5	1.40	3.02
-- "40db9e9aa57f7bb151bcda6b0f9bdbb7"	11	2.36	3.07
-- "5151aea44289d6c6b090ee31c2132508"	6	1.83	3.10
-- "a49928bcdf77c55c6d6e05e09a9b4ca5"	96	3.03	3.11
-- "972d0f9cf61b499a4812cf0bfa3ad3c4"	79	3.03	3.12

-----------------------------------

-- proportion of low/high scores
-- >3.90 wr : 87.42% sellers
-- <=3.90 wr : 12.58% sellers

------------------------------------------------------------------------------------------------------------

-- with a as(
-- 	select 
-- 		r.review_id,
-- 		r.order_id,
-- 		r.review_score,
-- 		r.review_comment_title,
-- 		r.review_comment_message,
-- 		r.review_creation_date,
-- 		r.review_answer_timestamp,
-- 		p.product_id
-- 	from olist.order_reviews as r
-- 	left join olist.orders as o
-- 	using (order_id) 
-- 	left join olist.order_items as oi
-- 	using (order_id)
-- 	left join olist.products as p
-- 	using (product_id)
-- 	where order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 	group by 
-- 		r.review_id,
-- 		r.order_id,
-- 		r.review_score,
-- 		r.review_comment_title,
-- 		r.review_comment_message,
-- 		r.review_creation_date,
-- 		r.review_answer_timestamp,
-- 		p.product_id
-- 		),
	
-- b as(
-- 	select product_id,count(*) as nr,round(avg(review_score),2) as avg_r
-- 	from a
-- 	group by product_id
-- 	order by nr desc
-- 	),

-- c as(select *,CONCAT(FLOOR(nr / 50) * 50, '-', (FLOOR(nr / 50) * 50) + 49) AS review_range
-- 	from b),

-- d as(select *,CONCAT(FLOOR(nr / 10) * 10, '-', (FLOOR(nr / 10) * 10) + 9) AS review_range
-- 	from b),

-- e as(select *,CONCAT(FLOOR(nr / 2) * 2, '-', (FLOOR(nr / 2) * 2) + 1) AS review_range
-- 	from b),

-- f as(
-- 	select 
-- 		*,
-- 		round((((avg_r * nr::numeric) + (4.13 * 3.12))/(nr::numeric + 3.12)),2) as weighted_rating
-- 	from b 
-- 	order by weighted_rating
-- 	)
	
-- -- -- select distinct product_id from b

-- -- -- select review_range, count(product_id) as tp, round((count(product_id)::numeric/32070)*100,3) as tpp
-- -- -- from e                       
-- -- -- group by review_range
-- -- -- order by tp desc

-- -- select count(product_id),min(weighted_rating),max(weighted_rating) from f

-- select round((count(product_id)::numeric/32070)*100,2)
-- from f
-- where weighted_rating <= 3.90

-- -- select avg(avg_r), avg(nr), percentile_cont(0.5) within group (order by nr), max(nr), min(nr)
-- -- from b

-- -- select * from f

----------------------------------------------------------------------------------------------------------

-- 3. Satisfaction by product

--RR : review range \ TP : total products \ TPP : total product %
--NR : number of reviews \ AR : average rating \ WR : weighted rating

-- For each product, determine:

-- number of reviews
-- review_range  total_product total_product_%    RR     TP      TPP        RR     TP    TPP
-- "0-49"	      31925	         99.54          "0-9"	 30426	94.87     "0-1"	  18935	59.043         
-- "50-99"	      94	         0.293          "10-19"	 1039	3.240     "2-3"	  7696	23.998
-- "100-149"	  30	         0.094          "20-29"	 274	0.854     "4-5"	  2205	6.876
-- "150-199"	  9	             0.028          "30-39"	 112    0.349     "6-7"	  1031	3.215
-- "250-299"	  5	             0.016          "40-49"	 74	    0.231     "8-9"	  559	1.743
-- "300-349"	  3	             0.009          "50-59"	 36	    0.112     "10-11" 389	1.213
-- "400-449"	  1	             0.003          "60-69"	 21	    0.065     "12-13" 242	0.755
-- "450-499"	  1	             0.003          "70-79"	 14	    0.044     "14-15" 181	0.564
-- "200-249"	  1  	         0.003          "80-89"	 14	    0.044     "16-17" 123	0.384
-- "350-399"	  1	             0.003          "110-119"10	    0.031     "18-19" 104	0.324

---------------------------------------

-- average review score
--            product_id                 NR   AR     WR
-- "3e4176d545618ed02f382a3057de32b4"	24	4.96	4.86
-- "2722b7e5f68e776d18fe901638034e54"	12	5.00	4.82
-- "4c8b28305f570899b6ded964ddd234a9"	11	5.00	4.81
-- "8b6ed41158b194711f83b8da92757544"	11	5.00	4.81
-- "73326828aa5efe1ba096223de496f596"	52	4.85	4.81
-- "62c89abe1afe3a23c17765d462718a4c"	16	4.94	4.81
-- "8173ca41cdb176462f9ae79821a48404"	11	5.00	4.81
-- "59c1840441f4df065f52760bf51a8442"	11	5.00	4.81
-- "f8b624d4e475bb8d1bddf1b65c6a64f6"	40	4.85	4.80
-- "83aae8023b8feda53259f63e0ec06390"	10	5.00	4.79

--            product_id                 NR   AR     WR
-- "cd46a885543f0e169a49f1eb25c04e43"	28	1.61	1.86
-- "fb29f48bfea41db52e349454f433340e"	8	1.00	1.88
-- "fd0065af7f09af4b82a0ca8f3eed1852"	10	1.20	1.90
-- "c230b471b7e21ff9060e68ee154afd70"	9	1.22	1.97
-- "b1d207586fca400a2370d50a9ba1da98"	42	2.02	2.17
-- "6d2fde7d12bb6ff367dbda120ba8828e"	12	1.67	2.18
-- "b36f3c918c91478c4559160022d3f14e"	14	1.79	2.22
-- "e6b314a2236c162ede1a879f1075430f"	9	1.67	2.30
-- "ad4b5def91ac7c575dbdf65b5be311f4"	9	1.67	2.30
-- "17d8b8e9c21ec0fc5b33724e32fe422e"	5	1.20	2.33


----------------------------------

-- low/high score proportion
-- >3.90 wr : 75.48% products
-- <=3.90 wr : 24.52% products

-----------------------------------------------------------------------------------------------------------



-- CREATE VIEW olist.product_category_satisfaction AS
-- WITH review_category AS (
--     SELECT DISTINCT
--         r.review_id,
--         COALESCE(
--             pct.product_category_name_english,
--             p.product_category_name
--         ) AS product_category,
--         r.review_score
--     FROM olist.order_reviews AS r
--     JOIN olist.orders AS o
--         ON r.order_id = o.order_id
--     JOIN olist.order_items AS oi
--         ON o.order_id = oi.order_id
--     JOIN olist.products AS p
--         ON oi.product_id = p.product_id
--     LEFT JOIN olist.product_category_name_translation AS pct
--         ON p.product_category_name = pct.product_category_name
--     WHERE o.order_status = 'delivered'
--       AND o.order_delivered_customer_date IS NOT NULL
-- )

-- SELECT
--     product_category AS "Product Category",
--     COUNT(*) AS "Review Count",
--     ROUND(AVG(review_score), 2) AS "Average Review Score",
--     ROUND(
--         COUNT(*) FILTER (
--             WHERE review_score IN (1, 2, 3)
--         )::numeric / COUNT(*) * 100,
--         2
--     ) AS "Low Score Share (%)"
-- FROM review_category
-- GROUP BY product_category
-- ORDER BY "Average Review Score" ASC;

-- with a as(
-- 	select 
-- 		r.review_id,
-- 		r.order_id,
-- 		r.review_score,
-- 		r.review_comment_title,
-- 		r.review_comment_message,
-- 		r.review_creation_date,
-- 		r.review_answer_timestamp,
-- 		t.product_category_name_english
-- 	from olist.order_reviews as r
-- 	left join olist.orders as o
-- 	using (order_id) 
-- 	left join olist.order_items as oi
-- 	using (order_id)
-- 	left join olist.products as p
-- 	using (product_id)
-- 	left join olist.product_category_name_translation as t
-- 	using (product_category_name)
-- 	where order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 	group by 
-- 		r.review_id,
-- 		r.order_id,
-- 		r.review_score,
-- 		r.review_comment_title,
-- 		r.review_comment_message,
-- 		r.review_creation_date,
-- 		r.review_answer_timestamp,
-- 	    t.product_category_name_english
-- 		),
	
-- b as(
-- 	select product_category_name_english,count(*) as nr,round(avg(review_score),2) as avg_r
-- 	from a
-- 	group by product_category_name_english
-- 	order by nr desc
-- 	),

-- z as(
-- 	select product_category_name_english,count(*) as lnr
-- 	from a
-- 	where review_score in (1,2,3)
-- 	group by product_category_name_english
-- 	),

-- x as(
-- 	select 
-- 		product_category_name_english,
-- 		nr,lnr
-- 		avg_r
-- 	from b
-- 	left join x
-- 	using (product_category_name_english)
-- ),

-- c as(select *,CONCAT(FLOOR(nr / 1000) * 1000, '-', (FLOOR(nr / 1000) * 1000) + 999) AS review_range
-- 	from x),

-- d as(select *,CONCAT(FLOOR(nr / 100) * 100, '-', (FLOOR(nr / 100) * 100) + 99) AS review_range
-- 	from x),

-- e as(select *,CONCAT(FLOOR(nr / 10) * 10, '-', (FLOOR(nr / 10) * 10) + 9) AS review_range
-- 	from x),

-- f as(
-- 	select 
-- 		*,
-- 		round((((avg_r * nr::numeric) + (4.05 * 242))/(nr::numeric + 242)),2) as weighted_rating
-- 	from x 
-- 	order by weighted_rating 
-- 	)

-- select 
-- 	product_category_name_english as product_category,
-- 	nr as review_count,
-- 	avg_r as average_review_score,
-- 	round((lnr::numeric/nr::numeric)*100,2) as low_score_share
-- from f

-- -- select distinct product_category_name_english from b

-- -- select 
-- -- 	review_range, 
-- -- 	count(product_category_name_english) as tp, 
-- -- 	round((count(product_category_name_english)::numeric/73)*100,3) as tpp
-- -- from e
-- -- group by review_range
-- -- order by tp desc

-- -- select min(weighted_rating),max(weighted_rating) from f

-- select round((count(product_category_name_english)::numeric/73)*100,2)
-- from f
-- where avg_r > 3.90

-- -- select avg(avg_r), avg(nr), percentile_disc(0.5) within group (order by nr), max(nr), min(nr)
-- -- from b

-- -- select * from f

----------------------------------------------------------------------------------------------------------

-- 4. Satisfaction by category

--RR : review range \ NC : number of category \ NC% : number of category in % 
--NR : number of reviews \ AR : average rating \ WR : weighted rating

-- Determine:

-- review count
--   RR         NC   NC%         RR         NC   NC%          RR        NC   NC%
-- "0-999"	    52	71.23      "0-99"	    22	30.13        "20-29"	5	6.849
-- "3000-3999"	5	6.849      "200-299"	11	15.06        "30-39"	4	5.479
-- "1000-1999"	5	6.849      "100-199"	9	12.32        "0-9"	    3	4.110
-- "2000-2999"	3	4.110      "400-499"	4	5.479        "230-239"	3	4.110
-- "6000-6999"	2	2.740      "1000-1099"	2	2.740        "10-19"	3	4.110
-- "5000-5999"	2	2.740      "300-399"	2	2.740        "50-59"	2	2.740
-- "9000-9999"	1	1.370      "700-799"	2	2.740        "70-79"	2	2.740
-- "7000-7999"	1	1.370      "600-699"	2	2.740        "220-229"	2	2.740
-- "8000-8999"	1	1.370      "3700-3799"	1	1.370        "170-179"	2	2.740
-- "4000-4999"	1	1.370      "7500-7599"	1	1.370        "90-99"	2	2.740

----------------------------------------

-- average review score
--         category             NR      AR       WR
-- "books_general_interest"	     491	4.53	4.37
-- "luggage_accessories"	    1015	4.37	4.31
-- "stationery"	                2258	4.29	4.27
-- "books_technical"	         257	4.43	4.25
-- "pet_shop"	                1682	4.27	4.24
-- "food_drink"	                 223	4.45	4.24
-- "perfumery"	                3090	4.26	4.24
-- "health_beauty"	            8654	4.23	4.23
-- "toys"	                    3781	4.24	4.23

--         category             NR      AR       WR
-- "office_furniture"	        1249	3.64	3.71
-- "audio"	                     346	3.83	3.92
-- "home_confort"	             393	3.88	3.94
-- "fashion_male_clothing"	     105	3.82	3.98
-- "bed_bath_table"	            9295	4.00	4.00
-- "fixed_telephony"	         210	3.97	4.01
-- "home_construction"	         482	3.99	4.01
-- "construction_tools_safety"	 158	3.97	4.02
-- "home_comfort_2"	              23	3.83	4.03
-- "gaming pc"	                   7	3.43	4.03

----------------------------------------

-- low/high score proportion
-- >3.90 ar : 87.67% products
-- <=3.90 ar : 12.33% products

---------------------------------------------------------------------------------------------------------

-- CREATE VIEW olist.delivery_satisfaction AS
-- SELECT
--     CASE
--         WHEN o.order_delivered_customer_date
--              > o.order_estimated_delivery_date
--             THEN 'Late'
--         ELSE 'On-Time / Early'
--     END AS "Delivery Performance",
--     COUNT(DISTINCT o.order_id) AS "Delivered Orders",
--     COUNT(DISTINCT r.order_id) AS "Reviewed Orders",
--     ROUND(AVG(r.review_score), 2) AS "Average Review Score"

-- FROM olist.orders AS o
-- LEFT JOIN olist.order_reviews AS r
--     ON o.order_id = r.order_id
-- WHERE o.order_status = 'delivered'
--   AND o.order_delivered_customer_date IS NOT NULL
--   AND o.order_estimated_delivery_date IS NOT NULL
-- GROUP BY
--     CASE
--         WHEN o.order_delivered_customer_date
--              > o.order_estimated_delivery_date
--             THEN 'Late'
--         ELSE 'On-Time / Early'
--     END
-- ORDER BY
--     "Delivery Performance";


-- with a as(
-- 	select *,
-- 	case
-- 		when (order_estimated_delivery_date - order_delivered_customer_date)::text like '-%' then 'late'
-- 		when (order_estimated_delivery_date - order_delivered_customer_date)::text not like '-%' then 'on-time'
-- 	end as delivery_performance
-- 	from olist.orders as o
-- 	left join olist.order_reviews as r
-- 	using (order_id)
-- 	where order_status = 'delivered'
-- 		and order_delivered_customer_date is not null 
-- 	)

-- select 
-- 	delivery_performance,
-- 	count(distinct order_id) as delivered_orders,
-- 	count(review_score) as reviewed_orders,
-- 	avg(review_score) as average_review_score
-- from a
-- group by delivery_performance


-- select avg(review_score)
-- from a

---------------------------------------------------------------------------------------------------------

-- 5. Satisfaction by delivery performance

-- Compare review outcomes between:

-- late deliveries : 2.57
-- on-time/early deliveries : 4.29

--------------------------------------------------------------------------------------------------------
-- create view olist.customer_type_satisfaction as
-- WITH customer_type AS (
--     SELECT
--         c.customer_unique_id,
--         CASE
--             WHEN COUNT(DISTINCT o.order_id) = 1 THEN 'one-time'
--             WHEN COUNT(DISTINCT o.order_id) > 1 THEN 'repeat'
--         END AS customer_type
--     FROM olist.orders AS o
--     JOIN olist.customers AS c
--         ON o.customer_id = c.customer_id
--     WHERE o.order_status = 'delivered'
--       AND o.order_delivered_customer_date IS NOT NULL
--     GROUP BY c.customer_unique_id
-- ),

-- customer_reviews AS (
--     SELECT
--         ct.customer_type,
--         r.review_score
--     FROM olist.order_reviews AS r
--     JOIN olist.orders AS o
--         ON r.order_id = o.order_id
--     JOIN olist.customers AS c
--         ON o.customer_id = c.customer_id
--     JOIN customer_type AS ct
--         ON c.customer_unique_id = ct.customer_unique_id
--     WHERE o.order_status = 'delivered'
--       AND o.order_delivered_customer_date IS NOT NULL
-- )

-- SELECT
--     customer_type AS "Customer Type",
--     COUNT(*) AS "Review Count",
--     ROUND(AVG(review_score), 2) AS "Average Review Score",
--     ROUND(
--         COUNT(*) FILTER (WHERE review_score IN (1, 2, 3))::numeric
--         / COUNT(*) * 100,
--         2
--     ) AS "Low Score Share (%)"
-- FROM customer_reviews
-- GROUP BY customer_type
-- ORDER BY customer_type;

-- with a as(
-- 	select 
-- 		customer_unique_id, 
-- 		count(review_score), 
-- 		round(avg(review_score),0) as ar
-- 	from olist.order_reviews as r
-- 	left join olist.orders as o
-- 	using (order_id)
-- 	left join olist.customers as c
-- 	using (customer_id)
-- 	where order_status = 'delivered'
-- 		and order_delivered_customer_date is not null
-- 	group by customer_unique_id
-- 	having count(*) > 1)

-- select avg(ar)
-- from a

-- select round(ar,0) as av, count(customer_unique_id), round((count(customer_unique_id)::numeric/2854)*100,2)
-- from a
-- group by ar
-- order by av

------------------------------------------------------------------------------------------------------

-- 6. Satisfaction by customer type

--UC : unique customers / UCD : unique customer distribution

-- one-time customers::

-- average review score : 4.15

-- score distribution :
--score  UC     UCD
-- 1	8809	9.80
-- 2	2752	3.06
-- 3	7437	8.27
-- 4	17846	19.85
-- 5	53049	59.01

-- high/low score proportion
-- low(1,2,3) : 21.14%
-- high(4,5)  : 78.86%

-- repeat customers:: 

-- average review score : 4.30

-- score distribution :
--score  UC     UCD
-- 1	108	   3.78
-- 2	103	   3.61
-- 3	351	   12.30
-- 4	566	   19.83
-- 5	1726   60.48

-- high/low score proportion
-- low(1,2,3) : 19.69%
-- high(4,5)  : 80.31%

--------------------------------------------------------------------------------------------------------

-- DROP VIEW IF EXISTS olist.customer_geography_satisfaction;

-- CREATE VIEW olist.customer_geography_satisfaction AS
-- WITH geography_reviews AS (
--     SELECT
--         c.customer_state AS state,
--         c.customer_city AS city,
--         r.review_id,
--         r.review_score
--     FROM olist.order_reviews AS r
--     JOIN olist.orders AS o
--         ON r.order_id = o.order_id
--     JOIN olist.customers AS c
--         ON o.customer_id = c.customer_id
--     WHERE o.order_status = 'delivered'
--       AND o.order_delivered_customer_date IS NOT NULL
-- ),

-- geography_scores AS (
--     SELECT
--         state,
--         city,
--         COUNT(*) AS review_count,
--         AVG(review_score) AS average_review_score,

--         (
--             AVG(review_score) * COUNT(*)
--             + 4.19 * 22
--         )
--         /
--         (
--             COUNT(*) + 22
--         ) AS weighted_review_score,

--         COUNT(*) FILTER (
--             WHERE review_score IN (1, 2, 3)
--         )::numeric
--         / COUNT(*) * 100 AS low_score_share
--     FROM geography_reviews
--     GROUP BY
--         state,
--         city
-- )

-- SELECT
--     state AS "State",
--     city AS "City",
--     review_count AS "Review Count",
--     ROUND(average_review_score, 2) AS "Average Review Score",
--     ROUND(weighted_review_score, 2) AS "Weighted Review Score",
--     ROUND(low_score_share, 2) AS "Low Score Share (%)"
-- FROM geography_scores
-- ORDER BY
--     "State",
--     "City";


-- with a as(
-- 	select *
-- 	from olist.order_reviews as r
-- 	left join olist.orders as o
-- 	using(order_id)
-- 	left join olist.customers as c
-- 	using(customer_id)
--     where order_status = 'delivered'
--     	and order_delivered_customer_date is not null
-- 	),

-- b as(select customer_state,customer_city, count(review_score) as nr, round(avg(review_score),2) as ar
-- 	from a
-- 	group by customer_state,customer_city
-- 	order by ar desc),

-- c as(
-- 	select 
-- 		*,
-- 		round((((ar * nr::numeric) + (4.19 * 22))/(nr::numeric + 22)),2) as weighted_rating
-- 	from b 
-- 	order by weighted_rating 
-- 	)
	
-- select * from c

-- select avg(ar),avg(nr),percentile_disc(0.5) within group (order by nr), min(nr), max(nr) from b 

---------------------------------------------------------------------------------------------------------

-- 7. Satisfaction by geography

--NR : number of reviews \ AR : average rating \ WR : weighted rating

--state      NR     AR
-- "SP"	    40477	4.25
-- "PR"	    4919	4.24
-- "AP"	    66	    4.24
-- "AM"	    145	    4.22
-- "RS"	    5363	4.19
-- "MG"	    11354	4.19
-- "MS"	    710	    4.17
-- "RO"	    242	    4.17
-- "TO"	    273	    4.15
-- "MT"	    882	    4.15
-- "RN"	    473	    4.15
-- "SC"	    3533	4.13
-- "DF"	    2089	4.13
-- "GO"	    1963	4.10
-- "AC"	    80	    4.09
-- "PE"	    1590	4.09
-- "PB"	    513	    4.08
-- "ES"	    1978	4.08
-- "PI"	    472	    4.00
-- "RJ"	    12281	3.96
-- "CE"	    1276	3.94
-- "BA"	    3246	3.93
-- "SE"	    334	    3.91
-- "PA"	    939	    3.91
-- "RR"	    41	    3.90
-- "MA"	    716	    3.84
-- "AL"	    398	    3.84

--state       city                  NR   AR      WR
-- "RS"	"santiago"	                26	4.88	4.56
-- "SP"	"santa cruz do rio pardo"	34	4.79	4.55
-- "ES"	"nova venecia"	            18	4.89	4.51
-- "SP"	"santo antonio de posse"	20	4.85	4.50
-- "RS"	"marau"	                    24	4.79	4.50
-- "SP"	"monte alto"	            32	4.69	4.49
-- "SP"	"votuporanga"	            63	4.60	4.49
-- "SP"	"assis"	                    84	4.55	4.48
-- "MG"	"uberaba"	               188	4.51	4.48
-- "SP"	"porto feliz"	           21	4.76	4.47

--state       city                  NR   AR      WR
-- "RJ"	"iguaba grande"	            19	2.58	3.44
-- "PA"	"santarem"	                43	3.07	3.45
-- "BA"	"camacari"	                59	3.32	3.56
-- "BA"	"porto seguro"	            39	3.36	3.66
-- "RJ"	"pirai"	                    15	2.93	3.68
-- "RJ"	"macae"	                   227	3.71	3.75
-- "AL"	"maceio"	               235	3.72	3.76
-- "RJ"	"mesquita"	               72	3.64	3.77
-- "RJ"	"sao goncalo"	           381	3.75	3.77
-- "SP"	"itupeva"	                42	3.57	3.78

-------------------------------------------------------------------------------------------------------

-- create view olist.review_commets_evidence as
-- with a as(
-- 	select
-- 		review_id,
		
-- 		order_id,
		
-- 		review_score,
	
-- 		review_comment_message,
		
-- 		(review_comment_message ilike any(array['%atraso%', '%atrasado%', '%demorou%', '%não chegou%', '%nunca chegou%',
-- 		'%perdido%', '%extraviado%', '%transportadora%', '%correio%', '%ctt%', '%morada incorreta%', 
-- 		'%entrega falhada%', '%retido na alfândega%', '%alfândega%', '%sem rastreio%', '%tracking inválido%',
-- 		'%reagendado%', '%prazo ultrapassado%', '%demora na entrega%', '%não recebi%'])) as delivery_issue,
		
-- 			(review_comment_message ilike any(array['%partido%', '%danificado%', '%estragado%', '%partida%', 
-- 		'%danificada%', '%estragada%', '%partidos%', '%danificados%', '%estragados%', '%partidas%', 
-- 		'%danificadas%', '%estragadas%', '%partiu%', '%partiram%', '%quebrado%', '%quebrada%', '%rachado%',
-- 		'%vazou%', '%vazamento%', '%amassado%', '%amassada%', '%riscado%', '%risco%', '%defeito%', 
-- 		'%defeito de fabrico%', '%com defeito%', '%avariado%', '%avariada%', '%inutilizável%', '%partiu-se%',
-- 		'%partiram-se%'])) as damaged_products,
		
-- 		( review_comment_message ilike any(array['%incompleto%', '%falta%', '%faltam%', '%faltou%', '%em falta%', 
-- 		'%em falta peças%', '%peças em falta%', '%peça em falta%', '%não veio%', '%não vieram%', '%caixa vazia%',
-- 		'%veio vazio%', '%veio vazia%', '%por metade%', '%encomenda incompleta%', '%faltava%', '%faltavam%',
-- 		'%esqueceram-se%', '%esqueceram%'])) as missing_items,
	
-- 		( review_comment_message ilike any(array['%errado%', '%errada%', '%errados%', '%erradas%', '%incorreto%',
-- 		'%incorreta%', '%incorretos%', '%incorretas%', '%tamanho errado%', '%cor errada%', '%modelo errado%',
-- 		'%trocado%', '%trocada%', '%trocados%', '%trocadas%', '%diferente%', '%diferentes%', '%não corresponde%',
-- 		'%enganaram-se%', '%outro modelo%', '%outra cor%', '%outro tamanho%', '%produto errado%', '%artigo errado%'])
-- 		) as incorrect_products,
		
-- 		 (review_comment_message ilike any(array['%pessimo atendimento%', '%pessimo serviço%', '%mau atendimento%', 
-- 		'%mau serviço%', '%suporte horrivel%', '%não respondem%', '%sem resposta%', '%vendedor antipatico%', 
-- 		'%vendedor rude%', '%burla%', '%burlado%', '%burlada%', '%fraude%', '%engano%', '%enganado%', '%enganada%',
-- 		'%atendimento ao cliente%', '%apoio ao cliente%', '%ignoraram%', '%ignorou%', '%má fé%', 
-- 		'%recusa reembolso%', '%sem reembolso%', '%devolução recusada%'])) as seller_service_issues
	
-- 	from olist.order_reviews
-- 	where review_comment_message is not null)

-- select
-- 	case when count(delivery_issue) > 1 then 'delivery issue' end as issue_theme,
-- 	count(delivery_issue) as review_count, round((count(delivery_issue)::numeric/40977)*100,2) as review_share
-- from a
-- where delivery_issue = true
-- group by delivery_issue
-- union all
-- select
-- 	case when count(damaged_products) > 1 then 'damaged products' end as issue_theme,
-- 	count(damaged_products) as review_count, round((count(damaged_products)::numeric/40977)*100,2) as review_share
-- from a
-- where damaged_products = true
-- group by damaged_products
-- union all
-- select 
-- 	case when count(missing_items) > 1 then 'missing items' end as issue_theme,
-- 	count(missing_items) as review_count, round((count(missing_items)::numeric/40977)*100,2) as review_share
-- from a
-- where missing_items = true
-- group by missing_items
-- union all
-- select 
-- 	case when count(incorrect_products) > 1 then 'incorrect products' end as issue_theme,
-- 	count(incorrect_products) as review_count, round((count(incorrect_products)::numeric/40977)*100,2) as review_share
-- from a
-- where incorrect_products = true
-- group by incorrect_products
-- union all
-- select 
-- 	case when count(seller_service_issues) > 1 then 'seller service issues' end as issue_theme,
-- 	count(seller_service_issues) as review_count, round((count(seller_service_issues)::numeric/40977)*100,2) as review_share
-- from a
-- where seller_service_issues = true
-- group by seller_service_issues

-- select incorrect_products, count(incorrect_products),round((count(incorrect_products)::numeric/40977)*100,2)
-- from a
-- group by incorrect_products

-- select seller_service_issues, count(seller_service_issues),round((count(seller_service_issues)::numeric/40977)*100,2)
-- from a
-- group by seller_service_issues
	
--------------------------------------------------------------------------------------------------------

-- 8. Review comments / qualitative evidence

-- Where useful, examine low-score comments to identify recurring themes such as:
-- keyword-based classifications::::
-- problem : number of reviews containing that problem - % of those reviews in review record
-- delivery problems : 3980	- 9.71%
-- damaged products : 1028 - 2.51%
-- missing items : 1261 - 3.08%
-- incorrect products : 1146 -	2.80%
-- seller/service issues : 173 - 0.42%

-----------------------------------------------------------------------------------------------------------

-- 9. Business interpretation

-- Determine:

-->>>Which factors appear most strongly associated with customer dissatisfaction, and which sellers,
-- products, delivery conditions, customer groups, or geographic markets require attention?

-->Customer dissatisfaction is most strongly associated with late delivery, while dissatisfaction
-- also clusters around a smaller set of low-rated sellers, products, categories, and geographic markets.
-->Delivery performance
-- Late-delivery orders average 2.57/5, versus 4.29/5 for on-time/early orders.
-- This is the strongest association in the available analysis. Late delivery is strongly associated with 
-- lower customer satisfaction, although the data does not prove that lateness alone caused the lower rating.
-->Seller performance
-- 12.07% of sellers have weighted ratings ≤3.90. Several sellers have very low weighted ratings, including 
-- sellers at 2.50, 2.68, 2.84 and 2.93.
-- A minority of sellers create disproportionate customer-experience risk. They require targeted investigation
-- rather than marketplace-wide intervention.
-->Product performance
-- 23.98% of products have weighted ratings ≤3.90. Several products have weighted ratings around 1.86–2.33.
-- Product quality or product-expectation issues appear to be associated with a meaningful subset of the 
-- catalog. Low-rated products should be investigated alongside their sellers and order outcomes.
-->Category performance
-- Office furniture has 3.64 average rating; audio 3.83; home_confort 3.88. In contrast, books_general_interest
-- has 4.53.Dissatisfaction is uneven across categories. Office furniture is the clearest high-volume category
-- requiring attention because it has 1,249 reviews as well as a low average rating.
-->Customer type
-- One-time customers average 4.15; repeat customers 4.30. Low-score share is 21.14% for one-time customers 
-- versus 19.69% for repeat customers.Repeat customers are somewhat more satisfied, but the difference is 
-- relatively modest. Customer type is a weaker signal than delivery performance.
-->Geography
-- State ratings range from 4.25 in SP to 3.84 in MA and AL. RJ = 3.96, CE = 3.94, BA = 3.93.Customer 
-- experience varies geographically. MA, AL, RJ, CE and BA warrant further investigation, especially 
-- where low ratings overlap with delivery problems.
-->Overall satisfaction baseline
-- Average review score = 4.16; 21.07% of reviews are scores 1–3 and 78.93% are 4–5.Overall satisfaction 
-- is relatively strong, but roughly one in five reviews is still a low score, leaving a material pool of 
-- dissatisfied customers to address.

-----------------------------------------------------------------------------------------------------------

-- 10. Business recommendation

-- Based on the evidence:

-- What should management prioritize to improve customer satisfaction, and where should intervention begin?

--> What did i measure? 
-- ]overall number of reviews
-- ]overall average review score
-- ]overall proportion of high/low scores
-- ]number of reviews by seller
-- ]weighted review score by seller
-- ]proportion of high/low scores by seller
-- ]number of reviews by product
-- ]weighted review score by product
-- ]proportion of high/low scores by product
-- ]number of reviews by category
-- ]average review score by category
-- ]proportion of high/low scores by category
-- ]average review score by delivery performance(on-time/late)
-- ]average review score by customer type
-- ]rating distribution by customer type
-- ]proportion of high/low scores by customer type
-- ]average review score by state
-- ]weighted review score by city
-- ]proportion of comments regarding type of customer issues

--> What data qualifies? 

-- included : order_status = 'delivered'
--  {  ]overall number of reviews (table : order_reviews, orders)
-- 	]overall average review score (table : order_reviews, orders)
-- 	]overall proportion of high/low scores (table : order_reviews, orders)
-- 	]number of reviews by seller (table : order_reviews, orders, order_items, sellers)
-- 	]weighted review score by seller (table : order_reviews, orders, order_items, sellers)
-- 	]proportion of high/low scores by seller (table : order_reviews, orders, order_items, sellers)
-- 	]number of reviews by product (table : order_reviews, orders, order_items, products)
-- 	]weighted review score by product (table : order_reviews, orders, order_items, products)
-- 	]proportion of high/low scores by product (table : order_reviews, orders, order_items, products)
-- 	]number of reviews by category (table : order_reviews, orders, order_items, products, product_category_name_translation)
-- 	]average review score by category (table : order_reviews, orders, order_items, products, product_category_name_translation)
-- 	]proportion of high/low scores by category (table : order_reviews, orders, order_items, products, product_category_name_translation)
-- 	]average review score by delivery performance(on-time/late) (table : order_reviews, orders)
-- 	]average review score by customer type (table : order_reviews, orders, customers)
-- 	]rating distribution by customer type (table : order_reviews, orders, customers)
-- 	]proportion of high/low scores by customer type (table : order_reviews, orders, customers)
-- 	]average review score by state (table : order_reviews, orders, customers)
-- 	]weighted review score by city (table : order_reviews, orders, customers)
-- 					}

-- included : proportion of comments regarding type of customer issues 
-- 			(table : order_reviews)


--> What is the grain? 
-- ]overall number of reviews :  reviews
-- ]overall average review score :  reviews
-- ]overall proportion of high/low scores :  reviews
-- ]number of reviews by seller : seller
-- ]weighted review score by seller : seller
-- ]proportion of high/low scores by seller : seller
-- ]number of reviews by product : product
-- ]weighted review score by product : product
-- ]proportion of high/low scores by product : product
-- ]number of reviews by category : category
-- ]average review score by category : category
-- ]proportion of high/low scores by category : category
-- ]average review score by delivery performance(on-time/late) : delivery-group
-- ]average review score by customer type : customer-group
-- ]rating distribution by customer type : customer-group
-- ]proportion of high/low scores by customer type : customer-group
-- ]average review score by state : state
-- ]weighted review score by city : city
-- ]proportion of comments regarding type of customer issues : customer-issue-group

--> Why this method? 
-- ]Bayesian Average(weighted rating) :
-- }why : when measuring average review score, there were number of products,sellers and cities
--  containing too little size of reviews to get accurate average rating, if considered they could possibly
--  distort analysis by buring products,sellers, city with decent size reviews. 
-- }what : A Bayesian average is a mathematical method used to calculate a fairer average score by factoring
--  in a "prior belief"—which usually defaults to the average of the entire platform or catalog. As the number
--  of real reviews grows much larger than the threshold , the mathematical weight of the platform 
--  average fades away, and the score naturally shifts to the item's true performance.

--> Final management recommendation
-- First address delivery reliability because it has the largest observed rating gap; then target
-- persistently low-rated sellers/products using review-volume-adjusted ratings; finally investigate 
-- geographic clusters where poor satisfaction overlaps with operational problems.

----------------------------------------------------------------------------------------------------------
--==============================================================================================
--------------------------------------------------------------------------------------------------
--*************************** TOP 7 FINDINGS *************************************
--==============================================================================================

-- 1. Revenue concentration → Protect the revenue core

-- Finding: Revenue is highly concentrated among a relatively small share of products, sellers, and markets. 
-- The top 25% of sellers generate 86.2% of revenue, while the bottom 25% generate only 0.67%.

-- Recommendation:
-- Management should prioritize protecting the high-contribution seller and product base from stock,
-- fulfillment, and service disruptions, while selectively expanding proven high-performing segments 
-- rather than distributing resources evenly across the entire marketplace.

-- Priority: Highest

-- Success metrics: Revenue retention, revenue concentration, revenue growth of priority sellers/products.

-- 2. Long product tail → Rationalize and monitor the catalog

-- Finding: 99.5% of products sold fewer than 50 items, while 55% sold only one item.

-- Recommendation:
-- Management should segment the product catalog by observed commercial traction. High-performing 
-- products should receive stronger inventory and promotional support, while persistently low-volume 
-- products should be reviewed for continued marketplace relevance rather than automatically receiving equal attention.

-- Priority: High

-- Success metrics: Product sell-through, revenue per active product, share of catalog generating 
-- meaningful sales.

-- 3. Long seller tail → Differentiate seller management

-- Finding: Most sellers operate at low volume, while a small group contributes a large share of revenue.

-- Recommendation:
-- Management should avoid a one-size-fits-all seller strategy. High-value sellers should receive
-- retention and operational support; promising mid-tier sellers should be developed; persistently 
-- low-value sellers should be monitored and reviewed based on both contribution and service outcomes.

-- Priority: High

-- Success metrics: Revenue per active seller, seller retention, seller growth, operational quality.

-- 4. Sales vs revenue trajectories → Manage volume and value separately

-- Finding: Product sales and revenue trajectories do not always move together.

-- Recommendation:
-- Management should evaluate product performance using both sales volume and transaction value, 
-- rather than relying on revenue or volume alone. Products showing strong volume but weak value 
-- should be investigated separately from products showing lower volume but strong value contribution.

-- Priority: Medium

-- Success metrics: Revenue per item, item volume, product contribution, freight-to-price relationship.

-- 5. Weak repeat purchasing → Build targeted retention

-- Finding: 97% of unique customers are one-time customers and only about 3% are repeat customers.

-- Recommendation:
-- Management should focus on identifying the customer segments, product types, and purchasing periods 
-- associated with higher observed repeat-purchase behavior and develop targeted re-engagement 
-- strategies around those patterns rather than relying on blanket discounts.

-- Priority: Highest strategic opportunity

-- Success metrics: Repeat customer rate, second-order rate, time to second purchase, repeat-customer revenue.

-- 6. Delivery reliability → Target the operational hotspots

-- Finding: 8.11% of delivered orders were late, with substantially higher late rates in certain 
-- sellers, products, periods, and markets.

-- Recommendation:
-- Management should concentrate delivery improvement efforts on the highest-risk sellers, products,
-- geographic markets, and periods instead of redesigning the entire fulfillment operation.

-- Priority: Highest operational priority

-- Success metrics: Late-delivery rate, median delivery time, on-time delivery rate.

-- 7. Delivery → Customer satisfaction → Make this the first customer-experience intervention

-- Finding: Late deliveries had an average review score of 2.57 versus 4.29 for on-time/early deliveries.

-- Recommendation:
-- Management should treat delivery reliability as the primary customer-experience intervention 
-- point. After addressing delivery hotspots, seller/product review performance should be monitored using sufficient-volume thresholds to identify persistent experience problems.

-- Priority: Highest customer-experience priority

-- Success metrics: Average review score, 1–2 star share, late-delivery rate, complaints related
-- to delivery.

-- ==================================================================================================
--***************************************************************************************************
--######################## Final Executive Recommendation ###################################
--**************************************************************************************************
--==================================================================================================

-- 1. Protect the economic core

-- Prioritize the small group of sellers and products responsible for the majority of revenue.

-- 2. Improve delivery reliability

-- Target the specific sellers, products, markets, and periods generating late deliveries, 
-- because late delivery has the clearest observed relationship with customer dissatisfaction.

-- 3. Strengthen repeat purchasing

-- Treat the very small repeat-customer base as a major growth opportunity through targeted rather 
-- than blanket retention initiatives.

-- 4. Rationalize the long tail

-- Use differentiated management for low-volume products and sellers, with phase-out considered 
-- only when low contribution is persistent and accompanied by weak operational or customer outcomes.