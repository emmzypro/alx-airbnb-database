# SQL Joins Queries

This directory contains SQL queries demonstrating different types of JOINs using the **ALX Airbnb Database**.

## Files

- **joins_queries.sql** – Contains SQL queries for:
  - INNER JOIN: Retrieves all bookings and their respective users.
  - LEFT JOIN: Retrieves all properties and their reviews, including properties that have no reviews.
  - FULL OUTER JOIN: Retrieves all users and all bookings, even if the user has no booking or a booking is not linked to a user.

## Queries Explanation

### 1. INNER JOIN
This query returns only records where there is a match between `bookings.user_id` and `users.id`.  
It shows which user made which booking.

### 2. LEFT JOIN
This query returns all properties, whether or not they have reviews.  
If a property does not have a review, the `review_id`, `rating`, and `comment` columns will be `NULL`.

### 3. FULL OUTER JOIN
This query returns:
- All users, even if they have not made a booking.
- All bookings, even if the `user_id` is missing or does not match a user.
This is useful for auditing or seeing "orphan" data.

