/*
Created: 11/1/2017
Modified: 12/7/2017
Project: Member.Provider.Policy
Model: Microsoft SQL Server 2016
Company: Group - 7
Author: Northeastern University
Version: 1.0
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table Member.Information

CREATE TABLE [Member.Information]
(
 [Mem.ID] Varchar(11) NOT NULL,
 [Fname] Varchar(25) NOT NULL,
 [Lname] Varchar(25) NOT NULL,
 [DOB] Date NOT NULL,
 [Phone] Varchar(12) NOT NULL,
 [Group.Insurance] Char(1) NOT NULL,
 [Email] Varchar(30) NULL,
 [NP.ID] Varchar(10) NULL
)
go

-- Create indexes for table Member.Information

CREATE INDEX [IX_Relationship25] ON [Member.Information] ([NP.ID])
go

-- Add keys for table Member.Information

ALTER TABLE [Member.Information] ADD CONSTRAINT [Key1] PRIMARY KEY ([Mem.ID])
go

-- Table Member.Policy

CREATE TABLE [Member.Policy]
(
 [Policy.Type] Char(15) NOT NULL,
 [Validity] Date NULL,
 [Mem.ID] Varchar(11) NOT NULL,
 [Group.ID] Varchar(11) NULL,
 [Plan.ID] Varchar(5) NOT NULL
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
 [Street.Address.1] Char(50) NOT NULL,
 [Street.Address.2] Char(50) NULL,
 [State] Char(2) NOT NULL,
 [City] Char(20) NOT NULL,
 [Zipcode] Char(5) NOT NULL,
 [Mem.ID] Varchar(11) NOT NULL
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
 [Mem.ID] Varchar(11) NULL
)
go

-- Create indexes for table Member.Chronic.Disease

CREATE INDEX [IX_Relationship7] ON [Member.Chronic.Disease] ([Mem.ID])
go

-- Table Member.Event

CREATE TABLE [Member.Event]
(
 [Event.ID] Varchar(12) NOT NULL,
 [Start.Date] Date NOT NULL,
 [End.Date] Date NOT NULL,
 [CPT.Code] Char(8) NOT NULL,
 [ICD.Code] Char(6) NULL,
 [Mem.ID] Varchar(11) NOT NULL,
 [Fac.ID] Varchar(8) NULL,
 [NP.ID] Varchar(10) NULL
)
go

-- Create indexes for table Member.Event

CREATE INDEX [IX_Relationship9] ON [Member.Event] ([Fac.ID])
go

CREATE INDEX [IX_Relationship10] ON [Member.Event] ([NP.ID])
go

-- Add keys for table Member.Event

ALTER TABLE [Member.Event] ADD CONSTRAINT [Key5] PRIMARY KEY ([Mem.ID] DESC,[Event.ID])
go

-- Table Member.MemberGroup

CREATE TABLE [Member.MemberGroup]
(
 [Group.ID] Varchar(11) NOT NULL,
 [Gname] Varchar(50) NOT NULL,
 [Start.Date] Date NOT NULL,
 [End.Date] Date NOT NULL,
 [Street.Address1] Char(50) NOT NULL,
 [Street.Address2] Char(50) NULL,
 [City] Char(25) NOT NULL,
 [State] Char(2) NOT NULL,
 [Zipcode] Char(5) NOT NULL
)
go

-- Add keys for table Member.MemberGroup

ALTER TABLE [Member.MemberGroup] ADD CONSTRAINT [Key6] PRIMARY KEY ([Group.ID])
go

-- Table Provider.Speciality

CREATE TABLE [Provider.Speciality]
(
 [Speciality] Char(30) NOT NULL,
 [Medical.School] Varchar(50) NOT NULL,
 [Class.Of.Year] Date NOT NULL,
 [NP.ID] Varchar(10) NOT NULL
)
go

-- Add keys for table Provider.Speciality

ALTER TABLE [Provider.Speciality] ADD CONSTRAINT [Key3] PRIMARY KEY ([NP.ID])
go

-- Table Provider.Person.Info

CREATE TABLE [Provider.Person.Info]
(
 [NP.ID] Varchar(10) NOT NULL,
 [Fname] Varchar(30) NOT NULL,
 [Lname] Varchar(25) NOT NULL,
 [Phone] Varchar(13) NOT NULL,
 [Email] Varchar(35) NOT NULL,
 [Street.Address1] Char(50) NOT NULL,
 [Street.Address2] Char(50) NULL,
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
 [Fac.ID] Varchar(8) NOT NULL,
 [Fac.Name] Varchar(50) NOT NULL,
 [Fac.Type] Char(35) NOT NULL,
 [Street.Address1] Char(50) NOT NULL,
 [Street.Address2] Char(50) NULL,
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
 [NP.ID] Varchar(10) NOT NULL,
 [Fac.ID] Varchar(8) NOT NULL
)
go

-- Add keys for table Person.Facility

ALTER TABLE [Person.Facility] ADD CONSTRAINT [Key8] PRIMARY KEY ([NP.ID],[Fac.ID])
go

-- Table Plans

CREATE TABLE [Plans]
(
 [Plan.ID] Varchar(5) NOT NULL,
 [Plan.Name] Varchar(30) NOT NULL,
 [Start.Date] Date NOT NULL,
 [Validity] Char(7) NOT NULL,
 [Number.of.Members] Int NOT NULL,
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

-- Table Event.Claim

CREATE TABLE [Event.Claim]
(
 [Amount] Money NOT NULL,
 [Claim.Date] Date NOT NULL,
 [Claim.EndDate] Date NOT NULL,
 [Claim.Status] Char(15) NOT NULL,
 [Mem.ID] Varchar(11) NOT NULL,
 [Event.ID] Varchar(12) NOT NULL
)
go

-- Add keys for table Event.Claim

ALTER TABLE [Event.Claim] ADD CONSTRAINT [Key13] PRIMARY KEY ([Mem.ID] DESC,[Event.ID])
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


ALTER TABLE [Person.Facility] ADD CONSTRAINT [Person to Facility] FOREIGN KEY ([NP.ID]) REFERENCES [Provider.Person.Info] ([NP.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Person.Facility] ADD CONSTRAINT [Facility to Person] FOREIGN KEY ([Fac.ID]) REFERENCES [Provider.Facility] ([Fac.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Provider.Speciality] ADD CONSTRAINT [Person to Speciality] FOREIGN KEY ([NP.ID]) REFERENCES [Provider.Person.Info] ([NP.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Event] ADD CONSTRAINT [Member Facility visit] FOREIGN KEY ([Fac.ID]) REFERENCES [Provider.Facility] ([Fac.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Event] ADD CONSTRAINT [Member Provider Person visit] FOREIGN KEY ([NP.ID]) REFERENCES [Provider.Person.Info] ([NP.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Event.Claim] ADD CONSTRAINT [Event Claim] FOREIGN KEY ([Mem.ID], [Event.ID]) REFERENCES [Member.Event] ([Mem.ID], [Event.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Policy] ADD CONSTRAINT [Plans taken] FOREIGN KEY ([Plan.ID]) REFERENCES [Plans] ([Plan.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Member.Information] ADD CONSTRAINT [Relationship25] FOREIGN KEY ([NP.ID]) REFERENCES [Provider.Person.Info] ([NP.ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




