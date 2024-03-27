/*markdown
## 1069 Product Sales Analysis II [Easy]

- Write a solution that reports the total quantity sold for every product id.
*/

SELECT p.product_id, sum(s.quantity) as total_quantity
from sales s
join product p on s.product_id = p.product_id
group by p.product_id;


-- No need for join we have product_id in the sales table itself
SELECT product_id, SUM(quantity) AS total_quantity
FROM Sales
GROUP BY product_id;