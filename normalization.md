# Airbnb Database Normalization (3NF)

## 1. Introduction
This document explains the normalization process applied to the Airbnb database schema and shows the resulting Third Normal Form (3NF) schema design. The goal is to minimize redundancy, ensure data integrity, and create a scalable structure for users, properties, bookings, payments, reviews, and messages.

---

## 2. Step 1: First Normal Form (1NF)
**Definition:**  
A table is in 1NF if:
- All attributes contain only atomic (indivisible) values.
- Each record is unique (no duplicate rows).

**Application:**  
- All tables have atomic attributes (no repeating groups, no multi-valued columns).
- Each table has a primary key (PK).
- ✅ Our schema already satisfies 1NF.

---

## 3. Step 2: Second Normal Form (2NF)
**Definition:**  
A table is in 2NF if:
- It is already in 1NF.
- All non-key attributes are fully functionally dependent on the primary key.

**Application:**  
- No partial dependency exists because every table has a single-column primary key (UUID).
- Example: In **Booking**, `start_date`, `end_date`, `total_price`, and `status` depend only on `booking_id`.
- ✅ Our schema satisfies 2NF.

---

## 4. Step 3: Third Normal Form (3NF)
**Definition:**  
A table is in 3NF if:
- It is already in 2NF.
- There are no transitive dependencies (no non-key attribute depends on another non-key attribute).

**Adjustments Made:**
- **User Table:** `role` is kept as an ENUM since it has a small set of controlled values (guest, host, admin). This avoids redundancy but does not require a separate table unless roles become complex with extra attributes.
- **Property Table:** `host_id` is a Foreign Key referencing `User(user_id)`, avoiding duplication of host data.
- **Booking Table:** `total_price` is stored as a derived attribute for performance, but its calculation depends on `price_per_night` and `dates`. This is an acceptable denormalization for efficiency.
- No other transitive dependencies were found.

✅ **Result:** The schema is in **Third Normal Form (3NF)**.

---

## 5. Final 3NF Schema Design

### **User**
- **PK:** `user_id`
- `first_name`, `last_name`, `email` (UNIQUE), `password_hash`, `phone_number`, `role (ENUM)`, `created_at`

### **Property**
- **PK:** `property_id`
- **FK:** `host_id` → User(user_id)
- `name`, `description`, `location`, `price_pernight`, `created_at`, `updated_at`

### **Booking**
- **PK:** `booking_id`
- **FK:** `property_id` → Property(property_id)
- **FK:** `user_id` → User(user_id)
- `start_date`, `end_date`, `total_price`, `status (ENUM)`, `created_at`

### **Payment**
- **PK:** `payment_id`
- **FK:** `booking_id` → Booking(booking_id)
- `amount`, `payment_date`, `payment_method (ENUM)`

### **Review**
- **PK:** `review_id`
- **FK:** `property_id` → Property(property_id)
- **FK:** `user_id` → User(user_id)
- `rating (1–5)`, `comment`, `created_at`

### **Message**
- **PK:** `message_id`
- **FK:** `sender_id` → User(user_id)
- **FK:** `recipient_id` → User(user_id)
- `message_body`, `sent_at`

---

## 6. Benefits of 3NF
- **Eliminates redundancy:** No duplicate user, property, or booking data.
- **Ensures data integrity:** All relationships are enforced through foreign keys.
- **Improves maintainability:** Easy to add new entities or attributes.
- **Optimized queries:** Smaller tables and fewer anomalies during insert, update, or delete operations.

---

## 7. Future Considerations
- If `role` needs more attributes (e.g., permissions), create a separate **Role** table.
- Consider adding a **PropertyType** or **Location** table if more attributes need to be tracked.

---

