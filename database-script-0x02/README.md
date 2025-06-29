# 🏠 Airbnb Database — Sample Data Seeding

## 📄 About

This folder contains the SQL script (`seed.sql`) used to populate the Airbnb database with sample data. The sample data is designed to reflect realistic scenarios for testing the functionality of the database schema created in the previous step (`schema.sql`).

---

## 🗂️ Files Included

- `seed.sql` — SQL script that inserts sample data into the database tables (`User`, `Property`, `Booking`, `Payment`, `Review`, and `Message`).
- `README.md` — This documentation file explaining the purpose of the script and how to use it.

---

## 🏗️ What’s Inside

The seed script includes:

- ✅ Multiple users — including hosts, guests, and admins.
- ✅ Various property listings tied to hosts.
- ✅ Bookings made by users for different properties with various statuses (pending, confirmed, canceled).
- ✅ Payments associated with bookings using different methods (credit card, PayPal, Stripe).
- ✅ Reviews left by users for properties with star ratings (1 to 5) and comments.
- ✅ Messages exchanged between users (guests and hosts).

---

## 🔗 Data Relationships

- Users are linked to properties (as hosts).
- Users are linked to bookings (as guests).
- Bookings are connected to payments.
- Properties are connected to reviews.
- Users are connected through messages (sender and recipient).

---

## 🚀 How to Run

### ✅ Prerequisites

- The database schema from `schema.sql` must be created first.

### ✅ Steps

1. Ensure you are connected to the correct database.
2. Run the seeding script:

```bash
mysql -u your_username -p your_database < seed.sql
