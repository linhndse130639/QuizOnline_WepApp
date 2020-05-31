USE [master]
GO
/****** Object:  Database [QuizOnlineLinhNd]    Script Date: 5/31/2020 10:42:10 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 5/31/2020 10:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Email] [varchar](255) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Password] [varchar](256) NOT NULL,
	[StatusId] [varchar](30) NOT NULL,
	[RoleId] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Account__A9D105352ABF2C8B] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 5/31/2020 10:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answer](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[AnswerContent] [varchar](300) NOT NULL,
	[QuestionId] [int] NULL,
 CONSTRAINT [PK__Answer__D48250044D48B1DD] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 5/31/2020 10:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[QuestionContent] [varchar](500) NOT NULL,
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
/****** Object:  Table [dbo].[Role]    Script Date: 5/31/2020 10:42:10 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 5/31/2020 10:42:10 PM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 5/31/2020 10:42:10 PM ******/
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
/****** Object:  Table [dbo].[Test]    Script Date: 5/31/2020 10:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
	[TestTitle] [varchar](30) NOT NULL,
	[Score] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Email] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Test__8CC3316043F76927] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestQuestions]    Script Date: 5/31/2020 10:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestQuestions](
	[TestQuestionsId] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [int] NULL,
	[QuestionId] [int] NOT NULL,
	[AnswerId] [int] NOT NULL,
 CONSTRAINT [PK__TestQues__35E5A93CB2D42D10] PRIMARY KEY CLUSTERED 
(
	[TestQuestionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Email], [Name], [Password], [StatusId], [RoleId]) VALUES (N'admin@gmail.com', N'admin', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Activated', N'ADMIN')
INSERT [dbo].[Account] ([Email], [Name], [Password], [StatusId], [RoleId]) VALUES (N'linhnguyen131999@gmail.com', N'Nguyen Duc Linh', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'New', N'STUDENT')
INSERT [dbo].[Account] ([Email], [Name], [Password], [StatusId], [RoleId]) VALUES (N'student@gmail.com', N'Student Test', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Activated', N'STUDENT')
INSERT [dbo].[Account] ([Email], [Name], [Password], [StatusId], [RoleId]) VALUES (N'test@gmail.com', N'linh linh', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'New', N'STUDENT')
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (2, N'null', 1)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (3, N'ResultSet', 1)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (4, N'DataSet', 1)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (5, N'RowSet', 1)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (6, N'Single -tier and two tier', 4)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (7, N'None of the others', 4)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (8, N'Three-tier and four tier', 4)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (9, N'two-tier and three-tier', 4)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (20, N'fm.stringWidth(s)', 21)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (21, N'fm.getHeight(s)', 21)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (22, N'fm.getWidth(s)', 21)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (23, N'getLength(s)', 21)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (24, N'Depends on the particular implementation of the Java Virtual Machine', 22)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (25, N'FlowLayout.CENTER', 22)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (26, N'FlowLayout.RIGHT', 22)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (27, N'FlowLayout.LEFT', 22)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (28, N'DOM', 23)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (29, N'DCE', 23)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (30, N'CORBAa', 23)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (31, N'RMI', 23)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (32, N'The format of the resource name depends on the protocol being used', 24)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (33, N'The resource can be an HTML page, an image or simply any file', 24)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (34, N'URL is a reference or an address to a resource on the Internet', 24)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (35, N'In URL, port number to which you connect has to be specified', 24)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (36, N'setVisible( int height, int width)', 25)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (37, N'setSize( int height, int width)', 25)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (38, N'setSize( int width, int height)', 25)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (39, N'setVisible( int width, int height)', 25)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (40, N'User-driven programming.', 26)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (41, N'Action-driven programming.', 26)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (42, N'Event-driven programming.', 26)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (43, N'Mouse-driven programming', 26)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (44, N'Frame', 27)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (45, N'Mouse', 27)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (46, N'Monitor', 27)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (47, N'Button', 27)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (48, N'Serializable', 28)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (49, N'ObjectInput', 28)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (50, N'Externalization', 28)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (51, N'FileFilter', 28)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (52, N'getHostAddress()', 29)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (53, N'getIPAddress()', 29)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (54, N'getAddress()', 29)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (55, N'getIP()', 29)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (56, N'jta.setText(s)', 30)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (57, N'jta.appendText(s)', 30)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (58, N'jta.append(s)', 30)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (59, N'jta.insertText(s)', 30)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (60, N'None of the above.', 31)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (61, N'jScrollPane.insert(jta)', 31)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (62, N'jScrollPane.add(jta)', 31)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (63, N'jScrollPane.addItem(jta)', 31)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (64, N'Statement statement = Connection.createStatement();', 32)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (65, N'Statement statement = connection.create();', 32)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (66, N'Statement statement = conn.createStatement();', 32)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (67, N'Statement statement = conn.statement();', 32)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (68, N'A candidate key', 33)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (69, N'A primary key', 33)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (70, N'A superkey', 33)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (71, N'A key', 33)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (72, N'Dialog class', 34)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (73, N'Applet class', 34)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (74, N'Container class', 34)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (75, N'MenuComponent class', 34)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (76, N'getImmediate', 35)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (77, N'getParent()', 35)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (78, N'getContainer', 35)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (79, N'getVisible()', 35)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (80, N'javax.swing.Component', 36)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (81, N'java.awt. Two Dimensional Graphics 2D', 36)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (82, N'java.awt. Two Dimensional Graphics', 36)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (83, N'java.awt.Transform', 36)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (84, N'Type 3', 37)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (85, N'Type 1', 37)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (86, N'Type 4', 37)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (87, N'Type 2', 37)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (88, N'FlowLayout', 38)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (89, N'Borderlayout', 38)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (90, N'Which layout places the components in rows and columns is Depends on the particular implementation of the Java Virtual Machine', 38)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (91, N'GridLayout', 38)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (92, N'notifyAll()', 39)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (93, N'finalize()', 39)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (94, N'wait()', 39)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (95, N'notify()', 39)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (96, N'g.drawLine(0, 0, getHeight(), getHeight())', 40)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (97, N'g.drawLine(0, 0, getWidth(), getHeight())', 40)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (98, N'g.drawLine(0, 0, getWidth(), getWidth())', 40)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (99, N'g.drawLine(0, 0, 100, 100)', 40)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (100, N'A frame.', 41)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (101, N'A screen.', 41)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (102, N'A window.', 41)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (103, N'A box.', 41)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (104, N'GUI Components, Event Listeners, Application Code', 42)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (105, N'Frames, Code, Events', 42)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (106, N'GUI Components, Graphics, Code', 42)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (107, N'Windows, Buttons, Mice', 42)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (108, N'socket.getInetAddress();', 43)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (109, N'socket.retrieveInetAddress();', 43)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (110, N'socket.InetAddress();', 43)
GO
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (111, N'socket.obtainInetAddress();', 43)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (112, N'a LinkedList', 44)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (113, N'a Vector', 44)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (114, N'an ArrayList', 44)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (115, N'an array', 44)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (116, N'SQL', 45)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (117, N'Integrity', 45)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (118, N'Language', 45)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (119, N'Structure', 45)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (120, N'Class.loadClass("sun.jdbc.odbc.JdbcOdbcDriver")', 46)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (121, N'Class.loadClass("sun.jdbc.odbc.JdbcOdbcDriver")', 46)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (122, N'Class.forName(sun.jdbc.odbc.JdbcOdbcDriver)', 46)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (123, N'Class.forName("sun.jdbc.odbc.JdbcOdbcDriver")', 46)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (124, N'Class.loadClass("sun.jdbc.odbc.JdbcOdbcDriver")', 47)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (125, N'Class.forName("sun.jdbc.odbc.JdbcOdbcDriver")', 47)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (126, N'Class.forName(sun.jdbc.odbc.JdbcOdbcDriver)', 47)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (127, N'Class.loadClass("sun.jdbc.odbc.JdbcOdbcDriver")', 47)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (128, N'Class.forName(sun.jdbc.odbc.JdbcOdbcDriver)', 48)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (129, N'Class.forName("sun.jdbc.odbc.JdbcOdbcDriver")', 48)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (130, N'Class.loadClass(sun.jdbc.odbc.JdbcOdbcDriver)', 48)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (131, N'Class.forName("sun.jdbc.odbc.JdbcOdbcDriver")', 48)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (132, N'getPreferred( )', 49)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (133, N'getRequiredSize( )', 49)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (134, N'getLayout( )', 49)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (135, N'getPreferredSize( )', 49)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (136, N'Runnable', 50)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (137, N'Connections', 50)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (138, N'MapConnections', 50)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (139, N'Set', 50)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (140, N'terminate()', 51)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (141, N'suspend()', 51)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (142, N'stop()', 51)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (143, N'sleep()', 51)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (144, N'BorderLayout', 52)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (145, N'CardLayout', 52)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (146, N'FlowLayput', 52)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (147, N'GirdLayout', 52)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (148, N'Arbitary contents', 53)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (149, N'Value = key', 53)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (150, N'Key = value', 53)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (151, N'Value : key', 53)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (152, N'setLayout(new FIowLayout()):', 54)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (153, N'setFIowLayout();', 54)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (154, N'addLayout(new FIowLayout()):', 54)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (155, N'setLayoutManager(new FIowLayout()):', 54)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (156, N'getNumberFormat()', 55)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (157, N'getCurrencyInstance()', 55)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (158, N'getInstance()', 55)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (159, N'getNumberInstance()', 55)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (160, N'vendor independent', 56)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (161, N'enable connecting to any database system', 56)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (162, N'platform independent', 56)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (163, N'database access faster than other languages', 56)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (164, N'openConnection()', 57)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (165, N'accept()', 57)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (166, N'connect()', 57)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (167, N'makeConnection()', 57)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (168, N'input stream', 58)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (169, N'output stream', 58)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (170, N'in-out stream', 58)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (171, N'both input stream and output stream', 58)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (172, N'notifyAll()', 59)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (173, N'wait()', 59)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (174, N'notify()', 59)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (175, N'join()', 59)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (176, N'ransport layer', 60)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (177, N'Remote Reference layer', 60)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (178, N'Stub and Skeleton layer', 60)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (179, N'Stub and Skeleton layers', 60)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (180, N'Multithread', 61)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (181, N'Threading', 61)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (182, N'DaemonThread', 61)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (183, N'MonoThread', 61)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (184, N'race', 62)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (185, N'synchronization', 62)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (186, N'deadlock', 62)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (187, N'blocking', 62)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (188, N'java.rmi.RemoteException', 63)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (189, N'java.rmi.MarshalException', 63)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (190, N'java.rmi.RMIException', 63)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (191, N'java.rmi.ServerRuntimeException', 63)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (192, N'rmip', 64)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (193, N'ftp', 64)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (194, N'rmic', 64)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (195, N'http', 64)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (196, N'setDaemon()', 65)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (197, N'convertToDaemon()', 65)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (198, N'isDaemon()', 65)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (199, N'SetDaemon()', 65)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (200, N'javax.rmi', 66)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (201, N'java.rmi', 66)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (202, N'java.net', 66)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (203, N'javax.net', 66)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (204, N'getHostAddress()', 67)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (205, N'getLocalHost()', 67)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (206, N'getFile()', 67)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (207, N'getHost()', 67)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (208, N'join()', 68)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (209, N'wait()', 68)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (210, N'interrupt()', 68)
GO
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (211, N'sleep()', 68)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (212, N'block of code', 69)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (213, N'class', 69)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (214, N'function', 69)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (215, N'method', 69)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (216, N'declarations', 70)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (217, N'scriptlets', 70)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (218, N'expressions', 70)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (219, N'declarationss', 70)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (220, N'<error_page>', 71)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (221, N'<error-location>', 71)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (222, N'<error>', 71)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (223, N'<error-page>', 71)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (224, N'<session-config>', 72)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (225, N'<session_config>', 72)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (226, N'<session-configuration>', 72)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (227, N'<webapp>', 72)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (228, N'Java EE 5', 73)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (229, N'Java EE 6', 73)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (230, N'Java EE 4', 73)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (231, N'Java EE 3', 73)
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (1, CAST(N'2020-05-20' AS Date), N'Statement object return SQL query result as ____ objects', N'4', N'PRJ311', N'QuesDelete')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (4, CAST(N'2020-05-20' AS Date), N'JDBC supports ____ and____ models', N'7', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (9, CAST(N'2020-05-20' AS Date), N'the ____ class is the primary class that has the driver information', N'1', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (21, CAST(N'2020-05-25' AS Date), N'Invoking __________ returns the width of the string in a FontMetrics object fm.', N'20', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (22, CAST(N'2020-05-27' AS Date), N'What is the default alignment for a FlowLayout?', N'25', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (23, CAST(N'2020-05-27' AS Date), N'Which distributed object technology is most appropriate for systems that consist entirely of Java objects?', N'30', N'PRJ311', N'QuesDelete')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (24, CAST(N'2020-05-27' AS Date), N'Which statements are CORRECT about network resource?', N'33', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (25, CAST(N'2020-05-27' AS Date), N'What method sets the size of the displayed JFrame?', N'38', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (26, CAST(N'2020-05-27' AS Date), N'What is it called when a program is written to respond to the button clicks, menu selections, and other actions of the user in whatever order the user does them?', N'42', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (27, CAST(N'2020-05-27' AS Date), N'What is the one component that nearly all GUI programs will have?', N'44', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (28, CAST(N'2020-05-27' AS Date), N'Which of these is an interface for control over serialization and deserialization?', N'50', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (29, CAST(N'2020-05-27' AS Date), N'The ____________ method in the InetAddress class returns the IP address.', N'52', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (30, CAST(N'2020-05-27' AS Date), N'The method __________ appends a string s into the text area jta.', N'58', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (31, CAST(N'2020-05-27' AS Date), N'The method __________ adds a text area jta to a scrollpane jScrollPane.', N'62', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (32, CAST(N'2020-05-27' AS Date), N'To create a statement on a Connection object conn, use', N'66', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (33, CAST(N'2020-05-27' AS Date), N'32 ________ is an attribute or a set of attributes that uniquely identifies the relation.', N'70', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (34, CAST(N'2020-05-27' AS Date), N'What are the immediate super classes of the following classes?', N'74', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (35, CAST(N'2020-05-27' AS Date), N'Which Component method is used to access a component''s immediate Container?', N'77', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (36, CAST(N'2020-05-27' AS Date), N'The class ___ contains methods for drawing coordinated with grahical transformations such as rotating, shearing...', N'81', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (37, CAST(N'2020-05-27' AS Date), N'drivers that use a pure Java client and communicate with a middleware server using a database-independent protocol. The middleware serverthen communicates the client''s requests to the dat', N'84', N'PRJ311', N'QuesDelete')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (38, CAST(N'2020-05-27' AS Date), N'The _____ layout places the components in rows and columns', N'2', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (39, CAST(N'2020-05-27' AS Date), N'The ______ method causes a thread to release the lock or monitor of the object, allowing another thread to access it', N'94', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (40, CAST(N'2020-05-27' AS Date), N'Given a Graphics object g, to draw a line from the upper left corner to the bottom right corner, you use __________.', N'97', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (41, CAST(N'2020-05-27' AS Date), N'In Java, what do you call an area on the screen that has nice borders and various buttons along the top border?', N'102', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (42, CAST(N'2020-05-27' AS Date), N'The three software parts of a GUI program are:', N'104', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (43, CAST(N'2020-05-27' AS Date), N'You can invoke ______________ on a Socket object, say socket, to obtain an InetAddress object.', N'108', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (44, CAST(N'2020-05-27' AS Date), N'The data in DefaultTableModel are stored in ___________.', N'113', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (45, CAST(N'2020-05-27' AS Date), N'In a relational data model, _________ defines the representation of the data.', N'119', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (46, CAST(N'2020-05-27' AS Date), N'Which of the following statements loads the JDBC-ODBC driver?', N'2', N'PRJ311', N'QuesDelete')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (47, CAST(N'2020-05-27' AS Date), N'Which of the following statements loads the JDBC-ODBC driver?', N'2', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (48, CAST(N'2020-05-27' AS Date), N'Which of the following statements loads the JDBC-ODBC driver?', N'129', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (49, CAST(N'2020-05-27' AS Date), N'Which method returns the preferred size of a component?', N'135', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (50, CAST(N'2020-05-27' AS Date), N'Which of these interfaces is implemented by Thread class?', N'136', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (51, CAST(N'2020-05-27' AS Date), N'Which of these method of Thread class is used to Suspend a thread for a period of time?', N'143', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (52, CAST(N'2020-05-27' AS Date), N'what is the Layout Manager of the GUI (see picture)', N'147', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (53, CAST(N'2020-05-27' AS Date), N'Common syntax of each line in the properties file:', N'150', N'PRJ311', N'QuesDelete')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (54, CAST(N'2020-05-27' AS Date), N'Select the correct statement which sets the layout manager of a given frame to FIowLayout Manager.', N'152', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (55, CAST(N'2020-05-27' AS Date), N'To get an object NumberFormat class that initialized to the specified locale, we use', N'159', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (56, CAST(N'2020-05-27' AS Date), N'Which are the advantages of JDBC? (select two)', N'160', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (57, CAST(N'2020-05-27' AS Date), N'Which statements are CORRECT about properties file?', N'164', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (58, CAST(N'2020-05-27' AS Date), N'When a connection is established, we can get which streams', N'171', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (59, CAST(N'2020-05-27' AS Date), N'The _______ method wakes up all threads that are waiting for a monitor', N'172', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (60, CAST(N'2020-05-27' AS Date), N'Which RMI layer make invocation to remote methods', N'177', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (61, CAST(N'2020-05-27' AS Date), N'______ facilitates many parts of same program to run serially but access a same resource', N'180', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (62, CAST(N'2020-05-27' AS Date), N'The _______ condition describes a situation where two or more threads a blocked forever, waiting for each other', N'186', N'PRJ311', N'QuesDelete')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (63, CAST(N'2020-05-27' AS Date), N'All the remote methods declared should be qualified to throw the exception ___________', N'188', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (64, CAST(N'2020-05-27' AS Date), N'Which protocol is used in RMI connection', N'194', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (65, CAST(N'2020-05-27' AS Date), N'The ______ method with the argument as true will convert the user thread to a daemon thread', N'196', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (66, CAST(N'2020-05-27' AS Date), N'Which package providing classes and interfaces for distributed computing in Java', N'201', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (67, CAST(N'2020-05-27' AS Date), N'Which method is used to to retrieve the row IP address in textual format', N'204', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (68, CAST(N'2020-05-27' AS Date), N'The _____ method forces the current running thread to wait until the thread it is joining with is no longer alive', N'208', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (69, CAST(N'2020-05-27' AS Date), N'A synchronized block is a _____ or a _____ qualified by synchronized keyword', N'215', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (70, CAST(N'2020-05-31' AS Date), N'JSP _______________ let you insert arbitrary code into the servlet''s jspService method (which is called by service).', N'217', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (71, CAST(N'2020-05-31' AS Date), N'Which of the following elements are used for error handling and are child elements of <web-app> of a deployment descriptor?', N'220', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (72, CAST(N'2020-05-31' AS Date), N'Identify the parent element of <session-timeout> element in web.xml', N'224', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (73, CAST(N'2020-05-31' AS Date), N'EJB 3.0 specifications are first implemented in ______', N'228', N'PRJ311', N'QuesActive')
SET IDENTITY_INSERT [dbo].[Question] OFF
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (N'ADMIN', N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (N'STUDENT', N'Student')
INSERT [dbo].[Status] ([StatusName], [StatusId]) VALUES (N'Account is Activated', N'Activated')
INSERT [dbo].[Status] ([StatusName], [StatusId]) VALUES (N'Account have delete', N'Delete')
INSERT [dbo].[Status] ([StatusName], [StatusId]) VALUES (N'New Student', N'New')
INSERT [dbo].[Status] ([StatusName], [StatusId]) VALUES (N'Question is Active', N'QuesActive')
INSERT [dbo].[Status] ([StatusName], [StatusId]) VALUES (N'Question is Delete', N'QuesDelete')
INSERT [dbo].[Subject] ([SubjectId], [NumberOfQuestions], [SubjectName], [TimeTest]) VALUES (N'PRJ311', 40, N'Java Desktop', 60)
INSERT [dbo].[Subject] ([SubjectId], [NumberOfQuestions], [SubjectName], [TimeTest]) VALUES (N'PRJ321', 50, N'Java Web ', 80)
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([TestId], [TestTitle], [Score], [CreateDate], [Email]) VALUES (8, N'PRJ311-Java Desktop', 2.25, CAST(N'2020-05-31' AS Date), N'student@gmail.com')
INSERT [dbo].[Test] ([TestId], [TestTitle], [Score], [CreateDate], [Email]) VALUES (9, N'PRJ311-Java Desktop', 0, CAST(N'2020-05-31' AS Date), N'student@gmail.com')
INSERT [dbo].[Test] ([TestId], [TestTitle], [Score], [CreateDate], [Email]) VALUES (10, N'PRJ311-Java Desktop', 1.25, CAST(N'2020-05-31' AS Date), N'student@gmail.com')
SET IDENTITY_INSERT [dbo].[Test] OFF
SET IDENTITY_INSERT [dbo].[TestQuestions] ON 

INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (178, 8, 44, 115)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (179, 8, 33, 71)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (180, 8, 42, 104)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (181, 8, 34, 74)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (182, 8, 66, 202)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (183, 8, 35, 76)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (184, 8, 58, 171)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (185, 8, 43, 111)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (186, 8, 29, 55)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (187, 8, 56, 161)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (188, 8, 32, 67)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (189, 8, 27, 46)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (190, 8, 40, 96)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (191, 8, 64, 194)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (192, 8, 60, 176)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (193, 8, 61, 182)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (194, 8, 59, 174)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (195, 8, 52, 146)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (196, 8, 63, 190)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (197, 8, 25, 38)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (198, 8, 50, 139)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (199, 8, 48, 130)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (200, 8, 65, 197)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (201, 8, 45, 117)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (202, 8, 55, 158)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (203, 8, 31, 61)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (204, 8, 54, 155)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (205, 8, 24, 33)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (206, 8, 26, 41)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (207, 8, 21, 23)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (208, 8, 68, 210)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (209, 8, 67, 206)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (210, 8, 49, 133)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (211, 8, 51, 142)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (212, 8, 22, 25)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (213, 8, 39, 94)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (214, 8, 28, 50)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (215, 8, 69, 213)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (216, 8, 47, 127)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (217, 8, 57, 166)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (218, 9, 50, 137)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (219, 9, 39, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (220, 9, 33, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (221, 9, 60, 179)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (222, 9, 61, 182)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (223, 9, 36, 82)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (224, 9, 21, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (225, 9, 40, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (226, 9, 43, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (227, 9, 55, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (228, 9, 27, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (229, 9, 59, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (230, 9, 38, 89)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (231, 9, 44, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (232, 9, 45, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (233, 9, 65, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (234, 9, 47, 125)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (235, 9, 67, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (236, 9, 28, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (237, 9, 56, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (238, 9, 42, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (239, 9, 26, 41)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (240, 9, 54, 153)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (241, 9, 58, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (242, 9, 52, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (243, 9, 49, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (244, 9, 69, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (245, 9, 63, 191)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (246, 9, 68, 209)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (247, 9, 41, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (248, 9, 35, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (249, 9, 24, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (250, 9, 29, 53)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (251, 9, 64, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (252, 9, 32, 65)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (253, 9, 31, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (254, 9, 25, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (255, 9, 51, 141)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (256, 9, 30, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (257, 9, 22, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (258, 10, 33, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (259, 10, 32, 65)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (260, 10, 24, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (261, 10, 44, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (262, 10, 50, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (263, 10, 69, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (264, 10, 29, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (265, 10, 57, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (266, 10, 35, 77)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (267, 10, 48, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (268, 10, 66, 201)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (269, 10, 45, 117)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (270, 10, 40, 97)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (271, 10, 56, 163)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (272, 10, 47, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (273, 10, 54, 154)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (274, 10, 36, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (275, 10, 65, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (276, 10, 26, 40)
GO
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (277, 10, 64, 194)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (278, 10, 42, 105)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (279, 10, 58, 169)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (280, 10, 25, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (281, 10, 41, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (282, 10, 31, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (283, 10, 61, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (284, 10, 21, 20)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (285, 10, 39, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (286, 10, 38, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (287, 10, 28, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (288, 10, 55, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (289, 10, 60, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (290, 10, 49, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (291, 10, 27, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (292, 10, 51, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (293, 10, 34, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (294, 10, 22, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (295, 10, 63, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (296, 10, 67, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (297, 10, 59, 2)
SET IDENTITY_INSERT [dbo].[TestQuestions] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__RoleId__1920BF5C] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__RoleId__1920BF5C]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__StatusI__182C9B23] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__StatusI__182C9B23]
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
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK__Test__Email__20C1E124] FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Email])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK__Test__Email__20C1E124]
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
