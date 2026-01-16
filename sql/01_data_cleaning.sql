use swiggy;
-- 1.) Data Cleaning & Validation

-- 1.1 Null Check
-- Identify missing values in business-critical columns.

SELECT *
FROM swiggy_data
WHERE State IS NULL
   OR City IS NULL
   OR Order_Date IS NULL
   OR Restaurant_Name IS NULL
   OR Location IS NULL
   OR Category IS NULL
   OR Dish_Name IS NULL
   OR Price_INR IS NULL
   OR Rating IS NULL
   OR Rating_Count IS NULL;
   
-- 1.2 Blank / Empty String Check

-- Blank strings are silent killers in analytics.

SELECT *
FROM swiggy_data
WHERE TRIM(State) = ''
   OR TRIM(City) = ''
   OR TRIM(Restaurant_Name) = ''
   OR TRIM(Location) = ''
   OR TRIM(Category) = ''
   OR TRIM(Dish_Name) = '';
   
-- 1.3 Duplicate Detection

-- Check duplicates across all business-critical columns.

SELECT State, City, Order_Date, Restaurant_Name, Location,
       Category, Dish_Name, Price_INR, Rating, Rating_Count,
       COUNT(*) AS duplicate_count
FROM swiggy_data
GROUP BY State, City, Order_Date, Restaurant_Name, Location,
         Category, Dish_Name, Price_INR, Rating, Rating_Count
HAVING COUNT(*) > 1;





