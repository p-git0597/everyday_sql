/*markdown
## 1076 Project Employees II [Easy]

- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

*/

SELECT p.project_id, ROUND(AVG(e.experience_years), 2) as average_years 
from project p
join Employee e on p.employee_id = e.employee_id
group by p.project_id; 