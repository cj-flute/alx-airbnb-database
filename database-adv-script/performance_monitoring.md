**Performance Monitoring**
-- Optimization report
Analysis on the retrieval of all bookings along with the user details, property details, and payment details.

**Bookings Table**
id = 1
select_type = SIMPLE
table = bookings
partitions
type = range
possible_keys = PRIMARY,property_id,bookings_index
key = PRIMARY
key_len = 4
ref
rows = 5
filtered = 50.00
Extra = Using where

**Payments Table**
id = 1
select_type = SIMPLE
table = payments
partitions
type = ref
possible_keys = booking_id
key = booking_id
key_len = 5
ref = alx_airbnb_database.bookings.booking_id
rows = 1
filtered = 100.00
Extra

**Properties Table**
id = 1
select_type = SIMPLE
table = properties
partitions
type = eq_ref
possible_keys = PRIMARY,properties_index
key PRIMARY
key_len = 4
ref = alx_airbnb_database.bookings.property_id
rows = 1
filtered = 100.00
Extra

Had to remove the partitioned bookings table because it confilicted with the rest of the tables of the database. Tables like the payments table depended on it as a foriegn key and it depended on other tables like the users table and properties table. The partitioned bookings changed the whole achitechure of the database. It is not neccessary to carry out now because bookings toble is not a large table where partitioning will be very useful.
