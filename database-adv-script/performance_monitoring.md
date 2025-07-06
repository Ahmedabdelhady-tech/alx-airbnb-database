# Database Performance Monitoring Report

This report documents monitoring and refinement of database performance using tools like `EXPLAIN ANALYZE` and suggestions for schema or indexing adjustments.

---

## 1. Monitoring Queries with EXPLAIN ANALYZE

**Example 1: Frequent Booking Lookup by User ID**

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 42;
