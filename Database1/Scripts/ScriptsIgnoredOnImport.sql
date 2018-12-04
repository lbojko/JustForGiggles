
IF DB_ID('JustForGiggles_Test') IS NULL
Create Database JustForGiggles_Test
;
GO

USE JustForGiggles_Test
GO

IF object_id('patient') IS NULL
--The following statement was imported into the database project as a schema object and named dbo.patient.
--Create Table patient
--(
--    _id int Identity (1,1) NOT NULL
--)
--;

GO

IF (Select COUNT(*) From SYS.COLUMNS Where Object_ID = OBJECT_ID('dbo.patient') and name = 'First_Name') = 0
    Alter Table Patient Add First_Name Nvarchar(200) NULL
ELSE 
    Alter Table Patient ALTER COLUMN First_Name Nvarchar(200) NULL
;
GO

INSERT INTO Patient (First_Name) Values    ('550')
                                            , ('XYZ10')
;
GO

IF (Select COUNT(*) From SYS.COLUMNS Where Object_ID = OBJECT_ID('dbo.patient') and name = 'X_First_Name_FORMATALTER') != 0
    Alter Table Patient DROP COLUMN X_First_Name_FORMATALTER
;
GO

EXEC sp_rename 'patient.First_Name', 'X_First_Name_FORMATALTER', 'COLUMN'
;
GO

Alter Table Patient ADD First_Name INT NULL
;
GO

Update Patient
Set First_Name = dbo.fn_remove_letters(X_First_Name_FORMATALTER)
;
GO

IF (SELECT COUNT(*) FROM sys.objects where name = 'fn_remove_letters' and SCHEMA_ID = (SCHEMA_ID('dbo'))) > 0 
        DROP FUNCTION dbo.fn_remove_letters
;
GO
