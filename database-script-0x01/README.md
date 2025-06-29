# Airbnb Database Schema

## 📄 About

This directory contains the SQL scripts used to create the database schema for the **Airbnb Database Project** as part of the **ALX Software Engineering Program**.

The schema is designed to accurately represent the relationships between users, properties, bookings, payments, reviews, and messages in an Airbnb-like application. It follows best practices in relational database design, including normalization to 3NF, proper constraints, and indexing for optimal performance.

---

## 📂 Files Included

- `schema.sql` — SQL script to create all database tables, primary keys, foreign keys, indexes, and constraints.
- `README.md` — This documentation file explaining the purpose, usage, and structure of the schema.

---

## 🗺️ Database Schema Overview

### ✔️ Entities (Tables)

- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**

### ✔️ Key Features

- ✅ Primary keys defined on all tables.
- ✅ Foreign key constraints to enforce data integrity.
- ✅ ENUM types for controlled values (e.g., role, status, payment method).
- ✅ Indexing for frequently queried fields like `email`, `property_id`, and `booking_id`.
- ✅ Timestamps for record tracking (`created_at`, `updated_at`).

---

## 🏗️ How to Use

1. Open your MySQL client or server.
2. Run the script:

```bash
mysql -u your_username -p your_database < schema.sql
