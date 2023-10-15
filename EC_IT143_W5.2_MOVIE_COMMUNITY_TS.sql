/********************************************************************************************************
-NAME: dbo.Netflix_Rating

-PURPOSE: To showcase my Movie Community dataset questions and answers.

-MODIFICATION LOG:
Ver     Date            Author       Description
---     ---------       --------     -----------
1.0     7/10/2023       TSEUMANU     1. Built this script for EC IT143


RUNTIME:
1s

NOTES:
This script exists to help me answer my Movie Community dataset queries.
************************************************************************************************************/

/**Q1: We are considering bringing back our viewers favorite movies/shows. We want to know about our top 10 rated
movies in the Netflix Library. Could you retrieve our top 10 rated movies? -ME
A1: The following SQL query will retrieve the Top 10 rated movies;  **/

SELECT TOP 10 [m_name]
           , AVG([m_rating]) AS AvgRating
FROM [dbo].[netflix_movie]
INNER JOIN [dbo].[netflix_rating] ON m_id = movie_ID
GROUP BY m_name 
ORDER BY AvgRating DESC;

/**Q2: We are interested in finding out the amount of ratings each movie and show received.
Could you please show us a table of all our movies and shows and the amount of ratings they received? -ME
A2: Run this SQL query and it will show the number of rating for each movies and shows;  **/

SELECT m_name
       ,COUNT(m_rating) AS NumRatings
FROM dbo.netflix_movie
LEFT JOIN dbo.netflix_rating ON m_id =movie_ID
GROUP BY m_name
ORDER BY NumRatings DESC;

/**Q3: We want to know more about the “oldie but goodie” collections. We are specifically after our collections of 
movies before the year 2000.  Could you provide us with a table of all the movies and shows and their average rating? -ME 
A3: This SQL query display movies and shows released before 2000 with average ratings;  **/

SELECT m_name
       ,AVG(m_rating) AS AvgRating
FROM dbo.netflix_movie
LEFT JOIN dbo.netflix_rating ON m_id = movie_ID
WHERE m_year < 2000
GROUP BY m_id, m_name
ORDER BY AvgRating DESC

/**Q4: We want to make some improvements to our Netflix Library and want to know about our least favorite movies/shows 
collection. Which movies have the lowest average ratings? -Melvin Dunner
A4: Run this SQL query to retrieve a collection of least favorite movies and shows in the Netflix Library; **/

SELECT 
      m_name AS MovieName,
      AVG(m_rating) AS AverageRating
FROM dbo.netflix_movie
INNER JOIN dbo.netflix_rating ON m_id = movie_ID
GROUP BY m_name
ORDER BY AverageRating;
