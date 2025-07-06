# Partition Performance Report

This report compares query performance before and after partitioning the `bookings` table based on the `start_date` column.

---

## 1. Performance Without Partitioning (`bookings_old`)

**Sample Query:**

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings_old
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
