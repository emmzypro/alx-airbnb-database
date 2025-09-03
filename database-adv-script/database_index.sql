-- database_index.sql

-- Users table
CREATE INDEX idx_users_email ON Users(email);

-- Properties table
CREATE INDEX idx_properties_host_id ON Properties(host_id);
CREATE INDEX idx_properties_city ON Properties(city);

-- Bookings table
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_date ON Bookings(booking_date);
