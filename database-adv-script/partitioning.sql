CREATE TABLE bookings_partitioned (
  LIKE bookings INCLUDING ALL
) PARTITION BY RANGE (start_date);

CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
  FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

INSERT INTO bookings_partitioned
SELECT * FROM bookings;

ALTER TABLE bookings RENAME TO bookings_old;
ALTER TABLE bookings_partitioned RENAME TO bookings;

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
