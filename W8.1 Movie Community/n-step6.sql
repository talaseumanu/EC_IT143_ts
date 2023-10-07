-- Q: What are all the comedies movies in netflix_dataset table?

-- A: Lets ask SQL query using the Netflix database

-- 1) Reload data

TRUNCATE TABLE dbo.netflix_set_comedies;

INSERT INTO dbo.netflix_set_comedies
	 SELECT [Name]
	       ,[Category] 
	  FROM [dbo].[v_netflix_comedies];

--2) Review results

SELECT * FROM dbo.netflix_set_comedies;