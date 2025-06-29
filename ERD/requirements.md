\# Airbnb Database - ERD Requirements



\## ✅ Entities and Attributes



\### 1. \*\*User\*\*

\- user\_id (Primary Key, UUID)

\- first\_name (VARCHAR, NOT NULL)

\- last\_name (VARCHAR, NOT NULL)

\- email (VARCHAR, UNIQUE, NOT NULL)

\- password\_hash (VARCHAR, NOT NULL)

\- phone\_number (VARCHAR, NULL)

\- role (ENUM: guest, host, admin, NOT NULL)

\- created\_at (TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP)



---



\### 2. \*\*Property\*\*

\- property\_id (Primary Key, UUID)

\- host\_id (Foreign Key → User.user\_id)

\- name (VARCHAR, NOT NULL)

\- description (TEXT, NOT NULL)

\- location (VARCHAR, NOT NULL)

\- price\_per\_night (DECIMAL, NOT NULL)

\- created\_at (TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP)

\- updated\_at (TIMESTAMP, ON UPDATE CURRENT\_TIMESTAMP)



---



\### 3. \*\*Booking\*\*

\- booking\_id (Primary Key, UUID)

\- property\_id (Foreign Key → Property.property\_id)

\- user\_id (Foreign Key → User.user\_id)

\- start\_date (DATE, NOT NULL)

\- end\_date (DATE, NOT NULL)

\- total\_price (DECIMAL, NOT NULL)

\- status (ENUM: pending, confirmed, canceled, NOT NULL)

\- created\_at (TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP)



---



\### 4. \*\*Payment\*\*

\- payment\_id (Primary Key, UUID)

\- booking\_id (Foreign Key → Booking.booking\_id)

\- amount (DECIMAL, NOT NULL)

\- payment\_date (TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP)

\- payment\_method (ENUM: credit\_card, paypal, stripe, NOT NULL)



---



\### 5. \*\*Review\*\*

\- review\_id (Primary Key, UUID)

\- property\_id (Foreign Key → Property.property\_id)

\- user\_id (Foreign Key → User.user\_id)

\- rating (INTEGER, CHECK: rating between 1 and 5, NOT NULL)

\- comment (TEXT, NOT NULL)

\- created\_at (TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP)



---



\### 6. \*\*Message\*\*

\- message\_id (Primary Key, UUID)

\- sender\_id (Foreign Key → User.user\_id)

\- recipient\_id (Foreign Key → User.user\_id)

\- message\_body (TEXT, NOT NULL)

\- sent\_at (TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP)



---



\## 🔗 Relationships Between Entities



| Entity A | Relationship | Entity B | Description                           |

|----------|--------------|----------|---------------------------------------|

| User     | 1 → N        | Property | A user (host) can have many properties |

| User     | 1 → N        | Booking  | A user (guest) can make many bookings  |

| Property | 1 → N        | Booking  | A property can have many bookings      |

| Booking  | 1 → 1        | Payment  | Each booking has one payment           |

| Property | 1 → N        | Review   | A property can have many reviews       |

| User     | 1 → N        | Review   | A user can give many reviews           |

| User     | 1 → N        | Message  | A user can send many messages          |

| User     | 1 → N        | Message  | A user can receive many messages       |



---



\## 🎯 Notes

\- All Primary Keys are UUIDs.

\- Foreign Keys enforce referential integrity.

\- Indexes are applied to frequently queried columns like `email`, `property\_id`, and `booking\_id`.





