/*markdown
## 1587. Bank Account Summary II [Easy]

- Write a solution to report the name and balance of users with a balance higher than 10000. The balance of an account is equal to the sum of the amounts of all transactions involving that account.
*/

-- my solution
select name, balance from 
(select u.name, sum(t.amount) as balance from users u join transactions t
on u.account = t.account
group by u.name) as sub_query
where balance > 10000;

-- works in mysql
SELECT u.name, SUM(t.amount) AS balance 
FROM users u 
JOIN transactions t ON u.account = t.account
GROUP BY u.name
HAVING balance > 10000;


/*markdown
- The error "column 'balance' does not exist" occurs because aliases defined in the SELECT clause cannot be directly referenced in the HAVING clause in PostgreSQL.

- In PostgreSQL, the HAVING clause is used to filter rows after the GROUP BY clause has been applied. The problem is that column aliases, such as balance, are not recognized in the HAVING clause because PostgreSQL processes the HAVING clause before it processes the SELECT clause.

- To address this issue, you can either repeat the expression used in the SELECT clause in the HAVING clause, or you can use a subquery to alias the aggregate expression and then filter the result. Here's how you can do it:

- Option 1.: Repeat the expression in the HAVING clause

- Option 2: Use a subquery to alias the aggregate expression
*/

SELECT u.name, SUM(t.amount) AS balance 
FROM users u 
JOIN transactions t ON u.account = t.account
GROUP BY u.name
HAVING SUM(t.amount) > 10000;
