-- Q: How many stocks of chickens did Tuvalu sold? 

-- A: Lets ask SQL Server using our FoodBank database

SELECT Area,
      Count(Item) as stocks     
FROM [dbo].[livestock]
WHERE Item = 'Chickens'
AND AREA= 'Tuvalu'
GROUP BY Area