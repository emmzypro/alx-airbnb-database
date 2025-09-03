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


# Subqueries in SQL

This directory contains examples of correlated and non-correlated subqueries for the Airbnb Clone database project.

## Files
- **subqueries.sql** – Contains SQL queries demonstrating:
  - **Non-Correlated Subquery:** Find all properties where the average rating is greater than 4.0.
  - **Correlated Subquery:** Find users who have made more than 3 bookings.

## Explanation
### Non-Correlated Subquery
The first query uses a subquery to calculate the average rating per property and filters for properties with an average rating above 4.0. This subquery runs independently and does not depend on values from the outer query.

### Correlated Subquery
The second query uses a correlated subquery that counts the number of bookings for each user (`b.user_id = u.id`). The outer query selects users who have more than 3 bookings. This subquery runs once for each user in the `users` table.


# SQL Aggregation and Window Functions

This directory contains examples of SQL aggregation and window functions for analyzing data in the Airbnb Clone database.

## Files
- **aggregations.sql** – Contains:
  - **Total Bookings per User:** Uses `COUNT()` and `GROUP BY` to find how many bookings each user has made.
  - **Ranking Properties by Bookings:** Uses `RANK()` window function to rank properties based on total number of bookings.

## Explanation
### Aggregation Query
The first query groups bookings by user and counts them using `COUNT(b.id)`. A `LEFT JOIN` is used to include users with zero bookings.

### Window Function Query
The second query uses `RANK() OVER (ORDER BY COUNT(b.id) DESC)` to assign a rank to each property based on how many bookings it has. This allows for ordering and ranking without collapsing rows like `GROUP BY` alone would.



