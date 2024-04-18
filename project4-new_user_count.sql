/*
Q3: How many new users register per month?
*/

SELECT 
	FORMAT(registered_date, 'yyyy-MM') as year_month,
	count(distinct userID) as new_user
FROM platform_user
GROUP BY FORMAT(registered_date, 'yyyy-MM')
ORDER BY year_month