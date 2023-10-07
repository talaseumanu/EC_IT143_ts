-- Q: What are all the comedies movies in netflix_dataset table?

-- A: Lets ask SQL query using the Netflix database

SELECT [Name]
      ,[Category]
      INTO dbo.t_netflix_set_comedies
  FROM dbo.v_netflix_comedies;
