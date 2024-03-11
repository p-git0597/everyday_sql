/*markdown
## 1757. Recyclable and Low Fat Products [Easy]
- Write a solution to find the ids of products that are both low fat and recyclable.
*/

SELECT 
    product_id 
from 
    products 
where 
    low_fats = 'Y' and
    recyclable = 'Y';