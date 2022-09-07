-- Query to fetch the best performing day of 2021 in terms of total daily revenue
SELECT CAST(issue_date AS DATE) FROM payments WHERE issue_date > "2020-12-30" AND issue_date <= "2021-12-31" GROUP BY CAST(issue_date AS DATE) ORDER BY SUM(amount) desc LIMIT 1;
