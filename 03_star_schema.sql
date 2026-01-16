-- 3.) Dimensional Modelling (STAR SCHEMA)

-- Dimension Tables

-- dim_date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    year INT,
    month INT,
    quarter INT,
    week INT
);

INSERT INTO dim_date (order_date, year, month, quarter, week)
SELECT DISTINCT Order_Date,
       YEAR(Order_Date),
       MONTH(Order_Date),
       QUARTER(Order_Date),
       WEEK(Order_Date)
FROM swiggy_data;

-- dim_location
CREATE TABLE dim_location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    state VARCHAR(100),
    city VARCHAR(100),
    location VARCHAR(200)
);

INSERT INTO dim_location (state, city, location)
SELECT DISTINCT State, City, Location
FROM swiggy_data;

-- dim_restaurant
CREATE TABLE dim_restaurant (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_name VARCHAR(200)
);

INSERT INTO dim_restaurant (restaurant_name)
SELECT DISTINCT Restaurant_Name
FROM swiggy_data;

-- dim_category
CREATE TABLE dim_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(100)
);

INSERT INTO dim_category (category)
SELECT DISTINCT Category
FROM swiggy_data;

-- dim_dish
CREATE TABLE dim_dish (
    dish_id INT PRIMARY KEY AUTO_INCREMENT,
    dish_name VARCHAR(200)
);

INSERT INTO dim_dish (dish_name)
SELECT DISTINCT Dish_Name
FROM swiggy_data;


