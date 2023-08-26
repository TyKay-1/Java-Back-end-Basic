USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'KhaiPT_SU23')
BEGIN
	ALTER DATABASE [KhaiPT_SU23] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [KhaiPT_SU23] SET ONLINE;
	DROP DATABASE [KhaiPT_SU23];
END

GO

CREATE DATABASE [KhaiPT_SU23]
GO

USE [KhaiPT_SU23]
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
CREATE TABLE [dbo].[Registration] (
    [username] VARCHAR (50)  NOT NULL,
    [password] VARCHAR (50)  NULL,
    [lastname] NVARCHAR (50) NULL,
    [isAdmin]  BIT           NULL,
    CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED ([username] ASC)
);
GO

insert into Registration
values('hutruc','123456',N'Hu Truc','False')

insert into Registration
values('IA1301','123456',N'Class IA1301','False')

insert into Registration
values('khanh','kieu123',N'Khanh Kieu','True')

insert into Registration
values('khanh@Spring','123456',N'Spring annotation','False')

insert into Registration
values('khanhSpring','123456',N'khanh','False')

insert into Registration
values('messiuu','123456',N'Lionel Messi a','True')

insert into Registration
values('TheAlien','123456',N'Ronaldo de Lima','False')