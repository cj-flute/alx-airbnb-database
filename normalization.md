AirBNB Database Specification Normalization to 3NF

- Users

  - user_id (PK)
  - first_name
  - last_name
  - email
  - password_hash
  - phone_number
  - role
  - created_at

- Propertys

  - property_id (PK)
  - host_id (FK)
  - name
  - description
  - location
  - pricepernight
  - created_at
  - updated_at

- Bookings

  - booking_id (PK)
  - property_id (FK)
  - user_id (FK)
  - start_date
  - end_date
  - total_price
  - status
  - created_at

- Payments

  - payment_id (PK)
  - booking_id (FK)
  - amount
  - payment_date
  - payment_method

- Reviews

  - review_id (PK)
  - property_id (FK)
  - user_id (FK)
  - rating
  - comment
  - created_at

- Messages
  - message_id (PK)
  - sender_id (FK)
  - recipient_id (FK)
  - message_body
  - sent_at

**Normalization to Third Normal Form (3NF)**
This document explains how the given AirBnB-style database schema was normalized to satisfy Third Normal Form (3NF). It covers the theory behind normalization and a step-by-step analysis of each entity.

**What Is Normalization?**
Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity. It involves decomposing tables into smaller, well-structured tables.

**First Normal Form (1NF)**

    - **Ensures atomicity:** each column contains indivisible values.
    - No repeating groups or arrays.

**Second Normal Form (2NF)**

    - Must be in 1NF.
    - **Removes partial dependencies:** all non-key attributes must depend on the whole primary key (especially important for composite keys).

**Third Normal Form (3NF)**

    - Must be in 2NF.
    - **Removes transitive dependencies:** non-key attributes must depend only on the primary key, not on other non-key attributes.

**Entity-by-Entity Analysis**

- Users

  - user_id (PK)
  - first_name
  - last_name
  - email
  - password_hash
  - phone_number
  - role
  - created_at

All attributes depend directly on user_id.

No repeating groups or derived fields. ✅

- Propertys

  - property_id (PK)
  - host_id (FK)
  - name
  - description
  - location
  - pricepernight
  - created_at
  - updated_at

host_id is a foreign key to User.

All other attributes depend directly on property_id. ✅ No transitive dependencies.

- Bookings

  - booking_id (PK)
  - property_id (FK)
  - user_id (FK)
  - start_date
  - end_date
  - total_price
  - status
  - created_at

All attributes depend directly on booking_id.

No derived or calculated fields violating 3NF. ✅

- Payments

  - payment_id (PK)
  - booking_id (FK)
  - amount
  - payment_date
  - payment_method

  All attributes depend directly on payment_id. ✅ No transitive dependencies.

- Reviews

  - review_id (PK)
  - property_id (FK)
  - user_id (FK)
  - rating
  - comment
  - created_at

All attributes depend directly on review_id. ✅

- Messages

  - message_id (PK)
  - sender_id (FK)
  - recipient_id (FK)
  - message_body
  - sent_at

  All attributes depend directly on message_id. ✅
