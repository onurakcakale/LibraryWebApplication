USE [master]
GO
/****** Object:  Database [libraryApp]    Script Date: 12.09.2023 20:40:32 ******/
CREATE DATABASE [libraryApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'libraryApp', FILENAME = N'C:\Users\PROTEK\libraryApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'libraryApp_log', FILENAME = N'C:\Users\PROTEK\libraryApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [libraryApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [libraryApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [libraryApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [libraryApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [libraryApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [libraryApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [libraryApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [libraryApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [libraryApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [libraryApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [libraryApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [libraryApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [libraryApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [libraryApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [libraryApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [libraryApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [libraryApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [libraryApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [libraryApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [libraryApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [libraryApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [libraryApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [libraryApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [libraryApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [libraryApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [libraryApp] SET  MULTI_USER 
GO
ALTER DATABASE [libraryApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [libraryApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [libraryApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [libraryApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [libraryApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [libraryApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [libraryApp] SET QUERY_STORE = OFF
GO
USE [libraryApp]
GO
/****** Object:  Table [dbo].[books]    Script Date: 12.09.2023 20:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[book_image] [nvarchar](max) NOT NULL,
	[book_name] [nvarchar](max) NOT NULL,
	[book_writer] [nvarchar](max) NOT NULL,
	[record_state] [bit] NOT NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lend]    Script Date: 12.09.2023 20:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lend](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[book_id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[surname] [nvarchar](max) NOT NULL,
	[lend_date] [date] NOT NULL,
	[return_date] [date] NOT NULL,
 CONSTRAINT [PK_lend] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[books] ON 

INSERT [dbo].[books] ([Id], [book_image], [book_name], [book_writer], [record_state]) VALUES (7, N'tutunamayanlar.jpg', N'Tutunamayanlar', N'Oğuz Atay', 1)
INSERT [dbo].[books] ([Id], [book_image], [book_name], [book_writer], [record_state]) VALUES (8, N'sucveceza.jpg', N'Suç ve Ceza', N'Fyodor Dostoyevski', 1)
INSERT [dbo].[books] ([Id], [book_image], [book_name], [book_writer], [record_state]) VALUES (9, N'olasılıksız-1.jpg', N'Olasılıksız', N'Adam Fawer', 0)
INSERT [dbo].[books] ([Id], [book_image], [book_name], [book_writer], [record_state]) VALUES (10, N'da-vinci-sifresi.jpg', N'Da Vinci Şifresi', N'Dan Brown', 1)
INSERT [dbo].[books] ([Id], [book_image], [book_name], [book_writer], [record_state]) VALUES (12, N'kuyucakli-yusuf.jpg', N'Kuyucaklı Yusuf', N'Sabahattin Ali', 0)
SET IDENTITY_INSERT [dbo].[books] OFF
GO
SET IDENTITY_INSERT [dbo].[lend] ON 

INSERT [dbo].[lend] ([Id], [book_id], [name], [surname], [lend_date], [return_date]) VALUES (5, 9, N'Onur', N'Akçakale', CAST(N'2023-09-15' AS Date), CAST(N'2023-09-27' AS Date))
INSERT [dbo].[lend] ([Id], [book_id], [name], [surname], [lend_date], [return_date]) VALUES (7, 12, N'Muhammed Onur', N'Akçakale', CAST(N'2023-09-13' AS Date), CAST(N'2023-09-30' AS Date))
SET IDENTITY_INSERT [dbo].[lend] OFF
GO
ALTER TABLE [dbo].[lend]  WITH CHECK ADD  CONSTRAINT [FK_lend_books] FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([Id])
GO
ALTER TABLE [dbo].[lend] CHECK CONSTRAINT [FK_lend_books]
GO
USE [master]
GO
ALTER DATABASE [libraryApp] SET  READ_WRITE 
GO
