-- Query 1: Total number of bookings made by each user
SELECT
  u.id AS user_id,
  u.name AS user_name,
  COUNT(b.id) AS total_bookings
FROM
  users AS u
  LEFT JOIN bookings AS b ON u.id = b.user_id
GROUP BY
  u.id, u.name
ORDER BY
  total_bookings DESC;

-- Query 2: Rank properties based on the total number of bookings received using ROW_NUMBER()
SELECT
  p.id AS property_id,
  p.title AS property_title,
  COUNT(b.id) AS bookings_count,
  ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM
  properties AS p
  LEFT JOIN bookings AS b ON p.id = b.property_id
GROUP BY
  p.id, p.title
ORDER BY
  booking_rank;
sql
-- Query 1: Total number of bookings made by each user
SELECT
  u.id AS user_id,
  u.name AS user_name,
  COUNT(b.id) AS total_bookings
FROM
  users AS u
  LEFT JOIN bookings AS b ON u.id = b.user_id
GROUP BY
  u.id, u.name
ORDER BY
  total_bookings DESC;

-- Query 2: Rank properties based on the total number of bookings received
SELECT
  p.id AS property_id,
  p.title AS property_title,
  COUNT(b.id) AS bookings_count,
  RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM
  properties AS p
  LEFT JOIN bookings AS b ON p.id = b.property_id
GROUP BY
  p.id, p.title
ORDER BY
  booking_rank;