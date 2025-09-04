USE alx_airbnb_database;
-- A query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT COUNT(*) FROM bookings GROUP BY user_id;

-- A window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
-- A more complex query combining JOINs, aggregations, and window functions to list properties along with their total bookings and rank them.

SELECT
    properties.property_id,
    properties.property_name,
    bookings.total_bookings,
    ROW_NUMBER() OVER (
        ORDER BY bookings.total_bookings DESC
    ) AS row_numbers,
    RANK() OVER (
        ORDER BY bookings.total_bookings DESC
    ) AS booking_rank
FROM properties
    INNER JOIN (
        SELECT property_id, COUNT(*) AS total_bookings
        FROM bookings
        GROUP BY
            property_id
    ) AS bookings ON properties.property_id = bookings.property_id
ORDER BY booking_rank;