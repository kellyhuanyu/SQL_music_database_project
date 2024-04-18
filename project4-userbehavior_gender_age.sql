
/*
Q1: How does user engagement vary based on gender and age group?
How do different gender and age groups like different songs, genres, and artists?
*/
SELECT
	u.gender,
	CASE
		WHEN YEAR(GETDATE()) - YEAR(u.birth_date) BETWEEN 18 AND 24 THEN '18-24'
        WHEN YEAR(GETDATE()) - YEAR(u.birth_date) BETWEEN 25 AND 34 THEN '25-34'
		WHEN YEAR(GETDATE()) - YEAR(u.birth_date) BETWEEN 35 AND 44 THEN '35-44'
        ELSE '45+'
    END AS age_group,
	s.song_name,
	sum(s.amount_of_streaming) as song_streaming_amount,
	g.genre_name,
	a.artist_name,
	sum(a.amount_of_followers) as artist_following_count
FROM platform_user as u
	LEFT JOIN Song as s on u.userID = s.userID
	LEFT JOIN Genre as g on g.genreID = s.genreID
	LEFT JOIN Artist as a on a.albumID = s.albumID
	LEFT JOIN Country as c on c.countryID = a.countryID
GROUP BY u.gender, 
	CASE
		WHEN YEAR(GETDATE()) - YEAR(u.birth_date) BETWEEN 18 AND 24 THEN '18-24'
        WHEN YEAR(GETDATE()) - YEAR(u.birth_date) BETWEEN 25 AND 34 THEN '25-34'
		WHEN YEAR(GETDATE()) - YEAR(u.birth_date) BETWEEN 35 AND 44 THEN '35-44'
        ELSE '45+'
    END,
	s.song_name,
	g.genre_name,
	a.artist_name
ORDER BY song_streaming_amount desc, 
	artist_following_count desc