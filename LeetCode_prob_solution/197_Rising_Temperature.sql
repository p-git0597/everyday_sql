/*markdown
## 197. Rising Temperature

- Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
*/

-- SOlution with Self-join
Select w1.id
 from weather w1
 join weather w2 ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
 where w1.temperature > w2.temperature;

-- Optimized solution using LAG function.
SELECT id from(
    Select id, temperature, LAG(temperature) over (ORDER BY recordDate) as Prev_temp from weather) as w
where temperature > Prev_temp 