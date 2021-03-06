/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4206)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [Health Insurance]    Script Date: 12/7/2017 7:46:12 PM ******/
CREATE DATABASE [Health Insurance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Health Insurance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL16DEV\MSSQL\DATA\Health Insurance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Health Insurance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL16DEV\MSSQL\DATA\Health Insurance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Health Insurance] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Health Insurance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Health Insurance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Health Insurance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Health Insurance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Health Insurance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Health Insurance] SET ARITHABORT OFF 
GO
ALTER DATABASE [Health Insurance] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Health Insurance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Health Insurance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Health Insurance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Health Insurance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Health Insurance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Health Insurance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Health Insurance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Health Insurance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Health Insurance] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Health Insurance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Health Insurance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Health Insurance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Health Insurance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Health Insurance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Health Insurance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Health Insurance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Health Insurance] SET RECOVERY FULL 
GO
ALTER DATABASE [Health Insurance] SET  MULTI_USER 
GO
ALTER DATABASE [Health Insurance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Health Insurance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Health Insurance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Health Insurance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Health Insurance] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Health Insurance', N'ON'
GO
ALTER DATABASE [Health Insurance] SET QUERY_STORE = OFF
GO
USE [Health Insurance]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Health Insurance]
GO
/****** Object:  Table [dbo].[Event.Claim]    Script Date: 12/7/2017 7:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event.Claim](
	[Amount] [money] NOT NULL,
	[Claim.Date] [date] NOT NULL,
	[Claim.EndDate] [date] NOT NULL,
	[Claim.Status] [char](15) NOT NULL,
	[Mem.ID] [varchar](11) NOT NULL,
	[Event.ID] [varchar](12) NOT NULL,
 CONSTRAINT [Key13] PRIMARY KEY CLUSTERED 
(
	[Mem.ID] DESC,
	[Event.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member.Address]    Script Date: 12/7/2017 7:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member.Address](
	[Street.Address.1] [char](50) NOT NULL,
	[Street.Address.2] [char](50) NULL,
	[State] [char](2) NOT NULL,
	[City] [char](20) NOT NULL,
	[Zipcode] [char](5) NOT NULL,
	[Mem.ID] [varchar](11) NOT NULL,
 CONSTRAINT [Key3] PRIMARY KEY CLUSTERED 
(
	[Mem.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member.Chronic.Disease]    Script Date: 12/7/2017 7:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member.Chronic.Disease](
	[Chronic.Disease] [char](30) NULL,
	[Start.Date] [date] NULL,
	[Mem.ID] [varchar](11) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member.Event]    Script Date: 12/7/2017 7:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member.Event](
	[Event.ID] [varchar](12) NOT NULL,
	[Start.Date] [date] NOT NULL,
	[End.Date] [date] NOT NULL,
	[CPT.Code] [char](8) NOT NULL,
	[ICD.Code] [char](6) NULL,
	[Mem.ID] [varchar](11) NOT NULL,
	[Fac.ID] [varchar](8) NULL,
	[NP.ID] [varchar](10) NULL,
 CONSTRAINT [Key5] PRIMARY KEY CLUSTERED 
(
	[Mem.ID] DESC,
	[Event.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member.Information]    Script Date: 12/7/2017 7:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member.Information](
	[Mem.ID] [varchar](11) NOT NULL,
	[Fname] [varchar](25) NOT NULL,
	[Lname] [varchar](25) NOT NULL,
	[DOB] [date] NOT NULL,
	[Phone] [varchar](12) NOT NULL,
	[Email] [varchar](30) NULL,
	[NP.ID] [varchar](10) NULL,
	[Main.Mem.ID] [varchar](11) NULL,
 CONSTRAINT [Key1] PRIMARY KEY CLUSTERED 
(
	[Mem.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member.MemberGroup]    Script Date: 12/7/2017 7:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member.MemberGroup](
	[Group.ID] [varchar](11) NOT NULL,
	[Gname] [varchar](50) NOT NULL,
	[Start.Date] [date] NOT NULL,
	[End.Date] [date] NOT NULL,
	[Street.Address1] [char](50) NOT NULL,
	[Street.Address2] [char](50) NULL,
	[City] [char](25) NOT NULL,
	[State] [char](2) NOT NULL,
	[Zipcode] [char](5) NOT NULL,
	[Plan.ID] [varchar](5) NULL,
 CONSTRAINT [Key6] PRIMARY KEY CLUSTERED 
(
	[Group.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member.Policy]    Script Date: 12/7/2017 7:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member.Policy](
	[Policy.Type] [char](15) NOT NULL,
	[Validity] [date] NULL,
	[Mem.ID] [varchar](11) NOT NULL,
	[Group.ID] [varchar](11) NULL,
	[Plan.ID] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Member.Policy] PRIMARY KEY CLUSTERED 
(
	[Mem.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person.Facility]    Script Date: 12/7/2017 7:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person.Facility](
	[NP.ID] [varchar](10) NOT NULL,
	[Fac.ID] [varchar](8) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plans]    Script Date: 12/7/2017 7:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plans](
	[Plan.ID] [varchar](5) NOT NULL,
	[Plan.Name] [varchar](30) NOT NULL,
	[Start.Date] [date] NOT NULL,
	[Validity] [char](7) NOT NULL,
	[Number.of.Members] [int] NOT NULL,
	[Dependent.Allowed] [smallint] NOT NULL,
	[Cost] [smallmoney] NOT NULL,
	[Coverage] [money] NOT NULL,
	[Coinsurance] [smallint] NOT NULL,
	[Deductible] [smallmoney] NOT NULL,
	[Out.of.Pocket.Max] [smallmoney] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider.Facility]    Script Date: 12/7/2017 7:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider.Facility](
	[Fac.ID] [varchar](8) NOT NULL,
	[Fac.Name] [varchar](50) NOT NULL,
	[Fac.Type] [char](35) NOT NULL,
	[Street.Address1] [char](50) NOT NULL,
	[Street.Address2] [char](50) NULL,
	[City] [varchar](20) NOT NULL,
	[Zipcode] [char](5) NOT NULL,
	[State] [char](2) NOT NULL,
	[Avg.Patients] [smallint] NULL,
	[Insurance.Status] [char](3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider.Person.Info]    Script Date: 12/7/2017 7:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider.Person.Info](
	[NP.ID] [varchar](10) NOT NULL,
	[Fname] [varchar](30) NOT NULL,
	[Lname] [varchar](25) NOT NULL,
	[Phone] [varchar](13) NOT NULL,
	[Email] [varchar](35) NOT NULL,
	[Street.Address1] [char](50) NOT NULL,
	[Street.Address2] [char](50) NULL,
	[City] [char](20) NOT NULL,
	[Zip.Code] [char](5) NOT NULL,
	[State] [char](2) NOT NULL,
	[DOB] [date] NOT NULL,
	[Gender] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider.Speciality]    Script Date: 12/7/2017 7:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider.Speciality](
	[Speciality] [char](30) NOT NULL,
	[Medical.School] [varchar](50) NOT NULL,
	[Class.Of.Year] [date] NOT NULL,
	[NP.ID] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Relationship7]    Script Date: 12/7/2017 7:46:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Relationship7] ON [dbo].[Member.Chronic.Disease]
(
	[Mem.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Relationship10]    Script Date: 12/7/2017 7:46:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Relationship10] ON [dbo].[Member.Event]
(
	[NP.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Relationship9]    Script Date: 12/7/2017 7:46:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Relationship9] ON [dbo].[Member.Event]
(
	[Fac.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Relationship25]    Script Date: 12/7/2017 7:46:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Relationship25] ON [dbo].[Member.Information]
(
	[NP.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Relationship2]    Script Date: 12/7/2017 7:46:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Relationship2] ON [dbo].[Member.Policy]
(
	[Group.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Relationship6]    Script Date: 12/7/2017 7:46:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Relationship6] ON [dbo].[Member.Policy]
(
	[Mem.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event.Claim]  WITH CHECK ADD  CONSTRAINT [Event Claim] FOREIGN KEY([Mem.ID], [Event.ID])
REFERENCES [dbo].[Member.Event] ([Mem.ID], [Event.ID])
GO
ALTER TABLE [dbo].[Event.Claim] CHECK CONSTRAINT [Event Claim]
GO
ALTER TABLE [dbo].[Member.Address]  WITH CHECK ADD  CONSTRAINT [Member Address Information] FOREIGN KEY([Mem.ID])
REFERENCES [dbo].[Member.Information] ([Mem.ID])
GO
ALTER TABLE [dbo].[Member.Address] CHECK CONSTRAINT [Member Address Information]
GO
ALTER TABLE [dbo].[Member.Chronic.Disease]  WITH CHECK ADD  CONSTRAINT [Member Chronic Disease Information] FOREIGN KEY([Mem.ID])
REFERENCES [dbo].[Member.Information] ([Mem.ID])
GO
ALTER TABLE [dbo].[Member.Chronic.Disease] CHECK CONSTRAINT [Member Chronic Disease Information]
GO
ALTER TABLE [dbo].[Member.Event]  WITH CHECK ADD  CONSTRAINT [Hospital Visit] FOREIGN KEY([Mem.ID])
REFERENCES [dbo].[Member.Information] ([Mem.ID])
GO
ALTER TABLE [dbo].[Member.Event] CHECK CONSTRAINT [Hospital Visit]
GO
ALTER TABLE [dbo].[Member.Policy]  WITH CHECK ADD  CONSTRAINT [Member Policy Information] FOREIGN KEY([Mem.ID])
REFERENCES [dbo].[Member.Information] ([Mem.ID])
GO
ALTER TABLE [dbo].[Member.Policy] CHECK CONSTRAINT [Member Policy Information]
GO
ALTER TABLE [dbo].[Member.Policy]  WITH CHECK ADD  CONSTRAINT [Policy taken by the GroupMember] FOREIGN KEY([Group.ID])
REFERENCES [dbo].[Member.MemberGroup] ([Group.ID])
GO
ALTER TABLE [dbo].[Member.Policy] CHECK CONSTRAINT [Policy taken by the GroupMember]
GO
USE [master]
GO
ALTER DATABASE [Health Insurance] SET  READ_WRITE 
GO
