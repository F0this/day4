USE [master]
GO
/****** Object:  Database [BasketballSystem]    Script Date: 28.03.2022 18:36:46 ******/
CREATE DATABASE [BasketballSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BasketballSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BasketballSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BasketballSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BasketballSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BasketballSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BasketballSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BasketballSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BasketballSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BasketballSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BasketballSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BasketballSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [BasketballSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BasketballSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BasketballSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BasketballSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BasketballSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BasketballSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BasketballSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BasketballSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BasketballSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BasketballSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BasketballSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BasketballSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BasketballSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BasketballSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BasketballSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BasketballSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BasketballSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BasketballSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BasketballSystem] SET  MULTI_USER 
GO
ALTER DATABASE [BasketballSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BasketballSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BasketballSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BasketballSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BasketballSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BasketballSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BasketballSystem] SET QUERY_STORE = OFF
GO
USE [BasketballSystem]
GO
/****** Object:  Table [dbo].[ActionType]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionType](
	[ActionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ActionType] PRIMARY KEY CLUSTERED 
(
	[ActionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conference]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conference](
	[Conference_id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Conference] PRIMARY KEY CLUSTERED 
(
	[Conference_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryCode] [char](3) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Division]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Division](
	[DivisionId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Conference_id] [int] NOT NULL,
 CONSTRAINT [PK_Division] PRIMARY KEY CLUSTERED 
(
	[DivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Match]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Match](
	[MatchId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Team_Away_Score] [int] NOT NULL,
	[Team_Home_Score] [int] NOT NULL,
	[Location] [varchar](200) NOT NULL,
	[StatusId] [int] NOT NULL,
	[SeasonId] [int] NOT NULL,
	[Team_Away] [int] NOT NULL,
	[Team_Home] [int] NOT NULL,
	[MatchTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Match] PRIMARY KEY CLUSTERED 
(
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchLog]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchLog](
	[IdMatch] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[OccurTime] [varchar](10) NOT NULL,
	[Remark] [varchar](300) NULL,
	[ActionType] [int] NOT NULL,
	[MatchId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
	[PlayerId] [int] NOT NULL,
 CONSTRAINT [PK_MatchLog] PRIMARY KEY CLUSTERED 
(
	[IdMatch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchType]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchType](
	[MatchTypeId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MatchType] PRIMARY KEY CLUSTERED 
(
	[MatchTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[PlayerId] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Height] [decimal](10, 2) NOT NULL,
	[Weight] [decimal](10, 2) NOT NULL,
	[ShirtNumber] [varchar](10) NOT NULL,
	[Email] [varchar](50) NULL,
	[TeamId] [int] NOT NULL,
	[CountryCode] [char](3) NOT NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerInTeam]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerInTeam](
	[PlayerInTeamId] [int] NOT NULL,
	[ShirtNumber] [int] NOT NULL,
	[Salary] [decimal](10, 2) NOT NULL,
	[SeasonId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
	[PlayerId] [int] NOT NULL,
 CONSTRAINT [PK_PlayerInTeam] PRIMARY KEY CLUSTERED 
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerStatistics]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerStatistics](
	[IdStatistics] [int] NOT NULL,
	[IsStarting] [int] NOT NULL,
	[Min] [decimal](10, 2) NOT NULL,
	[Point] [int] NOT NULL,
	[Assist] [int] NOT NULL,
	[FieldGoalMade] [int] NOT NULL,
	[FieldGoalMissed] [int] NOT NULL,
	[C3pointFieldGoalMade] [int] NOT NULL,
	[C3pointFieldGoalMissed] [int] NOT NULL,
	[FreeThrowMade] [int] NOT NULL,
	[FreeThrowMissed] [int] NOT NULL,
	[Rebound] [int] NOT NULL,
	[OFFR] [int] NOT NULL,
	[DFFR] [int] NOT NULL,
	[Steal] [int] NOT NULL,
	[Block] [int] NOT NULL,
	[Turnover] [int] NOT NULL,
	[Foul] [int] NOT NULL,
	[PlayerId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
	[MatchId] [int] NOT NULL,
 CONSTRAINT [PK_PlayerStatistics] PRIMARY KEY CLUSTERED 
(
	[IdStatistics] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PositionName]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PositionName](
	[PositionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PositionOfPlayer]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PositionOfPlayer](
	[PositionId] [int] NOT NULL,
	[PlayerId] [int] NOT NULL,
 CONSTRAINT [PK_PositionOfPlayer] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC,
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostSeason]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostSeason](
	[PostSeasonId] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[SeasonId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_PostSeason] PRIMARY KEY CLUSTERED 
(
	[PostSeasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Season]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Season](
	[SeasonId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Season] PRIMARY KEY CLUSTERED 
(
	[SeasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TeamId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Abbr] [varchar](50) NOT NULL,
	[Logo] [varchar](100) NOT NULL,
	[DivisionId] [int] NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28.03.2022 18:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[JobNumber] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[JobNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Conference] ([Conference_id], [Name]) VALUES (1, N'Западная')
INSERT [dbo].[Conference] ([Conference_id], [Name]) VALUES (2, N'Восточная')
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'ARG', N'Argentina')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'AT ', N'Austria')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'AUS', N'Australia')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'BI ', N'Bosnia')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'BIH', N'Bosnia Herzegovina')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'BR ', N'Brazil')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'BS ', N'Bahamas')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'CA ', N'Canada')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'CG ', N'Congo')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'CH ', N'Switzerland')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'CM ', N'Cameroon')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'COD', N'Democratic Republic of Congo')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'DE ', N'Germany')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'DO ', N'The Dominican Republic')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'ES ', N'Spain')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'FR ', N'France')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'GE ', N'Georgia')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'GR ', N'Greece')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'HRV', N'Croatia')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'HT ', N'Haiti')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'IL ', N'Israel')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'IT ', N'Italy')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'LT ', N'Lithuania')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'LV ', N'Latvia')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'MLI', N'Mali')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'MNE', N'Montenegro')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'NGA', N'Nigeria')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'NZ ', N'New Zealand')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'PUR', N'Puerto Rico')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'RU ', N'Russia')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'SEN', N'Senegal')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'SI ', N'Slovenia')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'SRB', N'Serbia')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'SSD', N'South Sudan')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'TN ', N'Tunisia')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'TR ', N'Turkey')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'UA ', N'Ukraine')
INSERT [dbo].[Country] ([CountryCode], [CountryName]) VALUES (N'US ', N'America')
GO
INSERT [dbo].[Division] ([DivisionId], [Name], [Conference_id]) VALUES (1, N'Southeastern', 1)
INSERT [dbo].[Division] ([DivisionId], [Name], [Conference_id]) VALUES (2, N'Centra', 1)
INSERT [dbo].[Division] ([DivisionId], [Name], [Conference_id]) VALUES (3, N'Atlantic', 1)
INSERT [dbo].[Division] ([DivisionId], [Name], [Conference_id]) VALUES (4, N'Southwestern', 2)
INSERT [dbo].[Division] ([DivisionId], [Name], [Conference_id]) VALUES (5, N'Northwestern', 2)
INSERT [dbo].[Division] ([DivisionId], [Name], [Conference_id]) VALUES (6, N'Pacific', 2)
GO
SET IDENTITY_INSERT [dbo].[Player] ON 

INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (601, N'Barkley', N'Ross', N'M', CAST(196.00 AS Decimal(10, 2)), CAST(112.00 AS Decimal(10, 2)), N'18', N'lshj2824@163.com', 1, N'AUS')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (602, N'Dembl', N'Moussa', N'M', CAST(172.00 AS Decimal(10, 2)), CAST(99.00 AS Decimal(10, 2)), N'47', N'jianp_yao@live.cn', 2, N'ARG')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (603, N'Alaba', N'David', N'M', CAST(193.00 AS Decimal(10, 2)), CAST(122.00 AS Decimal(10, 2)), N'17', N'lili20266@163.com', 3, N'AT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (604, N'Hummels', N'Mats', N'M', CAST(173.00 AS Decimal(10, 2)), CAST(145.00 AS Decimal(10, 2)), N'34', N'tjsdianxiandianlan@163.com', 4, N'AUS')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (605, N'Soares', N'Cdric', N'M', CAST(176.00 AS Decimal(10, 2)), CAST(162.00 AS Decimal(10, 2)), N'79', N'fkunlee@hotmail.com', 5, N'BI ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (606, N'Cotterill', N'David', N'M', CAST(192.00 AS Decimal(10, 2)), CAST(94.00 AS Decimal(10, 2)), N'35', N'Support@eworldship.com', 6, N'BIH')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (607, N'Schpf', N'Alessandro', N'M', CAST(196.00 AS Decimal(10, 2)), CAST(133.00 AS Decimal(10, 2)), N'50', N'1121657066@qq.com', 7, N'BR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (608, N'Babacan', N'Volkan', N'M', CAST(174.00 AS Decimal(10, 2)), CAST(72.00 AS Decimal(10, 2)), N'86', N'222Leifeng@163.com', 8, N'BS ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (609, N'Rog', N'Marko', N'M', CAST(177.00 AS Decimal(10, 2)), CAST(74.00 AS Decimal(10, 2)), N'73', N'chinawutong@126.com', 9, N'CA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (610, N'Lou', N'Peter', N'M', CAST(187.00 AS Decimal(10, 2)), CAST(91.00 AS Decimal(10, 2)), N'46', N'bjwlslyxgs@3158.com', 10, N'CG ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (611, N'Neil', N'Ralap', N'M', CAST(196.00 AS Decimal(10, 2)), CAST(125.00 AS Decimal(10, 2)), N'72', N'inf996@163.com', 11, N'CH ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (612, N'Sampson', N'Boyd', N'M', CAST(174.00 AS Decimal(10, 2)), CAST(168.00 AS Decimal(10, 2)), N'6', N'bjyslkjsyxgs@3158.com', 12, N'CM ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (613, N'Willie', N'Corey', N'M', CAST(178.00 AS Decimal(10, 2)), CAST(79.00 AS Decimal(10, 2)), N'32', N'wangxin@will-tech.com.cn', 13, N'COD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (614, N'Jay', N'Gavin', N'M', CAST(193.00 AS Decimal(10, 2)), CAST(138.00 AS Decimal(10, 2)), N'20', N'fiona_yangyi@yahoo.com.cn', 14, N'DE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (615, N'Coleman', N'Samus', N'M', CAST(190.00 AS Decimal(10, 2)), CAST(152.00 AS Decimal(10, 2)), N'30', N'fecljp@126.com', 15, N'DO ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (616, N'Sigursson', N'Gylfi', N'M', CAST(190.00 AS Decimal(10, 2)), CAST(152.00 AS Decimal(10, 2)), N'69', N'cash163@gmail.com', 16, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (617, N'Schweinsteiger', N'Bastian', N'M', CAST(193.00 AS Decimal(10, 2)), CAST(155.00 AS Decimal(10, 2)), N'29', N'dlsjw@yahoo.com.cn', 17, N'FR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (618, N'Baszczykowski', N'Jakub', N'M', CAST(187.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), N'73', N'81246866@163.com', 18, N'GE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (619, N'Moutinho', N'Joo', N'M', CAST(193.00 AS Decimal(10, 2)), CAST(159.00 AS Decimal(10, 2)), N'77', N'bnsd820@126.com', 19, N'GR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (620, N'Stoch', N'Miroslav', N'M', CAST(178.00 AS Decimal(10, 2)), CAST(118.00 AS Decimal(10, 2)), N'30', N'yzm54188@yahoo.com.cn', 20, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (621, N'Quaresma', N'Ricardo', N'M', CAST(188.00 AS Decimal(10, 2)), CAST(145.00 AS Decimal(10, 2)), N'40', N'webmaster@@baidajob.com', 22, N'HT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (622, N'Tufan', N'Ozan', N'M', CAST(179.00 AS Decimal(10, 2)), CAST(70.00 AS Decimal(10, 2)), N'85', N'bdchina@bigdutchman.com', 23, N'IL ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (623, N'Memushaj', N'Ledian', N'M', CAST(173.00 AS Decimal(10, 2)), CAST(127.00 AS Decimal(10, 2)), N'59', N'zhaoshang@net114.com', 24, N'IT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (624, N'Louis', N'Phil', N'M', CAST(198.00 AS Decimal(10, 2)), CAST(79.00 AS Decimal(10, 2)), N'60', N'872779240@qq.com', 25, N'LT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (625, N'Nelson', N'Randolph', N'M', CAST(187.00 AS Decimal(10, 2)), CAST(169.00 AS Decimal(10, 2)), N'17', N'6723809d@qq.com', 26, N'LV ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (626, N'Samuel', N'Bradley', N'M', CAST(191.00 AS Decimal(10, 2)), CAST(77.00 AS Decimal(10, 2)), N'5', N'yadasteel@163.com', 27, N'MLI')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (627, N'Winfred', N'Cornelius', N'M', CAST(189.00 AS Decimal(10, 2)), CAST(89.00 AS Decimal(10, 2)), N'51', N'wch@public.tpt.tj.cn', 28, N'MNE')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (628, N'Jeff', N'Gene', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(79.00 AS Decimal(10, 2)), N'13', N'www.dgysdhs@gs.com', 29, N'NGA')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (629, N'Fellaini', N'Marouane', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(84.00 AS Decimal(10, 2)), N'26', N'db.ys@163.com', 30, N'NZ ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (630, N'Lloris', N'Hugo', N'M', CAST(190.00 AS Decimal(10, 2)), CAST(73.00 AS Decimal(10, 2)), N'33', N'lianhuiduo@gmail.com', 1, N'PUR')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (631, N'Kroos', N'Toni', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(103.00 AS Decimal(10, 2)), N'0', N'airui@china-iris.com', 2, N'RU ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (632, N'ahin', N'Nuri', N'M', CAST(176.00 AS Decimal(10, 2)), CAST(129.00 AS Decimal(10, 2)), N'45', N'qinlonltm@163.com', 3, N'SEN')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (633, N'der', N'Phil', N'M', CAST(179.00 AS Decimal(10, 2)), CAST(168.00 AS Decimal(10, 2)), N'6', N'cncta@cncta.org', 4, N'SI ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (634, N'Lila', N'Andi', N'M', CAST(193.00 AS Decimal(10, 2)), CAST(139.00 AS Decimal(10, 2)), N'1', N'qiaomaicha@@@sina.com', 5, N'SRB')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (635, N'Carvalho', N'William', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(118.00 AS Decimal(10, 2)), N'83', N'aixin_buckwheat@yahoo.com.cn', 6, N'SSD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (636, N'zyakup', N'Ouzhan', N'M', CAST(176.00 AS Decimal(10, 2)), CAST(129.00 AS Decimal(10, 2)), N'5', N'paws@enorth.com.cn', 7, N'TN ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (637, N'Pereira', N'Danilo', N'M', CAST(198.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), N'48', N'XF6831533@@126.com', 8, N'TR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (638, N'Lucien', N'Philip', N'M', CAST(190.00 AS Decimal(10, 2)), CAST(147.00 AS Decimal(10, 2)), N'68', N'qiye@ocasia.com', 9, N'UA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (639, N'Newman', N'Raymond', N'M', CAST(190.00 AS Decimal(10, 2)), CAST(87.00 AS Decimal(10, 2)), N'78', N'ap@hbyuansheng.com', 10, N'US ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (640, N'Sandy', N'Brady', N'M', CAST(175.00 AS Decimal(10, 2)), CAST(146.00 AS Decimal(10, 2)), N'80', N'aanshengwuliu@163.com', 11, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (641, N'Winston', N'Cornell', N'M', CAST(172.00 AS Decimal(10, 2)), CAST(102.00 AS Decimal(10, 2)), N'14', N'luosi@luosi.com', 12, N'FR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (642, N'Jeffrey', N'Geoffrey', N'M', CAST(200.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), N'17', N'ievezl@163.com', 13, N'GE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (643, N'Stones', N'John', N'M', CAST(174.00 AS Decimal(10, 2)), CAST(138.00 AS Decimal(10, 2)), N'67', N'wjy35858@yahoo.com', 14, N'GR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (644, N'Walker', N'Kyle', N'M', CAST(181.00 AS Decimal(10, 2)), CAST(117.00 AS Decimal(10, 2)), N'77', N'kefu@tjpinsou.com', 15, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (645, N'Arnautovi', N'Marko', N'M', CAST(171.00 AS Decimal(10, 2)), CAST(117.00 AS Decimal(10, 2)), N'66', N'pdt@pdt-china.com', 16, N'HT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (646, N'Piszczek', N'ukasz', N'M', CAST(196.00 AS Decimal(10, 2)), CAST(118.00 AS Decimal(10, 2)), N'24', N'aobosports@126.com', 17, N'IL ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (647, N'Halldrsson', N'Hannesr', N'M', CAST(178.00 AS Decimal(10, 2)), CAST(148.00 AS Decimal(10, 2)), N'84', N'99@alllike.com.cn', 18, N'IT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (648, N'Balaj', N'Bekim', N'M', CAST(200.00 AS Decimal(10, 2)), CAST(159.00 AS Decimal(10, 2)), N'45', N'lisa@yongyefurniture.com', 19, N'LT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (649, N'Dier', N'Eric', N'M', CAST(172.00 AS Decimal(10, 2)), CAST(141.00 AS Decimal(10, 2)), N'49', N'asgrounp_hr@126.com', 20, N'LV ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (650, N'Berg', N'Marcus', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(71.00 AS Decimal(10, 2)), N'68', N'aoyuksin.cn@163.com', 21, N'MLI')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (651, N'Kovalenko', N'Viktor', N'M', CAST(171.00 AS Decimal(10, 2)), CAST(150.00 AS Decimal(10, 2)), N'4', N'tjalb_1988@126.com', 22, N'MNE')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (652, N'Luther', N'Porter', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(123.00 AS Decimal(10, 2)), N'45', N'sunbao@188.com', 23, N'NGA')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (653, N'Nicholas', N'Aldrich', N'M', CAST(187.00 AS Decimal(10, 2)), CAST(125.00 AS Decimal(10, 2)), N'80', N'bjzhst@126.com', 24, N'NZ ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (654, N'Saxon', N'Brandon', N'M', CAST(183.00 AS Decimal(10, 2)), CAST(154.00 AS Decimal(10, 2)), N'71', N'saran1314@163.com', 25, N'PUR')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (655, N'Woodrow', N'Curitis', N'M', CAST(195.00 AS Decimal(10, 2)), CAST(86.00 AS Decimal(10, 2)), N'67', N'jianlishe@163.com', 26, N'RU ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (656, N'Jeremy', N'George', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(139.00 AS Decimal(10, 2)), N'29', N'kf@ebtow.com', 27, N'SEN')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (657, N'Duffy', N'Shane', N'M', CAST(186.00 AS Decimal(10, 2)), CAST(85.00 AS Decimal(10, 2)), N'3', N'chenli-ml967@163.com', 28, N'SI ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (658, N'Hughes', N'Aaron', N'M', CAST(197.00 AS Decimal(10, 2)), CAST(73.00 AS Decimal(10, 2)), N'66', N'cnzxncom@163.com', 29, N'SRB')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (659, N'De Sciglio', N'Mattia', N'M', CAST(176.00 AS Decimal(10, 2)), CAST(124.00 AS Decimal(10, 2)), N'58', N'fefenga@mail.sy.ln.cn', 30, N'SSD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (660, N'Buffon', N'Gianluigi', N'M', CAST(181.00 AS Decimal(10, 2)), CAST(149.00 AS Decimal(10, 2)), N'20', N'yuxin@agri.gov.cn', 1, N'TN ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (661, N'S?varsson', N'Birkir Mr', N'M', CAST(172.00 AS Decimal(10, 2)), CAST(97.00 AS Decimal(10, 2)), N'75', N'candokf@justcando.com.cn', 3, N'TR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (662, N'Vargi', N'Ivan', N'M', CAST(198.00 AS Decimal(10, 2)), CAST(125.00 AS Decimal(10, 2)), N'52', N'byly@byly.com.cn', 4, N'UA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (663, N'Mrio', N'Joo', N'M', CAST(197.00 AS Decimal(10, 2)), CAST(165.00 AS Decimal(10, 2)), N'20', N'wxc_6208@@@com.cn', 5, N'HT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (664, N'Hinterseer', N'Lukas', N'M', CAST(170.00 AS Decimal(10, 2)), CAST(170.00 AS Decimal(10, 2)), N'45', N'cjbbyey668@sohu.com', 6, N'IL ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (665, N'Traustason', N'Arnr Ingvi', N'M', CAST(176.00 AS Decimal(10, 2)), CAST(102.00 AS Decimal(10, 2)), N'63', N'yk.wang@t-zcargo.com.cn', 7, N'IT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (666, N'Lyle', N'Prescott', N'M', CAST(179.00 AS Decimal(10, 2)), CAST(77.00 AS Decimal(10, 2)), N'36', N'picknike24k@gmail.com', 8, N'LT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (667, N'Nick', N'Alexander', N'M', CAST(193.00 AS Decimal(10, 2)), CAST(160.00 AS Decimal(10, 2)), N'53', N'lcyx0219@sina.com', 9, N'LV ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (668, N'Scott', N'Brian', N'M', CAST(183.00 AS Decimal(10, 2)), CAST(164.00 AS Decimal(10, 2)), N'12', N'xiejun@panasia.cn', 10, N'MLI')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (669, N'Wordsworth', N'Cyril', N'M', CAST(184.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), N'76', N'summer@qdbonwei.com.cn', 11, N'MNE')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (670, N'Jerome', N'Gerald', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(106.00 AS Decimal(10, 2)), N'50', N'syshuanglong@hotmail.com', 12, N'NGA')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (671, N'McGinn', N'Niall', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(162.00 AS Decimal(10, 2)), N'60', N'baoer120@sina.com', 13, N'NZ ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (672, N'Cabaye', N'Yohan', N'M', CAST(200.00 AS Decimal(10, 2)), CAST(170.00 AS Decimal(10, 2)), N'8', N'c3990@21cn.com', 14, N'PUR')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (673, N'El Shaarawy', N'Stephan', N'M', CAST(177.00 AS Decimal(10, 2)), CAST(127.00 AS Decimal(10, 2)), N'11', N'616340065@qq.com', 15, N'RU ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (674, N'Chiellini', N'Giorgio', N'M', CAST(198.00 AS Decimal(10, 2)), CAST(133.00 AS Decimal(10, 2)), N'63', N'bhzbcbb@gmail.com', 16, N'SEN')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (675, N'rnason', N'Kri', N'M', CAST(172.00 AS Decimal(10, 2)), CAST(128.00 AS Decimal(10, 2)), N'70', N'ruirui12@@sina.com', 17, N'SI ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (676, N'Kirly', N'Gbor', N'M', CAST(172.00 AS Decimal(10, 2)), CAST(160.00 AS Decimal(10, 2)), N'45', N'ahtauwu@126.com', 18, N'SRB')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (677, N'Hennessey', N'Wayne', N'M', CAST(171.00 AS Decimal(10, 2)), CAST(128.00 AS Decimal(10, 2)), N'42', N'zhaofx@cmes.org', 19, N'SSD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (678, N'Magnsson', N'Hrur Bjrgvin', N'M', CAST(180.00 AS Decimal(10, 2)), CAST(73.00 AS Decimal(10, 2)), N'45', N'haoxing@haoxing.com', 20, N'TN ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (679, N'Kujovi', N'Emir', N'M', CAST(195.00 AS Decimal(10, 2)), CAST(164.00 AS Decimal(10, 2)), N'27', N'854328295@qq.com', 21, N'TR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (680, N'Lyndon', N'Primo', N'M', CAST(192.00 AS Decimal(10, 2)), CAST(146.00 AS Decimal(10, 2)), N'60', N'info@21wh.com', 22, N'UA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (681, N'Nigel', N'Alfred', N'M', CAST(190.00 AS Decimal(10, 2)), CAST(169.00 AS Decimal(10, 2)), N'33', N'tjtuliao12@163.com', 23, N'US ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (682, N'Sean', N'Broderick', N'M', CAST(174.00 AS Decimal(10, 2)), CAST(123.00 AS Decimal(10, 2)), N'77', N'cmwmold@126.com', 24, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (683, N'Wright', N'Dana', N'M', CAST(181.00 AS Decimal(10, 2)), CAST(111.00 AS Decimal(10, 2)), N'33', N'caoxueai@163.com', 25, N'FR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (684, N'Jerry', N'Gilbert', N'M', CAST(177.00 AS Decimal(10, 2)), CAST(93.00 AS Decimal(10, 2)), N'35', N'fly@vip.sina.com', 26, N'GE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (685, N'Magennis', N'Josh', N'M', CAST(180.00 AS Decimal(10, 2)), CAST(126.00 AS Decimal(10, 2)), N'76', N'lzc@tjvanke.com', 27, N'GR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (686, N'Sissoko', N'Moussa', N'M', CAST(190.00 AS Decimal(10, 2)), CAST(101.00 AS Decimal(10, 2)), N'87', N'michael@yinglan.com', 28, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (687, N'Griezmann', N'Antoine', N'M', CAST(189.00 AS Decimal(10, 2)), CAST(113.00 AS Decimal(10, 2)), N'29', N'600645dsh@163.com', 29, N'BI ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (688, N'Ogbonna', N'Angelo', N'M', CAST(193.00 AS Decimal(10, 2)), CAST(165.00 AS Decimal(10, 2)), N'18', N'zx@zxshare.com', 30, N'BIH')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (689, N'Sklason', N'Ari Freyr', N'M', CAST(196.00 AS Decimal(10, 2)), CAST(140.00 AS Decimal(10, 2)), N'15', N'a@allasky.com', 1, N'BR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (690, N'Gulcsi', N'Pter', N'M', CAST(177.00 AS Decimal(10, 2)), CAST(158.00 AS Decimal(10, 2)), N'47', N'ruland@jsmail.com.cn', 2, N'BS ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (691, N'Edwards', N'David', N'M', CAST(189.00 AS Decimal(10, 2)), CAST(146.00 AS Decimal(10, 2)), N'75', N'47707724@qq.com', 3, N'CA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (692, N'Bvarsson', N'Jn Dai', N'M', CAST(188.00 AS Decimal(10, 2)), CAST(125.00 AS Decimal(10, 2)), N'13', N'vivian.21053@163.com', 4, N'CG ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (693, N'Sigurjnsson', N'Rnar', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(96.00 AS Decimal(10, 2)), N'38', N'fubang@bjfubang.com', 5, N'CH ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (694, N'Lynn', N'Quentin', N'M', CAST(199.00 AS Decimal(10, 2)), CAST(119.00 AS Decimal(10, 2)), N'29', N'yangchao666@126.com', 6, N'CM ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (695, N'Noah', N'Alger', N'M', CAST(181.00 AS Decimal(10, 2)), CAST(136.00 AS Decimal(10, 2)), N'46', N'dingding.0226@163.com', 7, N'COD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (696, N'Sebastian', N'Barton', N'M', CAST(188.00 AS Decimal(10, 2)), CAST(79.00 AS Decimal(10, 2)), N'67', N'wzj280@126.com', 8, N'DE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (697, N'Wythe', N'Daniel', N'M', CAST(186.00 AS Decimal(10, 2)), CAST(114.00 AS Decimal(10, 2)), N'2', N'jsf@jsx.com.cn', 9, N'DO ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (698, N'Jesse', N'Giles', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(140.00 AS Decimal(10, 2)), N'0', N'rack-tianj333in@163.com', 10, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (699, N'de Gea', N'David', N'M', CAST(180.00 AS Decimal(10, 2)), CAST(124.00 AS Decimal(10, 2)), N'46', N'rack-tianjin@126.com', 11, N'FR ')
GO
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (700, N'Szczsny', N'Wojciech', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(126.00 AS Decimal(10, 2)), N'6', N'jiweixian163@sina.com', 12, N'GE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (701, N'Seferovi', N'Haris', N'M', CAST(197.00 AS Decimal(10, 2)), CAST(135.00 AS Decimal(10, 2)), N'62', N'hr@honkonlaser.com', 13, N'GR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (702, N'Pogba', N'Paul', N'M', CAST(171.00 AS Decimal(10, 2)), CAST(117.00 AS Decimal(10, 2)), N'59', N'webmaster@huangye.sh.cn', 14, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (703, N'Hallfresson', N'Emil', N'M', CAST(188.00 AS Decimal(10, 2)), CAST(93.00 AS Decimal(10, 2)), N'35', N'shhxgypd@126.com', 15, N'HT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (704, N'Kdr', N'Tams', N'M', CAST(198.00 AS Decimal(10, 2)), CAST(74.00 AS Decimal(10, 2)), N'82', N'soladms@163.com', 16, N'IL ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (705, N'Keogh', N'Richard', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(164.00 AS Decimal(10, 2)), N'56', N'tsysw.12315@yahoo.com', 17, N'IT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (706, N'Williams', N'George', N'M', CAST(186.00 AS Decimal(10, 2)), CAST(76.00 AS Decimal(10, 2)), N'32', N'service@086jc.com', 18, N'LT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (707, N'Lewicki', N'Oscar', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(136.00 AS Decimal(10, 2)), N'6', N'jetrun@live.com', 19, N'LV ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (708, N'Magee', N'Quennel', N'M', CAST(190.00 AS Decimal(10, 2)), CAST(168.00 AS Decimal(10, 2)), N'54', N'wxp@riyuejin.cn', 20, N'MLI')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (709, N'Noel', N'Allen', N'M', CAST(196.00 AS Decimal(10, 2)), CAST(83.00 AS Decimal(10, 2)), N'26', N'ythl39000210@126.com', 21, N'MNE')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (710, N'Sid', N'Basil', N'M', CAST(180.00 AS Decimal(10, 2)), CAST(144.00 AS Decimal(10, 2)), N'61', N'aoli-dress@126.com', 22, N'NGA')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (711, N'Xavier', N'Darcy', N'M', CAST(175.00 AS Decimal(10, 2)), CAST(141.00 AS Decimal(10, 2)), N'60', N'lfnswky@163.com', 23, N'NZ ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (712, N'Jim', N'Glenn', N'M', CAST(190.00 AS Decimal(10, 2)), CAST(123.00 AS Decimal(10, 2)), N'55', N'hr@zitoo.com.cn', 24, N'TN ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (713, N'Evra', N'Patrice', N'M', CAST(189.00 AS Decimal(10, 2)), CAST(81.00 AS Decimal(10, 2)), N'46', N'Ellen@e-jiankun.com', 25, N'TR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (714, N'Sagna', N'Bacary', N'M', CAST(180.00 AS Decimal(10, 2)), CAST(136.00 AS Decimal(10, 2)), N'49', N'dljs@263.net', 26, N'UA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (715, N'Gignac', N'Andr-Pierre', N'M', CAST(187.00 AS Decimal(10, 2)), CAST(93.00 AS Decimal(10, 2)), N'54', N'lglglg721@163.com', 27, N'US ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (716, N'Barzagli', N'Andrea', N'M', CAST(184.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), N'9', N'service@umetal.com', 28, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (717, N'Gumundsson', N'Jhann Berg', N'M', CAST(171.00 AS Decimal(10, 2)), CAST(127.00 AS Decimal(10, 2)), N'52', N'xsdpx@yahoo.cn', 29, N'FR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (718, N'Guzmics', N'Richrd', N'M', CAST(184.00 AS Decimal(10, 2)), CAST(115.00 AS Decimal(10, 2)), N'42', N'info@tegent.com.cn', 30, N'GE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (719, N'Bellern', N'Hctor', N'M', CAST(181.00 AS Decimal(10, 2)), CAST(169.00 AS Decimal(10, 2)), N'15', N'gl8457@126.com', 1, N'GR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (720, N'Jnsson', N'Ingvar', N'M', CAST(170.00 AS Decimal(10, 2)), CAST(148.00 AS Decimal(10, 2)), N'18', N'kf3@jiaomai.com', 2, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (721, N'Hauksson', N'Haukur', N'M', CAST(173.00 AS Decimal(10, 2)), CAST(141.00 AS Decimal(10, 2)), N'87', N'ea@eaonline.com', 3, N'BI ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (722, N'Malcolm', N'Quincy', N'M', CAST(191.00 AS Decimal(10, 2)), CAST(169.00 AS Decimal(10, 2)), N'27', N'sales@cxtoy.com', 4, N'BIH')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (723, N'Norman', N'Alston', N'M', CAST(198.00 AS Decimal(10, 2)), CAST(168.00 AS Decimal(10, 2)), N'24', N'88hueifa@163.com', 5, N'BR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (724, N'Sidney', N'Beacher', N'M', CAST(197.00 AS Decimal(10, 2)), CAST(109.00 AS Decimal(10, 2)), N'20', N'consultora@conecplan.com', 6, N'BS ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (725, N'Yale', N'Darnell', N'M', CAST(170.00 AS Decimal(10, 2)), CAST(163.00 AS Decimal(10, 2)), N'32', N'sales@haishunpackaging.com', 7, N'CA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (726, N'Jo', N'Godfery', N'M', CAST(188.00 AS Decimal(10, 2)), CAST(96.00 AS Decimal(10, 2)), N'58', N'rexuefeng@163.net', 8, N'CG ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (727, N'Evans', N'Jonny', N'M', CAST(187.00 AS Decimal(10, 2)), CAST(107.00 AS Decimal(10, 2)), N'3', N'yu@hotmail.com', 9, N'CH ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (728, N'Vermaelen', N'Thomas', N'M', CAST(192.00 AS Decimal(10, 2)), CAST(123.00 AS Decimal(10, 2)), N'39', N'user@ahzp.com', 10, N'CM ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (729, N'Payet', N'Dimitri', N'M', CAST(200.00 AS Decimal(10, 2)), CAST(125.00 AS Decimal(10, 2)), N'71', N'kefu@xhgx.cn', 11, N'COD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (730, N'Bonucci', N'Leonardo', N'M', CAST(198.00 AS Decimal(10, 2)), CAST(170.00 AS Decimal(10, 2)), N'21', N'xscbgs@suda.edu.cn', 12, N'DE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (731, N'Bjarnason', N'Birkir', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(72.00 AS Decimal(10, 2)), N'0', N'caorong_1979@163.com', 13, N'DO ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (732, N'Dzsudzsk', N'Balzs', N'M', CAST(179.00 AS Decimal(10, 2)), CAST(157.00 AS Decimal(10, 2)), N'31', N'shyu@shshuangyu.com', 14, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (733, N'Murphy', N'Daryl', N'M', CAST(193.00 AS Decimal(10, 2)), CAST(133.00 AS Decimal(10, 2)), N'33', N'web@chinachugui.com', 15, N'FR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (734, N'Lafferty', N'Kyle', N'M', CAST(173.00 AS Decimal(10, 2)), CAST(158.00 AS Decimal(10, 2)), N'82', N'sx@songxindianqi.com', 16, N'GE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (735, N'zbayrakl', N'ener', N'M', CAST(191.00 AS Decimal(10, 2)), CAST(117.00 AS Decimal(10, 2)), N'85', N'huixuan@vip.163.com', 17, N'GR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (736, N'Mandel', N'Quinn', N'M', CAST(180.00 AS Decimal(10, 2)), CAST(89.00 AS Decimal(10, 2)), N'19', N'shanghai@onkyochina.com', 18, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (737, N'Norton', N'Alva', N'M', CAST(195.00 AS Decimal(10, 2)), CAST(103.00 AS Decimal(10, 2)), N'70', N'xxx@xixixish.com', 19, N'HT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (738, N'Silvester', N'Beau', N'M', CAST(175.00 AS Decimal(10, 2)), CAST(148.00 AS Decimal(10, 2)), N'59', N'fado1319@hotmail.com', 20, N'IL ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (739, N'Yehudi', N'Darren', N'M', CAST(177.00 AS Decimal(10, 2)), CAST(141.00 AS Decimal(10, 2)), N'16', N'webmaster@ccctg.com', 21, N'IT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (740, N'John', N'Gordon', N'M', CAST(183.00 AS Decimal(10, 2)), CAST(140.00 AS Decimal(10, 2)), N'40', N'ythl3210@163.com', 22, N'GE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (741, N'Rooney', N'Wayne', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), N'86', N'sourcing@jswb.com', 23, N'GR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (742, N'Koscielny', N'Laurent', N'M', CAST(193.00 AS Decimal(10, 2)), CAST(129.00 AS Decimal(10, 2)), N'28', N'wsjhw@126.com', 24, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (743, N'Mandanda', N'Steve', N'M', CAST(194.00 AS Decimal(10, 2)), CAST(140.00 AS Decimal(10, 2)), N'44', N'cpp@cpp114.com', 25, N'BI ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (744, N'Lichtsteiner', N'Stephan', N'M', CAST(177.00 AS Decimal(10, 2)), CAST(142.00 AS Decimal(10, 2)), N'51', N'gongkong@guanyuan.com.cn', 26, N'BIH')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (745, N'Gudjohnsen', N'Eidur', N'M', CAST(191.00 AS Decimal(10, 2)), CAST(170.00 AS Decimal(10, 2)), N'47', N'Shwohing@Sh163.net', 27, N'BR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (746, N'Elek', N'kos', N'M', CAST(186.00 AS Decimal(10, 2)), CAST(158.00 AS Decimal(10, 2)), N'6', N'david@milkyway.com.cn', 28, N'BS ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (747, N'Ward', N'Stephen', N'M', CAST(194.00 AS Decimal(10, 2)), CAST(156.00 AS Decimal(10, 2)), N'30', N'asklight@gmail.com', 29, N'CA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (748, N'Korhut', N'Mihly', N'M', CAST(190.00 AS Decimal(10, 2)), CAST(137.00 AS Decimal(10, 2)), N'53', N'16377163@163.com', 30, N'CG ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (749, N'Gregu', N'Jn', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(102.00 AS Decimal(10, 2)), N'21', N'jihaiwei@126.com', 1, N'CH ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (750, N'Marcus', N'Quintion', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(109.00 AS Decimal(10, 2)), N'41', N'chinafmn@chinafmn.com', 2, N'CM ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (751, N'Ogden', N'Alvin', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(169.00 AS Decimal(10, 2)), N'1', N'7735kf@163.com', 3, N'COD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (752, N'Simon', N'Beck', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(170.00 AS Decimal(10, 2)), N'74', N'y330@126.com', 4, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (753, N'York', N'Dave', N'M', CAST(171.00 AS Decimal(10, 2)), CAST(154.00 AS Decimal(10, 2)), N'68', N'fubao@f139.com', 5, N'HT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (754, N'Jonas', N'Greg', N'M', CAST(184.00 AS Decimal(10, 2)), CAST(117.00 AS Decimal(10, 2)), N'15', N'webmaster@e-jjj.com', 6, N'IL ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (755, N'Smalling', N'Chris', N'M', CAST(174.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), N'88', N'lawon@sina.com', 7, N'IT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (756, N'Rosick', N'Tom', N'M', CAST(171.00 AS Decimal(10, 2)), CAST(84.00 AS Decimal(10, 2)), N'33', N'181888@gmail.com', 8, N'LT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (757, N'Huboan', N'Tom', N'M', CAST(191.00 AS Decimal(10, 2)), CAST(121.00 AS Decimal(10, 2)), N'46', N'hwp@chinaccm.com', 9, N'LV ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (758, N'Motta', N'Thiago', N'M', CAST(184.00 AS Decimal(10, 2)), CAST(101.00 AS Decimal(10, 2)), N'66', N'jlkmdz@163.com', 10, N'MLI')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (759, N'Wawrzyniak', N'Jakub', N'M', CAST(170.00 AS Decimal(10, 2)), CAST(112.00 AS Decimal(10, 2)), N'31', N'zhaoyanping8112@126.com', 11, N'MNE')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (760, N'Stieber', N'Zoltn', N'M', CAST(191.00 AS Decimal(10, 2)), CAST(132.00 AS Decimal(10, 2)), N'79', N'c114@c114.net', 12, N'NGA')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (761, N'McCullough', N'Luke', N'M', CAST(186.00 AS Decimal(10, 2)), CAST(111.00 AS Decimal(10, 2)), N'8', N'info@hzconsulting.cn', 13, N'NZ ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (762, N'Kalini', N'Lovre', N'M', CAST(183.00 AS Decimal(10, 2)), CAST(122.00 AS Decimal(10, 2)), N'77', N'info@helmshanghai.com', 14, N'TN ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (763, N'Kimmich', N'Joshua', N'M', CAST(196.00 AS Decimal(10, 2)), CAST(167.00 AS Decimal(10, 2)), N'49', N'daisyzhu@163.com', 15, N'TR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (764, N'Marico', N'Rachel', N'M', CAST(180.00 AS Decimal(10, 2)), CAST(138.00 AS Decimal(10, 2)), N'78', N'info@hanhongchem.com', 16, N'UA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (765, N'Oliver', N'Alvis', N'M', CAST(173.00 AS Decimal(10, 2)), CAST(91.00 AS Decimal(10, 2)), N'86', N'aceiw@sohu.com', 17, N'US ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (766, N'Solomon', N'Ben', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(156.00 AS Decimal(10, 2)), N'9', N'yp@jiaoyitong.com', 18, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (767, N'Yves', N'David', N'M', CAST(175.00 AS Decimal(10, 2)), CAST(153.00 AS Decimal(10, 2)), N'33', N'syaubyb*126.com', 19, N'FR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (768, N'Jonathan', N'Gregary', N'M', CAST(180.00 AS Decimal(10, 2)), CAST(81.00 AS Decimal(10, 2)), N'30', N'mingke18@126.com', 20, N'GE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (769, N'Nani', N'CV', N'M', CAST(194.00 AS Decimal(10, 2)), CAST(123.00 AS Decimal(10, 2)), N'0', N'ifaxing.cn@gmail.com', 21, N'GR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (770, N'Podolski', N'Lukas', N'M', CAST(178.00 AS Decimal(10, 2)), CAST(111.00 AS Decimal(10, 2)), N'88', N'wxiuge*tom.com', 22, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (771, N'Shirokov', N'Roman', N'M', CAST(199.00 AS Decimal(10, 2)), CAST(115.00 AS Decimal(10, 2)), N'16', N'jd@shanghaijd.com.cn', 23, N'BI ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (772, N'Ibrahimovi', N'Zlatan', N'M', CAST(175.00 AS Decimal(10, 2)), CAST(169.00 AS Decimal(10, 2)), N'25', N'chenxindianlu@yeah.net', 24, N'BIH')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (773, N'Jodowiec', N'Tomasz', N'M', CAST(171.00 AS Decimal(10, 2)), CAST(76.00 AS Decimal(10, 2)), N'53', N'jobs@vip.sina.com', 25, N'BR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (774, N'Nmeth', N'Krisztin', N'M', CAST(172.00 AS Decimal(10, 2)), CAST(97.00 AS Decimal(10, 2)), N'19', N'whps@whpstc.com', 26, N'BS ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (775, N'Alli', N'Dele', N'M', CAST(177.00 AS Decimal(10, 2)), CAST(146.00 AS Decimal(10, 2)), N'1', N'mishubu@beijing2008.cn', 27, N'CA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (776, N'Carlgren', N'Patrik', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(141.00 AS Decimal(10, 2)), N'38', N'shanghai@suneast.com', 28, N'CG ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (777, N'Weigl', N'Julian', N'M', CAST(195.00 AS Decimal(10, 2)), CAST(73.00 AS Decimal(10, 2)), N'58', N'siguona@163.com', 29, N'CH ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (778, N'Mark', N'Ralap', N'M', CAST(177.00 AS Decimal(10, 2)), CAST(108.00 AS Decimal(10, 2)), N'85', N'ea@eaonline.com.cn', 30, N'CM ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (779, N'Omar', N'Amos', N'M', CAST(199.00 AS Decimal(10, 2)), CAST(165.00 AS Decimal(10, 2)), N'52', N'chuanqiu@citiz.net', 1, N'COD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (780, N'Spencer', N'Benedict', N'M', CAST(181.00 AS Decimal(10, 2)), CAST(83.00 AS Decimal(10, 2)), N'36', N'yx56667738@yahoo.com.cn', 2, N'DE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (781, N'Zachary', N'Dean', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(76.00 AS Decimal(10, 2)), N'54', N'ythl329010@126.com', 3, N'DO ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (782, N'Joseph', N'Griffith', N'M', CAST(191.00 AS Decimal(10, 2)), CAST(156.00 AS Decimal(10, 2)), N'1', N'it114@mx.cei.gov.cn', 4, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (783, N'ech', N'Petr', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(122.00 AS Decimal(10, 2)), N'59', N'sonicchen88@sina.com', 5, N'FR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (784, N'Wilshere', N'Jack', N'M', CAST(198.00 AS Decimal(10, 2)), CAST(162.00 AS Decimal(10, 2)), N'39', N'qi-hang@qi-hang.com', 6, N'GE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (785, N'Shatov', N'Oleg', N'M', CAST(191.00 AS Decimal(10, 2)), CAST(118.00 AS Decimal(10, 2)), N'69', N'master@gzyp21.net', 7, N'GR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (786, N'Matuidi', N'Blaise', N'M', CAST(175.00 AS Decimal(10, 2)), CAST(105.00 AS Decimal(10, 2)), N'33', N'hp@hmhf.cn', 8, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (787, N'Glik', N'Kamil', N'M', CAST(196.00 AS Decimal(10, 2)), CAST(131.00 AS Decimal(10, 2)), N'56', N'shsl888@yahoo.cn', 9, N'HT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (788, N'Bde', N'Dniel', N'M', CAST(184.00 AS Decimal(10, 2)), CAST(157.00 AS Decimal(10, 2)), N'41', N'APaul222@hotmail.com', 10, N'IL ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (789, N'Dallas', N'Stuart', N'M', CAST(196.00 AS Decimal(10, 2)), CAST(114.00 AS Decimal(10, 2)), N'82', N'yidong_nb@163.com', 11, N'AUS')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (790, N'Lang', N'dm', N'M', CAST(171.00 AS Decimal(10, 2)), CAST(70.00 AS Decimal(10, 2)), N'57', N'fangyifang@hc360.com', 12, N'BI ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (791, N'Golovin', N'Aleksandr', N'M', CAST(176.00 AS Decimal(10, 2)), CAST(141.00 AS Decimal(10, 2)), N'74', N'nanhao@nanhao.com', 13, N'BIH')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (792, N'Marlon', N'Randolph', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(104.00 AS Decimal(10, 2)), N'25', N'09910@126.com', 14, N'BR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (793, N'Orville', N'Andre', N'M', CAST(192.00 AS Decimal(10, 2)), CAST(82.00 AS Decimal(10, 2)), N'72', N'zikoo@zikoo.com', 15, N'BS ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (794, N'Stan', N'Benjamin', N'M', CAST(193.00 AS Decimal(10, 2)), CAST(145.00 AS Decimal(10, 2)), N'73', N'tiaolab@163.com', 16, N'CA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (795, N'Zebulon', N'Dempsey', N'M', CAST(193.00 AS Decimal(10, 2)), CAST(114.00 AS Decimal(10, 2)), N'60', N'xm@salebinfo.com', 17, N'CG ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (796, N'Joshua', N'Grover', N'M', CAST(170.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), N'37', N'service_cn@sugoo.com', 18, N'CH ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (797, N'Schrrle', N'Andr', N'M', CAST(200.00 AS Decimal(10, 2)), CAST(139.00 AS Decimal(10, 2)), N'13', N'webmaster@zgdzsww.cn', 19, N'CM ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (798, N'Giroud', N'Olivier', N'M', CAST(175.00 AS Decimal(10, 2)), CAST(119.00 AS Decimal(10, 2)), N'69', N'shangjun110@126.com', 20, N'COD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (799, N'Smolnikov', N'Igor', N'M', CAST(183.00 AS Decimal(10, 2)), CAST(91.00 AS Decimal(10, 2)), N'34', N'summerprint@hotmail.com', 21, N'DE ')
GO
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (800, N'Digne', N'Lucas', N'M', CAST(192.00 AS Decimal(10, 2)), CAST(124.00 AS Decimal(10, 2)), N'75', N'tb@spp.com.cn', 22, N'DO ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (801, N'Jdrzejczyk', N'Artur', N'M', CAST(185.00 AS Decimal(10, 2)), CAST(94.00 AS Decimal(10, 2)), N'45', N'buima2006@yahoo.com.cn', 23, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (802, N'Lovrencsics', N'Gerg', N'M', CAST(192.00 AS Decimal(10, 2)), CAST(95.00 AS Decimal(10, 2)), N'59', N'Service@changhaopipe.com', 24, N'FR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (803, N'Washington', N'Conor', N'M', CAST(189.00 AS Decimal(10, 2)), CAST(92.00 AS Decimal(10, 2)), N'54', N'windowscar212@163.com', 25, N'GE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (804, N'Duda', N'Ondrej', N'M', CAST(195.00 AS Decimal(10, 2)), CAST(166.00 AS Decimal(10, 2)), N'24', N'yht2006sh@sina.com', 26, N'GR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (805, N'koda', N'Milan', N'M', CAST(194.00 AS Decimal(10, 2)), CAST(108.00 AS Decimal(10, 2)), N'69', N'info@qinbifa.com', 27, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (806, N'Marsh', N'Raymond', N'M', CAST(172.00 AS Decimal(10, 2)), CAST(77.00 AS Decimal(10, 2)), N'62', N'zxg18600@163.com', 28, N'HT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (807, N'Osborn', N'Andrew', N'M', CAST(195.00 AS Decimal(10, 2)), CAST(79.00 AS Decimal(10, 2)), N'55', N'isd99@163.com', 29, N'IL ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (808, N'Stanford', N'Bennett', N'M', CAST(176.00 AS Decimal(10, 2)), CAST(132.00 AS Decimal(10, 2)), N'17', N'57262493@qq.com', 30, N'IT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (809, N'Ziv', N'Dennis', N'M', CAST(170.00 AS Decimal(10, 2)), CAST(132.00 AS Decimal(10, 2)), N'1', N'lmxz@molss.gov', 1, N'LT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (810, N'Joyce', N'Gustave', N'M', CAST(175.00 AS Decimal(10, 2)), CAST(126.00 AS Decimal(10, 2)), N'87', N'admin@ojn-sd.com', 2, N'LV ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (811, N'Hazard', N'Eden', N'M', CAST(194.00 AS Decimal(10, 2)), CAST(139.00 AS Decimal(10, 2)), N'70', N'wangkun@overseas-edu.com', 3, N'MLI')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (812, N'Ramsey', N'Aaron', N'M', CAST(194.00 AS Decimal(10, 2)), CAST(152.00 AS Decimal(10, 2)), N'25', N'dongqig@cobwebs.com', 4, N'MNE')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (813, N'Tymoshchuk', N'Anatoliy', N'M', CAST(189.00 AS Decimal(10, 2)), CAST(128.00 AS Decimal(10, 2)), N'51', N'SERVICE@ABTB.CN', 5, N'NGA')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (814, N'Jallet', N'Christophe', N'M', CAST(184.00 AS Decimal(10, 2)), CAST(131.00 AS Decimal(10, 2)), N'40', N'sh_yuncai@163.com', 6, N'NZ ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (815, N'Salamon', N'Bartosz', N'M', CAST(170.00 AS Decimal(10, 2)), CAST(143.00 AS Decimal(10, 2)), N'7', N'webmaster@51xiaoguo.com', 7, N'PUR')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (816, N'Marchetti', N'Federico', N'M', CAST(192.00 AS Decimal(10, 2)), CAST(157.00 AS Decimal(10, 2)), N'9', N'ythl3awer210@126.com', 8, N'RU ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (817, N'McLaughlin', N'Conor', N'M', CAST(176.00 AS Decimal(10, 2)), CAST(113.00 AS Decimal(10, 2)), N'85', N'zhaopin@wuyoujob.com', 9, N'SEN')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (818, N'Augustinsson', N'Ludwig', N'M', CAST(183.00 AS Decimal(10, 2)), CAST(91.00 AS Decimal(10, 2)), N'32', N'go007@go007.com', 10, N'SI ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (819, N'Ivanov', N'Oleg', N'M', CAST(174.00 AS Decimal(10, 2)), CAST(77.00 AS Decimal(10, 2)), N'55', N'lude985@sina.com', 11, N'SRB')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (820, N'Marshall', N'Reg', N'M', CAST(200.00 AS Decimal(10, 2)), CAST(152.00 AS Decimal(10, 2)), N'60', N'support@cfchina.cn', 12, N'SSD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (821, N'Oscar', N'Andy', N'M', CAST(170.00 AS Decimal(10, 2)), CAST(122.00 AS Decimal(10, 2)), N'80', N'info@97xp.com', 13, N'TN ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (822, N'Stanley', N'Benson', N'M', CAST(170.00 AS Decimal(10, 2)), CAST(95.00 AS Decimal(10, 2)), N'86', N'pxf@abi.com.cn', 14, N'TR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (823, N'Glenn', N'Derrick', N'M', CAST(195.00 AS Decimal(10, 2)), CAST(111.00 AS Decimal(10, 2)), N'44', N'saizhi88@163.com', 15, N'UA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (824, N'Julian', N'Guy', N'M', CAST(196.00 AS Decimal(10, 2)), CAST(89.00 AS Decimal(10, 2)), N'33', N'admin@zmould.cn', 16, N'US ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (825, N'Cahill', N'Gary', N'M', CAST(189.00 AS Decimal(10, 2)), CAST(72.00 AS Decimal(10, 2)), N'6', N'ythler3210@126.com', 17, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (826, N'Fabiaski', N'ukasz', N'M', CAST(191.00 AS Decimal(10, 2)), CAST(137.00 AS Decimal(10, 2)), N'88', N'51mrrc@163.com', 18, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (827, N'Sigrsson', N'Kolbeinn', N'M', CAST(184.00 AS Decimal(10, 2)), CAST(149.00 AS Decimal(10, 2)), N'16', N'healthr@healthr.com', 19, N'BI ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (828, N'Sirigu', N'Salvatore', N'M', CAST(196.00 AS Decimal(10, 2)), CAST(94.00 AS Decimal(10, 2)), N'72', N'HZP852123@163.COM', 20, N'BIH')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (829, N'Peszko', N'Sawomir', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(149.00 AS Decimal(10, 2)), N'84', N'nmpx@ngx.net.cn', 21, N'BR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (830, N'Candreva', N'Antonio', N'M', CAST(171.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), N'3', N'cpsa*china-cpsre.com', 22, N'BS ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (831, N'Rami', N'Adil', N'M', CAST(192.00 AS Decimal(10, 2)), CAST(144.00 AS Decimal(10, 2)), N'0', N'dongshangnet@126.com', 23, N'CA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (832, N'Pjaca', N'Marko', N'M', CAST(176.00 AS Decimal(10, 2)), CAST(72.00 AS Decimal(10, 2)), N'49', N'webmaster@baidajob.com', 24, N'CG ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (833, N'Koubek', N'Tom', N'M', CAST(194.00 AS Decimal(10, 2)), CAST(134.00 AS Decimal(10, 2)), N'69', N'ceofosn@126.com', 25, N'CH ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (834, N'Martin', N'Regan', N'M', CAST(194.00 AS Decimal(10, 2)), CAST(117.00 AS Decimal(10, 2)), N'52', N'TC.ZIPPER@GMAIL.COM', 26, N'CM ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (835, N'Osmond', N'Angelo', N'M', CAST(187.00 AS Decimal(10, 2)), CAST(93.00 AS Decimal(10, 2)), N'11', N'kstm@sina.com', 27, N'COD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (836, N'Steven', N'Berg', N'M', CAST(186.00 AS Decimal(10, 2)), CAST(137.00 AS Decimal(10, 2)), N'56', N'qianyan.biz@hotmail.com', 28, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (837, N'Goddard', N'Devin', N'M', CAST(194.00 AS Decimal(10, 2)), CAST(118.00 AS Decimal(10, 2)), N'31', N'2008zhongbei@163.com', 29, N'HT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (838, N'Julius', N'Hale', N'M', CAST(193.00 AS Decimal(10, 2)), CAST(163.00 AS Decimal(10, 2)), N'57', N'ythl3210234@126.com', 30, N'IL ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (839, N'Azpilicueta', N'Csar', N'M', CAST(184.00 AS Decimal(10, 2)), CAST(140.00 AS Decimal(10, 2)), N'72', N'ruiyan28@21cn.com', 1, N'IT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (840, N'Collins', N'James', N'M', CAST(176.00 AS Decimal(10, 2)), CAST(128.00 AS Decimal(10, 2)), N'57', N'qaz9239@163.com', 2, N'LT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (841, N'Pintilii', N'Mihai', N'M', CAST(190.00 AS Decimal(10, 2)), CAST(71.00 AS Decimal(10, 2)), N'66', N'yukong3@sina.com', 3, N'LV ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (842, N'Coman', N'Kingsley', N'M', CAST(196.00 AS Decimal(10, 2)), CAST(96.00 AS Decimal(10, 2)), N'2', N'shhuiye@126.com', 4, N'MLI')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (843, N'Krychowiak', N'Grzegorz', N'M', CAST(199.00 AS Decimal(10, 2)), CAST(115.00 AS Decimal(10, 2)), N'77', N'sales@shsuiye.com', 5, N'MNE')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (844, N'Florenzi', N'Alessandro', N'M', CAST(181.00 AS Decimal(10, 2)), CAST(168.00 AS Decimal(10, 2)), N'51', N'njzlxf@yp.ce.net.cn', 6, N'NGA')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (845, N'San Jos', N'Mikel', N'M', CAST(171.00 AS Decimal(10, 2)), CAST(114.00 AS Decimal(10, 2)), N'17', N'pyrcjlb@163.com', 7, N'NZ ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (846, N'Jansson', N'Pontus', N'M', CAST(179.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), N'9', N'cs@72hr.cn', 8, N'TN ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (847, N'Skalk', N'Ji', N'M', CAST(171.00 AS Decimal(10, 2)), CAST(155.00 AS Decimal(10, 2)), N'88', N'webmaster@bmacn.com', 9, N'TR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (848, N'Marvin', N'Reginald', N'M', CAST(198.00 AS Decimal(10, 2)), CAST(70.00 AS Decimal(10, 2)), N'55', N'chenli@chinaccm.com', 10, N'UA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (849, N'Oswald', N'Augus', N'M', CAST(188.00 AS Decimal(10, 2)), CAST(161.00 AS Decimal(10, 2)), N'8', N'webmaster@sinopecec.com', 11, N'US ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (850, N'Stev', N'Bernard', N'M', CAST(196.00 AS Decimal(10, 2)), CAST(169.00 AS Decimal(10, 2)), N'18', N'PHONEjinyuan-lin@hotmail.com', 12, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (851, N'Godfery', N'Dick', N'M', CAST(182.00 AS Decimal(10, 2)), CAST(109.00 AS Decimal(10, 2)), N'57', N'chlitina@133sh.com', 13, N'FR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (852, N'Justin', N'Haley', N'M', CAST(189.00 AS Decimal(10, 2)), CAST(117.00 AS Decimal(10, 2)), N'73', N'ythl3210@126.com', 14, N'GE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (853, N'Bertrand', N'Ryan', N'M', CAST(189.00 AS Decimal(10, 2)), CAST(84.00 AS Decimal(10, 2)), N'21', N'karde@sina.com', 15, N'GR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (854, N'Ra', N'Rzvan', N'M', CAST(181.00 AS Decimal(10, 2)), CAST(135.00 AS Decimal(10, 2)), N'84', N'karderr@sina.com', 16, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (855, N'Chipciu', N'Alexandru', N'M', CAST(183.00 AS Decimal(10, 2)), CAST(152.00 AS Decimal(10, 2)), N'1', N'gift181@126.com', 17, N'BI ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (856, N'Mangala', N'Eliaquim', N'M', CAST(178.00 AS Decimal(10, 2)), CAST(88.00 AS Decimal(10, 2)), N'21', N'liuxianguo_1234@163.com', 18, N'BIH')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (857, N'Zieliski', N'Piotr', N'M', CAST(192.00 AS Decimal(10, 2)), CAST(79.00 AS Decimal(10, 2)), N'80', N'jr999999999@163.com', 19, N'BR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (858, N'Gman', N'Valeric', N'M', CAST(195.00 AS Decimal(10, 2)), CAST(102.00 AS Decimal(10, 2)), N'0', N'baidu@baidu-led.com', 20, N'BS ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (859, N'Aduriz', N'Aritz', N'M', CAST(191.00 AS Decimal(10, 2)), CAST(106.00 AS Decimal(10, 2)), N'57', N'zhaohaiyan@kitking.com', 21, N'CA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (860, N'Pell', N'Graziano', N'M', CAST(187.00 AS Decimal(10, 2)), CAST(121.00 AS Decimal(10, 2)), N'28', N'sinomag@vip.sina.com', 22, N'CG ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (861, N'Tarashaj', N'Shani', N'M', CAST(194.00 AS Decimal(10, 2)), CAST(76.00 AS Decimal(10, 2)), N'53', N'xiansheng@texindex.com', 23, N'CH ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (862, N'Matt', N'Reuben', N'M', CAST(192.00 AS Decimal(10, 2)), CAST(164.00 AS Decimal(10, 2)), N'4', N'020art@gmail.com', 24, N'CM ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (863, N'Otis', N'Ansel', N'M', CAST(189.00 AS Decimal(10, 2)), CAST(152.00 AS Decimal(10, 2)), N'11', N'ythl903210@126.com', 25, N'COD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (864, N'Steward', N'Bernie', N'M', CAST(173.00 AS Decimal(10, 2)), CAST(133.00 AS Decimal(10, 2)), N'76', N'webmaster@hrm.cnC', 26, N'DE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (865, N'Gordon', N'Dominic', N'M', CAST(180.00 AS Decimal(10, 2)), CAST(137.00 AS Decimal(10, 2)), N'40', N'icaman3000@vip.163.com', 27, N'DO ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (866, N'Keith', N'Hamiltion', N'M', CAST(176.00 AS Decimal(10, 2)), CAST(71.00 AS Decimal(10, 2)), N'82', N'zhangexpo1966@163.com', 28, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (867, N'De Bruyne', N'Kevin', N'M', CAST(175.00 AS Decimal(10, 2)), CAST(140.00 AS Decimal(10, 2)), N'59', N'huyong@opg.cn', 29, N'FR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (868, N'Gunnarsson', N'Aron', N'M', CAST(188.00 AS Decimal(10, 2)), CAST(74.00 AS Decimal(10, 2)), N'52', N'floorchina@sina.com', 30, N'GE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (869, N'Prepeli', N'Andrei', N'M', CAST(198.00 AS Decimal(10, 2)), CAST(92.00 AS Decimal(10, 2)), N'29', N'chinajinshui@163.com', 1, N'GR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (870, N'Wernbloom', N'Pontus', N'M', CAST(187.00 AS Decimal(10, 2)), CAST(99.00 AS Decimal(10, 2)), N'2', N'food800@126.com', 2, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (871, N'Milik', N'Arkadiusz', N'M', CAST(193.00 AS Decimal(10, 2)), CAST(81.00 AS Decimal(10, 2)), N'71', N'jobssme@ssme.gov.cn', 3, N'HT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (872, N'Mel', N'Alexandru', N'M', CAST(191.00 AS Decimal(10, 2)), CAST(131.00 AS Decimal(10, 2)), N'48', N'shzhimojixie@126.com', 4, N'IL ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (873, N'Moubandje', N'Franois', N'M', CAST(200.00 AS Decimal(10, 2)), CAST(93.00 AS Decimal(10, 2)), N'52', N'webmaster@hf365.com', 5, N'AUS')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (874, N'Gashi', N'Shklzen', N'M', CAST(190.00 AS Decimal(10, 2)), CAST(70.00 AS Decimal(10, 2)), N'55', N'shfuture@163.com', 6, N'BI ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (875, N'Lindelf', N'Victor', N'M', CAST(198.00 AS Decimal(10, 2)), CAST(94.00 AS Decimal(10, 2)), N'88', N'longxi62967511@163.com', 7, N'BIH')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (876, N'Matthew', N'Sandy', N'M', CAST(173.00 AS Decimal(10, 2)), CAST(82.00 AS Decimal(10, 2)), N'73', N'cncec@cncec.com.cn', 8, N'BR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (877, N'Otto', N'Antony', N'M', CAST(173.00 AS Decimal(10, 2)), CAST(108.00 AS Decimal(10, 2)), N'43', N'zhao_wei1982@hotmail.com', 9, N'BS ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (878, N'Tab', N'Bert', N'M', CAST(187.00 AS Decimal(10, 2)), CAST(166.00 AS Decimal(10, 2)), N'84', N'daocaozonghezhizuo@188.com', 10, N'CA ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (879, N'Greg', N'Don', N'M', CAST(176.00 AS Decimal(10, 2)), CAST(109.00 AS Decimal(10, 2)), N'28', N'shyh-sj@hotmail.com', 11, N'CG ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (880, N'Kelly', N'Hardy', N'M', CAST(198.00 AS Decimal(10, 2)), CAST(88.00 AS Decimal(10, 2)), N'62', N'zsbm@wjc.com.cn', 12, N'CH ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (881, N'Lukaku', N'Romelu', N'M', CAST(192.00 AS Decimal(10, 2)), CAST(134.00 AS Decimal(10, 2)), N'10', N'TKC99@PUBLIC1.WX.JS.CN', 13, N'CM ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (882, N'Hoolahan', N'Wes', N'M', CAST(175.00 AS Decimal(10, 2)), CAST(167.00 AS Decimal(10, 2)), N'0', N'cnaacn@hotmail.com', 14, N'COD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (883, N'Ttruanu', N'Ciprian', N'M', CAST(184.00 AS Decimal(10, 2)), CAST(70.00 AS Decimal(10, 2)), N'49', N'changkun1984111@126.com', 15, N'DE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (884, N'Ignashevich', N'Sergei', N'M', CAST(180.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), N'26', N'huachsh@winhere.cn', 16, N'DO ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (885, N'Almer', N'Robert', N'M', CAST(197.00 AS Decimal(10, 2)), CAST(94.00 AS Decimal(10, 2)), N'70', N'64015861@163.com', 17, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (886, N'Grigore', N'Drago', N'M', CAST(198.00 AS Decimal(10, 2)), CAST(80.00 AS Decimal(10, 2)), N'44', N'dn88@dn88.cn', 18, N'FR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (887, N'Parolo', N'Marco', N'M', CAST(181.00 AS Decimal(10, 2)), CAST(146.00 AS Decimal(10, 2)), N'32', N'serve@333cn.com', 19, N'GE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (888, N'Butko', N'Bohdan', N'M', CAST(195.00 AS Decimal(10, 2)), CAST(157.00 AS Decimal(10, 2)), N'77', N'lin_c_x@hotmail.com', 20, N'GR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (889, N'Kapustka', N'Bartosz', N'M', CAST(189.00 AS Decimal(10, 2)), CAST(166.00 AS Decimal(10, 2)), N'41', N'tlylb@163.com', 21, N'HRV')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (890, N'Maurice', N'Saxon', N'M', CAST(179.00 AS Decimal(10, 2)), CAST(127.00 AS Decimal(10, 2)), N'84', N'dscm2007@163.com', 22, N'HT ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (891, N'Owen', N'Antonio', N'M', CAST(179.00 AS Decimal(10, 2)), CAST(80.00 AS Decimal(10, 2)), N'30', N'Bpmot@online.sh.cn', 23, N'CG ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (892, N'Taylor', N'Berton', N'M', CAST(184.00 AS Decimal(10, 2)), CAST(93.00 AS Decimal(10, 2)), N'42', N'lrjxuwei@126.com', 24, N'CH ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (893, N'Gregary', N'Donahue', N'M', CAST(177.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), N'81', N'pcheng418@163.com', 25, N'CM ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (894, N'Ken', N'Harlan', N'M', CAST(184.00 AS Decimal(10, 2)), CAST(151.00 AS Decimal(10, 2)), N'47', N'webmaster@anlideng.com', 26, N'COD')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (895, N'Henderson', N'Jordan', N'M', CAST(192.00 AS Decimal(10, 2)), CAST(170.00 AS Decimal(10, 2)), N'63', N'gzhtthj@163.com', 27, N'DE ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (896, N'Olsson', N'Martin', N'M', CAST(186.00 AS Decimal(10, 2)), CAST(155.00 AS Decimal(10, 2)), N'38', N'hbkpjt@163.com', 28, N'DO ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (897, N'Stanciu', N'Nicuor', N'M', CAST(183.00 AS Decimal(10, 2)), CAST(89.00 AS Decimal(10, 2)), N'47', N'magangchao@163.com', 29, N'ES ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (898, N'Berezutski', N'Aleksei', N'M', CAST(200.00 AS Decimal(10, 2)), CAST(131.00 AS Decimal(10, 2)), N'62', N'ntkt@cadg.cn', 30, N'FR ')
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (899, N'zcan', N'Ramazan', N'M', CAST(183.00 AS Decimal(10, 2)), CAST(118.00 AS Decimal(10, 2)), N'38', N'info@tongzhuang.net', 30, N'DO ')
GO
INSERT [dbo].[Player] ([PlayerId], [LastName], [FirstName], [Gender], [Height], [Weight], [ShirtNumber], [Email], [TeamId], [CountryCode]) VALUES (900, N'Torje', N'Gabriel', N'M', CAST(183.00 AS Decimal(10, 2)), CAST(163.00 AS Decimal(10, 2)), N'52', N'service@oemtimes.com', 30, N'ES ')
SET IDENTITY_INSERT [dbo].[Player] OFF
GO
SET IDENTITY_INSERT [dbo].[PositionName] ON 

INSERT [dbo].[PositionName] ([PositionId], [Name]) VALUES (2, N'SmallForward')
INSERT [dbo].[PositionName] ([PositionId], [Name]) VALUES (3, N'PowerForward')
INSERT [dbo].[PositionName] ([PositionId], [Name]) VALUES (4, N'Center')
INSERT [dbo].[PositionName] ([PositionId], [Name]) VALUES (5, N'ShootingGuard')
INSERT [dbo].[PositionName] ([PositionId], [Name]) VALUES (6, N'PointGuard')
SET IDENTITY_INSERT [dbo].[PositionName] OFF
GO
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 601)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 606)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 611)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 615)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 616)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 617)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 618)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 619)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 620)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 621)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 622)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 623)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 626)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 629)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 634)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 638)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 639)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 640)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 641)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 642)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 645)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 649)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 650)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 651)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 652)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 656)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 660)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 661)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 662)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 678)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 679)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 680)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 681)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 685)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 689)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 690)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 691)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 692)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 696)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 700)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 701)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 702)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 703)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 707)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 711)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 712)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 713)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 714)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 717)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 720)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 725)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 729)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 730)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 731)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 732)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 736)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 740)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 741)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 742)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 743)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 747)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 751)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 752)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 753)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 754)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 770)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 771)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 773)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 776)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 781)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 785)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 786)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 787)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 788)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 792)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 796)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 797)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 798)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 799)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 803)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 807)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 808)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 809)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 810)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 826)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 827)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 829)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 832)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 837)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 841)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 842)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 843)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 844)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 848)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 852)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 853)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 854)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 855)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 859)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 863)
GO
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 864)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 865)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 866)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 882)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 883)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 885)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 888)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 892)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 893)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 895)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 897)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 898)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 899)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (2, 900)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 602)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 607)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 612)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 614)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 624)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 627)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 630)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 635)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 646)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 657)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 675)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 686)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 697)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 708)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 718)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 721)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 726)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 737)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 748)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 767)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 774)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 777)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 782)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 793)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 804)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 823)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 830)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 833)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 838)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 849)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 860)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 879)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 886)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 889)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (3, 894)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 601)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 603)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 608)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 613)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 625)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 628)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 631)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 636)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 642)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 647)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 653)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 658)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 663)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 664)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 665)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 666)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 667)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 668)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 669)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 676)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 682)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 687)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 693)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 698)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 704)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 709)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 715)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 716)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 719)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 722)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 727)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 733)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 738)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 744)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 749)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 755)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 756)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 757)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 758)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 759)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 760)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 761)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 768)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 772)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 775)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 778)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 783)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 789)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 794)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 800)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 805)
GO
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 811)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 812)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 813)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 814)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 815)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 816)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 817)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 824)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 828)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 831)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 834)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 839)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 845)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 850)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 856)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 861)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 867)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 868)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 869)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 870)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 871)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 872)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 873)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 880)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 884)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 887)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 890)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (4, 895)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 604)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 609)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 614)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 632)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 637)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 643)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 648)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 654)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 659)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 670)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 671)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 672)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 673)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 674)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 677)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 683)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 688)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 694)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 699)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 705)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 710)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 723)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 728)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 734)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 739)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 745)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 750)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 762)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 763)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 764)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 765)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 766)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 769)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 779)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 784)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 790)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 795)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 801)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 806)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 818)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 819)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 820)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 821)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 822)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 825)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 835)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 840)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 846)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 851)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 857)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 862)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 874)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 875)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 876)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 877)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 878)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 881)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 891)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (5, 896)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 605)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 610)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 633)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 644)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 655)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 684)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 695)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 706)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 724)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 735)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 746)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 780)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 791)
GO
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 802)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 836)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 847)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 858)
INSERT [dbo].[PositionOfPlayer] ([PositionId], [PlayerId]) VALUES (6, 892)
GO
SET IDENTITY_INSERT [dbo].[Team] ON 

INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (1, N'Miami Heat', N'MIA', N'C:\Users\admin\Desktop\Photos\1.jpg', 1)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (2, N'Orlando Magic', N'ORL', N'C:\Users\admin\Desktop\Photos\2.jpg', 1)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (3, N'Atlanta Hawks', N'ATL', N'C:\Users\admin\Desktop\Photos\3.jpg', 1)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (4, N'Washington Wizards', N'WSH', N'C:\Users\admin\Desktop\Photos\4.jpg', 1)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (5, N'Charlotte Hornets', N'CHA', N'C:\Users\admin\Desktop\Photos\5.jpg', 1)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (6, N'Detroit Pistons', N'DET', N'C:\Users\admin\Desktop\Photos\6.jpg', 2)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (7, N'Indiana Pacers', N'IND', N'C:\Users\admin\Desktop\Photos\7.jpg', 2)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (8, N'Cleveland Cavaliers', N'CLE', N'C:\Users\admin\Desktop\Photos\8.jpg', 2)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (9, N'Chicago Bulls', N'CHI', N'C:\Users\admin\Desktop\Photos\9.jpg', 2)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (10, N'Milwaukee Bucks', N'MIL', N'C:\Users\admin\Desktop\Photos\10.jpg', 2)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (11, N'Boston Celtics', N'BOS', N'C:\Users\admin\Desktop\Photos\11.jpg', 3)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (12, N'Philadelphia 76ers', N'PHI', N'C:\Users\admin\Desktop\Photos\12.jpg', 3)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (13, N'New York Knicks', N'NY ', N'C:\Users\admin\Desktop\Photos\13.jpg', 3)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (14, N'Brooklyn Nets', N'BKN', N'C:\Users\admin\Desktop\Photos\14.jpg', 3)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (15, N'Toronto Raptors', N'TOR', N'C:\Users\admin\Desktop\Photos\15.jpg', 3)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (16, N'San Antonio Spurs', N'SA ', N'C:\Users\admin\Desktop\Photos\16.jpg', 4)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (17, N'Memphis Grizzlies', N'MEM', N'C:\Users\admin\Desktop\Photos\17.jpg', 4)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (18, N'Dallas Mavericks', N'DAL', N'C:\Users\admin\Desktop\Photos\18.jpg', 4)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (19, N'Houston Rockets', N'HOU', N'C:\Users\admin\Desktop\Photos\19.jpg', 4)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (20, N'New Orleans Pelicans', N'NO ', N'C:\Users\admin\Desktop\Photos\20.jpg', 4)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (21, N'Minnesota Timberwolves', N'MIN', N'C:\Users\admin\Desktop\Photos\21.jpg', 5)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (22, N'Denver Nuggets', N'DEN', N'C:\Users\admin\Desktop\Photos\22.jpg', 5)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (23, N'Utah Jazz', N'UTA', N'C:\Users\admin\Desktop\Photos\23.jpg', 5)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (24, N'Portland Trail Blazers', N'POR', N'C:\Users\admin\Desktop\Photos\24.jpg', 5)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (25, N'Oklahoma City Thunder', N'OKC', N'C:\Users\admin\Desktop\Photos\25.jpg', 5)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (26, N'Sacramento Kings', N'SAC', N'C:\Users\admin\Desktop\Photos\26.jpg', 6)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (27, N'Phoenix Suns', N'PHX', N'C:\Users\admin\Desktop\Photos\27.jpg', 6)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (28, N'L.A. Lakers', N'LAL', N'C:\Users\admin\Desktop\Photos\28.jpg', 6)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (29, N'Los Angeles Clippers', N'LAC', N'C:\Users\admin\Desktop\Photos\', 6)
INSERT [dbo].[Team] ([TeamId], [Name], [Abbr], [Logo], [DivisionId]) VALUES (30, N'Golden State Warriors', N'GS ', N'C:\Users\admin\Desktop\Photos\30.jpg', 6)
SET IDENTITY_INSERT [dbo].[Team] OFF
GO
/****** Object:  Index [IX_FK__Division__Confer__4222D4EF]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__Division__Confer__4222D4EF] ON [dbo].[Division]
(
	[Conference_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__Match__MatchType__628FA481]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__Match__MatchType__628FA481] ON [dbo].[Match]
(
	[MatchTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__Match__SeasonId__5EBF139D]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__Match__SeasonId__5EBF139D] ON [dbo].[Match]
(
	[SeasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__Match__StatusId__619B8048]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__Match__StatusId__619B8048] ON [dbo].[Match]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Match_Team2]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Match_Team2] ON [dbo].[Match]
(
	[Team_Away] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Match_Team3]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Match_Team3] ON [dbo].[Match]
(
	[Team_Home] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__MatchLog__Action__6383C8BA]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__MatchLog__Action__6383C8BA] ON [dbo].[MatchLog]
(
	[ActionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__MatchLog__MatchI__693CA210]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__MatchLog__MatchI__693CA210] ON [dbo].[MatchLog]
(
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__MatchLog__Player__6477ECF3]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__MatchLog__Player__6477ECF3] ON [dbo].[MatchLog]
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__MatchLog__TeamId__5AEE82B9]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__MatchLog__TeamId__5AEE82B9] ON [dbo].[MatchLog]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_Player_Country]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Player_Country] ON [dbo].[Player]
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__PlayerInT__Seaso__4E88ABD4]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__PlayerInT__Seaso__4E88ABD4] ON [dbo].[PlayerInTeam]
(
	[SeasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__PlayerInT__TeamI__5812160E]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__PlayerInT__TeamI__5812160E] ON [dbo].[PlayerInTeam]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__PlayerSta__Match__6A30C649]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__PlayerSta__Match__6A30C649] ON [dbo].[PlayerStatistics]
(
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__PlayerSta__Playe__66603565]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__PlayerSta__Playe__66603565] ON [dbo].[PlayerStatistics]
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__PlayerSta__TeamI__5BE2A6F2]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__PlayerSta__TeamI__5BE2A6F2] ON [dbo].[PlayerStatistics]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__PostSeaso__Seaso__534D60F1]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__PostSeaso__Seaso__534D60F1] ON [dbo].[PostSeason]
(
	[SeasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__PostSeaso__TeamI__59063A47]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__PostSeaso__TeamI__59063A47] ON [dbo].[PostSeason]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__User__RoleId__5629CD9C]    Script Date: 28.03.2022 18:36:46 ******/
CREATE NONCLUSTERED INDEX [IX_FK__User__RoleId__5629CD9C] ON [dbo].[User]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Division]  WITH CHECK ADD  CONSTRAINT [FK__Division__Confer__4222D4EF] FOREIGN KEY([Conference_id])
REFERENCES [dbo].[Conference] ([Conference_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Division] CHECK CONSTRAINT [FK__Division__Confer__4222D4EF]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK__Match__MatchType__628FA481] FOREIGN KEY([MatchTypeId])
REFERENCES [dbo].[MatchType] ([MatchTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK__Match__MatchType__628FA481]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK__Match__SeasonId__5EBF139D] FOREIGN KEY([SeasonId])
REFERENCES [dbo].[Season] ([SeasonId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK__Match__SeasonId__5EBF139D]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK__Match__StatusId__619B8048] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK__Match__StatusId__619B8048]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team2] FOREIGN KEY([Team_Away])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Team2]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team3] FOREIGN KEY([Team_Home])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Team3]
GO
ALTER TABLE [dbo].[MatchLog]  WITH CHECK ADD  CONSTRAINT [FK__MatchLog__Action__6383C8BA] FOREIGN KEY([ActionType])
REFERENCES [dbo].[ActionType] ([ActionTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MatchLog] CHECK CONSTRAINT [FK__MatchLog__Action__6383C8BA]
GO
ALTER TABLE [dbo].[MatchLog]  WITH CHECK ADD  CONSTRAINT [FK__MatchLog__MatchI__693CA210] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[MatchLog] CHECK CONSTRAINT [FK__MatchLog__MatchI__693CA210]
GO
ALTER TABLE [dbo].[MatchLog]  WITH CHECK ADD  CONSTRAINT [FK__MatchLog__Player__6477ECF3] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([PlayerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MatchLog] CHECK CONSTRAINT [FK__MatchLog__Player__6477ECF3]
GO
ALTER TABLE [dbo].[MatchLog]  WITH CHECK ADD  CONSTRAINT [FK__MatchLog__TeamId__5AEE82B9] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MatchLog] CHECK CONSTRAINT [FK__MatchLog__TeamId__5AEE82B9]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_Country]
GO
ALTER TABLE [dbo].[PlayerInTeam]  WITH CHECK ADD  CONSTRAINT [FK__PlayerInT__Playe__656C112C] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([PlayerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerInTeam] CHECK CONSTRAINT [FK__PlayerInT__Playe__656C112C]
GO
ALTER TABLE [dbo].[PlayerInTeam]  WITH CHECK ADD  CONSTRAINT [FK__PlayerInT__Seaso__4E88ABD4] FOREIGN KEY([SeasonId])
REFERENCES [dbo].[Season] ([SeasonId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerInTeam] CHECK CONSTRAINT [FK__PlayerInT__Seaso__4E88ABD4]
GO
ALTER TABLE [dbo].[PlayerInTeam]  WITH CHECK ADD  CONSTRAINT [FK__PlayerInT__TeamI__5812160E] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerInTeam] CHECK CONSTRAINT [FK__PlayerInT__TeamI__5812160E]
GO
ALTER TABLE [dbo].[PlayerStatistics]  WITH CHECK ADD  CONSTRAINT [FK__PlayerSta__Match__6A30C649] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[PlayerStatistics] CHECK CONSTRAINT [FK__PlayerSta__Match__6A30C649]
GO
ALTER TABLE [dbo].[PlayerStatistics]  WITH CHECK ADD  CONSTRAINT [FK__PlayerSta__Playe__66603565] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([PlayerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerStatistics] CHECK CONSTRAINT [FK__PlayerSta__Playe__66603565]
GO
ALTER TABLE [dbo].[PlayerStatistics]  WITH CHECK ADD  CONSTRAINT [FK__PlayerSta__TeamI__5BE2A6F2] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerStatistics] CHECK CONSTRAINT [FK__PlayerSta__TeamI__5BE2A6F2]
GO
ALTER TABLE [dbo].[PositionOfPlayer]  WITH CHECK ADD  CONSTRAINT [FK_PositionOfPlayer_Player] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([PlayerId])
GO
ALTER TABLE [dbo].[PositionOfPlayer] CHECK CONSTRAINT [FK_PositionOfPlayer_Player]
GO
ALTER TABLE [dbo].[PositionOfPlayer]  WITH CHECK ADD  CONSTRAINT [FK_PositionOfPlayer_PositionName] FOREIGN KEY([PositionId])
REFERENCES [dbo].[PositionName] ([PositionId])
GO
ALTER TABLE [dbo].[PositionOfPlayer] CHECK CONSTRAINT [FK_PositionOfPlayer_PositionName]
GO
ALTER TABLE [dbo].[PostSeason]  WITH CHECK ADD  CONSTRAINT [FK__PostSeaso__Seaso__534D60F1] FOREIGN KEY([SeasonId])
REFERENCES [dbo].[Season] ([SeasonId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostSeason] CHECK CONSTRAINT [FK__PostSeaso__Seaso__534D60F1]
GO
ALTER TABLE [dbo].[PostSeason]  WITH CHECK ADD  CONSTRAINT [FK__PostSeaso__TeamI__59063A47] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostSeason] CHECK CONSTRAINT [FK__PostSeaso__TeamI__59063A47]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Division] FOREIGN KEY([DivisionId])
REFERENCES [dbo].[Division] ([DivisionId])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Division]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__RoleId__5629CD9C] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__RoleId__5629CD9C]
GO
USE [master]
GO
ALTER DATABASE [BasketballSystem] SET  READ_WRITE 
GO
