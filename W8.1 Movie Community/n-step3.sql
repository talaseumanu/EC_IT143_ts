-- Q: What are all the comedies movies in netflix_dataset table?

-- A: Lets ask SQL query using our Netflix database

SELECT Name,
	   Category
FROM [dbo].[netflix_set]
WHERE Category = 'Comedies'