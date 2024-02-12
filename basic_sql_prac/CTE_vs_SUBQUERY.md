## CTE vs. SUBQUERY:

As we start to write longer SQL queries in the advanced SQL tutorial, it's important to cover Common
Table Expressions (CTE) and subqueries which help us write more modular, reusable SQL code.

1. **What is a CTE?**

   - A CTE, short for Common Table Expression, is like a query within a query. With the WITH statement, you can create temporary tables to store results, making complex queries more readable and maintainable. These temporary tables exist only for the duration of the main query, streamlining your analysis process.

2. **What is a Subquery?**
   - Subqueries, also known as inner queries, are powerful tools to embed one query within another. By nesting queries within parentheses, you can generate temporary tables to perform calculations and filter data within the main query. Subqueries enable granular control over your data, enhancing the precision of your analysis.

### When Do You Use a CTE or a Subquery?

CTEs and subqueries are both powerful tools in SQL that can be used to achieve similar goals, but they
have different use cases and advantages. Here are some examples of when to use each:

- **Break Down Complex Queries:** By declaring CTEs at the beginning of the query, you enhance code readability, enabling a clearer grasp of your analysis logic. Breaking down the query into smaller, more manageable components fosters effortless code maintenance and enhances comprehension.

```
-- Start of a CTE
WITH genre_revenue_cte AS(
    SELECT
    genre,
    SUM(concert_revenue) AS total_revenue
    FROM concerts
    GROUP BY genre
)
-- End of a CTE

SELECT
    g.genre,
    g.total_revenue,
    AVG(c.concert_revenue) AS avg_concert_revenue
FROM genre_revenue_cte AS g
INNER JOIN concerts AS c
    ON g.genre = c.genre
WHERE c.concert_revenure > g.total_revenue * 0.5
GROUP BY g.genre, g.total_revenue;
```

- **Reusing Subquery Results:** When you need to use the same subquery result multiple times within a larger query, CTEs can be used to prevent redundant calculations.

- **Recursive Queries:** When you need to perform recursive queries, such as traversing hierarchical data like organizational structures or threaded discussions, CTEs are the ideal choice.

```
WITH recursive_cte AS (
  SELECT
    employee_id,
    name,
    manager_id
  FROM employees
  WHERE manager_id = @manager_id

  UNION ALL

  SELECT
    e.employee_id,
    e.name,
    e.manager_id
  FROM employees AS e
  INNER JOIN recursive_cte AS r -- The RECURSIVE CTE is utilized here within the main CTE.
    ON e.ManagerID = r.employee_id
)

SELECT *
FROM recursive_cte;
```

### Advantages of Using a Subquery

1. **Single-Value Comparison in WHERE Clauses:** When you need to compare a single value to a result from another query, utilize the subquery in the WHERE clause to enable dynamic data filtering. This enhances query flexibility and precision by allowing on-the-fly condition adjustments based on subquery results.

```
SELECT artist_name
FROM concerts
WHERE concert_revenue > (
  SELECT AVG(concert_revenue) FROM concerts);
```

2. **Column Creation and Aggregation:** Utilize subqueries to create new columns for real-time computations and to calculate intermediate values for aggregation functions within larger queries. This enhances your analysis by enriching data on the go and enabling more sophisticated aggregation.

```
SELECT
  artist_name,
  genre,
  concert_revenue,
  (SELECT AVG(concert_revenue) FROM concerts) AS avg_concert_revenue,
  (SELECT MAX(concert_revenue) FROM concerts) AS max_concert_revenue
FROM concerts;
```

Subqueries are often used with IN, NOT IN, and EXISTS operators to filter results based on conditions from another query.

```
SELECT artist_name
FROM concerts
WHERE artist_id IN (
  SELECT artist_id FROM concert_revenue WHERE concert_revenue > 500000);
```

3. **Correlated Subqueries:** Utilize correlated subqueries to retrieve values from the outer query.
   Imagine you have two lists of data side by side. With correlated subqueries, you can ask questions about each item in one list and get answers from the other list that are specific to that item. It's like having a conversation between these two lists, where the second list provides unique details for each item in the first list.

```
SELECT
  artist_name,
  genre,
  concert_revenue
FROM concerts AS c1
WHERE concert_revenue = (
    SELECT MAX(concert_revenue)
    FROM concerts AS c2
    WHERE c1.genre = c2.genre
);
```

1. As the lead data analyst for a prominent music event management company, you have been entrusted with a dataset containing concert revenue and detailed information about various artists.

Your mission is to unlock valuable insights by analyzing the concert revenue data and identifying the top revenue-generating artists within each music genre.

Write a query to rank the artists within each genre based on their revenue per member and extract the top revenue-generating artist from each genre. Display the output of the artist name, genre, concert revenue, number of members, and revenue per band member, sorted by the highest revenue per member within each genre.

```
WITH ranked_concerts_cte AS (
SELECT
  artist_name,
  genre,
  concert_revenue,
  number_of_members,
  (concert_revenue / number_of_members) AS revenue_per_member,
  RANK() OVER(
  PARTITION BY genre
  ORDER BY concert_revenue / number_of_members DESC) AS ranked_concerts
  from concerts)

SELECT
  artist_name,
  concert_revenue,
  genre,
  number_of_members,
  revenue_per_member
from ranked_concerts_cte
WHERE ranked_concerts = 1
ORDER BY revenue_per_member DESC;
```

Solution 2:

```
SELECT
    artist_name,
  concert_revenue,
  genre,
  number_of_members,
  revenue_per_member
FROM (SELECT
    artist_name,
    genre,
    concert_revenue,
    number_of_members,
    (concert_revenue / number_of_members) AS revenue_per_member,
    RANK OVER(
        PARTATION BY genre
        ORDER BY concert_revenue / number_of_members DESC) AS ranked_concerts
  from concerts) AS subquery
  where ranked_concerts = 1
  ORDER BY revenue_per_member DESC;
```
