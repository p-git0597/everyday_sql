-- Write your PostgreSQL query statement below
SELECT uni.unique_id, e.name from Employees e left join EmployeeUNI uni on e.id = uni.id;


-- Approach
-- Imagine we have two tables: one for the employees and one for their unique identifiers.
-- We want to combine the information from both tables to get the unique identifier and the name for each employee.
-- To do this, we use a left join, which means we take all the employees from the first table (Employees) and match them with their unique identifiers from the second table (EmployeeUNI) based on their IDs.
-- By performing this left join, we make sure that all the employees from the first table are included in the result, even if they don't have a matching unique identifier in the second table.
-- The result of our query will be a combination of the unique identifier and the name for each employee.