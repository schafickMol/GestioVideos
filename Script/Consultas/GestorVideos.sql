USE Gestion_Videos

DROP PROCEDURE spPlaylist_Insert

CREATE PROCEDURE spPlaylist_Insert
@YoutuberID INT,
 @Title NVARCHAR(200),
    @CreationDate DATE,
    @PlaylistDescription NVARCHAR(100)  
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Youtuber WHERE YoutuberID = @YoutuberID)
    BEGIN
        INSERT INTO Playlist (YoutuberID, Title, PlaylistDescription, CreationDate)
        VALUES (@YoutuberID, @Title, @PlaylistDescription, @CreationDate );
END
   ELSE
    BEGIN
        RAISERROR ('YoutuberID not found in Youtuber table.', 16, 1);
    END
END

DROP PROCEDURE spVideo_Insert

CREATE PROCEDURE spVideo_Insert
@PlaylistID INT,
@VideoTitle NVARCHAR(200),
    @UploadDate DATE,
    @Duration INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Playlist WHERE PlaylistID = @PlaylistID)
    BEGIN
        INSERT INTO Video (PlaylistID, VideoTitle, UploadDate, Duration)
        VALUES (@PlaylistID, @VideoTitle, @UploadDate,@Duration );
    END
    ELSE
    BEGIN
        RAISERROR ('PlaylistID not found in Playlist table.', 16, 1);
    END
END

CREATE PROCEDURE spVideos_GetByPlaylistID
    @PlaylistID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM Video
    WHERE PlaylistID = @PlaylistID;
END
GO

SELECT *FROM Youtuber