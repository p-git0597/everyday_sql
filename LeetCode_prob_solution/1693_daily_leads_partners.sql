/*markdown
## 1693. Daily Leads and Partners [Easy]

- For each date_id and make_name, find the number of distinct lead_id's and distinct partner_id's.


*/

-- Write your MySQL query statement below
Select date_id, make_name, count(distinct(lead_id)) as unique_leads, count(distinct(partner_id)) as unique_partners 
from DailySales
group by date_id, make_name;

/*markdown
- To find the number of distinct lead_id and partner_id for each combination of date_id and make_name, we need to use the COUNT(DISTINCT ...) function.
- The COUNT(DISTINCT lead_id) calculates the number of distinct lead_id for each combination of date_id and make_name.

*/

/*markdown

*/