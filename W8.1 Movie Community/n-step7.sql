Create Procedure dbo.netflix_comedies
AS

/********************************************************************************************************
-NAME:dbo.netflix_comedies

-PURPOSE: Netflix comedies - Load user stored procedure

-MODIFICATION LOG:
Ver     Date            Author       Description
---     ---------       --------     -----------
1.0     7/10/2023       TSEUMANU     1. Built this script for EC IT143


RUNTIME:
1s

NOTES:
This script create the procedure and store it into my SQL database
************************************************************************************************************/

BEGIN 

-- 1) Reload data

TRUNCATE TABLE dbo.netflix_set_comedies;

INSERT INTO dbo.netflix_set_comedies
	 SELECT [Name]
	       ,[Category] 
	  FROM [dbo].[v_netflix_comedies];

--2) Review results

SELECT * FROM dbo.netflix_set_comedies;

END;
GO