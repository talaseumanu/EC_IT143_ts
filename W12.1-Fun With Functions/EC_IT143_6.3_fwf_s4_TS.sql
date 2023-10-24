-- Q : How to extract last name from Contact Name?

-- A: Well, here is your problem...
-- CustomerName = Alejandra Camino -> Camino
-- Google search "How to extract first name from combined name tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

SELECT t.ContactName
      , RIGHT(t.ContactName, DATALENGTH(t.ContactName) - CHARINDEX(' ' , t.ContactName + ' ') + 1) AS last_name
  FROM dbo.t_w3_schools_customers AS t
  ORDER BY 1;