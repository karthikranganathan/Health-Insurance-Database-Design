/*
Created: 11/1/2017
Modified: 12/6/2017
Project: Member.Provider.Policy
Model: Microsoft SQL Server 2016
Company: Group - 7
Author: Northeastern University
Version: 1.0
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table Member.Information
NOT NULL,
 [Fname] Varchar(25) NOT NULL,
 [Lname] Varchar(25) NOT NULL,
 [DOB] Date NOT NULL,
 [Phone] Varchar(12) NOT NULL,
 [Group.Insurance] Char(1) NOT NULL,
 [Email] Varchar(30) NULL,
 [PCP NP.ID] Char(10) NULL
)
go
CREATE TABLE [Member.Information]
(
 [Mem.ID] Char(11) 

-- Add keys for table Member.Information

ALTER TABLE [Member.Information] ADD CONSTRAINT [Key1] PRIMARY KEY ([Mem.ID])
go

-- Table Member.Policy

CREATE TABLE [Member.Policy]
(
 [Policy.Type] Char(15) NOT NULL,
 [Validity] Date NULL,
 [Mem.ID] Char(11) NOT NULL,
 [Group.ID] Char(11) NULL,
 [Plan.ID] Char(5) NOT NULL
)
go

-- Create indexes for table Member.Policy

CREATE INDEX [IX_Relationship6] ON [Member.Policy] ([Mem.ID])
go

CREATE INDEX [IX_Relationship2] ON [Member.Policy] ([Group.ID])
go

-- Add keys for table Member.Policy

ALTER TABLE [Member.Policy] ADD CONSTRAINT [Key2] PRIMARY KEY ([Plan.ID])
go

-- Table Member.Address

CREATE TABLE [Member.Address]
(
 [Street.Address.1] Char(30) NOT NULL,
 [Street.Address.2] Char(30) NULL,
 [State] Char(2) NOT NULL,
 [City] Char(20) NOT NULL,
 [Zipcode] Char(5) NOT NULL,
 [Mem.ID] Char(11) NOT NULL
)
go

-- Add keys for table Member.Address

ALTER TABLE [Member.Address] ADD CONSTRAINT [Key3] PRIMARY KEY ([Mem.ID])
go

-- Table Member.Chronic.Disease

CREATE TABLE [Member.Chronic.Disease]
(
 [Chronic.Disease] Char(30) NULL,
 [Start.Date] Date NULL,
 [Mem.ID] Char(11) NULL
)
go

-- Create indexes for table Member.Chronic.Disease

CREATE INDEX [IX_Relationship7] ON [Member.Chronic.Disease] ([Mem.ID])
go

-- Table Member.Event

CREATE TABLE [Member.Event]
(
 [Event.ID] Char(12) NOT NULL,
 [Start.Date] Date NOT NULL,
 [End.Date] Date NOT NULL,
 [CPT.Code] Char(8) NOT NULL,
 [ICD.Code] Char(6) NULL,
 [Mem.ID] Char(11) NOT NULL,
 [Fac.ID] Char(8) NULL,
 [NP.ID] Char(10) NULL
)
go

-- Create indexes for table Member.Event

CREATE INDEX [IX_Relationship9] ON [Member.Event] ([Fac.ID])
go

CREATE INDEX [IX_Relationship10] ON [Member.Event] ([NP.ID])
go

-- Add keys for table Member.Event

ALTER TABLE [Member.Event] ADD CONSTRAINT [Key5] PRIMARY KEY ([Mem.ID],[Event.ID])
go


-- Table Member.MemberGroup1

CREATE TABLE [Member.MemberGroup1]
(
 [Group.ID] Char(11) NOT NULL,
 [Gname] Varchar(50) NOT NULL,
 [Start.Date] Date NOT NULL,
 [End.Date] Date NOT NULL,
 [Street.Address.1] Char(30) NOT NULL,
 [Street.Address.2] Char(30) NULL,
 [City] Char(25) NOT NULL,
 [State] Char(2) NOT NULL,
 [Zipcode] Char(5) NOT NULL,
 [Phone] Char(13) NOT NULL,
 [Email] Varchar(35) NOT NULL
)
go

-- Add keys for table Member.MemberGroup1

ALTER TABLE [Member.MemberGroup1] ADD CONSTRAINT [Key6] PRIMARY KEY ([Group.ID])
go

-- Table Member.Policy1

CREATE TABLE [Member.Policy1]
(
 [Policy.Name] Char(30) NOT NULL,
 [Policy.Type] Char(15) NOT NULL,
 [Policy.ID] Smallint NOT NULL,
 [Mem.ID] Char(11) NOT NULL,
 [Group.ID] Char(11) NULL
)
go

-- Create indexes for table Member.Policy1

CREATE INDEX [IX_Relationship6] ON [Member.Policy1] ([Mem.ID])
go

CREATE INDEX [IX_Relationship2] ON [Member.Policy1] ([Group.ID])
go

-- Table Member.Event1

CREATE TABLE [Member.Event1]
(
 [Start.Date] Datetime NOT NULL,
 [End.Date] Datetime NOT NULL,
 [Mem.ID] Char(11) NOT NULL,
 [NP.ID] Char(10) NULL,
 [Fac.ID] Char(8) NULL
)
go

-- Create indexes for table Member.Event1

CREATE INDEX [IX_Relationship9] ON [Member.Event1] ([NP.ID])
go

CREATE INDEX [IX_Relationship10] ON [Member.Event1] ([Fac.ID])
go

-- Add keys for table Member.Event1

ALTER TABLE [Member.Event1] ADD CONSTRAINT [Key5] PRIMARY KEY ([Mem.ID])
go

-- Table Member.Chronic.Disease1

CREATE TABLE [Member.Chronic.Disease1]
(
 [Chronic.Disease] Char(30) NULL,
 [Start.Date] Date NULL,
 [Mem.ID] Char(11) NULL
)
go

-- Create indexes for table Member.Chronic.Disease1

CREATE INDEX [IX_Relationship7] ON [Member.Chronic.Disease1] ([Mem.ID])
go

-- Table Member.Information

CREATE TABLE [Member.Information1]
(
 [Mem.ID] Char(11) NOT NULL,
 [Fname] Varchar(25) NOT NULL,
 [Lname] Varchar(25) NOT NULL,
 [DOB] Date NOT NULL,
 [Phone] Varchar(12) NOT NULL,
 [Group.Insurance] Char(1) NULL,
 [Email] Varchar(30) NOT NULL
)
go

-- Add keys for table Member.Information

ALTER TABLE [Member.Information1] ADD CONSTRAINT [Key1] PRIMARY KEY ([Mem.ID])
go

-- Table Member.Address

CREATE TABLE [Member.Address1]
(
 [Street.Address.1] Char(30) NOT NULL,
 [Street.Address.2] Char(30) NULL,
 [State] Char(2) NOT NULL,
 [City] Char(20) NOT NULL,
 [Zipcode] Char(5) NOT NULL,
 [Mem.ID] Char(11) NOT NULL
)
go

-- Add keys for table Member.Address1

ALTER TABLE [Member.Address1] ADD CONSTRAINT [Key3] PRIMARY KEY ([Mem.ID])
go

-- Table Provider.Speciality

CREATE TABLE [Provider.Speciality]
(
 [Speciality] Char(30) NOT NULL,
 [Medical.School] Varchar(50) NOT NULL,
 [Class.Of.Year] Date NOT NULL,
 [NP.ID] Char(10) NOT NULL
)
go

-- Add keys for table Provider.Speciality

ALTER TABLE [Provider.Speciality] ADD CONSTRAINT [Key3] PRIMARY KEY ([NP.ID])
go

-- Table Provider.Person.Info

CREATE TABLE [Provider.Person.Info]
(
 [NP.ID] Char(10) NOT NULL,
 [Fname] Varchar(30) NOT NULL,
 [Lname] Varchar(25) NOT NULL,
 [Phone] Varchar(13) NOT NULL,
 [Email] Varchar(35) NOT NULL,
 [Mail.Add] Char(50) NOT NULL,
 [City] Char(20) NOT NULL,
 [Zip.Code] Char(5) NOT NULL,
 [State] Char(2) NOT NULL,
 [DOB] Date NOT NULL,
 [Gender] Char(1) NOT NULL
)
go

-- Add keys for table Provider.Person.Info

ALTER TABLE [Provider.Person.Info] ADD CONSTRAINT [Key2] PRIMARY KEY ([NP.ID])
go

-- Table Provider.Facility

CREATE TABLE [Provider.Facility]
(
 [Fac.ID] Char(8) NOT NULL,
 [Fac.Name] Varchar(50) NOT NULL,
 [Fac.Type] Char(35) NOT NULL,
 [Street.Address1] Varchar(55) NOT NULL,
 [Street.Address2] Varchar(55) NULL,
 [City] Varchar(20) NOT NULL,
 [Zipcode] Char(5) NOT NULL,
 [State] Char(2) NOT NULL,
 [Avg.Patients] Smallint NULL,
 [Insurance.Status] Char(3) NOT NULL
)
go

-- Add keys for table Provider.Facility

ALTER TABLE [Provider.Facility] ADD CONSTRAINT [Key5] PRIMARY KEY ([Fac.ID])
go

-- Table Person.Facility

CREATE TABLE [Person.Facility]
(
 [NP.ID] Char(10) NOT NULL,
 [Fac.ID] Char(8) NOT NULL
)
go

-- Add keys for table Person.Facility

ALTER TABLE [Person.Facility] ADD CONSTRAINT [Key8] PRIMARY KEY ([NP.ID],[Fac.ID])
go

-- Table Entity7

CREATE TABLE [Entity7]
(
 [NP.ID] Char(10) NOT NULL,
 [Mem.ID] Char(11) NOT NULL
)
go

-- Add keys for table Entity7

ALTER TABLE [Entity7] ADD CONSTRAINT [Key9] PRIMARY KEY ([NP.ID],[Mem.ID])
go

-- Table Policy.Group

CREATE TABLE [Policy.Group]
(
 [GP.ID] Char(5) NOT NULL,
 [GP.Name] Varchar(5) NOT NULL,
 [Start.Date] Date NOT NULL,
 [Validity] Char(7) NOT NULL,
 [Num.Members] Int NOT NULL,
 [Cost] Smallmoney NOT NULL,
 [Coverage] Money NOT NULL,
 [Coinsurance] Smallint NOT NULL,
 [Deductible] Smallmoney NULL,
 [Out.of.Pocket.Max] Smallmoney NOT NULL
)
go

-- Add keys for table Policy.Group

ALTER TABLE [Policy.Group] ADD CONSTRAINT [Key2] PRIMARY KEY ([GP.ID])
go

-- Table Plans

CREATE TABLE [Plans]
(
 [Plan.ID] Char(5) NOT NULL,
 [Plan.Name] Varchar(30) NOT NULL,
 [Start.Date] Date NOT NULL,
 [Validity] Char(7) NOT NULL,
 [Dependent.Allowed] Smallint NOT NULL,
 [Cost] Smallmoney NOT NULL,
 [Coverage] Money NOT NULL,
 [Coinsurance] Smallint NOT NULL,
 [Deductible] Smallmoney NOT NULL,
 [Out.of.Pocket.Max] Smallmoney NOT NULL
)
go

-- Add keys for table Plans

ALTER TABLE [Plans] ADD CONSTRAINT [Key1] PRIMARY KEY ([Plan.ID])
go

-- Table Policy.Info

CREATE TABLE [Policy.Info]
(
 [Policy.ID] Char(10) NOT NULL,
 [Policy.Name] Varchar(50) NOT NULL,
 [Validity] Char(10) NOT NULL
)
go

-- Add keys for table Policy.Info

ALTER TABLE [Policy.Info] ADD CONSTRAINT [Key3] PRIMARY KEY ([Policy.ID])
go

-- Table Entity8

CREATE TABLE [Entity8]
(
 [GP.ID] Char(5) NOT NULL,
 [Plan.ID] Char(5) NOT NULL
)
go

-- Add keys for table Entity8

ALTER TABLE [Entity8] ADD CONSTRAINT [Key10] PRIMARY KEY ([GP.ID],[Plan.ID])
go

-- Table Entity9

CREATE TABLE [Entity9]
(
 [GP.ID] Char(5) NOT NULL,
 [Plan.ID] Char(5) NOT NULL
)
go

-- Add keys for table Entity9

ALTER TABLE [Entity9] ADD CONSTRAINT [Key11] PRIMARY KEY ([GP.ID],[Plan.ID])
go

-- Table Member Policy to Group Policy

CREATE TABLE [Member Policy to Group Policy]
(
 [GP.ID] Char(5) NOT NULL,
 [Plan.ID] Char(5) NOT NULL
)
go

-- Add keys for table Member Policy to Group Policy

ALTER TABLE [Member Policy to Group Policy] ADD CONSTRAINT [Key12] PRIMARY KEY ([GP.ID],[Plan.ID])
go

-- Table Event.Claim

CREATE TABLE [Event.Claim]
(
 [Claim.ID] Char(12) NOT NULL,
 [Amount] Money NOT NULL,
 [Claim.Date] Date NOT NULL,
 [Claim.EndDate] Date NOT NULL,
 [Claim.Status] Char(15) NOT NULL,
 [Mem.ID] Char(11) NOT NULL,
 [Event.ID] Char(12) NOT NULL
)
go

-- Add keys for table Event.Claim

ALTER TABLE [Event.Claim] ADD CONSTRAINT [Key13] PRIMARY KEY ([Claim.ID],[Mem.ID],[Event.ID])
go

-- Table Entity11

CREATE TABLE [Entity11]
(
 [Mem.ID] Char(11) NOT NULL,
 [Event.ID] Char(12) NOT NULL,
 [Group.ID] Char(11) NOT NULL
)
go

-- Add keys for table Entity11

ALTER TABLE [Entity11] ADD CONSTRAINT [Key14] PRIMARY KEY ([Mem.ID],[Event.ID],[Group.ID])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Member.Address] ADD CONSTRAINT [Member Address Information] FOREIGN KEY ([Mem.ID]) REFERENCES [Member.Information] ([Mem.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Policy] ADD CONSTRAINT [Member Policy Information] FOREIGN KEY ([Mem.ID]) REFERENCES [Member.Information] ([Mem.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Chronic.Disease] ADD CONSTRAINT [Member Chronic Disease Information] FOREIGN KEY ([Mem.ID]) REFERENCES [Member.Information] ([Mem.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Event] ADD CONSTRAINT [Hospital Visit] FOREIGN KEY ([Mem.ID]) REFERENCES [Member.Information] ([Mem.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Policy] ADD CONSTRAINT [Policy taken by the GroupMember] FOREIGN KEY ([Group.ID]) REFERENCES [Member.MemberGroup] ([Group.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Policy1] ADD CONSTRAINT [Policy taken by the GroupMember1] FOREIGN KEY ([Group.ID]) REFERENCES [Member.MemberGroup1] ([Group.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Event1] ADD CONSTRAINT [Member Provider visit] FOREIGN KEY ([Mem.ID]) REFERENCES [Member.Information1] ([Mem.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Chronic.Disease1] ADD CONSTRAINT [Member Chronic Disease Information1] FOREIGN KEY ([Mem.ID]) REFERENCES [Member.Information1] ([Mem.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Policy1] ADD CONSTRAINT [Member Policy Information1] FOREIGN KEY ([Mem.ID]) REFERENCES [Member.Information1] ([Mem.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Address1] ADD CONSTRAINT [Member Address Information1] FOREIGN KEY ([Mem.ID]) REFERENCES [Member.Information1] ([Mem.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Person.Facility] ADD CONSTRAINT [Person to Facility] FOREIGN KEY ([NP.ID]) REFERENCES [Provider.Person.Info] ([NP.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Person.Facility] ADD CONSTRAINT [Facility to Person] FOREIGN KEY ([Fac.ID]) REFERENCES [Provider.Facility] ([Fac.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Provider.Speciality] ADD CONSTRAINT [Person to Speciality] FOREIGN KEY ([NP.ID]) REFERENCES [Provider.Person.Info] ([NP.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity7] ADD CONSTRAINT [Relationship7] FOREIGN KEY ([NP.ID]) REFERENCES [Provider.Person.Info] ([NP.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity7] ADD CONSTRAINT [Relationship8] FOREIGN KEY ([Mem.ID]) REFERENCES [Member.Event1] ([Mem.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Event1] ADD CONSTRAINT [Member Provider Person visit] FOREIGN KEY ([NP.ID]) REFERENCES [Provider.Person.Info] ([NP.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Event1] ADD CONSTRAINT [Member Facility visit] FOREIGN KEY ([Fac.ID]) REFERENCES [Provider.Facility] ([Fac.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Event] ADD CONSTRAINT [Member Facility visit] FOREIGN KEY ([Fac.ID]) REFERENCES [Provider.Facility] ([Fac.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Event] ADD CONSTRAINT [Member Provider Person visit] FOREIGN KEY ([NP.ID]) REFERENCES [Provider.Person.Info] ([NP.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity8] ADD CONSTRAINT [Relationship16] FOREIGN KEY ([Plan.ID]) REFERENCES [Member.Policy] ([Plan.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity8] ADD CONSTRAINT [Relationship17] FOREIGN KEY ([GP.ID]) REFERENCES [Policy.Group] ([GP.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity9] ADD CONSTRAINT [Relationship20] FOREIGN KEY ([Plan.ID]) REFERENCES [Member.Policy] ([Plan.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity9] ADD CONSTRAINT [Relationship21] FOREIGN KEY ([GP.ID]) REFERENCES [Policy.Group] ([GP.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member Policy to Group Policy] ADD CONSTRAINT [Member to Group] FOREIGN KEY ([Plan.ID]) REFERENCES [Member.Policy] ([Plan.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member Policy to Group Policy] ADD CONSTRAINT [Group to Member] FOREIGN KEY ([GP.ID]) REFERENCES [Policy.Group] ([GP.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Event.Claim] ADD CONSTRAINT [Event Claim] FOREIGN KEY ([Mem.ID], [Event.ID]) REFERENCES [Member.Event] ([Mem.ID], [Event.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity11] ADD CONSTRAINT [Relationship23] FOREIGN KEY ([Mem.ID], [Event.ID]) REFERENCES [Member.Event] ([Mem.ID], [Event.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity11] ADD CONSTRAINT [Relationship24] FOREIGN KEY ([Group.ID]) REFERENCES [Member.MemberGroup] ([Group.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Policy] ADD CONSTRAINT [Plans taken] FOREIGN KEY ([Plan.ID]) REFERENCES [Plans] ([Plan.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




