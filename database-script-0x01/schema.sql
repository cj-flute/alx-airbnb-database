-- Database: alx_airbnb_database Design

CREATE SCHEMA IF NOT EXISTS alx_airbnb_database;

USE alx_airbnb_database;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    password_hash VARCHAR(400) NOT NULL,
    phone_number VARCHAR(15) NULL,
    role ENUM('guest', 'host', 'admin') DEFAULT 'guest' NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Properties table
CREATE TABLE IF NOT EXISTS properties (
    property_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    host_id INT,
    name VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES users (user_id)
);

-- Bookings table
CREATE TABLE IF NOT EXISTS bookings (
    booking_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
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
    FOREIGN KEY (property_id) REFERENCES properties (property_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- payments table
CREATE TABLE IF NOT EXISTS payments (
    payment_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM(
        'credit_card',
        'paypal',
        'bank_transfer'
    ) NOT NULL,
    status ENUM(
        'pending',
        'completed',
        'failed'
    ) DEFAULT 'pending' NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings (booking_id)
);

-- Reviews table
CREATE TABLE IF NOT EXISTS reviews (
    review_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    property_id INT,
    user_id INT,
    rating INT CHECK (
        rating >= 1
        AND rating <= 5
    ),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties (property_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- Messages table
CREATE TABLE IF NOT EXISTS messages (
    message_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    sender_id INT,
    recipient_id INT,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users (user_id),
    FOREIGN KEY (recipient_id) REFERENCES users (user_id)
);