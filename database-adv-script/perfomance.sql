-- A query to retrieve all bookings, properties, and payments details.
USE alx_airbnb_database;

SELECT bookings.*, properties.*, payments.*
FROM
    bookings
    INNER JOIN properties ON bookings.property_id = properties.property_id
    LEFT JOIN payments ON bookings.booking_id = payments.booking_id
WHERE
    bookings.booking_id < 6
    AND bookings.property_id < 6;

-- A query to analyze the performance of the above query using EXPLAIN.
EXPLAIN
SELECT bookings.*, properties.*, payments.*
FROM
    bookings
    INNER JOIN properties ON bookings.property_id = properties.property_id
    LEFT JOIN payments ON bookings.booking_id = payments.booking_id
WHERE
    bookings.booking_id < 6
    AND bookings.property_id < 6;

-- Adding indexes to improve performance
CREATE INDEX idx_bookings ON bookings (
    booking_id,
    property_id,
    user_id,
    booking_id
);

CREATE INDEX idx_properties ON properties (
    property_id,
    host_id,
    property_name,
    price_per_night
);

CREATE INDEX idx_payments ON payments (
    paymant_id,
    booking_id,
    amount,
    status,
    payment_method
);