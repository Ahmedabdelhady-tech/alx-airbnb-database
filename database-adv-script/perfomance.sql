-- 1) Initial complex query: retrieve bookings with user, property & payment details (using WHERE and AND)
SELECT
  b.id            AS booking_id,
  b.created_at    AS booking_date,
  u.id            AS user_id,
  u.name          AS user_name,
  p.id            AS property_id,
  p.title         AS property_title,
  pay.id          AS payment_id,
  pay.amount      AS payment_amount,
  pay.status      AS payment_status
FROM
  bookings AS b,
  users AS u,
  properties AS p,
  payments AS pay
WHERE
  b.user_id         = u.id
  AND b.property_id = p.id
  AND pay.booking_id = b.id;

-- 2) Analyze performance of the initial query
EXPLAIN ANALYZE
SELECT
  b.id, u.name, p.title, pay.amount
FROM
  bookings AS b,
  users AS u,
  properties AS p,
  payments AS pay
WHERE
  b.user_id         = u.id
  AND b.property_id = p.id
  AND pay.booking_id = b.id;

-- 3) Refactored query: drop unused columns & leverage indexing (using JOIN syntax)
SELECT
  b.id           AS booking_id,
  b.created_at   AS booking_date,
  u.id           AS user_id,
  p.id           AS property_id,
  pay.amount     AS payment_amount
FROM
  bookings AS b
  INNER JOIN users      AS u   ON b.user_id     = u.id
  INNER JOIN properties AS p   ON b.property_id = p.id
  LEFT  JOIN payments   AS pay ON b.id          = pay.booking_id;

-- 4) Analyze performance of the refactored query
EXPLAIN ANALYZE
SELECT
  b.id, u.id, p.id, pay.amount
FROM
  bookings AS b
  INNER JOIN users      AS u   ON b.user_id     = u.id
  INNER JOIN properties AS p   ON b.property_id = p.id
  LEFT  JOIN payments   AS pay ON b.id          = pay.booking_id;