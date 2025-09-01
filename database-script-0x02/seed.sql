
-- Sample Data Population Script for Airbnb Clone

-- USERS
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Emmanuel', 'Amieye', 'emmanuel@example.com', 'hashed_pass1', '+2347012345678', 'host'),
('22222222-2222-2222-2222-222222222222', 'Grace', 'Johnson', 'grace@example.com', 'hashed_pass2', '+2348098765432', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Victor', 'Ikpi', 'victor@example.com', 'hashed_pass3', '+2348011223344', 'guest'),
('44444444-4444-4444-4444-444444444444', 'Sarah', 'Benson', 'sarah@example.com', 'hashed_pass4', '+2348099887766', 'host');

-- PROPERTIES
INSERT INTO Properties (property_id, host_id, name, description, location, price_per_night)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'Cozy Apartment in Lagos', '2-bedroom apartment close to Victoria Island', 'Lagos, Nigeria', 25000.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '44444444-4444-4444-4444-444444444444', 'Beachfront Villa', 'Luxury villa with private pool near Lekki Beach', 'Lagos, Nigeria', 80000.00),
('aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'Abuja Studio', 'Compact studio apartment in Maitama', 'Abuja, Nigeria', 18000.00);

-- BOOKINGS
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', '2025-09-10', '2025-09-13', 75000.00, 'confirmed'),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '33333333-3333-3333-3333-333333333333', '2025-09-20', '2025-09-23', 240000.00, 'pending'),
('bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', '2025-10-05', '2025-10-07', 36000.00, 'confirmed');

-- PAYMENTS
INSERT INTO Payments (payment_id, booking_id, amount, payment_method)
VALUES
('ppppppp1-pppp-pppp-pppp-pppppppppppp', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 75000.00, 'credit_card'),
('ppppppp2-pppp-pppp-pppp-pppppppppppp', 'bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 36000.00, 'paypal');

-- REVIEWS
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment)
VALUES
('rrrrrrr1-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 5, 'Amazing stay! Very clean and host was responsive.'),
('rrrrrrr2-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 4, 'Nice location, but could use better Wi-Fi.');

-- MESSAGES
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body)
VALUES
('mmmmmmm1-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Emmanuel, is the apartment available for next weekend?'),
('mmmmmmm2-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Yes, it is available. You can book it now.');
