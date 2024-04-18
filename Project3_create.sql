
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