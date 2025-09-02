-- Joins_queries.sql
-- This script contains complex SQL queries using JOINs to retrieve data from multiple tables in the Airbnb database.
USE alx_airbnb_database;

-- Query to retrieve all bookings along with the user details who made those bookings
SELECT bookings.*, users.first_name, users.last_name, users.email
FROM bookings
    INNER JOIN users ON bookings.user_id = users.user_id
ORDER BY bookings.booking_id;

-- Left Join implementation
SELECT properties.property_id, properties.host_id, properties.property_name, reviews.review_id, reviews.user_id, reviews.rating, reviews.comment
FROM properties
    LEFT JOIN reviews ON properties.property_id = reviews.property_id
ORDER BY properties.property_id;

-- Full Outer Join implementation using UNION of Left and Right Joins
SELECT bookings.*, users.first_name, users.last_name, users.email
FROM bookings
    LEFT JOIN users ON bookings.user_id = users.user_id
UNION
SELECT bookings.*, users.first_name, users.last_name, users.email
FROM bookings
    RIGHT JOIN users ON bookings.user_id = users.user_id
ORDER BY booking_id;