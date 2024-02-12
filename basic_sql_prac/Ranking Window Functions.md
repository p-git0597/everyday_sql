## SQL Ranking Window Functions

Ranking functions help us assign ranks to rows based on partitioning and order expressions. Think of these ranks as numbers that indicate the position of a row within a specific "window" of data. A window is just a set of rows that meet certain conditions - hence the name "window function"!

Before we delve into the differences, let's look at the generic syntax of ranking functions:

```
SELECT
  RANK() / DENSE_RANK() / ROW_NUMBER() OVER ( -- Compulsory expression
    PARTITION BY partitioning_expression -- Optional expression
    ORDER BY order_expression) -- Compulsory expression
FROM table_name;
```

### ROW_NUMBER vs. RANK vs. DENSE_RANK

1. ROW_NUMBER(): This function assigns a unique sequential number to each row within a window. It's like numbering the rows in order.

2. RANK(): The RANK() function handles tied values by assigning the same rank to them. However, it may skip subsequent ranks, leaving gaps in the sequence.

3. DENSE_RANK(): Similar to RANK(), DENSE_RANK() also handles tied values by assigning the same rank. However, it does not skip ranks, resulting in no gaps in the sequence.

### QUESTION:

Assume there are three Spotify tables: artists, songs, and global_song_rank, which contain information about the artists, songs, and music charts, respectively.

Write a query to find the top 5 artists whose songs appear most frequently in the Top 10 of the global_song_rank table. Display the top 5 artist names in ascending order, along with their song appearance ranking.

If two or more artists have the same number of song appearances, they should be assigned the same ranking, and the rank numbers should be continuous (i.e. 1, 2, 2, 3, 4, 5).

```
WITH songs_tables_cte AS (
  SELECT
    artists.artist_name,
    DENSE_RANK() OVER(
    ORDER BY COUNT(songs.song_id)DESC) AS artist_rank
  FROM artists
  INNER JOIN songs
    ON artists.artist_id = songs.artist_id
  INNER JOIN global_song_rank AS ranking
    ON songs.song_id = ranking.song_id
  WHERE ranking.rank <= 10
  GROUP BY artists.artist_name
)

SELECT artist_name, artist_rank
from songs_tables_cte
where artist_rank <= 5;
```
