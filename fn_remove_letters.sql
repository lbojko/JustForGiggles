IF (SELECT COUNT(*) FROM sys.objects where name = 'fn_remove_letters' and SCHEMA_ID = (SCHEMA_ID('dbo'))) > 0 
        DROP FUNCTION dbo.fn_remove_letters
;
GO

CREATE function dbo.fn_remove_letters   ( 
                                        @STRINGINPUT nvarchar(max) NULL
                                        )
RETURNS nvarchar(max)
AS

BEGIN

WHILE   PATINDEX('%[^0-9]%', COALESCE(@STRINGINPUT, '')) != 0 
BEGIN
        SET @STRINGINPUT = STUFF(@STRINGINPUT, PATINDEX('%[^0-9]%', COALESCE(@STRINGINPUT, '')), 1, '')
END

RETURN @STRINGINPUT

END