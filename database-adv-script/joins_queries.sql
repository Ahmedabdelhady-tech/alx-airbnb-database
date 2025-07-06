-- Query 1: INNER JOIN to retrieve all bookings along with their booking users
SELECT
  b.*,       -- all booking fields
  u.*        -- all user fields
FROM
  bookings AS b
  INNER JOIN users AS u ON b.user_id = u.id;

-- Query 2: LEFT JOIN to retrieve all properties and their associated reviews,
-- including properties without any reviews
SELECT
  p.*,       -- all property fields
  r.*        -- review fields or NULL if no review exists
FROM
  properties AS p
  LEFT JOIN reviews AS r ON p.id = r.property_id;

-- Query 3: FULL OUTER JOIN to retrieve all users and all bookings,
-- including users without bookings and bookings without linked users
SELECT
  u.*,       -- user fields or NULL if no user exists
  b.*        -- booking fields or NULL if no booking exists
FROM
  users AS u
  FULL OUTER JOIN bookings AS b ON u.id = b.user_id;