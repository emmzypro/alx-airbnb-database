# Index Performance Analysis

## Objective
The goal of this task was to measure and compare query performance before and after adding indexes to the database.

## Steps Taken
1. Identified high-usage columns used in WHERE, JOIN, and ORDER BY clauses:
   - `Users.email`
   - `Properties.host_id`, `Properties.city`
   - `Bookings.user_id`, `Bookings.property_id`, `Bookings.booking_date`
2. Created indexes for these columns using `CREATE INDEX` commands in `database_index.sql`.
3. Measured query performance before and after indexing using `EXPLAIN ANALYZE`.

## Query Used for Testing
```sql
EXPLAIN ANALYZE
SELECT *
FROM Bookings
WHERE user_id = 10
ORDER BY booking_date DESC;

# Index Performance Report

## Identified High-Usage Columns
- Users.email (for login/auth queries)
- Properties.host_id & city (for property filtering/search)
- Bookings.user_id, property_id, booking_date (for joins and filtering)

## SQL Index Commands
```sql
CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_properties_host_id ON Properties(host_id);
CREATE INDEX idx_properties_city ON Properties(city);
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_date ON Bookings(booking_date);





