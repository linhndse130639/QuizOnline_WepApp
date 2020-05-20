USE [master]
GO
/****** Object:  Database [QuizOnlineLinhNd]    Script Date: 5/20/2020 11:12:07 PM ******/
CREATE DATABASE [QuizOnlineLinhNd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuizOnlineLinhNd', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuizOnlineLinhNd.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuizOnlineLinhNd_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuizOnlineLinhNd_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuizOnlineLinhNd] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizOnlineLinhNd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizOnlineLinhNd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET RECOVERY FULL 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET  MULTI_USER 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizOnlineLinhNd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuizOnlineLinhNd] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuizOnlineLinhNd', N'ON'
GO
USE [QuizOnlineLinhNd]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/20/2020 11:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Email] [varchar](255) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[StatusId] [varchar](30) NOT NULL,
	[RoleId] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 5/20/2020 11:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answer](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[AnswerContent] [varchar](30) NOT NULL,
	[QuestionId] [int] NOT NULL,
 CONSTRAINT [PK__Answer__D48250044D48B1DD] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 5/20/2020 11:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[QuestionContent] [varchar](255) NOT NULL,
	[CorrectAnswerID] [varchar](30) NOT NULL,
	[SubjectId] [varchar](30) NOT NULL,
	[StatusId] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Question__0DC06FAC8E334E58] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/20/2020 11:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [varchar](30) NOT NULL,
	[RoleName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 5/20/2020 11:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[StatusName] [varchar](30) NOT NULL,
	[StatusId] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 5/20/2020 11:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [varchar](30) NOT NULL,
	[NumberOfQuestions] [int] NOT NULL,
	[SubjectName] [varchar](30) NOT NULL,
	[TimeTest] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Test]    Script Date: 5/20/2020 11:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test](
	[TestId] [varchar](30) NOT NULL,
	[TestTitle] [varchar](30) NOT NULL,
	[Score] [float] NULL,
	[CreateDate] [date] NOT NULL,
	[Email] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestQuestions]    Script Date: 5/20/2020 11:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestQuestions](
	[TestQuestionsId] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [varchar](30) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[AnswerId] [int] NOT NULL,
 CONSTRAINT [PK__TestQues__35E5A93CB2D42D10] PRIMARY KEY CLUSTERED 
(
	[TestQuestionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([Email], [Name], [Password], [StatusId], [RoleId]) VALUES (N'admin@gmail.com', N'admin', N'1', N'Activated', N'ADMIN')
INSERT [dbo].[Account] ([Email], [Name], [Password], [StatusId], [RoleId]) VALUES (N'linhnguyen131999@gmail.com', N'Nguyen Duc Linh', N'1', N'New', N'STUDENT')
INSERT [dbo].[Account] ([Email], [Name], [Password], [StatusId], [RoleId]) VALUES (N'student@gmail.com', N'Student Test', N'1', N'Activated', N'STUDENT')
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (2, N'RecordSet', 1)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (3, N'ResultSet', 1)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (4, N'DataSet', 1)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (5, N'RowSet', 1)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (6, N'Single -tier and two tier', 4)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (7, N'None of the others', 4)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (8, N'Three-tier and four tier', 4)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (9, N'two-tier and three-tier', 4)
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (1, CAST(N'2020-05-20' AS Date), N'Statement object return SQL query result as ____ objects', N'3', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (4, CAST(N'2020-05-20' AS Date), N'JDBC supports ____ and____ models', N'7', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (9, CAST(N'2020-05-20' AS Date), N'the ____ class is the primary class that has the driver information', N'1', N'PRJ321', N'QuesActive')
SET IDENTITY_INSERT [dbo].[Question] OFF
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (N'ADMIN', N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (N'STUDENT', N'Student')
INSERT [dbo].[Status] ([StatusName], [StatusId]) VALUES (N'Account is Activated', N'Activated')
INSERT [dbo].[Status] ([StatusName], [StatusId]) VALUES (N'Account have delete', N'Delete')
INSERT [dbo].[Status] ([StatusName], [StatusId]) VALUES (N'New Student', N'New')
INSERT [dbo].[Status] ([StatusName], [StatusId]) VALUES (N'Account is not Activated', N'notActivated')
INSERT [dbo].[Status] ([StatusName], [StatusId]) VALUES (N'Question is Active', N'QuesActive')
INSERT [dbo].[Status] ([StatusName], [StatusId]) VALUES (N'Question is Delete', N'QuesDelete')
INSERT [dbo].[Subject] ([SubjectId], [NumberOfQuestions], [SubjectName], [TimeTest]) VALUES (N'PRJ311', 40, N'Java Desktop', 60)
INSERT [dbo].[Subject] ([SubjectId], [NumberOfQuestions], [SubjectName], [TimeTest]) VALUES (N'PRJ321', 50, N'Java Web ', 80)
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK__Question__Status__1DE57479] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK__Question__Status__1DE57479]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK__Question__Subjec__1BFD2C07] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK__Question__Subjec__1BFD2C07]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Email])
GO
ALTER TABLE [dbo].[TestQuestions]  WITH CHECK ADD  CONSTRAINT [FK__TestQuest__Answe__25869641] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answer] ([AnswerId])
GO
ALTER TABLE [dbo].[TestQuestions] CHECK CONSTRAINT [FK__TestQuest__Answe__25869641]
GO
ALTER TABLE [dbo].[TestQuestions]  WITH CHECK ADD  CONSTRAINT [FK__TestQuest__Quest__24927208] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[TestQuestions] CHECK CONSTRAINT [FK__TestQuest__Quest__24927208]
GO
ALTER TABLE [dbo].[TestQuestions]  WITH CHECK ADD  CONSTRAINT [FK__TestQuest__TestI__239E4DCF] FOREIGN KEY([TestId])
REFERENCES [dbo].[Test] ([TestId])
GO
ALTER TABLE [dbo].[TestQuestions] CHECK CONSTRAINT [FK__TestQuest__TestI__239E4DCF]
GO
USE [master]
GO
ALTER DATABASE [QuizOnlineLinhNd] SET  READ_WRITE 
GO
