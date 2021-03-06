USE [master]
GO
/****** Object:  Database [MusicService]    Script Date: 6/27/2022 1:55:23 AM ******/
CREATE DATABASE [MusicService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MusicService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusicService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MusicService_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MusicService] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicService] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicService] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MusicService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicService] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MusicService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicService] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicService] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MusicService] SET  MULTI_USER 
GO
ALTER DATABASE [MusicService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicService] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MusicService] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MusicService] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MusicService] SET QUERY_STORE = OFF
GO
USE [MusicService]
GO
/****** Object:  Table [dbo].[favs]    Script Date: 6/27/2022 1:55:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favs](
	[userID] [int] NULL,
	[songID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[songs]    Script Date: 6/27/2022 1:55:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songs](
	[songID] [int] IDENTITY(1,1) NOT NULL,
	[songName] [varchar](50) NULL,
	[artist] [varchar](50) NULL,
	[link] [varchar](100) NULL,
	[cover] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[songID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/27/2022 1:55:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NULL,
	[email] [varchar](30) NULL,
	[username] [varchar](16) NULL,
	[password] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[favs] ([userID], [songID]) VALUES (1, 1)
INSERT [dbo].[favs] ([userID], [songID]) VALUES (1, 3)
INSERT [dbo].[favs] ([userID], [songID]) VALUES (1, 9)
INSERT [dbo].[favs] ([userID], [songID]) VALUES (1, 13)
INSERT [dbo].[favs] ([userID], [songID]) VALUES (5, 1)
GO
SET IDENTITY_INSERT [dbo].[songs] ON 

INSERT [dbo].[songs] ([songID], [songName], [artist], [link], [cover]) VALUES (1, N'Invisible beauty', N'N/A', N'source/invisible_beauty.mp3', N'resources/lis.png')
INSERT [dbo].[songs] ([songID], [songName], [artist], [link], [cover]) VALUES (2, N'Just Stay', N'N/A', N'source/just_stay.mp3', N'resources/anh1.jpg')
INSERT [dbo].[songs] ([songID], [songName], [artist], [link], [cover]) VALUES (3, N'Liquid Time', N'N/A', N'source/liquid_time.mp3', N'resources/lis2.jpg')
INSERT [dbo].[songs] ([songID], [songName], [artist], [link], [cover]) VALUES (5, N'Silky Smooth', N'N/A', N'source/silky_smooth.mp3', N'resources/blue.jpg')
INSERT [dbo].[songs] ([songID], [songName], [artist], [link], [cover]) VALUES (6, N'Que Tune', N'Thuy Chi', N'source/quetune.mp3', N'resources/bg1.png')
INSERT [dbo].[songs] ([songID], [songName], [artist], [link], [cover]) VALUES (7, N'Elevator music', N'Unknown', N'source/elevator.mp3', N'resources/ele.png')
INSERT [dbo].[songs] ([songID], [songName], [artist], [link], [cover]) VALUES (8, N'Bingchilling', N'John Xina', N'source/cina.mp3', N'resources/cina.png')
INSERT [dbo].[songs] ([songID], [songName], [artist], [link], [cover]) VALUES (9, N'Tieng cho sua', N'Doge', N'source/bark.mp3', N'resources/doge.jpg')
INSERT [dbo].[songs] ([songID], [songName], [artist], [link], [cover]) VALUES (10, N'Golden wind', N'JJBA', N'source/golden.mp3', N'resources/416.jpg')
INSERT [dbo].[songs] ([songID], [songName], [artist], [link], [cover]) VALUES (11, N'Summer smile', N'NCS', N'source/summer.mp3', N'resources/beach.jpg')
INSERT [dbo].[songs] ([songID], [songName], [artist], [link], [cover]) VALUES (12, N'Sad Violin', N'Unknown', N'source/sad.mp3', N'resources/sad.jpg')
INSERT [dbo].[songs] ([songID], [songName], [artist], [link], [cover]) VALUES (13, N'Super idol hardstyle', N'Super idol', N'source/superidol.mp3', N'resources/sp.jpg')
SET IDENTITY_INSERT [dbo].[songs] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userID], [name], [email], [username], [password]) VALUES (1, N'Quan Le', N'dsda@ssas', N'quan123', N'123')
INSERT [dbo].[users] ([userID], [name], [email], [username], [password]) VALUES (2, N'warrior1671 Le q', N'dsa@gmail.com', N'admin', N'123')
INSERT [dbo].[users] ([userID], [name], [email], [username], [password]) VALUES (3, N'dsadas', N'dasasd@fds', N'quan167', N'123')
INSERT [dbo].[users] ([userID], [name], [email], [username], [password]) VALUES (4, N'dfsa gfsdfdss ', N'rweq7rqe@dfsa', N'asd123', N'123')
INSERT [dbo].[users] ([userID], [name], [email], [username], [password]) VALUES (5, N'quan anh le', N'quan@123', N'abc123', N'123')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[favs]  WITH CHECK ADD FOREIGN KEY([songID])
REFERENCES [dbo].[songs] ([songID])
GO
ALTER TABLE [dbo].[favs]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
USE [master]
GO
ALTER DATABASE [MusicService] SET  READ_WRITE 
GO
