-- 1.Get all columns from the Sales.Sales Territory table
-- SELECT * FROM SALES.SalesTerritory

-- 2.Get the TerritoryID and Name columns from the Sales.SalesTerritory table.
/*
SELECT  S.TerritoryID, S.Name
FROM Sales.SalesTerritory AS S
*/

--3.Find all the data that exists for people from Person.Person with LastName = ‘Norman’
/*
SELECT * FROM Person.Person p
WHERE p.LastName = 'Norman'
*/

--4 Find all lines from Person.Person where EmailPromotion is not equal to 2.
/*
SELECT * FROM Person.Person p
WHERE p.EmailPromotion !=2
ORDER BY EmailPromotion DESC
*/

