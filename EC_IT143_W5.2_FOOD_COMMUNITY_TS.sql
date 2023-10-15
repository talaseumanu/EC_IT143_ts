/********************************************************************************************************
-NAME: dbo.Food_Bank

-PURPOSE: To showcase my Food Community dataset questions and answers.

-MODIFICATION LOG:
Ver     Date            Author       Description
---     ---------       --------     -----------
1.0     7/10/2023       TSEUMANU     1. Built this script for EC IT143


RUNTIME:
1s

NOTES:
This script exists to help me answer my Food Community dataset queries.
************************************************************************************************************/

/**Q1:
Being conscious of the historical trends in crop stock and livestock within the World Food Bank is crucial.
We require a comprehensive report detailing the annual aggregate values of both crop stock and livestock. 
Can you kindly furnish us with a time series analysis that presents data type and year in a descending order? -ME
A1: Run this query and it will display a time series analysis of crop and livestock over the years;  **/

(SELECT
    'Crop_Stock' AS Data_Type
	,crp_year AS Year
    ,SUM(CAST(crp_value AS bigint)) AS TotalValue
FROM Crop_Stock
GROUP BY crp_year
)
UNION 

(SELECT
    'Livestock' AS Data_Type
    ,live_year
    ,SUM(CAST(species_value AS BIGINT)) AS TotalValue
FROM Livestock
GROUP BY live_year
)
Order By Data_Type, Year dESC;


/**Q2: The ongoing conflict in Israel has raised our interest in understanding Israel's role in supporting
the World Food Bank. Would you be able to provide us with a list detailing the crops, livestock, and their 
respective values that Israel has supplied to the World Food Bank? -ME
A2: The following sql will provide a list of Israel's crops and livestock contribution to the world;  **/

SELECT
    [crop_name] AS Crop,
	[crp_year] AS crop_year,
    SUM(CAST([crp_value] as BIGINT)) AS Crop_Value,
    [crop_name] AS Species,
	[crp_year] as species_year,
    SUM(CAST([species_value] as BIGINT)) AS Livestock_Value
FROM [dbo].[crop_stock]
FULL JOIN [dbo].[livestock] ON [country_crop] =[livestock_area] and
[crp_year] = [live_year]
WHERE [country_crop] = 'Israel'
GROUP BY [crop_name],[crp_year], [species],[live_year]
ORDER BY Crop_Value DESC, Livestock_Value DESC;



/**Q3: New Zealand is renowned for its outstanding kiwi fruit crop stock and its substantial sheep livestock.
We are interested in obtaining the annual average values for both kiwi fruit and livestock in New Zealand. 
Could you kindly provide us with this data? -ME 
A3: Here is a SQL query that will provide you with NZ annual kiwifruit and sheep stocks;  **/

WITH CombinedData AS
  (
   SELECT
    [crop_name],
    [crp_year],
    AVG([crp_value]) AS AverageStock
FROM (
    SELECT
        [country_crop],
        [crop_name],
        [crp_year],
        [crp_value]
    FROM [dbo].[crop_stock]
    WHERE [country_crop] = 'New Zealand' AND [crop_name] = 'Kiwi Fruit'

    UNION 

    SELECT
        [livestock_area],
        [species],
        [live_year],
        [species_value]
    FROM [dbo].[livestock]
    WHERE [livestock_area] = 'New Zealand' AND[species]  = 'Sheep'
	) Subquery
	Group by [crop_name],[crp_year]
)
Select
	[crop_name] as Item,
	[crp_year] as Year,
	AverageStock
FROM CombinedData
ORDER BY Item, Year DESC;


/**Q4:  Afghanistan needs to increase the value of it's herds.  Which years have a 1,300,000 or more Value 
for Stock Head, so they can investigate what gave such high value in those years? -Tad Dastrup
A4: Below query will showcase the years that Afghanistan have 1,300,000 or more for stockhead; **/

SELECT [livestock_area]
       ,[species]
       ,[live_year]
	   ,[species_value] 
FROM [dbo].[livestock]
WHERE [livestock_area] = 'Afghanistan'
AND [live_unit] = 'Head' AND [species_value] >= 1300000
Order by [live_year] desc;

