-- Total number of bookings by each user
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM Users u
LEFT JOIN Bookings b ON u.id = b.user_id
GROUP BY u.id, u.name;

-- Rank properties based on number of bookings (using ROW_NUMBER)
SELECT 
    p.id AS property_id,
    p.title AS property_title,
    COUNT(b.id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM Properties p
LEFT JOIN Bookings b ON p.id = b.property_id
GROUP BY p.id, p.title;
