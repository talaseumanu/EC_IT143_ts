DROP VIEW IF EXISTS dbo.v_netflix_comedies
Go

CREATE VIEW dbo.v_netflix_comedies
AS

/********************************************************************************************************
-NAME: dbo.v_netflix_comedies

-PURPOSE: Create the netflix_comedies view

-MODIFICATION LOG:
Ver     Date            Author       Description
---     ---------       --------     -----------
1.0     7/10/2023       TSEUMANU     1. Built this script for EC IT143


RUNTIME:
1s

NOTES:
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
************************************************************************************************************/

SELECT Name,
	   Category
FROM [dbo].[netflix_set]
WHERE Category = 'Comedies';