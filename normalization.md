# Normalization Steps for Airbnb Database

This document outlines the normalization process applied to the Airbnb database schema to ensure it adheres to Third Normal Form (3NF).

---

## 1. Original Schema Overview

Entities and attributes as initially defined:

* **User** (`users`):

  * `user_id` (PK)
  * `first_name`
  * `last_name`
  * `email`
  * `password_hash`
  * `phone_number`
  * `role`
  * `created_at`

* **Property** (`properties`):

  * `property_id` (PK)
  * `host_id` (FK → users.user\_id)
  * `name`
  * `description`
  * `location`
  * `price_per_night`
  * `created_at`
  * `updated_at`

* **Booking** (`bookings`):

  * `booking_id` (PK)
  * `property_id` (FK → properties.property\_id)
  * `user_id` (FK → users.user\_id)
  * `start_date`
  * `end_date`
  * `total_price`
  * `status`
  * `created_at`

* **Payment** (`payments`):

  * `payment_id` (PK)
  * `booking_id` (FK → bookings.booking\_id)
  * `amount`
  * `payment_date`
  * `payment_method`

* **Review** (`reviews`):

  * `review_id` (PK)
  * `property_id` (FK → properties.property\_id)
  * `user_id` (FK → users.user\_id)
  * `rating`
  * `comment`
  * `created_at`

* **Message** (`messages`):

  * `message_id` (PK)
  * `sender_id` (FK → users.user\_id)
  * `recipient_id` (FK → users.user\_id)
  * `message_body`
  * `sent_at`

---

## 2. First Normal Form (1NF)

**Rule:** Atomic values; no repeating groups; each field contains only one value.

* All tables use atomic columns (e.g., `first_name`, `last_name` are separate).
* No multi-valued or composite attributes exist.
* ✔️ **Result:** Schema satisfies 1NF.

---

## 3. Second Normal Form (2NF)

**Rule:** Already in 1NF; all non-key attributes fully depend on the primary key (no partial dependencies).

* **Composite keys check:** No table uses a composite primary key; each entity has a single-column PK (UUIDs).
* Non-key attributes (e.g., `email`, `role`) depend solely on `user_id`, not on part of a key.
* ✔️ **Result:** Schema satisfies 2NF.

---

## 4. Third Normal Form (3NF)

**Rule:** Already in 2NF; no transitive dependencies—non-key attributes depend only on the primary key.

* **User table:** All attributes (email, password\_hash, etc.) relate directly to `user_id`.
* **Property table:** Attributes (`name`, `location`, etc.) relate only to `property_id`. No attribute depends on another non-key attribute.
* **Booking table:** Attributes (`start_date`, `end_date`, `total_price`, `status`) depend only on `booking_id`.
* **Payment, Review, Message tables:** Similarly, no transitive dependencies.
* ✔️ **Result:** Schema satisfies 3NF.

---

## 5. Conclusion

The Airbnb database design is normalized through 3NF:

1. **1NF:** Atomic columns and unique rows.
2. **2NF:** No partial dependencies on composite keys.
3. **3NF:** No transitive dependencies among non-key attributes.

This normalized schema reduces redundancy, maintains data integrity, and supports efficient queries and updates.
