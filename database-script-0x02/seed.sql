USE alx_airbnb_database;

-- Users data
INSERT INTO
    users (
        first_name,
        last_name,
        email,
        password_hash,
        phone_number,
        role,
        created_at
    )
VALUES (
        'John',
        'Doe',
        'john.doe@test.com',
        'hashed_password_1',
        '1234567890',
        'guest',
        '2024-01-01 10:00:00'
    ),
    (
        'Jane',
        'Smith',
        'jane.smith@test.com',
        'hashed_password_2',
        '0987654321',
        'host',
        '2024-01-02 11:00:00'
    ),
    (
        'Alice',
        'Johnson',
        'alice.johnson@test.com',
        'hashed_password_3',
        '5555555555',
        'admin',
        '2024-01-03 12:00:00'
    );

-- Properties data
INSERT INTO
    properties (
        host_id,
        name,
        description,
        location,
        price_per_night,
        created_at,
        update_at
    )
VALUES (
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'jane.smith@test.com'
            LIMIT 1
        ),
        'Cozy Apartment',
        'A lovely apartment in the city center.',
        'New York',
        120.00,
        '2024-01-05 09:00:00',
        '2024-01-05 09:00:00'
    ),
    (
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'john.doe@test.com'
            LIMIT 1
        ),
        'Beach House',
        'A beautiful house by the beach.',
        'Los Angeles',
        250.00,
        '2024-01-06 10:00:00',
        '2024-01-06 10:00:00'
    ),
    (
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'alice.johnson@test.com'
            LIMIT 1
        ),
        'Mountain Cabin',
        'A quiet cabin in the mountains.',
        'Denver',
        180.00,
        '2024-01-07 11:00:00',
        '2024-01-07 11:00:00'
    ),
    (
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'alice.johnson@test.com'
            LIMIT 1
        ),
        'Lake House',
        'A peaceful house by the lake.',
        'Chicago',
        200.00,
        '2024-01-08 12:00:00',
        '2024-01-08 12:00:00'
    );

-- Bookings data
INSERT INTO
    bookings (
        property_id,
        user_id,
        start_date,
        end_date,
        total_price,
        status,
        created_at
    )
VALUES (
        (
            SELECT property_id
            FROM properties
            WHERE
                name = 'Cozy Apartment'
            LIMIT 1
        ),
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'john.doe@test.com'
            LIMIT 1
        ),
        '2024-02-10',
        '2024-02-15',
        600.00,
        'confirmed',
        '2024-01-10 14:00:00'
    ),
    (
        (
            SELECT property_id
            FROM properties
            WHERE
                name = 'Beach House'
            LIMIT 1
        ),
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'alice.johnson@test.com'
            LIMIT 1
        ),
        '2024-03-01',
        '2024-03-05',
        1000.00,
        'pending',
        '2024-01-11 15:00:00'
    ),
    (
        (
            SELECT property_id
            FROM properties
            WHERE
                name = 'Mountain Cabin'
            LIMIT 1
        ),
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'jane.smith@test.com'
            LIMIT 1
        ),
        '2024-04-10',
        '2024-04-12',
        360.00,
        'canceled',
        '2024-01-12 16:00:00'
    ),
    (
        (
            SELECT property_id
            FROM properties
            WHERE
                name = 'Lake House'
            LIMIT 1
        ),
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'john.doe@test.com'
            LIMIT 1
        ),
        '2024-05-20',
        '2024-05-25',
        1000.00,
        'completed',
        '2024-01-13 17:00:00'
    );

-- Payments data
INSERT INTO
    payments (
        booking_id,
        amount,
        payment_date,
        payment_method,
        status
    )
VALUES (
        (
            SELECT booking_id
            FROM bookings
            WHERE
                property_id = (
                    SELECT property_id
                    FROM properties
                    WHERE
                        name = 'Cozy Apartment'
                )
                AND user_id = (
                    SELECT user_id
                    FROM users
                    WHERE
                        email = 'john.doe@test.com'
                )
            LIMIT 1
        ),
        600.00,
        '2024-01-15 10:00:00',
        'credit_card',
        'completed'
    ),
    (
        (
            SELECT booking_id
            FROM bookings
            WHERE
                property_id = (
                    SELECT property_id
                    FROM properties
                    WHERE
                        name = 'Beach House'
                )
                AND user_id = (
                    SELECT user_id
                    FROM users
                    WHERE
                        email = 'alice.johnson@test.com'
                )
            LIMIT 1
        ),
        1000.00,
        '2024-01-16 11:00:00',
        'paypal',
        'pending'
    ),
    (
        (
            SELECT booking_id
            FROM bookings
            WHERE
                property_id = (
                    SELECT property_id
                    FROM properties
                    WHERE
                        name = 'Mountain Cabin'
                )
                AND user_id = (
                    SELECT user_id
                    FROM users
                    WHERE
                        email = 'jane.smith@test.com'
                )
            LIMIT 1
        ),
        360.00,
        '2024-01-17 12:00:00',
        'bank_transfer',
        'failed'
    ),
    (
        (
            SELECT booking_id
            FROM bookings
            WHERE
                property_id = (
                    SELECT property_id
                    FROM properties
                    WHERE
                        name = 'Lake House'
                )
                AND user_id = (
                    SELECT user_id
                    FROM users
                    WHERE
                        email = 'john.doe@test.com'
                )
            LIMIT 1
        ),
        1000.00,
        '2024-01-18 13:00:00',
        'credit_card',
        'completed'
    );

-- Reviews data
INSERT INTO
    reviews (
        property_id,
        user_id,
        rating,
        comment,
        created_at
    )
VALUES (
        (
            SELECT property_id
            FROM properties
            WHERE
                name = 'Cozy Apartment'
            LIMIT 1
        ),
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'john.doe@test.com'
            LIMIT 1
        ),
        5,
        'Amazing place! Had a great time.',
        '2024-02-20 10:00:00'
    ),
    (
        (
            SELECT property_id
            FROM properties
            WHERE
                name = 'Beach House'
            LIMIT 1
        ),
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'jane.smith@test.com'
            LIMIT 1
        ),
        4,
        'Beautiful location, but a bit noisy.',
        '2024-03-10 11:00:00'
    ),
    (
        (
            SELECT property_id
            FROM properties
            WHERE
                name = 'Mountain Cabin'
            LIMIT 1
        ),
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'alice.johnson@test.com'
            LIMIT 1
        ),
        3,
        'Cozy but could use some improvements.',
        '2024-04-15 12:00:00'
    ),
    (
        (
            SELECT property_id
            FROM properties
            WHERE
                name = 'Lake House'
            LIMIT 1
        ),
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'john.doe@test.com'
            LIMIT 1
        ),
        5,
        'Perfect getaway spot!',
        '2024-05-30 13:00:00'
    );

-- Messages data
INSERT INTO
    messages (
        sender_id,
        recipient_id,
        message_body,
        sent_at
    )
VALUES (
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'john.doe@test.com'
            LIMIT 1
        ),
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'alice.johnson@test.com'
            LIMIT 1
        ),
        'Hi Alice, I am interested in your Beach House. Is it available for my dates?',
        '2024-01-20 09:00:00'
    ),
    (
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'alice.johnson@test.com'
            LIMIT 1
        ),
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'jane.smith@test.com'
            LIMIT 1
        ),
        'Hello Jane, I saw your Mountain Cabin listing. Can you provide more details?',
        '2024-01-21 10:00:00'
    ),
    (
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'jane.smith@test.com'
            LIMIT 1
        ),
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'john.doe@test.com'
            LIMIT 1
        ),
        'Hi John, the Cozy Apartment is available for your requested dates.',
        '2024-01-22 11:00:00'
    ),
    (
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'jane.smith@test.com'
            LIMIT 1
        ),
        (
            SELECT user_id
            FROM users
            WHERE
                email = 'john.doe@test.com'
            LIMIT 1
        ),
        'Also, feel free to ask if you have any questions about the property.',
        '2024-01-22 11:05:00'
    );