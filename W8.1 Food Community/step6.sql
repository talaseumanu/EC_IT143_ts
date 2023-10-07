
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


TRUNCATE TABLE dbo.table_tuvalu_chickens

INSERT INTO dbo.table_tuvalu_chickens
SELECT [Area] ,
       [item_count]
FROM [dbo].[v_tuvalu_stock] as v;

SELECT * FROM dbo.table_tuvalu_chickens