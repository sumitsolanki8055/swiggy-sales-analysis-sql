-- Fact Table

CREATE TABLE fact_swiggy_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    date_id INT,
    location_id INT,
    restaurant_id INT,
    category_id INT,
    dish_id INT,
    price_inr DECIMAL(10,2),
    rating DECIMAL(2,1),
    rating_count INT,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (location_id) REFERENCES dim_location(location_id),
    FOREIGN KEY (restaurant_id) REFERENCES dim_restaurant(restaurant_id),
    FOREIGN KEY (category_id) REFERENCES dim_category(category_id),
    FOREIGN KEY (dish_id) REFERENCES dim_dish(dish_id)
);

INSERT INTO fact_swiggy_orders (
    date_id, location_id, restaurant_id,
    category_id, dish_id, price_inr, rating, rating_count
)
SELECT
    d.date_id,
    l.location_id,
    r.restaurant_id,
    c.category_id,
    di.dish_id,
    s.Price_INR,
    s.Rating,
    s.Rating_Count
FROM swiggy_data s
JOIN dim_date d ON s.order_date = d.order_date
JOIN dim_location l ON s.State = l.state
                  AND s.City = l.city
                  AND s.Location = l.location
JOIN dim_restaurant r ON s.Restaurant_Name = r.restaurant_name
JOIN dim_category c ON s.Category = c.category
JOIN dim_dish di ON s.Dish_Name = di.dish_name
-- LIMIT 20000 OFFSET 0;
-- LIMIT 20000 OFFSET 20000;
-- LIMIT 20000 OFFSET 40000;
-- LIMIT 20000 OFFSET 60000;
-- LIMIT 20000 OFFSET 80000;
-- LIMIT 20000 OFFSET 100000;
-- LIMIT 20000 OFFSET 120000;
-- LIMIT 20000 OFFSET 140000;
-- LIMIT 20000 OFFSET 160000;
LIMIT 20000 OFFSET 180000;

SELECT COUNT(*) FROM fact_swiggy_orders;

SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CONCAT(
        date_id, location_id, restaurant_id,
        category_id, dish_id, price_inr, rating, rating_count
    )) AS unique_rows
FROM fact_swiggy_orders;

DELETE f1
FROM fact_swiggy_orders f1
JOIN fact_swiggy_orders f2
ON 
    f1.date_id = f2.date_id
AND f1.location_id = f2.location_id
AND f1.restaurant_id = f2.restaurant_id
AND f1.category_id = f2.category_id
AND f1.dish_id = f2.dish_id
AND f1.price_inr = f2.price_inr
AND f1.rating = f2.rating
AND f1.rating_count = f2.rating_count
AND f1.order_id > f2.order_id;

select * from fact_swiggy_orders