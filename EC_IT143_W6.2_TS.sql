--*********************************************************************************
--NAME: AdventureWorks: Create Answers
--PURPOSE: Provide sql query solutions to my chosen eight questions from create questions forum.

--MODIFICATION LOG:
--Ver Date        Author      Description
----- ---------- ----------- -------------------------------------------------------
--1.0 09/30/2023 TSeumanu     1. Built this script for IT 143 Section 02P

--NOTES:
--This script responds to eight requests from various users, each with increasing levels of complexity.
----******************************************************************************
--USE AdventureWorks2019; -- Makes the script run in AdventureWorks2019 database

---- MARGINAL COMPLEXITY QUESTIONS:

---- Q1:How many people does AdventureWorks employ? -Nathan White
---- A1:AdventureWorks have a total of 290 employees. 
---- You can use the following query to answer this question:
	 
	 SELECT COUNT(*) as TotalEmployees
     FROM [HumanResources].[Employee];

---- Q2: What are AdventureWorks product category names? -Nathan White
---- A2:The product category names are Accessories, Bikes, Clothing and Components. 
---- This sql query will list all the product catergory names in AdventureWorks:

	 SELECT Name
     FROM Production.ProductCategory;

---- MODERATE COMPLEXITY QUESTIONS:

---- Q3: What is the Name and Order Quantity of the Product that has a Product ID of 348?- Tad Dastrup
---- A3:The product name is Flat Washer 5 and order quantity is NULL.
---- To retrieve the product name and quantity of product, use this sql query:

	 SELECT P.Name, OD.OrderQty
	 FROM Production.Product AS P
	 LEFT JOIN Sales.SalesOrderDetail AS OD ON P.ProductID = OD.ProductID
     WHERE P.ProductID = 348;


---- Q4: What are the product name, unit price, total revenue of top 10 revenue producing products?- Stacey Singleton
----A4:Here are all the top 10 revenue producing products in AdventureWorks;

      ---- Product name:           Unit Price:     Total Revenue:
      ----Mountain-200 Black, 38	 2294.99	     4400592.800400
      ----Mountain-200 Black, 42	 2294.99	     4009494.761841
      ----Mountain-200 Silver, 38	 2319.99	     3693678.025272
      ----Mountain-200 Silver, 42	 2319.99	     3438478.860423
      ----Mountain-200 Silver, 46	 2319.99	     3434256.941928
      ----Mountain-200 Black, 46	 2294.99	     3309673.216908
      ----Road-250 Black, 44	     2443.35	     2516857.314918
      ----Road-250 Black, 48	     2443.35	     2347655.953454
      ----Road-250 Black, 52	     2443.35	     2012447.775000
      ----Road-150 Red, 56	         3578.27	     1847818.628000
	  
---- Use this SQL to check the given answer:

	WITH ProductRevenue AS (
    SELECT
        p.Name AS ProductName,
        p.ListPrice AS UnitPrice,
        SUM(dh.LineTotal) AS TotalRevenue
    FROM 
        Sales.SalesOrderDetail AS dh
    INNER JOIN 
        Production.Product AS p ON dh.ProductID = p.ProductID
    GROUP BY 
        p.Name, p.ListPrice
)
    SELECT TOP 10
       ProductName,
       UnitPrice,
       TotalRevenue
    FROM 
       ProductRevenue
    ORDER BY 
       TotalRevenue DESC;


---- INCREASED COMPLEXITY QUESTIONS: 

---- Q5: What is the best-selling product in our company? -Daniel Ayala
---- A5:The best selling product in Advenuture Works is AWC Logo Cap. Its been sold 8311 times.
---- This query will retrieve this data for you:
    
	 SELECT TOP 1
     p.Name AS BestSellingProduct,
     SUM(dh.OrderQty) AS TotalQuantitySold
     FROM Sales.SalesOrderDetail AS dh
     INNER JOIN 
             Production.Product AS p ON dh.ProductID = p.ProductID
     GROUP BY 
             p.Name
     ORDER BY 
            TotalQuantitySold DESC;


---- Q6: Can you create a list of the top 10 products when it comes to cumulative net revenue? Include Products’ name and cumulative net revenue -Stacey Singleton 
---- A6: These are the top 10 products and cumulative net revenue;

		--Product                   Cumulative Net Revenue
		--Mountain-200 Black, 42	674216.578641
		--Mountain-200 Black, 38	673444.470300
        --Mountain-200 Black, 46	666740.692608
        --Mountain-200 Silver, 38	663784.942272
        --Mountain-200 Silver, 46	629644.129928
        --Mountain-200 Silver, 42	611084.897423
        --Road-150 Red, 48	        470355.021400
        --Road-150 Red, 62	        466320.168000
        --Road-150 Red, 52	        421110.868400
        --Road-150 Red, 56	        406079.279200

---- The following query can verify the top 10 products and cumulative net revenue given for you:

	 WITH ProductRevenue AS (
     SELECT
        p.Name AS ProductName,
        SUM(dh.LineTotal - p.StandardCost * dh.OrderQty) AS CumulativeNetRevenue
     FROM 
        Sales.SalesOrderDetail AS dh
     INNER JOIN 
        Production.Product AS p ON dh.ProductID = p.ProductID
     GROUP BY 
        p.Name
     )
     SELECT TOP 10
        ProductName,
        CumulativeNetRevenue
     FROM 
        ProductRevenue
     ORDER BY 
        CumulativeNetRevenue DESC;


---- METADATA QUESTIONS:

---- Q7: Can you create a list of all the primary keys in the database? -Talafua Seumanu
---- A7:To access a list of all the Primary Keys in the database, use the following SQL:
    
	SELECT 
        CONSTRAINT_NAME AS PrimaryKeyConstraintName,
        TABLE_NAME AS TableName,
        COLUMN_NAME AS ColumnName
    FROM 
       INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE 
       CONSTRAINT_NAME LIKE 'PK_%';

---- Q8: Can I obtain a list of all the columns and data types in the Production.ScrapReason Table? -Carloz Paz
---- A8: Use the following SQL query to obatain a list of columns and data types in Production.ScrapReason table;
	
	USE AdventureWorks2022; 
    SELECT 
        COLUMN_NAME AS ColumnName,
        DATA_TYPE AS DataType
    FROM 
        INFORMATION_SCHEMA.COLUMNS
    WHERE 
       TABLE_NAME = 'ScrapReason' AND
       TABLE_SCHEMA = 'Production';

