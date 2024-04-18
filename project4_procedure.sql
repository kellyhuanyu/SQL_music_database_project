
/*
Write the SQL to create a stored procedure to INSERT a row in the Song table.
USE THROW error-handling if variable is NULL.
*/

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