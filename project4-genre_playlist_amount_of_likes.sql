
/*
Q5: How does the addition of songs from different genres impact the overall likability of a playlist?
*/

SELECT 
	p.playlistID,
	p.playlist_name,
	count(s.songID) as number_of_song,
	count(g.genreID) as number_of_genre,
	sum(p.amount_of_likes) as playlist_likes
FROM Song as s
	LEFT JOIN Genre as g on g.genreID = s.genreID
	LEFT JOIN Playlist as p on p.userID = s.userID
GROUP BY p.playlistID, p.playlist_name
ORDER BY playlist_likes