CREATE FUNCTION [dbo].CONVERT_TEMP
(
@temperature DECIMAL,
@Degree CHAR
)
RETURNS DECIMAL
AS
BEGIN
--This function converts temperature value from one measure to other.
DECLARE @Result AS DECIMAL
IF UPPER(@Degree) = 'F'
SET @Result = ((@temperature - 32)* 5/9) 
IF UPPER(@Degree) = 'C'
SET @Result = (((@temperature * 9) /5 )+ 32)
RETURN  @Result
END
SELECT [dbo].CONVERT_TEMP (70, 'F') AS 'C'
SELECT [dbo].CONVERT_TEMP (21, 'C') AS 'F'