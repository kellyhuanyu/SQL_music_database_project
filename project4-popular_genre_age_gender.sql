
/*
Q4: What are the most popular genres among users in a specific age group or gender?
*/
SELECT 
	u.gender,
	CASE
		WHEN YEAR(GETDATE()) - YEAR(u.birth_date) BETWEEN 18 AND 24 THEN '18-24'
        WHEN YEAR(GETDATE()) - YEAR(u.birth_date) BETWEEN 25 AND 34 THEN '25-34'
		WHEN YEAR(GETDATE()) - YEAR(u.birth_date) BETWEEN 35 AND 44 THEN '35-44'
        ELSE '45+'
    END AS age_group,
	g.genre_name,
	sum(s.amount_of_streaming) as streaming_count
FROM Genre as g 
	LEFT JOIN Song as s on s.genreID = g.genreID
	LEFT JOIN platform_user as u on u.userID = s.userID
GROUP BY u.gender,
		CASE
			WHEN YEAR(GETDATE()) - YEAR(u.birth_date) BETWEEN 18 AND 24 THEN '18-24'
			WHEN YEAR(GETDATE()) - YEAR(u.birth_date) BETWEEN 25 AND 34 THEN '25-34'
			WHEN YEAR(GETDATE()) - YEAR(u.birth_date) BETWEEN 35 AND 44 THEN '35-44'
			ELSE '45+'
		END,
		g.genre_name
ORDER BY streaming_count desc