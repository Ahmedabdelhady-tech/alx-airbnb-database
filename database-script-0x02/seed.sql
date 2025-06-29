-- seed.sql for Airbnb Database

USE airbnb_db;

-- Insert Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('uuid-001', 'Alice', 'Smith', 'alice@example.com', 'hashed_pass1', '1234567890', 'host'),
('uuid-002', 'Bob', 'Jones', 'bob@example.com', 'hashed_pass2', '0987654321', 'guest'),
('uuid-003', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pass3', NULL, 'guest');

-- Insert Properties
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
('prop-001', 'uuid-001', 'Cozy Cottage', 'A lovely cottage in the countryside.', 'London', 120.00),
('prop-002', 'uuid-001', 'Urban Flat', 'A modern flat in the city center.', 'Paris', 150.00);

-- Insert Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('book-001', 'prop-001', 'uuid-002', '2024-07-01', '2024-07-05', 480.00, 'confirmed'),
('book-002', 'prop-002', 'uuid-003', '2024-08-10', '2024-08-15', 750.00, 'pending');

-- Insert Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
('pay-001', 'book-001', 480.00, 'credit_card'),
('pay-002', 'book-002', 750.00, 'paypal');

-- Insert Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
('rev-001', 'prop-001', 'uuid-002', 5, 'Amazing stay, very cozy and clean!'),
('rev-002', 'prop-002', 'uuid-003', 4, 'Great location but a bit noisy.');

-- Insert Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
('msg-001', 'uuid-002', 'uuid-001', 'Hi, is the Cozy Cottage available in August?'),
('msg-002', 'uuid-001', 'uuid-002', 'Hi Bob, unfortunately it is booked until September.');
