-- 1. Performance measurement before indexing
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 42;

-- 2. Create indexes on high‑usage columns
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_properties_city ON properties(city);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- 3. Performance measurement after indexing
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 42;
