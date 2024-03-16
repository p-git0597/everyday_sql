/*markdown
## 2026. Low-Quality Problems [Easy]

- Find the IDs of the low-quality problems. A LeetCode problem is low-quality if the like percentage of the problem (number of likes divided by the total number of votes) is strictly less than 60%.

- Return the result table ordered by problem_id in ascending order.
*/

SELECT problem_id from 
(select problem_id, likes, (likes + dislikes) as votes from problems) as sub_query
where ((likes / votes) * 100) < 60
order by problem_id asc;