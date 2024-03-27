/*markdown
## 1068 Product Sales Analysis I [Easy]

- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
*/

SELECT p.product_name, s.year, s.price
from sales s
JOIN product p on s.product_id = p.product_id
group by s.sale_id, p.product_name, s.year, s.price;

-- optimized
SELECT p.product_name, s.year, s.price
from sales s
JOIN product p on s.product_id = p.product_id;

-- If you're looking to retrieve data from the Sales table without any aggregation or grouping, you can simply perform a 
--straightforward SELECT query joining the Sales and Product tables. Here's the SQL query without using GROUP BY