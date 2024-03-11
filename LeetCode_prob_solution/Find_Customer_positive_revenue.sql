/*markdown
## 1821. Find Customers With Positive Revenue this Year [Easy]

- Write a solution to report the customers with postive revenue in the year 2021.
*/

-- works with mySQL
select customer_id from customers
where year = 2021 and revenue NOT LIKE '-%';

-- The error I was encountering wad due to the use of the NOT LIKE operator with a numeric value in PostgreSQL. 
--The NOT LIKE operator is typically used with string values, not numeric values.


SELECT customer_id 
from customers
where year = 2021 and revenue :: text NOT LIKE '-%'; 