/*markdown
## 2339. All the Matches of the League [Easy]

- Write a solution to report all the possible matches of the league. Note that every two teams play two matches with each other, with one team being the `home_team` once and the other time being the `away_team`.
*/

SELECT t1.team_name as home_team, t2.team_name as away_team
from teams t1, teams t2
where t1.team_name != t2.team_name;

/*markdown
FROM clause:
- The query selects data from the "teams" table twice, aliased as "t1" and "t2", respectively.
- This creates two instances of the same table, allowing us to reference it multiple times in the query.

WHERE clause:
- `t1.team_name != t2.team_name`: This condition filters the rows to include only those where the team name from the first instance of the table (home team) is not equal to the team name from the second instance of the table (away team).
- This condition ensures that we do not include pairs where the home team is the same as the away team, as it would not represent a valid match scenario.
*/

/*markdown

*/