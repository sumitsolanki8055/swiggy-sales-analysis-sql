-- 6.)Deep-Dive Business Analysis

-- Date-Based

-- Monthly Orders
SELECT year, month, COUNT(*) AS orders
FROM fact_swiggy_orders f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY year, month
ORDER BY year, month;

-- Day-of-Week Pattern
SELECT DAYNAME(order_date) AS day_name, COUNT(*) AS orders
FROM dim_date d
JOIN fact_swiggy_orders f ON d.date_id = f.date_id
GROUP BY day_name;

-- Location-Based

-- Top 10 Cities
SELECT city, COUNT(*) AS orders
FROM fact_swiggy_orders f
JOIN dim_location l ON f.location_id = l.location_id
GROUP BY city
ORDER BY orders DESC
LIMIT 10;

-- Revenue by State
SELECT state, SUM(price_inr) AS revenue
FROM fact_swiggy_orders f
JOIN dim_location l ON f.location_id = l.location_id
GROUP BY state;

-- Food Performance

-- Top 10 Restaurants
SELECT restaurant_name, COUNT(*) AS orders
FROM fact_swiggy_orders f
JOIN dim_restaurant r ON f.restaurant_id = r.restaurant_id
GROUP BY restaurant_name
ORDER BY orders DESC
LIMIT 10;

-- Cuisine Performance
SELECT category,
       COUNT(*) AS orders,
       ROUND(AVG(rating),2) AS avg_rating
FROM fact_swiggy_orders f
JOIN dim_category c ON f.category_id = c.category_id
GROUP BY category;

-- Customer Spending Buckets
SELECT
CASE
    WHEN price_inr < 100 THEN 'Under 100'
    WHEN price_inr BETWEEN 100 AND 199 THEN '100-199'
    WHEN price_inr BETWEEN 200 AND 299 THEN '200-299'
    WHEN price_inr BETWEEN 300 AND 499 THEN '300-499'
    ELSE '500+'
END AS price_bucket,
COUNT(*) AS total_orders
FROM fact_swiggy_orders
GROUP BY price_bucket;

-- Ratings Distribution
SELECT rating, COUNT(*) AS rating_count
FROM fact_swiggy_orders
GROUP BY rating
ORDER BY rating;





