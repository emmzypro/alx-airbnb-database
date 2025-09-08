-- performance.sql

-- Step 1: Initial Query (Unoptimized)
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.booking_date,
    u.id AS user_id,
    u.name AS user_name,
    p.id AS property_id,
    p.title AS property_title,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM Bookings b
JOIN Users u ON b.user_id = u.id
JOIN Properties p ON b.property_id = p.id
LEFT JOIN Payments pay ON pay.booking_id = b.id;

-- Step 2: Index Creation for Optimization
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON Payments(booking_id);

-- Step 3: Optimized Query
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.booking_date,
    u.name AS user_name,
    p.title AS property_title,
    pay.amount,
    pay.status
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.id
INNER JOIN Properties p ON b.property_id = p.id
LEFT JOIN Payments pay ON pay.booking_id = b.id;
