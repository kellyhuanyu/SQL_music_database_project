## Goal of SQL Database Project - Music Trend Analysis
1. SDLC in database management -The process of database development goes through phases from conceptual design to implementation and maintenance of the database.
2. Queries based on the business requirement

## Business Requirement
### Business description
Database to store and track countries, artists, producers, albums, songs, genres, playlist. 
With this database, we can track the relationships between different entities to create better playlists and recommendations.

### Rules
1. One country can have many artists and producers
2. One artist can have many albums
3. Many producers can produce many albums
4. Many albums and have many songs
5. Multiple different songs can belong to many different genres
6. Multiple users can listen to many different songs
7. Multiple users can listen to many different playlists
8. Multiple songs can be in many different playlists

## Entity Relationship Diagram
![543 Project drawio (2)](https://github.com/kellyhuanyu/SQL_music_database_project/assets/105426157/54e794d6-f117-4470-ba9c-3f87efcb7a03)

## SDLC - Create Tables and Attributes
Create all the tables and insert the attributes defined in the data model.

### Create
```
-- create country table
CREATE TABLE Country(
	countryID INT PRIMARY KEY,
	country_name NVARCHAR(255)
	)

-- create producer table
CREATE TABLE Producer(
	producerID INT PRIMARY KEY,
	countryID INT FOREIGN KEY REFERENCES Country(countryID),
	producer_name NVARCHAR(255)
	)

-- create album table
CREATE TABLE Album(
	albumID INT PRIMARY KEY,
	producerID INT FOREIGN KEY REFERENCES Producer(producerID),
	album_name NVARCHAR(255),
	amount_of_streaming INT
	)

-- create genre table
CREATE TABLE Genre(
	genreID INT PRIMARY KEY,
	genre_name NVARCHAR(255)
	)

-- create user table
CREATE TABLE platform_user(
	userID INT PRIMARY KEY,
	username NVARCHAR(255),
	gender NVARCHAR(50),
	birth_date DATETIME,
	registered_date DATETIME
	)

-- create playlist table
CREATE TABLE Playlist(
	playlistID INT PRIMARY KEY,
	userID INT FOREIGN KEY REFERENCES platform_user(userID),
	playlist_name NVARCHAR(255),
	amount_of_likes INT
	)

-- create song table
CREATE TABLE Song(
	songID INT PRIMARY KEY,
	playlistID INT FOREIGN KEY REFERENCES Playlist(playlistID),
	genreID INT FOREIGN KEY REFERENCES Genre(genreID),
	userID INT FOREIGN KEY REFERENCES platform_user(userID),
	albumID INT FOREIGN KEY REFERENCES Album(albumID),
	song_name NVARCHAR(255),
	published_date DATETIME,
	amount_of_streaming INT,
	amount_of_adding_playlist INT,
	amount_of_likes INT
	)

-- create artist table
CREATE TABLE Artist(
	artistID INT PRIMARY KEY,
	albumID INT FOREIGN KEY REFERENCES Album(albumID),
	countryID INT FOREIGN KEY REFERENCES Country(countryID),
	artist_name NVARCHAR(255),
	amount_of_streaming INT,
	amount_of_followers INT,
	)
```
### Insert
```
USE [MyDB2]
GO

-- create country columns
SET IDENTITY_INSERT Country ON
GO
INSERT INTO Country(countryID,country_name) VALUES
 (1,'Taiwan')
,(2,'Japan')
,(3,'United States')
,(4,'England')
,(5,'Korea');
SET IDENTITY_INSERT Country OFF

-- create producer table
SET IDENTITY_INSERT Producer ON
GO
INSERT INTO Producer(producerID,countryID,producer_name) VALUES
 (1,1,'Franklyn Lamb')
,(2,1,'Guy Duran')
,(3,1,'Shari Joseph')
,(4,2,'Rochelle Keith')
,(5,2,'Jae Williams')
,(6,2,'Bradly Pearson')
,(7,3,'Mary Whitney')
,(8,3,'Chang Parker')
,(9,3,'Kenton Burnett')
,(10,4,'Kathy Cervantes')
,(11,4,'Leanna Davies')
,(12,4,'Aileen Hernandez')
,(13,5,'Lesley Benitez')
,(14,5,'Benny Perkins')
,(15,5,'Julianne Bonilla');
SET IDENTITY_INSERT Producer OFF


-- create album table
SET IDENTITY_INSERT Album ON
GO
INSERT INTO Album(albumID,producerID,album_name,amount_of_streaming) VALUES
 (1,1,'Experience Required',316068)
,(2,2,'Commercial Break',2275483)
,(3,3,'No Ambition',1222247)
,(4,4,'Cat Killed Curiosity',1004392)
,(5,5,'Eye Of The Camera',3101946)
,(6,6,'Bursted Bubble',2006567)
,(7,7,'Sweetbitter',9315883)
,(8,8,'Crossing A Bridge',9009369)
,(9,9,'Cattle In The Sky',5445453)
,(10,10,'Blinded By Fame',1324013)
,(11,11,'Forever Alone',6509249)
,(12,12,'Dread And Horror',1802994)
,(13,13,'For Two Songs',7256902)
,(14,14,'Final Draft',9077372)
,(15,15,'Library Of Liberty',393748);
SET IDENTITY_INSERT Album OFF

-- create genre table
SET IDENTITY_INSERT Genre ON
GO
INSERT INTO Genre(genreID,genre_name) VALUES
 (1,'Pop')
,(2,'Rock')
,(3,'Country')
,(4,'Folk')
,(5,'Eletronic');
SET IDENTITY_INSERT Genre OFF

-- create user table
SET IDENTITY_INSERT platform_user ON
GO
INSERT INTO platform_user(userID,username,gender,birth_date,registered_date) VALUES
 (1,'Elsa','female','1984-05-16','2021-02-26')
,(2,'Kelly','female','1990-10-26','2010-04-05')
,(3,'Eric','male','1993-01-17','2010-11-20')
,(4,'John','male','1994-03-16','2012-05-21')
,(5,'Derek','male','1994-04-24','2012-09-04')
,(6,'Howard','male','1995-08-01','2014-06-15')
,(7,'Stacy','female','1997-11-16','2014-07-17')
,(8,'Mary','female','1999-06-27','2014-08-12')
,(9,'Ellin','female','1999-08-27','2015-09-25')
,(10,'Jimmy','male','2000-10-01','2016-03-14')
,(11,'Jeremy','male','2002-10-31','2018-09-26')
,(12,'Celine','female','2007-02-15','2018-10-21')
,(13,'Melissa','female','2010-10-26','2019-05-21')
,(14,'Elva','female','2002-12-01','2019-12-04')
,(15,'Jack','male','2003-11-14','2018-12-25');
SET IDENTITY_INSERT platform_user OFF

-- create playlist table
SET IDENTITY_INSERT Playlist ON
GO
INSERT INTO Playlist(playlistID,userID,playlist_name,amount_of_likes) VALUES
 (1,1,'Shake Your Body',7362149)
,(2,2,'Arcade Anthems',6580280)
,(3,3,'Tearful Melodies',7938396)
,(4,4,'Cozy Bedtime Bliss',2974062)
,(5,5,'Decades Of Soundtracks',2439988)
,(6,6,'Relaxing Sunday',9918727)
,(7,7,'These Violent Delights',1141978)
,(8,8,'Timeless Soulful Beats',8913280)
,(9,9,'Mixed Emotions',4066518)
,(10,10,'Emotional Euphoria',7397441)
,(11,11,'Game Boost',3769127)
,(12,12,'Latin Pop Fever',7808982)
,(13,13,'Party Anthems',3368171)
,(14,14,'Happy Hits Collection',7058327)
,(15,15,'Rock and Roll',8229344);
SET IDENTITY_INSERT Playlist OFF


-- create song table
SET IDENTITY_INSERT Song ON
GO
INSERT INTO Song(songID,playlistID,genreID,userID,albumID,song_name,published_date,amount_of_streaming,amount_of_adding_playlist,amount_of_likes) VALUES
 (1,1,5,1,1,'Creative Horizon','1968-10-16',16344130,184395,9058040)
,(2,2,1,2,2,'Back Jungle','1973-03-26',84709910,785830,7977422)
,(3,3,1,3,3,'Hymn Of Snow','1976-02-11',4270109,374605,6456423)
,(4,4,4,4,4,'That Warms Your Endless Adventures','1976-05-18',3267031,441771,5253466)
,(5,5,3,5,5,'Oh My Pretty Worries','1977-02-01',47289780,578953,286267)
,(6,6,4,6,6,'Is This Skies','1980-12-23',53036626,373010,8895690)
,(7,7,2,7,7,'Mad Hatter''s Spirit','1985-06-21',94388842,413033,594995)
,(8,8,4,8,8,'True Heart','1987-10-13',48340263,137419,2160984)
,(9,9,3,9,9,'Still Need Sun','1990-10-15',34375059,478150,8013079)
,(10,10,2,10,10,'Unlikely Machine','1998-05-09',93708701,185602,398755)
,(11,11,5,11,11,'Chicago Night','2001-08-31',20525696,297864,2595346)
,(12,12,1,12,12,'Saving Fusion','2005-02-19',24389222,509418,126161)
,(13,13,5,13,13,'Think Of Paradise','2012-03-21',74658426,836252,6614356)
,(14,14,3,14,14,'Blissful Look','2015-03-25',203949,548725,1873747)
,(15,15,2,15,15,'Worshipful Nirvana','2018-05-24',5983074,213355,4215519);
SET IDENTITY_INSERT Song OFF


-- create artist table
SET IDENTITY_INSERT Artist ON
GO
INSERT INTO Artist(artistID,albumID,countryID,artist_name,amount_of_streaming,amount_of_followers) VALUES
 (1,1,1,'Marcella Terry',548415568,861783)
,(2,2,1,'Morgan Burch',281876393,655782)
,(3,3,1,'Claire Arroyo',71778199,193169)
,(4,4,2,'Colin Lopez',786208182,742020)
,(5,5,2,'Valentine Rivera',866453412,682627)
,(6,6,2,'Janine Moyer',778817780,149512)
,(7,7,3,'Nicole Wheeler',151896774,369804)
,(8,8,3,'Michael Sloan',948694330,617054)
,(9,9,3,'Ester Simon',781165152,563524)
,(10,10,4,'Anastasia Gilmore',449871390,98097)
,(11,11,4,'Donovan Rose',429451550,543766)
,(12,12,4,'Debbie Bowman',313889533,399511)
,(13,13,5,'Bernie Ross',204887037,188917)
,(14,14,5,'Alexis Bradley',171182601,318734)
,(15,15,5,'Russel Santos',893089110,410753);
SET IDENTITY_INSERT Artist OFF
```
## Queries

Q1: How does user engagement vary based on gender and age group?
How do different gender and age groups like different songs, genres, and artists?
```
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
```

Q2. Identify the most streamed songs from artists in a specific genre.
```
SELECT a.artist_name,
	s.song_name,
	sum(s.amount_of_streaming) as streaming_count,
	g.genre_name
FROM Song as s 
	LEFT JOIN Artist as a on a.albumID = s.albumID
	LEFT JOIN Genre as g on g.genreID = s.genreID
GROUP BY a.artist_name, s.song_name, g.genre_name
ORDER BY streaming_count desc
```

Q3. How many new users register per month?
```
SELECT 
	FORMAT(registered_date, 'yyyy-MM') as year_month,
	count(distinct userID) as new_user
FROM platform_user
GROUP BY FORMAT(registered_date, 'yyyy-MM')
ORDER BY year_month
```

Q4. What are the most popular genres among users in a specific age group or gender?
```
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
```

Q5: How does the addition of songs from different genres impact the overall likability of a playlist?
```
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
```

Q5. Procedure to create a stored procedure to INSERT a row in the Song table.
```
CREATE PROCEDURE InsertSong
(@songID INT,
 @song_name VARCHAR(75),
 @published_date DATE,
 @amount_of_streaming INT,
 @amount_of_adding_playlist INT,
 @amount_of_likes INT,
 @playlistID INT,
 @genreID INT,
 @userID INT,
 @albumID INT
 )
AS
BEGIN
    IF @songID IS NULL OR @song_name IS NULL OR @published_date IS NULL 
		OR @playlistID IS NULL OR @genreID IS NULL or @userID IS NULL or @albumID IS NULL
    BEGIN
        THROW 50000, 'Error: Variables must have non-NULL values.', 1;
    END

    INSERT INTO Song (songID, song_name, published_date, amount_of_streaming, 
					amount_of_adding_playlist, amount_of_likes, playlistID, genreID, userID, albumID)
    VALUES (@songID, @song_name, @published_date, @amount_of_streaming, @amount_of_adding_playlist, 
			@amount_of_likes, @playlistID, @genreID, @userID, @albumID);
END;


/*
Write the SQL to create a stored procedure to INSERT and new row into Song that calls three nested stored procedures. 
*/
CREATE PROCEDURE GetSongID
    @song_name NVARCHAR(50),
    @published_date DATE,
	@songID INT output
AS
BEGIN
	DECLARE @Status1 int=0;

    BEGIN TRY
		IF @Status1 and @song_name and @published_date is not null
			BEGIN
				SELECT @songID = songID
				FROM Song
				WHERE song_name = @song_name AND published_date = @published_date;
			SET @Status1=1
			END
		ELSE
			RAISERROR('There is no match', 15,1)
	END TRY
	BEGIN CATCH
		SET @Status1=-1
			END CATCH
	RETURN @Status1;
END
GO

CREATE PROCEDURE GetAlbumID
    @album_name NVARCHAR(50),
	@albumID INT output
AS
BEGIN
	DECLARE @Status1 int=0;

    BEGIN TRY
		IF @Status1 and @album_name is not null
			BEGIN
				SELECT @albumID = albumID
				FROM Album
				WHERE album_name = @album_name;
			SET @Status1=1
			END
		ELSE
			RAISERROR('There is no match', 15,1)
	END TRY
	BEGIN CATCH
		SET @Status1=-1
			END CATCH
	RETURN @Status1;
END
GO

CREATE PROCEDURE GetPlaylistID
    @playlist_name NVARCHAR(50),
	@playlistID INT output
AS
BEGIN
	DECLARE @Status1 int=0;

    BEGIN TRY
		IF @Status1 and @playlist_name is not null
			BEGIN
				SELECT @playlistID = playlistID
				FROM Playlist
				WHERE playlist_name = @playlist_name;
			SET @Status1=1
			END
		ELSE
			RAISERROR('There is no match', 15,1)
	END TRY
	BEGIN CATCH
		SET @Status1=-1
			END CATCH
	RETURN @Status1;
END
GO

CREATE PROCEDURE InsertSongID
	@song_name NVARCHAR(50),
	@album_name NVARCHAR(50),
	@playlist_name NVARCHAR(50),
	@NewSongID INT output
AS
  BEGIN
    DECLARE @Status int=0
	DECLARE @songID int=NULL
	DECLARE @albumID int=NULL
	DECLARE @playlistID int=NULL
	
	BEGIN TRY
		BEGIN 
			EXEC @Status = GetSongID
				 @song_name = song_name,
				 @published_date = published_date,
				 @songID = @NewSongID output
			IF @Status = -1
				RAISERROR(50001, 15, 1, 'There is no match!')
		END
  		BEGIN 
			EXEC @Status = GetAlbumID
				 @album_name = album_name,
				 @albumID = @albumID output
			IF @Status = -1
				RAISERROR(50001, 15, 1, 'There is no match!')
		END
		BEGIN 
			EXEC @Status = GetPlaylistID
				@playlist_name = playlist_name,
				@playlistID = @playlistID output
			IF @Status = -1
				RAISERROR(50001, 15, 1, 'There is no match!')
		END

	BEGIN
		BEGIN TRAN;
			INSERT INTO Song(songID, albumID, playlistID)
				VALUES (@songID, @albumID, @playlistID)
			COMMIT TRAN;
			SET @NewSongID = @@IDENTITY
			SET @STATUS = +1;
			PRINT('Successfully inserted ID')
	END
ELSE
	RAISERROR(50003, 15, 1, 'Information already existed!')
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0 ROLLBACK TRAN;

  SET @Status = -1;
	DECLARE @ErrorMessage NVARCHAR(4000);
	DECLARE @ErrorSeverity INT;
	DECLARE @ErrorState INT;
  
  SELECT
	@ErrorMessage = ERROR_MESSAGE(),
	@ErrorSeverity = ERROR_SEVERITY(),
	@ErrorState = ERROR_STATE();
  
  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
END CATCH
END
GO
```


















