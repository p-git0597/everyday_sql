/*markdown
## 1076 Project Employees II

- Write a solution to report all the projects that have the most employees.
*/

WITH ProjectEmployeeCount AS (
    SELECT project_id, COUNT(employee_id) AS num_employees
    FROM Project
    GROUP BY project_id
)
SELECT project_id
FROM ProjectEmployeeCount
WHERE num_employees = (
    SELECT MAX(num_employees)
    FROM ProjectEmployeeCount
);
