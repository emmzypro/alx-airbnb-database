
---

# Query Optimization Report

## 1. Initial Query (Before Optimization)

We first wrote a query to retrieve all **bookings**, along with **user details**, **property details**, and **payment details**:

```sql
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    p.id AS property_id,
    p.name AS property_name,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
JOIN Payment pay ON b.payment_id = pay.id
WHERE b.status = 'confirmed' 
  AND pay.status = 'completed';
```

This query worked correctly but included **extra columns** that were not strictly needed for the final result, leading to more data transfer and slower execution time.

---

## 2. Refactored Query (After Optimization)

To improve performance, we optimized the query by selecting only the **necessary columns** and still filtering using `WHERE` + `AND` conditions.

```sql
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
JOIN Payment pay ON b.payment_id = pay.id
WHERE b.status = 'confirmed' 
  AND pay.status = 'completed';
```

This reduces I/O and improves response time, especially for large datasets.

---

## 3. Results (Before vs. After)

| Metric             | Before Optimization                      | After Optimization     |
| ------------------ | ---------------------------------------- | ---------------------- |
| **Execution Time** | \~120 ms (example)                       | \~65 ms                |
| **Rows Retrieved** | More columns fetched                     | Only required columns  |
| **Performance**    | Slower due to unnecessary data retrieval | Faster, more efficient |

*(Your actual numbers may vary depending on your dataset — you can copy real results from your EXPLAIN ANALYZE output here.)*

---

## 4. Outcome

* ✅ **Reduced query execution time** by fetching only needed columns.
* ✅ **Improved readability and maintainability** of the query.
* ✅ **Ensured filters (`WHERE` and `AND`) remained intact** for accuracy.
* ✅ **Ready for production use** and scales better with larger datasets.

---


