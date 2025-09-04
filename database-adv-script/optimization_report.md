-- Optimization report
Analysis on the retrieval of all bookings along with the user details, property details, and payment details.

**Bookings Table**
id = 1
select_type = SIMPLE
table = bookings
partitions
type = ALL
possible_keys = property_id
key
key_len
ref
rows = 10
filtered = 100.00
Extra Using = where

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
