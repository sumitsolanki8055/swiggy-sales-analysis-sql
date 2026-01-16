-- 2.) Duplicate Removal (ROW_NUMBER)

-- Keep 1 clean record, remove extras.

DELETE FROM swiggy_data
WHERE id IN (
    SELECT id FROM (
        SELECT id,
               ROW_NUMBER() OVER (
                   PARTITION BY state, city, order_date, restaurant_name,
                                location, category, dish_name,
                                price_inr, rating, rating_count
                   ORDER BY order_date
               ) AS rn
        FROM swiggy_data
    ) t
    WHERE rn > 1
);
