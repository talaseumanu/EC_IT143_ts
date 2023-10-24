CREATE FUNCTION [dbo].[udf_parse_last_name]
(@v_combined_name AS VARCHAR(500)
)
RETURNS VARCHAR(100)

/********************************************************************************************************
-NAME: dbo.udf_parse_last_name

-PURPOSE:Parse Last Name from combined name

-MODIFICATION LOG:
Ver     Date            Author       Description
---     ---------       --------     -----------
1.0     23/10/2023       TSEUMANU     Script for fun with function


RUNTIME:
1s

NOTES:
adapted from the following...
 https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name
************************************************************************************************************/

    BEGIN
	   
	   DECLARE @v_last_name AS VARCHAR(100);

	   SET @v_last_name = RIGHT(@v_combined_name, (DATALENGTH(@v_combined_name) - CHARINDEX(' ', @v_combined_name + ' ')) + 1);

	   RETURN @v_last_name;

	END;
GO