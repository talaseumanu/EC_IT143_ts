CREATE PROCEDURE dbo.stock_counts

AS

/********************************************************************************************************
-NAME: EC_IT143_W8.1_Tuvalu_Stock_s1_TS.sql
40
-PURPOSE: My purpose is to store the procedure and views from previous steps into my SQL database

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
	TRUNCATE TABLE dbo.table_tuvalu_chickens

    INSERT INTO dbo.table_tuvalu_chickens
    SELECT [Area] ,
           [item_count]
    FROM [dbo].[v_tuvalu_stock] as v;

    SELECT * FROM dbo.table_tuvalu_chickens;

END;
GO