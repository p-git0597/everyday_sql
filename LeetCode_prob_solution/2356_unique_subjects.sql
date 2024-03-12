/*markdown
## 2356. Number of Unique Subjects Taught by Each Teacher [Easy]

- Write a solution to calculate the number of unique subjects each teacher teaches in the university.

*/

SELECT teacher_id, count(distinct(subject_id)) as cnt from Teacher
group by teacher_id;