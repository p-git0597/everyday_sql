/*markdown
## 627. Swap Salary [Easy]

- Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.

- Note that you must write a single update statement, do not write any select statement for this problem.
*/

Update Salary
SET sex = Case
            When sex = 'm' then 'f'
            when sex = 'f' then 'm'
            end;