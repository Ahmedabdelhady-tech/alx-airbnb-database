# Optimization Report

## 1. Initial Query & Analysis

**Query:**

```sql
SELECT
  b.id, u.name, p.title, pay.amount
FROM bookings b
INNER JOIN users u       ON b.user_id     = u.id
INNER JOIN properties p  ON b.property_id = p.id
LEFT JOIN payments pay   ON b.id          = pay.booking_id;
