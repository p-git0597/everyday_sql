/*markdown
## 1683. Invalid Tweets [Easy]

- Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
*/

select tweet_id from tweets where length(content) > 15;