Tables to identify from the database to create indexes to improve query performance.

**Users Table:**
_ user_id
_ first_name

- last_name

* email

**Bookings Table:**
_ booking_id
_ property\*id

- user\*id
- total_price

**Properties Table:**
_ property_id
_ host\*id

- property\*name
- price_per_night

Before adding indexes to users, properties, and bookings their execution took as follows;
_ users = 0.016 sec
_ properties = 0.016 sec \* bookings = 0.016 sec

After adding indexes to users, properties, and bookings their execution took as follows;
_ users = 0.00 sec
_ properties = 0.016 sec \* bookings = 0.00 sec
