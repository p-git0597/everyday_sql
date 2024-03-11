/*markdown
## 1350. Students With Invalid Departments [Easy]
- Find the id and the name of all students who are enrolled in departments that no longer exist.
- Return the result table in any order.

The result format is in the following example:- 
*/

SELECT s.id, s.name from STUDENTS s 
LEFT JOIN DEPARTMENTS d 
on s.department_id = d.id
WHERE d.id is NULL;