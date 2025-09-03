-- 1. Total number of bookings made by each user
SELECT 
    user_id, 
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;

-- 2. Rank properties based on the total number of bookings (RANK)
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM bookings
GROUP BY property_id;

-- 3. Rank properties based on the total number of bookings (ROW_NUMBER)
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS booking_row_number
FROM bookings
GROUP BY property_id;

