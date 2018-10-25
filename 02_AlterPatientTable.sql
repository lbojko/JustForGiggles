/*
CREATED LB  20181025
Purpose:    Request made iin user story x to s
*/
-- Select rows from a Table or View '[TableOrViewName]' in schema '[SchemaName]' in database '[DatabaseName]'
SELECT * 

IF (Select COUNT(*) From SYS.COLUMNS Where Object_ID = OBJECT_ID('dbo.patient') and name = 'First_Name') = 0
    Alter Table Patient Add First_Name Nvarchar(200) NULL
ELSE 
    Alter Table Patient ALTER COLUMN First_Name Nvarchar(200) NULL
;
    INSERT INTO Patient (First_Name) Values    ('550')
                                            , ('XYZ10')
;

IF (Select COUNT(*) From SYS.COLUMNS Where Object_ID = OBJECT_ID('dbo.patient') and name = 'X_First_Name_FORMATALTER') != 0
    Alter Table Patient DROP COLUMN X_First_Name_FORMATALTER
;

    EXEC sp_rename 'patient.First_Name', 'X_First_Name_FORMATALTER', 'COLUMN'
;

    Alter Table Patient ADD First_Name INT NULL
;
GO

Update Patient
Set First_Name = dbo.fn_remove_letters(X_First_Name_FORMATALTER)
;
GO