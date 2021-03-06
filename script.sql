USE [master]
GO
/****** Object:  Database [BayanTest]    Script Date: 6/24/2018 9:38:23 PM ******/
CREATE DATABASE [BayanTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BayanTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BayanTest.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BayanTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BayanTest_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BayanTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BayanTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BayanTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BayanTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BayanTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BayanTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BayanTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [BayanTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BayanTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BayanTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BayanTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BayanTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BayanTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BayanTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BayanTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BayanTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BayanTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BayanTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BayanTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BayanTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BayanTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BayanTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BayanTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BayanTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BayanTest] SET RECOVERY FULL 
GO
ALTER DATABASE [BayanTest] SET  MULTI_USER 
GO
ALTER DATABASE [BayanTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BayanTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BayanTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BayanTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BayanTest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BayanTest', N'ON'
GO
USE [BayanTest]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 6/24/2018 9:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[AnswerDetails] [nvarchar](100) NULL,
	[QuestionID] [int] NOT NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 6/24/2018 9:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionTitle] [nvarchar](100) NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/24/2018 9:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_QuestionsAnswers] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([QuestionID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_QuestionsAnswers]
GO
/****** Object:  StoredProcedure [dbo].[GetAllAnswers]    Script Date: 6/24/2018 9:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllAnswers] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.AnswerID , a.AnswerDetails , a.QuestionID, q.QuestionTitle
	from Answers a
	inner join Questions q on q.QuestionID = a.QuestionID
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllQuestions]    Script Date: 6/24/2018 9:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllQuestions] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT QuestionID , QuestionTitle 
	from Questions
END

GO
/****** Object:  StoredProcedure [dbo].[GetAnswers]    Script Date: 6/24/2018 9:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAnswers] 
	-- Add the parameters for the stored procedure here
	@QuestionID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.AnswerID , a.AnswerDetails , a.QuestionID, q.QuestionTitle
	from Answers a
	inner join Questions q on q.QuestionID = a.QuestionID
	where a.QuestionID = @QuestionID
END

GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 6/24/2018 9:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserLogin] 
	-- Add the parameters for the stored procedure here
	@UserName Nvarchar(100),
	@Password Nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Users.ID , Users.UserName
	from Users
	where Users.UserName = @UserName and Users.Password = @Password
END

GO
USE [master]
GO
ALTER DATABASE [BayanTest] SET  READ_WRITE 
GO
