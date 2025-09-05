Partition Performance from partitioning the bookings table.

-- A brief report on the improvements observed.
-- By partitioning the bookings table by RANGE on the start_date column, we can improve query performance for date-based queries.
-- Queries that filter on the start_date can now quickly locate the relevant partition, reducing the amount of data scanned.
-- This is particularly beneficial for large datasets where date-based queries are common.
