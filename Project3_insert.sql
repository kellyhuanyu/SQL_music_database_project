
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