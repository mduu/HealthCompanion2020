--
-- IMPORTANT: Add new SQL Migrations to the end of this file
--
-- DESCRIPTION
-- -----------
-- 
-- This file updates an existing SQL database schema step by step to match the latest schema changes.
-- To keep track of what migrations where already appled the table "__MigrationsHistory" is used.
-- 
-- It contains the MigrationId of each migrations executed. The MigrationId has the following format:
-- 
-- 'YYYYMMDD_HHmm_name'
-- 
-- - YYYY = Four digit year
-- - MM = Two digit month
-- - DD = Two digit day
-- - HH = Two digit hour
-- - mm = Two digit minutes
-- - name = A short human readable name of the migration. Eg. "add_app_vouchers"
-- 
-- eg: 20191213_1335_initial
-- 
-- PATTERN FOR MIGRATIONS:
-- ----------------------
-- 
-- IF NOT EXISTS(SELECT * FROM [__MigrationsHistory] WHERE [MigrationId] = N'<migrationId>')
-- BEGIN
--     ... do you SQL-Statements in here ...
--     INSERT INTO [__MigrationsHistory] ([MigrationId]) VALUES (N'<migrationId>');
-- END;
-- GO
--
-- SAMPLE:
-- -------
--
-- IF NOT EXISTS(SELECT * FROM [__MigrationsHistory] WHERE [MigrationId] = N'20191213_1335_sample')
-- BEGIN
--     CREATE TABLE [ContentWrite].[Test] (
--         [Id] nvarchar(450) NOT NULL,
--         [Name] nvarchar(256) NULL
--         CONSTRAINT [PK_ContentWriteTest] PRIMARY KEY ([Id])
--     );
-- 
--     INSERT INTO [__MigrationsHistory] ([MigrationId]) VALUES (N'20191213_1335_sample');
-- END;
-- GO

--- Initialization of __MigrationHistory ---

IF OBJECT_ID(N'[__MigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__MigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [AppliedAt] datetime2 NOT NULL DEFAULT GETDATE(),
        CONSTRAINT [PK___MigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

--- Migrations ---


--- ^^^ NEWEST MIGRATION GOES HERE AND IN InitialSqlScriptEnt.sql on top of the file (see comment there) ^^^