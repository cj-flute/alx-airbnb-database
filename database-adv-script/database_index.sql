use alx_airbnb_database;

-- Annalyze the query plan before creating indexes
EXPLAIN SELECT * FROM users;

ANALYZE TABLE users;

EXPLAIN SELECT * FROM properties;

ANALYZE TABLE properties;

EXPLAIN SELECT * FROM bookings;

ANALYZE TABLE bookings;

-- Indexing for users table
CREATE INDEX users_index ON users (
    user_id,
    first_name,
    last_name,
    email
);

-- Indexing for properties table
CREATE INDEX properties_index ON properties (
    property_id,
    host_id,
    property_name,
    price_per_night
);

-- Indexing for bookings table
CREATE INDEX bookings_index ON bookings (
    booking_id,
    property_id,
    user_id,
    total_price
);

-- Annalyze the query plan after creating indexes
EXPLAIN SELECT * FROM users;

ANALYZE TABLE users;

EXPLAIN SELECT * FROM properties;

ANALYZE TABLE properties;

EXPLAIN SELECT * FROM bookings;

ANALYZE TABLE bookings;
-- Dropping Indexes
-- ALTER TABLE users DROP INDEX users_index;

-- ALTER TABLE properties DROP INDEX properties_index;

-- ALTER TABLE bookings DROP INDEX bookings_index;