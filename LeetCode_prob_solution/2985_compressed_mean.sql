/*markdown
## 2985. Calculate Compressed Mean [Easy]
- Write a solution to calculate the average number of items per order, rounded to 2 decimal places.
*/

-- Write your MySQL query statement below
select round(num_cost / occ, 2) as average_items_per_order 
from (select SUM(item_count * order_occurrences) as num_cost, SUM(order_occurrences) as occ from orders) as sub_query;

select round(SUM(item_count * order_occurrences)/ SUM(order_occurrences), 2) as average_items_per_order
from orders;