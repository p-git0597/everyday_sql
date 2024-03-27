/*markdown
## 1050 Actors and Directors Who Cooperated At Least Three Times [Easy]

- Write a solution to find all the pairs `(actor_id, director_id)` where the actor has cooperated with the director at least three times.

*/

select actor_id, director_id
from
(select actor_id, director_id, count(actor_id = director_id) as count_pairs 
            from ActorDirector group by actor_id, director_id) as count_p
where count_pairs >= 3;

-- Optimized version
select actor_id, director_id
            from ActorDirector group by actor_id, director_id
having count(*) >= 3;