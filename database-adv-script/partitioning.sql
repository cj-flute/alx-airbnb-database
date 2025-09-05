-- Partitioning of the bookings table by booking_date
-- This script demonstrates how to partition the bookings table based on the booking_date column to improve query
use alx_airbnb_database;

SELECT * FROM bookings;

-- First, we need to drop the existing bookings table if it exists and drop any other dependent tables
DROP TABLE IF EXISTS payments;

DROP TABLE IF EXISTS bookings;

-- Now, we create the bookings table with partitioning by RANGE on the start_date column
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT NOT NULL,
    property_id INT,
    user_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM(
        'pending',
        'confirmed',
        'canceled',
        'completed'
    ) DEFAULT 'pending' NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY
    RANGE (YEAR(start_date)) (
        PARTITION p2022
        VALUES
            LESS THAN (2023),
            PARTITION p2023
        VALUES
            LESS THAN (2024),
            PARTITION p2024
        VALUES
            LESS THAN (2025),
            PARTITION pFuture
        VALUES
            LESS THAN MAXVALUE
    );

-- To test the partitioning, we can insert some sample data
INSERT INTO
    bookings (
        property_id,
        user_id,
        start_date,
        end_date,
        total_price,
        status
    )
VALUES (
        1,
        1,
        '2022-05-01',
        '2022-05-10',
        500.00,
        'confirmed'
    ),
    (
        2,
        2,
        '2023-06-15',
        '2023-06-20',
        300.00,
        'pending'
    ),
    (
        3,
        3,
        '2024-07-10',
        '2024-07-15',
        400.00,
        'completed'
    ),
    (
        4,
        4,
        '2025-08-01',
        '2025-08-05',
        600.00,
        'canceled'
    );
-- Query to check the data distribution across partitions
SELECT PARTITION_NAME, TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE
    TABLE_NAME = 'bookings';

SELECT * FROM bookings WHERE start_date = '2023-06-15';

-- A brief report on the improvements observed.
-- By partitioning the bookings table by RANGE on the start_date column, we can improve query performance for date-based queries.
-- Queries that filter on the start_date can now quickly locate the relevant partition, reducing the amount of data scanned.
-- This is particularly beneficial for large datasets where date-based queries are common.

-- Note: Foreign keys are not supported in partitioned tables in MySQL.