DROP VIEW IF EXISTS dbo.v_tuvalu_stock;
GO

CREATE VIEW dbo.v_tuvalu_stock
AS

/********************************************************************************************************
-NAME: EC_IT143_W8.1_Tuvalu_Stock_s1_TS.sql

-PURPOSE: My purpose is to find the total amount of chicken stock Tuvalu sold.

-MODIFICATION LOG:
Ver     Date            Author       Description
---     ---------       --------     -----------
1.0     7/10/2023       TSEUMANU     1. Built this script for EC IT143


RUNTIME:
1s

NOTES:
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
************************************************************************************************************/

SELECT Area,
      Count(Item)as item_count     
FROM [dbo].[livestock]
WHERE Item = 'Chickens'
AND AREA= 'Tuvalu'
GROUP BY Area






