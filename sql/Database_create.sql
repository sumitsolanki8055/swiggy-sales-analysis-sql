CREATE DATABASE swiggy;
USE swiggy;

CREATE TABLE swiggy_data (
    State TEXT,
    City TEXT,
    Order_Date TEXT,
    Restaurant_Name TEXT,
    Location TEXT,
    Category TEXT,
    Dish_Name TEXT,
    Price_INR TEXT,
    Rating TEXT,
    Rating_Count TEXT
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/swiggy_data.csv'
INTO TABLE swiggy_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

ALTER TABLE swiggy_data CHANGE COLUMN `Order Date` order_date VARCHAR(20);
ALTER TABLE swiggy_data CHANGE COLUMN `Restaurant Name` restaurant_name VARCHAR(255);
ALTER TABLE swiggy_data CHANGE COLUMN `Dish Name` dish_name VARCHAR(255);
ALTER TABLE swiggy_data CHANGE COLUMN `Price (INR)` price_inr DECIMAL(10,2);
ALTER TABLE swiggy_data CHANGE COLUMN `Rating Count` rating_count INT;
ALTER TABLE swiggy_data CHANGE COLUMN `City` city VARCHAR(100);
ALTER TABLE swiggy_data CHANGE COLUMN `Location` location VARCHAR(255);
ALTER TABLE swiggy_data CHANGE COLUMN `Category` category VARCHAR(100);
ALTER TABLE swiggy_data CHANGE COLUMN `Rating` rating DECIMAL(3,2);
ALTER TABLE swiggy_data CHANGE COLUMN `ï»¿State` state VARCHAR(100);

ALTER TABLE swiggy_data
ADD id INT AUTO_INCREMENT PRIMARY KEY;

SELECT COUNT(*) FROM swiggy_data;

UPDATE swiggy_data
SET `Order_Date` = STR_TO_DATE(`Order_Date`, '%d-%m-%Y');


DESCRIBE swiggy_data;

SELECT * FROM swiggy_data;
