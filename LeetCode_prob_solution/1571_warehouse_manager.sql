/*markdown
## 1571. Warehouse Manager [Easy]
- Write a solution to report the number of cubic feet of volume the inventory occupies in each warehouse.
*/

SELECT w.name as warehouse_name, sum(p.length*p.width*p.height*p.units) from warehouse w join products p
on w.product_id = p.product_id
group by w.NAME
order by w.name asc;

/*markdown
- We multiply the volume of each product by the number of units in the warehouse (w.units) to get the total volume for that product in the warehouse.
*/

/*markdown

*/