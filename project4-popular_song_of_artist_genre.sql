
/*
Q2: Identify the most streamed songs from artists in a specific genre
*/
SELECT a.artist_name,
	s.song_name,
	sum(s.amount_of_streaming) as streaming_count,
	g.genre_name
FROM Song as s 
	LEFT JOIN Artist as a on a.albumID = s.albumID
	LEFT JOIN Genre as g on g.genreID = s.genreID
GROUP BY a.artist_name, s.song_name, g.genre_name
ORDER BY streaming_count desc