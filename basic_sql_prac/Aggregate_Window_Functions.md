## SQL Aggregate Window Functions With Examples & Practice Exercises

They are functions that operate by creating virtual "windows" 🪟 within the dataset.

```
SELECT
  spend,
   SUM(spend) OVER (
     PARTITION BY product
     ORDER BY transaction_date) AS running_total
  FROM product_spend;
```

You can see that the above query sums up spend for each window.

We're calculating the sum of spending for the whole dataset, but we're organizing it into sections /partitions / windows by product. Within each section/window, we arrange/ order the data by transaction_date, and we're adding up spending as we go down the section.

- **Breaking Down The Window Function** Let's break down the earlier window function:

```
SUM(spend) OVER (
     PARTITION BY product
     ORDER BY transaction_date) AS running_total
```

Here's what each SQL command in the window function is doing:

- SUM(): SUM(spend) is a typical aggregate function
- OVER: OVER required for window functions
- PARTITION BY: makes each product it's own section / window,
- ORDER BY: the data is ordered by transaction_date, and the running_total accumulates the sum across the current row and all subsequent rows of spend
- ORDER BY: ORDER BY essentially sorts the data by the specified column, similar to an ORDER BY clause.
  - Without ORDER BY, each value would be a sum of all the spend values without its respective product.
