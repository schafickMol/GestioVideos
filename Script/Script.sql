USE [master]
GO
/****** Object:  Database [Gestion_Videos]    Script Date: 19/5/2024 23:08:07 ******/
CREATE DATABASE [Gestion_Videos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gestion_Videos', FILENAME = N'D:\SQLData\Gestion_Videos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gestion_Videos_log', FILENAME = N'D:\SQLData\Gestion_Videos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Gestion_Videos] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gestion_Videos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gestion_Videos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gestion_Videos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gestion_Videos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gestion_Videos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gestion_Videos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gestion_Videos] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Gestion_Videos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gestion_Videos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gestion_Videos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gestion_Videos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gestion_Videos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gestion_Videos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gestion_Videos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gestion_Videos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gestion_Videos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Gestion_Videos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gestion_Videos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gestion_Videos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gestion_Videos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gestion_Videos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gestion_Videos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gestion_Videos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gestion_Videos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Gestion_Videos] SET  MULTI_USER 
GO
ALTER DATABASE [Gestion_Videos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gestion_Videos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gestion_Videos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gestion_Videos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gestion_Videos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Gestion_Videos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Gestion_Videos] SET QUERY_STORE = ON
GO
ALTER DATABASE [Gestion_Videos] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Gestion_Videos]
GO
/****** Object:  Table [dbo].[Playlist]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlist](
	[PlaylistID] [int] IDENTITY(1,1) NOT NULL,
	[YoutuberID] [int] NULL,
	[Title] [nvarchar](100) NULL,
	[PlaylistDescription] [nvarchar](255) NULL,
	[CreationDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[VideoID] [int] IDENTITY(1,1) NOT NULL,
	[PlaylistID] [int] NULL,
	[VideoTitle] [nvarchar](100) NULL,
	[UploadDate] [date] NULL,
	[Duration] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Youtuber]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Youtuber](
	[YoutuberID] [int] IDENTITY(1,1) NOT NULL,
	[YoutuberName] [nvarchar](100) NULL,
	[ChannelName] [nvarchar](100) NULL,
	[Country] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[YoutuberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Playlist] ON 

INSERT [dbo].[Playlist] ([PlaylistID], [YoutuberID], [Title], [PlaylistDescription], [CreationDate]) VALUES (1, 1, N'gamgan Style', N'papi tiene estilo gangan', CAST(N'2024-05-20' AS Date))
INSERT [dbo].[Playlist] ([PlaylistID], [YoutuberID], [Title], [PlaylistDescription], [CreationDate]) VALUES (2, 1, N'pechurina con papa', N'Comida tipica peruana', CAST(N'2024-05-20' AS Date))
SET IDENTITY_INSERT [dbo].[Playlist] OFF
GO
SET IDENTITY_INSERT [dbo].[Youtuber] ON 

INSERT [dbo].[Youtuber] ([YoutuberID], [YoutuberName], [ChannelName], [Country]) VALUES (1, N'JuegaManolo', N'ManoloJuegos', N'Vietnam')
SET IDENTITY_INSERT [dbo].[Youtuber] OFF
GO
ALTER TABLE [dbo].[Playlist]  WITH CHECK ADD FOREIGN KEY([YoutuberID])
REFERENCES [dbo].[Youtuber] ([YoutuberID])
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[Playlist] ([PlaylistID])
GO
/****** Object:  StoredProcedure [dbo].[spPlaylist_Delete]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPlaylist_Delete]
    @PlaylistID INT
AS
BEGIN
    DELETE FROM Playlist
    WHERE PlaylistID = @PlaylistID;
END;
GO
/****** Object:  StoredProcedure [dbo].[spPlaylist_GetAll]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPlaylist_GetAll]
AS
BEGIN
    SELECT * FROM Playlist;
END;
GO
/****** Object:  StoredProcedure [dbo].[spPlaylist_GetByID]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPlaylist_GetByID]
    @PlaylistID INT
AS
BEGIN
    SELECT * FROM Playlist
    WHERE PlaylistID = @PlaylistID;
END;

GO
/****** Object:  StoredProcedure [dbo].[spPlaylist_Insert]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPlaylist_Insert]
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
GO
/****** Object:  StoredProcedure [dbo].[spPlaylist_Update]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPlaylist_Update]
    @PlaylistID INT,
    @YoutuberID INT,
    @Title NVARCHAR(100),
    @PlaylistDescription NVARCHAR(255),
    @CreationDate DATE
AS
BEGIN
    UPDATE Playlist
    SET YoutuberID = @YoutuberID, Title = @Title, PlaylistDescription = @PlaylistDescription, CreationDate = @CreationDate
    WHERE PlaylistID = @PlaylistID;
END;
GO
/****** Object:  StoredProcedure [dbo].[spVideo_Delete]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVideo_Delete]
    @VideoID INT
AS
BEGIN
    DELETE FROM Video
    WHERE VideoID = @VideoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[spVideo_GetAll]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVideo_GetAll]
AS
BEGIN
    SELECT * FROM Video;
END;
GO
/****** Object:  StoredProcedure [dbo].[spVideo_GetByID]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spVideo_GetByID]
    @VideoID INT
AS
BEGIN
    SELECT * FROM Video
    WHERE VideoID = @VideoID;
END;

GO
/****** Object:  StoredProcedure [dbo].[spVideo_Insert]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVideo_Insert]
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
GO
/****** Object:  StoredProcedure [dbo].[spVideo_Update]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVideo_Update]
    @VideoID INT,
    @PlaylistID INT,
    @VideoTitle NVARCHAR(100),
    @UploadDate DATE,
    @Duration INT
AS
BEGIN
    UPDATE Video
    SET PlaylistID = @PlaylistID, VideoTitle = @VideoTitle, UploadDate = @UploadDate, Duration = @Duration
    WHERE VideoID = @VideoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[spVideos_GetByPlaylistID]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVideos_GetByPlaylistID]
    @PlaylistID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM Video
    WHERE PlaylistID = @PlaylistID;
END
GO
/****** Object:  StoredProcedure [dbo].[spYoutuber_Delete]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spYoutuber_Delete]
    @YoutuberID INT
AS
BEGIN
    DELETE FROM Youtuber
    WHERE YoutuberID = @YoutuberID;
END;
GO
/****** Object:  StoredProcedure [dbo].[spYoutuber_GetAll]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spYoutuber_GetAll]
AS
BEGIN
    SELECT * FROM Youtuber;
END;
GO
/****** Object:  StoredProcedure [dbo].[spYoutuber_GetByID]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spYoutuber_GetByID]
    @YoutuberID INT
AS
BEGIN
    SELECT * FROM Youtuber
    WHERE YoutuberID = @YoutuberID;
END;

GO
/****** Object:  StoredProcedure [dbo].[spYoutuber_Insert]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spYoutuber_Insert]
    @YoutuberName NVARCHAR(100),
    @ChannelName NVARCHAR(100),
    @Country NVARCHAR(50)
AS
BEGIN
    INSERT INTO Youtuber (YoutuberName, ChannelName, Country)
    VALUES (@YoutuberName, @ChannelName, @Country);
END;
GO
/****** Object:  StoredProcedure [dbo].[spYoutuber_Update]    Script Date: 19/5/2024 23:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spYoutuber_Update]
    @YoutuberID INT,
    @YoutuberName NVARCHAR(100),
    @ChannelName NVARCHAR(100),
    @Country NVARCHAR(50)
AS
BEGIN
    UPDATE Youtuber
    SET YoutuberName = @YoutuberName, ChannelName = @ChannelName, Country = @Country
    WHERE YoutuberID = @YoutuberID;
END;
GO
USE [master]
GO
ALTER DATABASE [Gestion_Videos] SET  READ_WRITE 
GO
