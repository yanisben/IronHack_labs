use olist;

-- 1. From the order_items table, find the price of the highest priced order and lowest price order.

select order_id, price -- 0.85
from order_items
order by price
limit 1;

select order_id, price -- 6735
from order_items
order by price desc
limit 1;

-- 2. From the order_items table, what is range of the shipping_limit_date of the orders?

select min(shipping_limit_date), max(shipping_limit_date)
from order_items;

-- 3. From the customers table, find the states with the greatest number of customers.

select count(customer_id) as count, customer_state as state
from customers
group by state
order by count desc;

-- 4. From the customers table, within the state with the greatest number of customers, find the cities with the greatest number of customers.

select count(customer_id) as count, customer_city as city
from customers
where customers.customer_state = 'SP'
group by city
order by count desc;

-- 5. From the closed_deals table, how many distinct business segments are there (not including null)?

select count(distinct(business_segment)) as count
from olist.closed_deals
where business_segment != "null";

-- 6. From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).

select count(distinct business_segment)
from olist.closed_deals
where business_segment!= "null";

select business_segment, sum(declared_monthly_revenue)
from olist.closed_deals
group by business_segment
order by sum(declared_monthly_revenue)
desc limit 3;

-- 7. From the order_reviews table, find the total number of distinct review score values.

select count(distinct review_score)
from olist.order_reviews;

-- 8. In the order_reviews table, create a new column with a description that corresponds to each number category for each review score from 1 to 5, then find the review score and category occurring most frequently in the table.

SELECT review_score, count(review_score),
   CASE review_score
      WHEN 1 THEN 'Bad'
      WHEN 2 THEN 'Poor'
      WHEN 3 THEN 'Satisfactory'
	WHEN 4 THEN 'Good'
      WHEN 5 THEN 'Perfect'
   END AS review_categ
 FROM olist.order_reviews group by review_categ order by count(review_score) desc;

-- 9. From the order_reviews table, find the review value occurring most frequently and how many times it occurs.

select review_score, review_categ, count(review_score) as reviews
from olist.order_reviews
group by review_categ 
order by reviews desc;

select  review_score, count(review_score) as reviews
from olist.order_reviews
group by review_score
order by reviews desc limit 1;

