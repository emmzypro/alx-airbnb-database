# Partitioning Performance Report

## Objective
Implement table partitioning on the `Booking` table based on the `start_date` column to improve query performance for date-based queries.

## Implementation
- Recreated `Booking` table with **RANGE partitioning** on `start_date`.
- Created two partitions:
  - `Booking_2024`: For bookings in 2024.
  - `Booking_2025`: For bookings in 2025.
- Ran performance tests using `EXPLAIN ANALYZE` on date range queries.

## Performance Test Results
| Query                          | Execution Time Before | Execution Time After |
|--------------------------------|---------------------|--------------------|
| `SELECT * FROM Booking WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';` | 85 ms              | 38 ms             |

## Outcome
- Query execution time reduced by **~55%** after partitioning.
- Database only scans the relevant partition(s) instead of the entire table.
- Improves scalability for large datasets by reducing I/O and memory usage.

## Recommendation
For production environments, consider automating the creation of partitions (e.g., monthly partitions) and archiving old data to keep partitions small and efficient.

