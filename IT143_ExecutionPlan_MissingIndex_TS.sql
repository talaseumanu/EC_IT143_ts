
/********************************************************************************************************
-NAME: Performance Analysis Script

-PURPOSE: To showcase my Food Community dataset questions and answers.

-MODIFICATION LOG:
Ver     Date            Author       Description
---     ---------       --------     -----------
1.0     23/10/2023       TSEUMANU     1. Built this script for EC IT143


RUNTIME:
1s

NOTES:
This script exists to showcase SQL queries, Execution plan and missing index recommendation
************************************************************************************************************/

/* First Query using a WHERE CLAUSE that does not have an existing index */
SELECT * FROM [Person].[Person]
WHERE FirstName = 'Mark'


/*
Missing Index Details from SQLQuery1.sql - DESKTOP-TDAGD9K.AdventureWorks2022 (DESKTOP-TDAGD9K\Seumanu (61))
The Query Processor estimates that implementing the following index could improve the query cost by 81.7272%.
*/


USE [AdventureWorks2022]
GO
CREATE NONCLUSTERED INDEX IX_First_Name
ON [Person].[Person] ([FirstName])

GO

/* Second Query using a WHERE CLAUSE that does not have an existing index */

SELECT * FROM [Person].[Address]
WHERE City = 'Seattle'

/*
Missing Index Details from SQLQuery3.sql - DESKTOP-TDAGD9K.AdventureWorks2022 (DESKTOP-TDAGD9K\Seumanu (52))
The Query Processor estimates that implementing the following index could improve the query cost by 93.2298%.
*/


USE [AdventureWorks2022]
GO
CREATE NONCLUSTERED INDEX IX_Person_City
ON [Person].[Address] ([City])

GO
