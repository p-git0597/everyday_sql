-- Write your PostgreSQL query statement below
SELECT tweet_id from Tweets
where 
    length(content) > 15;