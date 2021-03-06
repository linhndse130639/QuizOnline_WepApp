USE [master]
GO
/****** Object:  Database [QuizOnlineLinhNd]    Script Date: 6/1/2020 10:24:31 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 6/1/2020 10:24:31 PM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 6/1/2020 10:24:31 PM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 6/1/2020 10:24:31 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 6/1/2020 10:24:31 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 6/1/2020 10:24:31 PM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 6/1/2020 10:24:31 PM ******/
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
/****** Object:  Table [dbo].[Test]    Script Date: 6/1/2020 10:24:31 PM ******/
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
/****** Object:  Table [dbo].[TestQuestions]    Script Date: 6/1/2020 10:24:31 PM ******/
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
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (232, N'sun.driver.jdbc.odbc', 74)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (233, N'jdbc.odbc.sun.JdbcOdbcDriver', 74)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (234, N'sun.jdbc.odbc.JdbcOdbcDriver', 74)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (235, N'jdbc.odbc.sun.driver', 74)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (236, N'createStatement(String, int);', 75)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (237, N'createStatement(int, String);', 75)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (238, N'createStatement();', 75)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (239, N'createStatement(int, int);', 75)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (240, N'executeQuery()', 76)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (241, N'executeUpdate()', 76)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (242, N'executeBatch()', 76)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (243, N'execute()', 76)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (244, N'getOutputStream', 77)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (245, N'getWriter', 77)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (246, N'getStream', 77)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (247, N'getBinaryStream', 77)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (248, N'\doc-root\WEB-INF\dd.xml', 78)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (249, N'\doc-root\WEB-INF\web.xml', 78)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (250, N'\doc-root\web.xml', 78)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (251, N'\doc-root\dd.xml', 78)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (252, N'JDBC', 79)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (253, N'None of the other choices', 79)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (254, N'JAVADB', 79)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (255, N'ODBC', 79)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (256, N'Single-tier and two-tier', 80)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (257, N'Three-tier and four-tier', 80)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (258, N'None of the other choices', 80)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (259, N'Two-tier and three-tier', 80)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (260, N'protocol:datasoursename', 81)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (261, N'protocol:subprotocol:datasoursename', 81)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (262, N'jdbc:datasoursename', 81)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (263, N'jdbc:odbc:datasoursename', 81)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (264, N'ODBCDriver', 82)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (265, N'Driver', 82)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (266, N'DriverManager', 82)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (267, N'None of the other choices', 82)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (268, N'HttpServletRequest', 83)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (269, N'ServletContext', 83)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (270, N'ServletConfig', 83)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (271, N'HttpServletResponse', 83)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (272, N'setType', 84)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (273, N'setContent', 84)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (274, N'setResponseContentType', 84)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (275, N'setContentType', 84)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (276, N'SC_NOT_FOUND', 85)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (277, N'SC_INTERNAL_SERVER_ERROR', 85)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (278, N'SC_MOVED_TEMPORARILY', 85)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (279, N'SC_OK', 85)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (280, N'getStream', 86)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (281, N'getOutputStream', 86)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (282, N'getWriter', 86)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (283, N'getBinaryStream', 86)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (284, N'PUT method', 87)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (285, N'GET method', 87)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (286, N'HEAD method', 87)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (287, N'POST method', 87)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (288, N'GET method', 88)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (289, N'POST method', 88)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (290, N'HEAD method', 88)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (291, N'PUT method', 88)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (292, N'OPTIONS method', 89)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (293, N'CONNECT method', 89)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (294, N'TRACE method', 89)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (295, N'COMPARE method', 89)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (296, N'PUT method', 90)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (297, N'COPY method', 90)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (298, N'WRITE method', 90)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (299, N'FTP methodd', 90)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (300, N'TRACE method', 91)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (301, N'OPTIONS method', 91)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (302, N'HEAD method', 91)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (303, N'DEBUG method', 91)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (304, N'Codes starting from 500', 92)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (305, N'Codes starting from 200', 92)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (306, N'Codes starting from 300', 92)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (307, N'Codes starting from 400', 92)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (308, N'/WEB-INF/classes', 93)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (309, N'/root/classes', 93)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (310, N'/classes', 93)
GO
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (311, N'/META-INF/classes', 93)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (312, N'session', 94)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (313, N'httpsession', 94)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (314, N'page', 94)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (315, N'request', 94)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (316, N'session', 95)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (317, N'request', 95)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (318, N'application', 95)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (319, N'page', 95)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (320, N'include', 96)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (321, N'session', 96)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (322, N'scope', 96)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (323, N'errorPage', 96)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (324, N'<% sum %>', 97)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (325, N'<%= sum; %>', 97)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (326, N'<% sum; %>', 97)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (327, N'<%= sum %>', 97)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (328, N'ServletRequest', 98)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (329, N'HttpRequest', 98)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (330, N'Request', 98)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (331, N'HttpServletRequest', 98)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (332, N'application', 99)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (333, N'session', 99)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (334, N'httpsession', 99)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (335, N'httpSession', 99)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (336, N'type', 100)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (337, N'generateXML', 100)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (338, N'contentType', 100)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (339, N'outputXML', 100)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (340, N'End User', 101)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (341, N'EJB Deployer', 101)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (342, N'Application Assembler', 101)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (343, N'System Administrator', 101)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (344, N'Application Assembler', 102)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (345, N'Developer', 102)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (346, N'Application Builder', 102)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (347, N'Deployer', 102)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (348, N'Choosing hardware that provides the required level of performance', 103)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (349, N'Performance-turning the system', 103)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (350, N'Write the code that calls on components supplied by bean providers', 103)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (351, N'Securing the deployment with a firewall', 103)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (352, N'Application assembler', 104)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (353, N'Bean provider', 104)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (354, N'Deployer', 104)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (355, N'Tool vendor', 104)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (356, N'include directive', 105)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (357, N'<jsp:forward>', 105)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (358, N'import directive', 105)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (359, N'<jsp:include>', 105)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (360, N'SessionConfig', 106)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (361, N'SessionContext', 106)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (362, N'HttpSevletResponse', 106)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (363, N'HttpSevletRequest', 106)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (364, N'getAttribute of Session', 107)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (365, N'get of Session', 107)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (366, N'getValue of HttpSession', 107)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (367, N'getAttribute of HttpSession', 107)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (368, N'jsp:useBean.property', 108)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (369, N'jsp:useBean', 108)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (370, N'jsp:useBean.setProperty', 108)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (371, N'jsp:property', 108)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (372, N'import directive', 109)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (373, N'<jsp:useBean>', 109)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (374, N'<jsp:forward>', 109)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (375, N'include directive', 109)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (376, N'request', 110)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (377, N'session', 110)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (378, N'application', 110)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (379, N'page', 110)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (380, N'response.setContentType("image/pdf");', 111)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (381, N'response.setContentType("application/pdf");', 111)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (382, N'response.setType("application/pdf");', 111)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (383, N'response.setType("image/pdf);', 111)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (384, N'scriptlet', 112)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (385, N'declaration', 112)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (386, N'expression', 112)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (387, N'declarations', 112)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (388, N'They are used to share data among clients', 113)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (389, N'They are used to implement business processes', 113)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (390, N'They are used to store persistent data', 113)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (391, N'They are used to represent data stored in a RDBMS', 113)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (392, N'Servlet', 114)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (393, N'JavaMail', 114)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (394, N'JSP', 114)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (395, N'EJB', 114)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (396, N'getFormValue("email") of HttpServletRequest', 115)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (397, N'getField(email") of HttpServletRequest', 115)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (398, N'getParameter("email") ofServletRequest', 115)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (399, N'getParameters("email") of HttpServlet', 115)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (400, N'HttpServletResponse.addCookie(Cookie cookie)', 116)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (401, N'HttpServletResponse.addCookie(String contents)', 116)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (402, N'ServletResponse.addCookie(Cookie cookie)', 116)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (403, N'ServletResponse.addCookie(String contents)', 116)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (404, N'FWorks/classes', 117)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (405, N'FWorks/WEB-INF/lib/classes', 117)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (406, N'FWorks/WEB-INF', 117)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (407, N'FWorks/WEB-INF/classes', 117)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (408, N'scriptlets', 118)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (409, N'tag libraries', 118)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (410, N'actions', 118)
GO
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (411, N'name of a jsp file', 118)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (412, N'<session-configuration>', 119)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (413, N'<session_config>', 119)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (414, N'<webapp>', 119)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (415, N'<session-config>', 119)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (416, N'<% "Hello World"; %>', 120)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (417, N'<%= new Date() %>', 120)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (418, N'<%= "Hello World"; %>', 120)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (419, N'<%= outprintln("hello"); %>', 120)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (420, N'\WEB-INF', 121)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (421, N'\WEB-INF\classes', 121)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (422, N'\WEB-INF\lib', 121)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (423, N'\jars', 121)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (424, N'Data integrity', 122)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (425, N'Authentication', 122)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (426, N'Data validation', 122)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (427, N'Packet sniffing', 122)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (428, N'session', 123)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (429, N'exception', 123)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (430, N'application', 123)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (431, N'response', 123)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (432, N'A servlet explicitly calls invalidateO on a session object', 124)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (433, N'No request comes from the client for more than "session timeout" period.', 124)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (434, N'If the session time out is set to 0 using setMaxInactivelntervalO method.', 124)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (435, N'The container is shutdown and brought up again.', 124)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (436, N'Creation of the servlet class corresponding to the JSP file.', 125)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (437, N'Instantiation of the servlet class.', 125)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (438, N'None of the others', 125)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (439, N'Execution of JspServiceQ method.', 125)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (440, N'By enconding the redirect path with HttpServletResponse.encodeRedirectURLO method.c', 126)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (441, N'By using HttpServletRequestencodeURLO method.', 126)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (442, N'By using hidden parameters s', 126)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (443, N'By using hidden parameters.', 126)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (444, N'<tag-uri>', 127)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (445, N'<taglib-uri>', 127)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (446, N'<uri-location>', 127)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (447, N'<uri-name>', 127)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (448, N'Servlets', 128)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (449, N'EJB', 128)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (450, N'JMS', 128)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (451, N'MOM (Message-Oriented Middleware Product)', 128)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (452, N'the user has closed all his/her browser windows.', 129)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (453, N'the request is the first request from the user.', 129)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (454, N'the user''s browser does not support URL rewriting.', 129)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (455, N'the session attribute of page directive is set to false', 129)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (456, N'HttpSession.', 130)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (457, N'HttpRequestSession.', 130)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (458, N'HttpServletSession.', 130)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (459, N'HttpResponseSession.', 130)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (460, N'DoGet, DoPost', 131)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (461, N'Get, Post', 131)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (462, N'doGET, doPOST', 131)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (463, N'doGet, doPost', 131)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (464, N'taglib-location', 132)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (465, N'taguri', 132)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (466, N'display-name', 132)
INSERT [dbo].[Answer] ([AnswerId], [AnswerContent], [QuestionId]) VALUES (467, N'info', 132)
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
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (74, CAST(N'2020-06-01' AS Date), N'Which is correct JDBC-ODBC driver name?', N'234', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (75, CAST(N'2020-06-01' AS Date), N'Which are the correct statements of Connection object? (Choose two)', N'239', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (76, CAST(N'2020-06-01' AS Date), N'Which are the correct statements of ResultSet object? (Choose three)', N'240', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (77, CAST(N'2020-06-01' AS Date), N'To send text outptut in a response, the following method of HttpServletResponse may be used to get the appropriate Writer/Stream object. Select the one correct answer.', N'245', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (78, CAST(N'2020-06-01' AS Date), N'Which of the following files is the correct name and location of deployment descriptor of a web application. Assume that the web application is rooted at \doc-root. Select the one correct answer', N'249', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (79, CAST(N'2020-06-01' AS Date), N'______ is a set of java API for executing SQL statements.', N'252', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (80, CAST(N'2020-06-01' AS Date), N'JDBC supports ______ and ______ models.', N'259', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (81, CAST(N'2020-06-01' AS Date), N'URL referring to databases use the form:', N'261', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (82, CAST(N'2020-06-01' AS Date), N'The ______ class is the primary class that has the driver information.', N'266', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (83, CAST(N'2020-06-01' AS Date), N'The method getWriter returns an object of type PrintWriter. This class has println methods to generate output. Which of these classes define the getWriter method?', N'271', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (84, CAST(N'2020-06-01' AS Date), N'Name the method defined in the HttpServletResponse class that may be used to set the content type.', N'275', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (85, CAST(N'2020-06-01' AS Date), N'The sendError method defined in the HttpServlet class is equivalent to invoking the setStatus method with the following parameter', N'276', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (86, CAST(N'2020-06-01' AS Date), N'To send binary output in a response, the following method of HttpServletResponse may be used to get the appropriate Writer/Stream object.', N'281', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (87, CAST(N'2020-06-01' AS Date), N'A user types the URL http://www.javaprepare.com/scwd/index.html . Which HTTP request gets generated.', N'285', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (88, CAST(N'2020-06-01' AS Date), N'Which HTTP method gets invoked when a user clicks on a link?', N'288', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (89, CAST(N'2020-06-01' AS Date), N'Which of the following is not a valid HTTP/1.1 method', N'295', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (90, CAST(N'2020-06-01' AS Date), N'Name the http method used to send resources to the server. Select the one correct answer.', N'296', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (91, CAST(N'2020-06-01' AS Date), N'Name the http method that sends the same response as the request.', N'300', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (92, CAST(N'2020-06-01' AS Date), N'Which three digit error codes represent an error in request from client?', N'304', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (93, CAST(N'2020-06-01' AS Date), N'Name the location of compiled class files within a war file?', N'308', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (94, CAST(N'2020-06-01' AS Date), N'Which of the following JSP variables are not available within a JSP expression', N'313', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (95, CAST(N'2020-06-01' AS Date), N'Name the default value of the scope atribute of <jsp:usebean>.', N'319', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (96, CAST(N'2020-06-01' AS Date), N'Which of these are legal attributes of page directive.', N'323', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (97, CAST(N'2020-06-01' AS Date), N'Now consider the same JSP example as last question. What must be added at the location YYY to print the sum of ten numbers', N'327', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (98, CAST(N'2020-06-01' AS Date), N'JSP pages have access to implicit objects that are exposed automatically. One such object that is available is request. The request object is an instance of which class?', N'331', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (99, CAST(N'2020-06-01' AS Date), N'JSP pages have access to implicit objects that are exposed automatically. Name the implicit object that is of type HttpSession.', N'2', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (100, CAST(N'2020-06-01' AS Date), N'A JSP page needs to generate an XML file. Which attribute of page directive may be used to specify that the JSP page is generating an XML file.', N'338', N'PRJ311', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (101, CAST(N'2020-06-01' AS Date), N'Which is not the players in the EJB Ecosystem?', N'340', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (102, CAST(N'2020-06-01' AS Date), N'The ______ is the overall application architect .This party is responsible for understanding how various components fit together and writes the application that combine components.', N'344', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (103, CAST(N'2020-06-01' AS Date), N'which is not the role of EJB Deployer?', N'350', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (104, CAST(N'2020-06-01' AS Date), N'The ________ supplies business components,or enterprise beans', N'352', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (105, CAST(N'2020-06-01' AS Date), N'_____ sends a request to an object and includes the result in a JSP file.', N'359', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (106, CAST(N'2020-06-01' AS Date), N'Name the class that includes the SetSession method that is used to get the httpSession object', N'363', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (107, CAST(N'2020-06-01' AS Date), N'Identify the method used to get an object available in a session', N'366', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (108, CAST(N'2020-06-01' AS Date), N'Which jsp tag can be used to set bean property?', N'370', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (109, CAST(N'2020-06-01' AS Date), N'______includes a static file in a JSP file, parsing the file''s JSP elements', N'375', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (110, CAST(N'2020-06-01' AS Date), N'Name the default value of the scope attribute of <jsp:useBean>', N'379', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (111, CAST(N'2020-06-01' AS Date), N'You have to send a pdf file to the client as a response to a request Which of the following calls will you have to make?', N'381', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (112, CAST(N'2020-06-01' AS Date), N'A JSP_____lets you define methods or fields that get inserted into the main body of the servlet class', N'385', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (113, CAST(N'2020-06-01' AS Date), N'Which is NOT a correct statement about entity beans?', N'389', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (114, CAST(N'2020-06-01' AS Date), N'A Java developer needs to be able to send email, containing XML attachments, using SMTP. Which JEE (J2EE) technology provides this capability?', N'393', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (115, CAST(N'2020-06-01' AS Date), N'Consider the HTML code below. Which of the following method calls can retrieve the "email" value sent from the browser?', N'398', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (116, CAST(N'2020-06-01' AS Date), N'Which of the following methods can be used to add cookies to a servlet response?', N'402', N'PRJ321', N'QuesActive')
GO
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (117, CAST(N'2020-06-01' AS Date), N'Your web application named "FWorks" uses SpecialMath.class. This is an unbundled class and is not contained in any jar file. Where will you keep this class file?', N'406', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (118, CAST(N'2020-06-01' AS Date), N'Which is NOT a core component of JSP?', N'409', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (119, CAST(N'2020-06-01' AS Date), N'Identify the parent element of <session-timeout> element in web.xml', N'413', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (120, CAST(N'2020-06-01' AS Date), N'Which of the following are correct JSP expressions?', N'416', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (121, CAST(N'2020-06-01' AS Date), N'What would be the best directory in which to store a supporting JAR file for a web application? Note that in the list below, all directories begin from the context root', N'420', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (122, CAST(N'2020-06-01' AS Date), N'Which security mechanism proves that data has not been tampered with during its transit through the network?', N'424', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (123, CAST(N'2020-06-01' AS Date), N'A JSP page has the following page directives:
<%@page isErrorPage=''false'' %>
<%@page errorPage=''/jsp/myerror.jsp'' %>
Which of the following implicit object is NOT available to the jsp page?', N'429', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (124, CAST(N'2020-06-01' AS Date), N'Which is NOT a standard technique for a session be definitely invalidated?', N'433', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (125, CAST(N'2020-06-01' AS Date), N'Which of the following task may happen in the translation phase of JSP page? (Choose one)', N'436', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (126, CAST(N'2020-06-01' AS Date), N'How can you ensure the continuity of the session while using HttpServletResponse.sendRedirect() method when cookies are not supported by the client?', N'443', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (127, CAST(N'2020-06-01' AS Date), N'Identify the correct element is required for a valid <taglib> tag in web.xml (Choose one)', N'445', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (128, CAST(N'2020-06-01' AS Date), N'Which technology is used for processing HTTP requests and mapping those requests to business objects', N'448', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (129, CAST(N'2020-06-01' AS Date), N'A JSP page will not have access to session implicit variable if.', N'455', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (130, CAST(N'2020-06-01' AS Date), N'HttpServletRequest.getSession() method returns a_____object.', N'457', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (131, CAST(N'2020-06-01' AS Date), N'Class HttpServlet defines the methods _____ and _______ to response to get and post request from a client', N'460', N'PRJ321', N'QuesActive')
INSERT [dbo].[Question] ([QuestionId], [CreateDate], [QuestionContent], [CorrectAnswerID], [SubjectId], [StatusId]) VALUES (132, CAST(N'2020-06-01' AS Date), N'Which of the elements defined within the taglib element of taglib descriptor file are required? Select one correct answer.', N'464', N'PRJ321', N'QuesActive')
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
INSERT [dbo].[Test] ([TestId], [TestTitle], [Score], [CreateDate], [Email]) VALUES (11, N'PRJ311-Java Desktop', 1, CAST(N'2020-06-01' AS Date), N'student@gmail.com')
INSERT [dbo].[Test] ([TestId], [TestTitle], [Score], [CreateDate], [Email]) VALUES (12, N'PRJ311-Java Desktop', 0, CAST(N'2020-06-01' AS Date), N'student@gmail.com')
INSERT [dbo].[Test] ([TestId], [TestTitle], [Score], [CreateDate], [Email]) VALUES (13, N'PRJ311-Java Desktop', 0, CAST(N'2020-06-01' AS Date), N'student@gmail.com')
INSERT [dbo].[Test] ([TestId], [TestTitle], [Score], [CreateDate], [Email]) VALUES (14, N'PRJ311-Java Desktop', 0, CAST(N'2020-06-01' AS Date), N'student@gmail.com')
INSERT [dbo].[Test] ([TestId], [TestTitle], [Score], [CreateDate], [Email]) VALUES (15, N'PRJ321-Java Web ', 0.19, CAST(N'2020-06-01' AS Date), N'student@gmail.com')
INSERT [dbo].[Test] ([TestId], [TestTitle], [Score], [CreateDate], [Email]) VALUES (16, N'PRJ321-Java Web ', 0.4, CAST(N'2020-06-01' AS Date), N'student@gmail.com')
INSERT [dbo].[Test] ([TestId], [TestTitle], [Score], [CreateDate], [Email]) VALUES (17, N'PRJ321-Java Web ', 0.2, CAST(N'2020-06-01' AS Date), N'student@gmail.com')
INSERT [dbo].[Test] ([TestId], [TestTitle], [Score], [CreateDate], [Email]) VALUES (18, N'PRJ321-Java Web ', 0, CAST(N'2020-06-01' AS Date), N'student@gmail.com')
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
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (298, 11, 48, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (299, 11, 24, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (300, 11, 64, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (301, 11, 26, 41)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (302, 11, 47, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (303, 11, 35, 76)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (304, 11, 61, 181)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (305, 11, 67, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (306, 11, 42, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (307, 11, 45, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (308, 11, 28, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (309, 11, 27, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (310, 11, 51, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (311, 11, 36, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (312, 11, 52, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (313, 11, 68, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (314, 11, 43, 108)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (315, 11, 60, 177)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (316, 11, 66, 201)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (317, 11, 39, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (318, 11, 44, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (319, 11, 40, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (320, 11, 25, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (321, 11, 55, 157)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (322, 11, 58, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (323, 11, 49, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (324, 11, 59, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (325, 11, 69, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (326, 11, 21, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (327, 11, 54, 152)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (328, 11, 50, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (329, 11, 63, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (330, 11, 41, 101)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (331, 11, 31, 61)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (332, 11, 38, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (333, 11, 29, 53)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (334, 11, 34, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (335, 11, 57, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (336, 11, 30, 57)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (337, 11, 73, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (338, 12, 65, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (339, 12, 64, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (340, 12, 35, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (341, 12, 41, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (342, 12, 47, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (343, 12, 55, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (344, 12, 45, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (345, 12, 28, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (346, 12, 49, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (347, 12, 73, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (348, 12, 22, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (349, 12, 60, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (350, 12, 69, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (351, 12, 43, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (352, 12, 51, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (353, 12, 25, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (354, 12, 38, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (355, 12, 67, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (356, 12, 61, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (357, 12, 52, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (358, 12, 29, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (359, 12, 24, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (360, 12, 63, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (361, 12, 54, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (362, 12, 32, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (363, 12, 26, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (364, 12, 59, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (365, 12, 33, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (366, 12, 31, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (367, 12, 40, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (368, 12, 58, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (369, 12, 36, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (370, 12, 39, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (371, 12, 66, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (372, 12, 27, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (373, 12, 34, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (374, 12, 48, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (375, 12, 44, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (376, 12, 56, 2)
GO
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (377, 12, 30, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (378, 13, 50, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (379, 13, 60, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (380, 13, 56, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (381, 13, 63, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (382, 13, 45, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (383, 13, 58, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (384, 13, 67, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (385, 13, 32, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (386, 13, 39, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (387, 13, 38, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (388, 13, 68, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (389, 13, 55, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (390, 13, 22, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (391, 13, 66, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (392, 13, 73, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (393, 13, 48, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (394, 13, 64, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (395, 13, 44, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (396, 13, 34, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (397, 13, 65, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (398, 13, 42, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (399, 13, 25, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (400, 13, 26, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (401, 13, 30, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (402, 13, 27, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (403, 13, 43, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (404, 13, 24, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (405, 13, 36, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (406, 13, 47, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (407, 13, 52, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (408, 13, 28, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (409, 13, 49, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (410, 13, 40, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (411, 13, 41, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (412, 13, 31, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (413, 13, 33, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (414, 13, 54, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (415, 13, 59, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (416, 13, 29, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (417, 13, 35, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (418, 14, 42, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (419, 14, 66, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (420, 14, 65, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (421, 14, 68, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (422, 14, 56, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (423, 14, 69, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (424, 14, 55, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (425, 14, 40, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (426, 14, 47, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (427, 14, 25, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (428, 14, 38, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (429, 14, 73, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (430, 14, 49, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (431, 14, 50, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (432, 14, 41, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (433, 14, 51, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (434, 14, 43, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (435, 14, 58, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (436, 14, 32, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (437, 14, 24, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (438, 14, 36, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (439, 14, 27, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (440, 14, 31, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (441, 14, 45, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (442, 14, 54, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (443, 14, 29, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (444, 14, 34, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (445, 14, 59, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (446, 14, 64, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (447, 14, 21, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (448, 14, 30, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (449, 14, 39, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (450, 14, 26, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (451, 14, 35, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (452, 14, 22, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (453, 14, 67, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (454, 14, 52, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (455, 14, 61, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (456, 14, 60, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (457, 14, 48, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (458, 15, 76, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (459, 15, 124, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (460, 15, 4, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (461, 15, 77, 245)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (462, 15, 127, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (463, 15, 101, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (464, 15, 111, 383)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (465, 15, 95, 317)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (466, 15, 115, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (467, 15, 126, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (468, 15, 99, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (469, 15, 84, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (470, 15, 83, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (471, 15, 103, 349)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (472, 15, 123, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (473, 15, 117, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (474, 15, 116, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (475, 15, 74, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (476, 15, 87, 2)
GO
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (477, 15, 93, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (478, 15, 125, 438)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (479, 15, 122, 426)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (480, 15, 90, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (481, 15, 78, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (482, 15, 94, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (483, 15, 72, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (484, 15, 113, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (485, 15, 86, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (486, 15, 129, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (487, 15, 85, 278)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (488, 15, 82, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (489, 15, 118, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (490, 15, 128, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (491, 15, 70, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (492, 15, 107, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (493, 15, 108, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (494, 15, 75, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (495, 15, 114, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (496, 15, 104, 353)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (497, 15, 106, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (498, 15, 110, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (499, 15, 89, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (500, 15, 9, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (501, 15, 88, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (502, 15, 121, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (503, 15, 130, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (504, 15, 102, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (505, 15, 80, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (506, 15, 96, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (507, 15, 97, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (508, 16, 130, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (509, 16, 86, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (510, 16, 96, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (511, 16, 72, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (512, 16, 109, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (513, 16, 103, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (514, 16, 102, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (515, 16, 127, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (516, 16, 83, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (517, 16, 82, 266)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (518, 16, 90, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (519, 16, 93, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (520, 16, 87, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (521, 16, 84, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (522, 16, 125, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (523, 16, 118, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (524, 16, 119, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (525, 16, 123, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (526, 16, 71, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (527, 16, 128, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (528, 16, 107, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (529, 16, 126, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (530, 16, 115, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (531, 16, 121, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (532, 16, 98, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (533, 16, 116, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (534, 16, 120, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (535, 16, 4, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (536, 16, 111, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (537, 16, 101, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (538, 16, 70, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (539, 16, 117, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (540, 16, 78, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (541, 16, 112, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (542, 16, 131, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (543, 16, 91, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (544, 16, 95, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (545, 16, 114, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (546, 16, 79, 252)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (547, 16, 106, 361)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (548, 16, 92, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (549, 16, 80, 258)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (550, 16, 110, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (551, 16, 9, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (552, 16, 74, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (553, 16, 129, 453)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (554, 16, 89, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (555, 16, 124, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (556, 16, 132, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (557, 16, 76, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (558, 17, 76, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (559, 17, 116, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (560, 17, 85, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (561, 17, 72, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (562, 17, 97, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (563, 17, 106, 362)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (564, 17, 92, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (565, 17, 90, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (566, 17, 82, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (567, 17, 103, 349)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (568, 17, 95, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (569, 17, 114, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (570, 17, 93, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (571, 17, 89, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (572, 17, 83, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (573, 17, 119, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (574, 17, 105, 357)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (575, 17, 122, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (576, 17, 75, 2)
GO
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (577, 17, 130, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (578, 17, 117, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (579, 17, 111, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (580, 17, 120, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (581, 17, 4, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (582, 17, 74, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (583, 17, 123, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (584, 17, 79, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (585, 17, 96, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (586, 17, 108, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (587, 17, 110, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (588, 17, 91, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (589, 17, 124, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (590, 17, 80, 257)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (591, 17, 128, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (592, 17, 98, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (593, 17, 125, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (594, 17, 94, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (595, 17, 132, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (596, 17, 81, 262)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (597, 17, 115, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (598, 17, 84, 273)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (599, 17, 101, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (600, 17, 86, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (601, 17, 112, 385)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (602, 17, 107, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (603, 17, 109, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (604, 17, 118, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (605, 17, 88, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (606, 17, 9, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (607, 17, 104, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (608, 18, 128, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (609, 18, 80, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (610, 18, 83, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (611, 18, 85, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (612, 18, 109, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (613, 18, 96, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (614, 18, 108, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (615, 18, 86, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (616, 18, 71, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (617, 18, 70, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (618, 18, 90, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (619, 18, 99, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (620, 18, 119, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (621, 18, 107, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (622, 18, 101, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (623, 18, 131, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (624, 18, 77, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (625, 18, 114, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (626, 18, 130, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (627, 18, 126, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (628, 18, 88, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (629, 18, 125, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (630, 18, 115, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (631, 18, 74, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (632, 18, 104, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (633, 18, 132, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (634, 18, 79, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (635, 18, 91, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (636, 18, 82, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (637, 18, 111, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (638, 18, 81, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (639, 18, 116, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (640, 18, 87, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (641, 18, 84, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (642, 18, 103, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (643, 18, 72, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (644, 18, 113, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (645, 18, 4, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (646, 18, 117, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (647, 18, 118, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (648, 18, 123, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (649, 18, 97, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (650, 18, 124, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (651, 18, 9, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (652, 18, 98, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (653, 18, 120, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (654, 18, 129, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (655, 18, 110, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (656, 18, 76, 2)
INSERT [dbo].[TestQuestions] ([TestQuestionsId], [TestId], [QuestionId], [AnswerId]) VALUES (657, 18, 105, 2)
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
