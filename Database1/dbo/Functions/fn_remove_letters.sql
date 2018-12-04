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