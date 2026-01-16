-- 5.)KPI Development

-- Basic KPIs

-- Total Orders
SELECT COUNT(*) AS total_orders FROM fact_swiggy_orders;

-- Total Revenue
SELECT ROUND(SUM(price_inr)/1000000,2) AS revenue_million
FROM fact_swiggy_orders;

-- AVG Dish Price
SELECT ROUND(AVG(price_inr),2) AS avg_dish_price
FROM fact_swiggy_orders;

-- AVG Rating
SELECT ROUND(AVG(rating),2) AS avg_rating
FROM fact_swiggy_orders;
