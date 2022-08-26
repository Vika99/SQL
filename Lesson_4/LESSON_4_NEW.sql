/* SELECT *
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'
*/


-- INSERT INTO Production.UnitMeasure (UnitMeasureCode,Name,ModifiedDate ) VALUES ('TT2', 'Test 2', getdate())

/*SELECT *
INTO Production.UnitMeasureTest_1
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'
OR UnitMeasureCode LIKE '%CAN%'
*/

 -- SELECT *
-- FROM Production.UnitMeasureTest


/* UPDATE Production.UnitMeasureTest
SET UnitMeasureCode = 'TTT'
*/

/* DELETE 
FROM  Production.UnitMeasureTest
*/

/*
SELECT SalesOrderID, MAX(LineTotal) as MAX, MIN(LineTotal) as MIN, AVG(LineTotal) as AVG
FROM [Sales].[SalesOrderDetail]
WHERE SalesOrderID IN (43659,43664)
GROUP BY SalesOrderID
*/

/*SELECT SalesOrderID, (SELECT MAX(LineTotal) FROM [Sales].[SalesOrderDetail])  AS MAX,(SELECT MIN(LineTotal) FROM [Sales].[SalesOrderDetail])  AS MIN, (SELECT AVG(LineTotal) FROM [Sales].[SalesOrderDetail])  AS AVG
FROM [Sales].[SalesOrderDetail]
WHERE SalesOrderID IN (43659,43664)
*/

/*
SELECT  [BusinessEntityID]
      ,[FirstName]
      ,[LastName]
      ,[TerritoryGroup]
      ,[SalesYTD]
      ,[SalesLastYear],
	  ROW_NUMBER() OVER (ORDER BY SalesLastYear DESC) AS "ROW_NUMBER",
	  RANK() OVER (ORDER BY SalesLastYear DESC) AS "RANK",
	  DENSE_RANK() OVER (ORDER BY SalesLastYear DESC) AS "DENSE_RANK",
	 -- ROW_NUMBER() OVER (ORDER BY SalesYTD DESC) AS "ROW_NUMBER",
	  --RANK() OVER (ORDER BY SalesYTD DESC) AS "RANK",
	--  DENSE_RANK() OVER (ORDER BY SalesYTD DESC) AS "DENSE_RANK",
	 CONCAT(UPPER(LEFT(LastName,3)),'login', COALESCE(TerritoryGroup,'')) as Login

  FROM [AdventureWorks2017].[Sales].[vSalesPerson]

  */

  /*
  SELECT CASE
         WHEN Datename(dw, Dateadd(dd, -Datepart(dd, Getdate()) + 1, Getdate())) = 'Saturday' THEN Dateadd(dd, -Datepart(dd, Getdate()) + 3, Getdate())
         WHEN Datename(dw, Dateadd(dd, -Datepart(dd, Getdate()) + 1, Getdate())) = 'Sunday' THEN Dateadd(dd, -Datepart(dd, Getdate()) + 2, Getdate())
         ELSE Dateadd(dd, -Datepart(dd, Getdate()) + 1, Getdate())
       END 
	   */