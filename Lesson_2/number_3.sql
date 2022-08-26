-- How many unique PersonType there are for people from Person.Person 
-- with LastName starting with the letter M or not containing 1 in EmailPromotion.

/*
SELECT COUNT(DISTINCT p.PersonType) AS uniqueTypes
FROM Person.Person p
WHERE p.LastName Like 'M%'
OR p.EmailPromotion NOT IN (1)
*/

-- Output the first 3 special offers from Sales.SpecialOffer with the highest DiscountPct, 
-- which started from 2013-01-01 to 2014-01-01.

/*
SELECT TOP 3 *
FROM Sales.SpecialOffer s
WHERE s.StartDate BETWEEN '2013-01-01 00:00:00'
AND  '2014-01-01 00:00:00'
ORDER BY s.DiscountPct DESC
*/

-- Find the lowest weight and highest maximum product size from Production.Product.
/*
SELECT MIN(p.Weight), MAX(p.Size)
FROM Production.Product p
*/

-- Find the lowest weight and highest product size for each ProductSubcategoryID from Production.Product.
/*
SELECT p.ProductSubcategoryID,MIN(p.Weight) AS MIN_WEIGHT, MAX(p.Size) AS MAX_SIZE
FROM Production.Product p
-- WHERE p.Weight IS NOT NULL 
-- AND p.Size IS NOT NULL
GROUP BY p.ProductSubcategoryID
*/


-- Find the lowest weight and highest maximum product size for each ProductSubcategoryID from Production.Product
-- where the product color is defined by (Color).
/*
SELECT p.ProductSubcategoryID,MIN(p.Weight) AS MIN_WEIGHT, MAX(p.Size) AS MAX_SIZE,p.Color
FROM Production.Product p
-- WHERE p.Weight IS NOT NULL 
-- AND p.Size IS NOT NULL
where p.Color IS NOT NULL
GROUP BY p.ProductSubcategoryID,p.Color
*/