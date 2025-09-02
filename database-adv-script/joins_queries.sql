
-- INNER JOIN: Get all bookings and their respective users
SELECT 
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.check_in_date,
    bookings.check_out_date,
    users.id AS user_id,
    users.username,
    users.email
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

-- LEFT JOIN: Get all properties and their reviews (including those with no reviews)
SELECT 
    properties.id AS property_id,
    properties.name,
    properties.location,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;

-- FULL OUTER JOIN: Get all users and all bookings (even users with no booking)
SELECT 
    users.id AS user_id,
    users.username,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.check_in_date,
    bookings.check_out_date
FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;
