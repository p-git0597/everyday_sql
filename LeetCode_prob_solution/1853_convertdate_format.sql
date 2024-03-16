/*markdown
## 1853. Convert Date Format [Easy]

- Column Name -> day
- Type -> date
- input      -> output
- 2022-04-12 -> Tuesday, April 12, 2022

1. Write a solution to convert each date in Days into a string formatted as "day_name, month_name day, year".

*/


select DATE_FORMAT(day, '%W, %M %e, %Y') as day from days;