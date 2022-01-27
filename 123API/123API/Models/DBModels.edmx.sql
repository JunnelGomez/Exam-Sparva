
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/28/2022 02:12:18
-- Generated from EDMX file: C:\Users\Junnel Gomez\Documents\Visual Studio 2013\Projects\123API\123API\Models\DBModels.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [123DB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Tbl_Accountinfo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tbl_Accountinfo];
GO
IF OBJECT_ID(N'[dbo].[Tbl_TransactionInfo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tbl_TransactionInfo];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Tbl_Accountinfo'
CREATE TABLE [dbo].[Tbl_Accountinfo] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Account_Name] varchar(50)  NULL,
    [Male] nvarchar(50)  NULL,
    [Balance] decimal(18,3)  NULL,
    [Date_Created] datetime  NULL,
    [Created_By] varchar(50)  NULL
);
GO

-- Creating table 'Tbl_TransactionInfo'
CREATE TABLE [dbo].[Tbl_TransactionInfo] (
    [TransactionCode] int IDENTITY(1,1) NOT NULL,
    [Account_No] int  NULL,
    [Account_Name] varchar(50)  NULL,
    [Merchant] nvarchar(50)  NULL,
    [Status] nvarchar(50)  NULL,
    [Amount] decimal(18,3)  NULL,
    [Createddate] datetime  NULL,
    [Createdby] varchar(50)  NULL,
    [UpdatedDate] datetime  NULL,
    [Updatedby] varchar(50)  NULL,
    [Documentinfo] varchar(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Tbl_Accountinfo'
ALTER TABLE [dbo].[Tbl_Accountinfo]
ADD CONSTRAINT [PK_Tbl_Accountinfo]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [TransactionCode] in table 'Tbl_TransactionInfo'
ALTER TABLE [dbo].[Tbl_TransactionInfo]
ADD CONSTRAINT [PK_Tbl_TransactionInfo]
    PRIMARY KEY CLUSTERED ([TransactionCode] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------