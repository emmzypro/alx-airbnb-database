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
