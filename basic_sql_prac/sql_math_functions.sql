-- ABS(): Calculating Absolute Differences
-- Imagine you're tasked with preparing a dashboard showcasing the historical performance of Google's 
-- stock (ticker: 'GOOG') throughout 2023. The finance team specifically requests the absolute difference 
--between the opening and closing prices for each trading day.

-- We can utilize the ABS() function which calculates the absolute value of a number, irrespective of its sign

SELECT
    date, ticker,
    (close - open) AS difference,
    ABS(close-open) as abs_difference
FROM stock_prices
WHERE EXTRACT(YEAR from date) = 2023
    AND ticker = 'GOOG';

-- In the (close-open) calculation, you end up with a difference of -9.44, including the negative sign. 
-- But with the helpful ABS(close-open) function, you get a positive difference of 9.44 without the negative sign.

-- ROUND(): Rounding Numbers
-- by using ROUND(AVG(close), 2), you specify the number of decimals you prefer, resulting in a neatly rounded up price.

-- CEIL() and FLOOR(): Rounding Up and Down
-- Now, imagine you're analyzing Facebook's stock performance (ticker: 'META') to identify potential trading ranges.

-- We can utilize the CEIL() function to round up and the FLOOR() function to round down to the lowest and highest prices.

SELECT
    date, ticker,
    high,
    CEIL(high) as resistance_level,
    low,
    FLOOR(low) as support_level
FROM stock_prices
WHERE ticker = 'META'
ORDER BY date;

-- By employing FLOOR() on the low column, we highlight potential support levels by rounding down the lowest prices.
-- Conversely, with CEIL() on the high column, we identify potential resistance levels by rounding up the highest prices.

-- POWER(): Calculating Squared Values
-- In this scenario, we'll explore the concept of squared values by focusing on the 3 popular tech stocks: Apple ('AAPL'), Google ('GOOG'), and Microsoft ('MSFT'). Although this scenario is simplified for illustrative purposes, it offers a straightforward way to introduce the usage of the POWER() function.

-- The POWER() function raises a number to a specified power, allowing us to perform exponential calculations.
SELECT  
    date, ticker,close,
    ROUND(POWER(close, 2),2) AS squared_close
FROM stock_prices
WHERE ticker IN ('APPL', 'GOOG', 'MSFT')
ORDER BY date;

-- In this query, we're leveraging the POWER() function to calculate the squared values of the closing prices for the selected tech stocks.
-- For shorthand, in PostgreSQL, we can also just use the ^ operator too!

-- In the following problem, we'll analyze the CVS pharmacy sales dataset, and try to find the per unit cost of medicines made by Merck. We'll round our unit cost up to the nearest dollar, courtesy of CEIL().

-- The output should look like this:

-- drug	            unit_cost
-- FLU KIDS RELIEF	 11
-- DHEA	             14
-- METHOCARBAMOL	 18
-- Keytruda	         58
-- Divalproex sodium 100

-- SOLUTION:
SELECT 
  drug, 
  CEIL(total_sales/units_sold) as unit_cost 
FROM pharmacy_sales where manufacturer = 'Merck'
ORDER BY unit_cost ASC;


--Division in SQL looks deceptively easy. Here's the syntax:

SELECT expression_1 / expression_2
FROM table;

--How to Divide Integers and Return Decimal/Float Output?
-- You can still make SQL achieve decimal output with a few tricks such as:

-- CAST() function
-- multiplying by 1.0
-- being explicit with types using ::

SELECT 
  CAST(10 AS DECIMAL)/4,
  CAST(10 AS FLOAT)/4,
  10/CAST(6 AS DECIMAL),
  10/CAST(6 AS FLOAT); 

SELECT 
  10/6,
  10*1.0/6,
  10/6*1.0,
  10/(6*1.0);

SELECT 
  10::DECIMAL/4,
  10::FLOAT/4,
  10/4::DECIMAL,
  10/4::FLOAT,
  10::DECIMAL/6,
  10::FLOAT/6;


-- Assigning Categories with CASE Statement Example
-- Here's an example CASE SQL query that determines the popularity category of each Marvel character based on their number of followers ("Popular" is if they have 500,000 or more followers).
SELECT 
    character,
    superhero_alias,
    platform,
    CASE
        WHEN followers >= 500000 THEN 'Popular'
    END AS popularity_category
FROM marvel_avengers;


-- Handling Multiple Conditions with CASE Statement
-- High Engagement: Engagement rate greater than or equal to 8.0
-- Moderate Engagement: Engagement rate between 6.0 and 7.9 (inclusive)
-- Low Engagement: Engagement rate less than 6.0

SELECT actor,
    character,
    CASE
        WHEN engagement_rate >= 8.0 THEN 'High Engagement'
        WHEN engagement_rate BETWEEN 6.0 AND 7.9 THEN 'Moderate Engagement'
        WHEN engagement_rate < 6.0 THEN 'Low Engagement'
    END AS engagement_category
FROM marvel_avengers
WHERE platform IN ('TikTok', 'Instagram');

-- Using ELSE Clause with CASE Statement
-- When none of the previous conditions match, we can use the ELSE clause to provide a default value.

-- For characters with 700,000 or more followers, label them as "Highly Popular."
-- For characters with followers between 300,000 and 699,999, label them as "Moderately Popular."
-- For characters with fewer than 300,000 followers, label them as "Less Popular."

SELECT
  character,
  superhero_alias,
  platform,
  CASE
    WHEN followers >= 700000 THEN 'Highly Popular'
    WHEN followers BETWEEN 300000 AND 699999 THEN 'Moderately Popular'
    ELSE 'Less Popular'
  END AS popularity_category
FROM marvel_avengers;

SELECT 
  actor,
  character,
  platform,
  avg_likes,
  CASE  
      WHEN avg_likes >= 15000 THEN 'Super Likes'
      WHEN avg_likes BETWEEN 5000 AND 14999 THEN 'Good Likes'
      WHEN avg_likes < 5000 THEN 'Low Likes'
  END AS likes_category
FROM marvel_avengers
ORDER BY avg_likes DESC;