/*markdown
## How to find nth highest salary in sql
 - This can not only be used for just finding salary it could be any numerical number
 - NOTE: - using 'ROW_NUMBER()' funcion you can give you wrong answer(ROW_NUMBER() gives sequentials row number, this create problem.)
*/

-- Simple way to find the 1st and 2nd highest salary

--FIRST Highest salary
Select max(salary) from employees1;

-- SECOND highest salary
SELECT max(salary) from employees1 where 
salary < (SELECT max(salary) from employees1);

-- Any of the nth highest salary: using sub query option
Select salary from employees1 order by salary desc;
select salary from
(SELECT DISTINCT salary from employees1
order by salary desc limit 3) result
order by salary
limit 1;



-- using CTE:
with RESULT as
(SELECT salary, DENSE_RANK() over (order by salary desc) as salary_rank
from Employees1)
SELECT SALARY from RESULT
where RESULT.salary_rank = 3;
