/*markdown
## 1303. Find the Team Size [Easy]

- Write a solution to find the team size of each of the employees.
- Return the result table in any order.


*/

SELECT employee_id, count(employee_id) over(partition by team_id) as team_size from Employee;

/*markdown
- We use the COUNT function with OVER (PARTITION BY team_id) to count the number of employees for each team.
- PARTITION BY team_id ensures that the count is calculated separately for each team.
- We select the employee_id and the calculated team_size for each employee.
*/

-- Works with mySQL
SELECT employee_id, 
(SELECT count(*) from EMPLOYEE e1 where e1.team_id = e2.team_id) as team_size 
from  EMPLOYEE e2;