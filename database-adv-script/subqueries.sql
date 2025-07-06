-- Query 1: Find all properties where the average rating is greater than 4.0 using a non-correlated subquery
SELECT
  *
FROM
  properties AS p
WHERE
  (SELECT AVG(r.rating) FROM reviews AS r WHERE r.property_id = p.id) > 4.0
ORDER BY p.id;

-- Query 2: Find users who have made more than 3 bookings using a correlated subquery
SELECT
  *
FROM
  users AS u
WHERE
  (SELECT COUNT(*) FROM bookings AS b WHERE b.user_id = u.id) > 3
ORDER BY u.id;