USE [master]
GO
/****** Object:  Database [TutorDb]    Script Date: 8/11/2021 9:17:56 PM ******/
CREATE DATABASE [TutorDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TutorDb', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TutorDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TutorDb_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TutorDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TutorDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TutorDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TutorDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TutorDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TutorDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TutorDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TutorDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [TutorDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TutorDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TutorDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TutorDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TutorDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TutorDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TutorDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TutorDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TutorDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TutorDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TutorDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TutorDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TutorDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TutorDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TutorDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TutorDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TutorDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TutorDb] SET RECOVERY FULL 
GO
ALTER DATABASE [TutorDb] SET  MULTI_USER 
GO
ALTER DATABASE [TutorDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TutorDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TutorDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TutorDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TutorDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TutorDb', N'ON'
GO
ALTER DATABASE [TutorDb] SET QUERY_STORE = OFF
GO
USE [TutorDb]
GO
/****** Object:  Table [dbo].[Advertisement]    Script Date: 8/11/2021 9:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [nvarchar](max) NULL,
 CONSTRAINT [PK_Advertisement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 8/11/2021 9:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountNo] [nvarchar](max) NULL,
	[Bank] [nvarchar](max) NULL,
	[Branch] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[TutorId] [int] NULL,
 CONSTRAINT [PK_BankAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 8/11/2021 9:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CardNo] [nvarchar](max) NULL,
	[CVN] [nvarchar](max) NULL,
	[ExpiryDate] [nvarchar](max) NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashOutRequest]    Script Date: 8/11/2021 9:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashOutRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TutorId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NULL,
	[Date] [datetime] NULL,
	[BankAccountId] [int] NOT NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_CashOutRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conversation]    Script Date: 8/11/2021 9:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TutorId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[LastMessageDate] [datetime] NULL,
 CONSTRAINT [PK_Conversation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonRequest]    Script Date: 8/11/2021 9:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[TutorId] [int] NOT NULL,
	[Start] [datetime] NULL,
	[End] [datetime] NULL,
	[HourlyRate] [decimal](18, 2) NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_LessonRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 8/11/2021 9:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TutorId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Text] [nvarchar](max) NULL,
	[Attachment] [nvarchar](max) NULL,
	[IsSeen] [bit] NULL,
	[Direction] [nvarchar](max) NULL,
	[SentDate] [datetime] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 8/11/2021 9:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[TutorId] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Rating] [decimal](18, 2) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/11/2021 9:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[MobileNumber] [nvarchar](max) NULL,
	[DOB] [datetime] NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 8/11/2021 9:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[MobileNumber] [nvarchar](max) NULL,
	[DOB] [datetime] NULL,
	[Password] [nvarchar](max) NULL,
	[HighestQualification] [nvarchar](max) NULL,
	[Hometown] [nvarchar](max) NULL,
	[MainSubject] [nvarchar](max) NULL,
	[Curriculum] [nvarchar](max) NULL,
	[ProfilePicture] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[HourlyRate] [decimal](18, 2) NULL,
	[CurrentBalance] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Tutor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Advertisement] ON 

INSERT [dbo].[Advertisement] ([ID], [StudentId], [Title], [Description], [CreatedDate], [IsActive]) VALUES (1034, 3033, N'IT tutor required', N'I want to learn android app development but I do not have much knowledge about this. So, I am looking for an online tutor who can teach android app development from scratch. My budget is Rs. 1500 per hour. Please contact me through Whatsapp using the 0717258565 number.', CAST(N'2021-08-03T23:14:18.000' AS DateTime), N'Active')
INSERT [dbo].[Advertisement] ([ID], [StudentId], [Title], [Description], [CreatedDate], [IsActive]) VALUES (1035, 3034, N'English tutor needed', N'We need a child friendly male teacher who speaks English fluently for our son(4 years old). we need two classes per week (Saturday and Sunday).We are willing to pay Rs.2000 per hour. Please contact us through Whatsapp using the 0711331003 number.', CAST(N'2021-08-03T23:16:45.000' AS DateTime), N'Active')
SET IDENTITY_INSERT [dbo].[Advertisement] OFF
GO
SET IDENTITY_INSERT [dbo].[BankAccount] ON 

INSERT [dbo].[BankAccount] ([ID], [AccountNo], [Bank], [Branch], [Name], [TutorId]) VALUES (2037, N'123123123', N'Union Bank', N'Gampaha', N'Uditha Dissanayake', 1016)
INSERT [dbo].[BankAccount] ([ID], [AccountNo], [Bank], [Branch], [Name], [TutorId]) VALUES (2038, N'12312312322', N'Union Bank', N'Kadawatha', N'Roshan Kulathilaka', 1017)
INSERT [dbo].[BankAccount] ([ID], [AccountNo], [Bank], [Branch], [Name], [TutorId]) VALUES (2040, N'8917312888', N'Union Bank', N'Kadawatha', N'Ashan Lakshitha', 1019)
INSERT [dbo].[BankAccount] ([ID], [AccountNo], [Bank], [Branch], [Name], [TutorId]) VALUES (2041, N'76879483743', N'Union Bank', N'Colombo', N'Nilantha Jayasooriya', 1020)
INSERT [dbo].[BankAccount] ([ID], [AccountNo], [Bank], [Branch], [Name], [TutorId]) VALUES (2042, N'4184719828', N'Union Bank', N'Colombo', N'Bhanuka Udukumbure', 1021)
INSERT [dbo].[BankAccount] ([ID], [AccountNo], [Bank], [Branch], [Name], [TutorId]) VALUES (2043, N'87234238498', N'Union Bank', N'Ragama', N'Tharaka Sandaruwan', 1022)
INSERT [dbo].[BankAccount] ([ID], [AccountNo], [Bank], [Branch], [Name], [TutorId]) VALUES (2044, N'8789879879', N'Union Bank', N'Ragama', N'Sandun Perera', 1023)
INSERT [dbo].[BankAccount] ([ID], [AccountNo], [Bank], [Branch], [Name], [TutorId]) VALUES (2045, N'78436328746', N'Union Bank', N'Yakkala', N'Milan Fernando', 1024)
INSERT [dbo].[BankAccount] ([ID], [AccountNo], [Bank], [Branch], [Name], [TutorId]) VALUES (2046, N'784832749832', N'Union Bank', N'Yakkala', N'Ranga Kasun', 1025)
INSERT [dbo].[BankAccount] ([ID], [AccountNo], [Bank], [Branch], [Name], [TutorId]) VALUES (3035, N'87489237', N'adasd', N'asdas', N'asdas', 2014)
INSERT [dbo].[BankAccount] ([ID], [AccountNo], [Bank], [Branch], [Name], [TutorId]) VALUES (3039, N'23467657', N'Union Bank', N'Gampaha', N'Arosha Dissanayake', 2015)
SET IDENTITY_INSERT [dbo].[BankAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[Card] ON 

INSERT [dbo].[Card] ([ID], [StudentId], [CardNo], [CVN], [ExpiryDate]) VALUES (3031, 3033, N'4893038459', N'244', N'8/2024')
INSERT [dbo].[Card] ([ID], [StudentId], [CardNo], [CVN], [ExpiryDate]) VALUES (3032, 3034, N'82348324237', N'688', N'7/2024')
SET IDENTITY_INSERT [dbo].[Card] OFF
GO
SET IDENTITY_INSERT [dbo].[Conversation] ON 

INSERT [dbo].[Conversation] ([ID], [TutorId], [StudentId], [LastMessageDate]) VALUES (1018, 2015, 3034, CAST(N'2021-08-11T14:34:09.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Conversation] OFF
GO
SET IDENTITY_INSERT [dbo].[LessonRequest] ON 

INSERT [dbo].[LessonRequest] ([ID], [StudentId], [TutorId], [Start], [End], [HourlyRate], [Status]) VALUES (5055, 3034, 2015, CAST(N'2021-08-12T21:10:00.000' AS DateTime), CAST(N'2021-08-12T23:10:00.000' AS DateTime), CAST(3000.00 AS Decimal(18, 2)), N'Pending')
SET IDENTITY_INSERT [dbo].[LessonRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([Id], [TutorId], [StudentId], [Text], [Attachment], [IsSeen], [Direction], [SentDate]) VALUES (2072, 2015, 3034, N'HI', NULL, NULL, N'TutorToStudent', CAST(N'2021-08-11T14:33:40.000' AS DateTime))
INSERT [dbo].[Message] ([Id], [TutorId], [StudentId], [Text], [Attachment], [IsSeen], [Direction], [SentDate]) VALUES (2073, 2015, 3034, N'I saw your advertisement ', NULL, NULL, N'TutorToStudent', CAST(N'2021-08-11T14:34:09.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (17, 3034, 1016, N'He is very knowledgeable and does a very good job at teaching', CAST(5.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:47:47.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (18, 3034, 1017, N'He is very knowledgeable and does a very good job at teaching', CAST(5.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:48:03.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (19, 3034, 1019, N'He is very knowledgeable and does a very good job at teaching', CAST(5.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:48:23.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (20, 3034, 1020, N'He is very knowledgeable and does a very good job at teaching', CAST(5.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:48:38.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (21, 3034, 1021, N'He is very knowledgeable and does a very good job at teaching', CAST(5.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:48:55.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (22, 3034, 1022, N'He is very knowledgeable and does a very good job at teaching', CAST(5.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:49:19.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (23, 3034, 1023, N'He is very knowledgeable and does a very good job at teaching', CAST(5.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:49:31.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (24, 3034, 1024, N'He is very knowledgeable and does a very good job at teaching', CAST(5.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:50:06.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (25, 3034, 1025, N'He is very knowledgeable and does a very good job at teaching', CAST(5.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:50:25.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (27, 3033, 1016, N'Has good teachings skills, does a fair job for what you pay.', CAST(3.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:57:23.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (28, 3033, 1017, N'Has good teachings skills, does a fair job for what you pay.', CAST(3.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:57:56.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (29, 3033, 1019, N'Has good teachings skills, does a fair job for what you pay.', CAST(3.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:58:20.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (30, 3033, 1020, N'Has good teachings skills, does a fair job for what you pay.', CAST(3.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:58:49.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (31, 3033, 1021, N'Has good teachings skills, does a fair job for what you pay.', CAST(3.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:59:09.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (32, 3033, 1022, N'Has good teachings skills, does a fair job for what you pay.', CAST(3.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:59:29.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (33, 3033, 1023, N'Has good teachings skills, does a fair job for what you pay.', CAST(3.00 AS Decimal(18, 2)), CAST(N'2021-08-04T08:59:54.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (34, 3033, 1024, N'Has good teachings skills, does a fair job for what you pay.', CAST(3.00 AS Decimal(18, 2)), CAST(N'2021-08-04T09:00:10.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (35, 3033, 1025, N'Has good teachings skills, does a fair job for what you pay.', CAST(3.00 AS Decimal(18, 2)), CAST(N'2021-08-04T09:00:24.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (1014, 3034, 2014, N'He is very knowledgeable and does a very good job at teaching', CAST(5.00 AS Decimal(18, 2)), CAST(N'2021-08-05T09:46:35.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (1015, 3034, 2015, N'He is very knowledgeable and does a very good job at teaching', CAST(5.00 AS Decimal(18, 2)), CAST(N'2021-08-05T09:46:50.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (1016, 3033, 2015, N'Has good teachings skills, does a fair job for what you pay.', CAST(3.00 AS Decimal(18, 2)), CAST(N'2021-08-05T09:48:55.000' AS DateTime))
INSERT [dbo].[Review] ([ID], [StudentId], [TutorId], [Comment], [Rating], [Date]) VALUES (1017, 3033, 2014, N'Has good teachings skills, does a fair job for what you pay.', CAST(3.00 AS Decimal(18, 2)), CAST(N'2021-08-05T09:49:10.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Email], [MobileNumber], [DOB], [Password]) VALUES (3033, N'Tharindu', N'Yasantha', N'tharindu@gmail.com', N'0711331003', CAST(N'1997-07-09T00:00:00.000' AS DateTime), N'87DB0457B8E9AEC4FAD84308B795A704A9A43BD33CC87F61CB6883864D3952E3')
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Email], [MobileNumber], [DOB], [Password]) VALUES (3034, N'chamath', N'nanayakkara', N'chamath@gmail.com', N'0718045787', CAST(N'1998-06-16T00:00:00.000' AS DateTime), N'87DB0457B8E9AEC4FAD84308B795A704A9A43BD33CC87F61CB6883864D3952E3')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Tutor] ON 

INSERT [dbo].[Tutor] ([ID], [FirstName], [LastName], [Email], [MobileNumber], [DOB], [Password], [HighestQualification], [Hometown], [MainSubject], [Curriculum], [ProfilePicture], [Summary], [HourlyRate], [CurrentBalance]) VALUES (1016, N'Uditha', N'Dissanayake', N'uditha@gmail.com', N'0773459745', CAST(N'1992-06-09T00:00:00.000' AS DateTime), N'87DB0457B8E9AEC4FAD84308B795A704A9A43BD33CC87F61CB6883864D3952E3', N'Phd', N'Gampaha', N'IT', N'Local', N'/Images/profile_b7cbcdc9-c9c3-4db4-8dc4-9b771c498fe6.png', N'University of Moratuwa graduate', CAST(3500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Tutor] ([ID], [FirstName], [LastName], [Email], [MobileNumber], [DOB], [Password], [HighestQualification], [Hometown], [MainSubject], [Curriculum], [ProfilePicture], [Summary], [HourlyRate], [CurrentBalance]) VALUES (1017, N'Roshan', N'Kulathilaka', N'roshan@gmail.com', N'0772323567', CAST(N'1997-11-05T00:00:00.000' AS DateTime), N'87DB0457B8E9AEC4FAD84308B795A704A9A43BD33CC87F61CB6883864D3952E3', N'MSC', N'Kadawatha', N'Maths', N'local', N'/Images/profile_d4d3cc47-f7d3-471f-aa5a-565e7a773136.png', N'University of Kelaniya graduate', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Tutor] ([ID], [FirstName], [LastName], [Email], [MobileNumber], [DOB], [Password], [HighestQualification], [Hometown], [MainSubject], [Curriculum], [ProfilePicture], [Summary], [HourlyRate], [CurrentBalance]) VALUES (1019, N'Ashan', N'Lakshitha', N'ashan@gmail.com', N'0774569871', CAST(N'1998-11-04T00:00:00.000' AS DateTime), N'87DB0457B8E9AEC4FAD84308B795A704A9A43BD33CC87F61CB6883864D3952E3', N'MSC', N'Kadawatha', N'Maths', N'Local', N'/Images/profile_5a100bfc-5e14-47e8-aaba-29b70e28363a.png', N'University of Moratuwa graduate', CAST(2500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Tutor] ([ID], [FirstName], [LastName], [Email], [MobileNumber], [DOB], [Password], [HighestQualification], [Hometown], [MainSubject], [Curriculum], [ProfilePicture], [Summary], [HourlyRate], [CurrentBalance]) VALUES (1020, N'Nilantha', N'Jayasooriya', N'nilantha@gmail.com', N'0774598692', CAST(N'1989-03-08T00:00:00.000' AS DateTime), N'87DB0457B8E9AEC4FAD84308B795A704A9A43BD33CC87F61CB6883864D3952E3', N'Degree', N'Colombo', N'Science', N'Local', N'/Images/profile_d84661eb-f17b-4c86-bc44-76d7adc2329e.png', N'University of Moratuwa graduate', CAST(2200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Tutor] ([ID], [FirstName], [LastName], [Email], [MobileNumber], [DOB], [Password], [HighestQualification], [Hometown], [MainSubject], [Curriculum], [ProfilePicture], [Summary], [HourlyRate], [CurrentBalance]) VALUES (1021, N'Bhanuka', N'Udukumbure', N'bhanuka@gmail.com', N'0718763498', CAST(N'1995-06-07T00:00:00.000' AS DateTime), N'87DB0457B8E9AEC4FAD84308B795A704A9A43BD33CC87F61CB6883864D3952E3', N'Degree', N'Colombo', N'Science', N'International', N'/Images/profile_c55c45ed-b2ca-4c17-be86-cee31ea404f9.png', N'University of Moratuwa graduate', CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Tutor] ([ID], [FirstName], [LastName], [Email], [MobileNumber], [DOB], [Password], [HighestQualification], [Hometown], [MainSubject], [Curriculum], [ProfilePicture], [Summary], [HourlyRate], [CurrentBalance]) VALUES (1022, N'Tharaka', N'Sandaruwan', N'tharaka@gmail.com', N'0774560864', CAST(N'1989-10-17T00:00:00.000' AS DateTime), N'87DB0457B8E9AEC4FAD84308B795A704A9A43BD33CC87F61CB6883864D3952E3', N'Diploma', N'Ragama', N'English', N'International', N'/Images/profile_48f542b7-1486-4fe3-8efe-dcac4109322f.png', N'University of Colombo undergraduate', CAST(1750.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Tutor] ([ID], [FirstName], [LastName], [Email], [MobileNumber], [DOB], [Password], [HighestQualification], [Hometown], [MainSubject], [Curriculum], [ProfilePicture], [Summary], [HourlyRate], [CurrentBalance]) VALUES (1023, N'Sandun', N'Perera', N'sandun@gmail.com', N'0716775694', CAST(N'1997-06-11T00:00:00.000' AS DateTime), N'87DB0457B8E9AEC4FAD84308B795A704A9A43BD33CC87F61CB6883864D3952E3', N'Diploma', N'Ragama', N'English', N'International', N'/Images/profile_d37d4a57-9c60-4621-bbf3-0ad60ce6461e.png', N'University of Moratuwa undergraduate', CAST(1500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Tutor] ([ID], [FirstName], [LastName], [Email], [MobileNumber], [DOB], [Password], [HighestQualification], [Hometown], [MainSubject], [Curriculum], [ProfilePicture], [Summary], [HourlyRate], [CurrentBalance]) VALUES (1024, N'Milan', N'Fernando', N'Milan@gmail.com', N'0775698456', CAST(N'1993-07-07T00:00:00.000' AS DateTime), N'87DB0457B8E9AEC4FAD84308B795A704A9A43BD33CC87F61CB6883864D3952E3', N'Experience', N'Yakkala', N'Music', N'International ', N'/Images/profile_8e83f7f9-5307-4f70-a215-1111e9421723.png', N'Has 5 years of teaching experience', CAST(1200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Tutor] ([ID], [FirstName], [LastName], [Email], [MobileNumber], [DOB], [Password], [HighestQualification], [Hometown], [MainSubject], [Curriculum], [ProfilePicture], [Summary], [HourlyRate], [CurrentBalance]) VALUES (1025, N'Ranga', N'Kasun', N'ranga@gmail.com', N'0765887689', CAST(N'1997-06-11T00:00:00.000' AS DateTime), N'87DB0457B8E9AEC4FAD84308B795A704A9A43BD33CC87F61CB6883864D3952E3', N'Experience', N'Yakkala', N'Music', N'International', N'/Images/profile_e1d476c4-3249-442e-ac4b-23a276294b23.png', N'Has 10 years of teaching experience', CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Tutor] ([ID], [FirstName], [LastName], [Email], [MobileNumber], [DOB], [Password], [HighestQualification], [Hometown], [MainSubject], [Curriculum], [ProfilePicture], [Summary], [HourlyRate], [CurrentBalance]) VALUES (2014, N'Kapila', N'Rupasighe', N'kapila@gmail.com', N'0774568798', CAST(N'2017-01-31T00:00:00.000' AS DateTime), N'87DB0457B8E9AEC4FAD84308B795A704A9A43BD33CC87F61CB6883864D3952E3', N'Degree', N'Anuradhapura', N'Science', N'local', N'/Images/profile_5557cd4c-7d5f-40da-b92b-60ac7bae096a.png', N'University of Moratuwa graduate', CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Tutor] ([ID], [FirstName], [LastName], [Email], [MobileNumber], [DOB], [Password], [HighestQualification], [Hometown], [MainSubject], [Curriculum], [ProfilePicture], [Summary], [HourlyRate], [CurrentBalance]) VALUES (2015, N'Arosha', N'Dissanayake', N'arosha@gmail.com', N'0774995829', CAST(N'1994-10-19T00:00:00.000' AS DateTime), N'87DB0457B8E9AEC4FAD84308B795A704A9A43BD33CC87F61CB6883864D3952E3', N'Phd', N'Gampaha', N'IT', N'local', N'/Images/profile_1a01399b-fa33-4b41-ad84-7c04e44241a4.png', N'University of Moratuwa graduate', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Tutor] OFF
GO
ALTER TABLE [dbo].[Advertisement]  WITH CHECK ADD  CONSTRAINT [FK_Advertisement_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Advertisement] CHECK CONSTRAINT [FK_Advertisement_Student]
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_Tutor] FOREIGN KEY([TutorId])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_Tutor]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Student]
GO
ALTER TABLE [dbo].[CashOutRequest]  WITH CHECK ADD  CONSTRAINT [FK_CashOutRequest_BankAccount] FOREIGN KEY([BankAccountId])
REFERENCES [dbo].[BankAccount] ([ID])
GO
ALTER TABLE [dbo].[CashOutRequest] CHECK CONSTRAINT [FK_CashOutRequest_BankAccount]
GO
ALTER TABLE [dbo].[CashOutRequest]  WITH CHECK ADD  CONSTRAINT [FK_CashOutRequest_Tutor] FOREIGN KEY([TutorId])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[CashOutRequest] CHECK CONSTRAINT [FK_CashOutRequest_Tutor]
GO
ALTER TABLE [dbo].[Conversation]  WITH CHECK ADD  CONSTRAINT [FK_Conversation_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Conversation] CHECK CONSTRAINT [FK_Conversation_Student]
GO
ALTER TABLE [dbo].[Conversation]  WITH CHECK ADD  CONSTRAINT [FK_Conversation_Tutor] FOREIGN KEY([TutorId])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Conversation] CHECK CONSTRAINT [FK_Conversation_Tutor]
GO
ALTER TABLE [dbo].[LessonRequest]  WITH CHECK ADD  CONSTRAINT [FK_LessonRequest_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[LessonRequest] CHECK CONSTRAINT [FK_LessonRequest_Student]
GO
ALTER TABLE [dbo].[LessonRequest]  WITH CHECK ADD  CONSTRAINT [FK_Tutor_LessonRequest] FOREIGN KEY([TutorId])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[LessonRequest] CHECK CONSTRAINT [FK_Tutor_LessonRequest]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Student]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Tutor] FOREIGN KEY([TutorId])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Tutor]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Student]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Tutor] FOREIGN KEY([TutorId])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Tutor]
GO
USE [master]
GO
ALTER DATABASE [TutorDb] SET  READ_WRITE 
GO
