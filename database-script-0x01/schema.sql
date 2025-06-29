-- schema.sql for Airbnb Database

-- Create database
CREATE DATABASE IF NOT EXISTS airbnb_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE airbnb_db;

-- Users table
CREATE TABLE users (
  user_id CHAR(36) PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20),
  role ENUM('guest', 'host', 'admin') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX(email)
);

-- Properties table
CREATE TABLE properties (
  property_id CHAR(36) PRIMARY KEY,
  host_id CHAR(36) NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR(200) NOT NULL,
  price_per_night DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (host_id) REFERENCES users(user_id) ON DELETE CASCADE,
  INDEX(host_id)
);

-- Bookings table
CREATE TABLE bookings (
  booking_id CHAR(36) PRIMARY KEY,
  property_id CHAR(36) NOT NULL,
  user_id CHAR(36) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
  INDEX(property_id),
  INDEX(user_id)
);

-- Payments table
CREATE TABLE payments (
  payment_id CHAR(36) PRIMARY KEY,
  booking_id CHAR(36) NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
  FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE,
  INDEX(booking_id)
);

-- Reviews table
CREATE TABLE reviews (
  review_id CHAR(36) PRIMARY KEY,
  property_id CHAR(36) NOT NULL,
  user_id CHAR(36) NOT NULL,
  rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
  INDEX(property_id),
  INDEX(user_id)
);

-- Messages table
CREATE TABLE messages (
  message_id CHAR(36) PRIMARY KEY,
  sender_id CHAR(36) NOT NULL,
  recipient_id CHAR(36) NOT NULL,
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE CASCADE,
  FOREIGN KEY (recipient_id) REFERENCES users(user_id) ON DELETE CASCADE,
  INDEX(sender_id),
  INDEX(recipient_id)
);
