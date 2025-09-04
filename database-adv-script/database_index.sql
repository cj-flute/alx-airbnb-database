use alx_airbnb_database;

-- Indexing for users table
CREATE INDEX users_index ON users ( user_id, first_name, last_name );

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