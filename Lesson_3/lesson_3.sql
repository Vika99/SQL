/*Write a list of prices as a text comment based on the price range for a product:
StandardCost is 0 or undefined - ‘Not for sale’
StandardCost greater than 0 but less than 100 - ‘<$ 100’
StandardCost is greater than or equal to 100 but less than 500 - '<$ 500'
Otherwise - ‘> = $ 500 '
Write the product name and a new PriceRange field.
*/
 SELECT p.Name,
 CASE
	WHEN p.StandardCost = 0 OR p.StandardCost = NULL THEN 'Not for sale'
	WHEN p.StandardCost >= 0 AND p.StandardCost <100 THEN '<$ 100'
	WHEN p.StandardCost >= 100 OR p.StandardCost < 500 THEN '<$ 500'
	ELSE '> = $ 500'
END AS PriceRange
 FROM Production.Product p



 /*
 Find ProductID, BusinessEntityID and supplier name of products from Purchasing.ProductVendor and Purchasing.Vendor 
 where StandardPrice is greater than $ 10.
 Also, the vendor name must contain (regardless of position) the letter X or the name must start with the letter N.
 */

 SELECT ProductID,pv.BusinessEntityID,v.Name
 FROM Purchasing.ProductVendor pv
 JOIN Purchasing.Vendor v ON pv.BusinessEntityID = v.BusinessEntityID
 WHERE pv.StandardPrice > 10
 AND v.Name LIKE '%X%' OR v.Name LIKE 'N%'


 /*
 Find the names of all vendors whose products have not been sold in the entire time.
 You must use the following scheme for connecting the Purchasing.ProductVendor and Purchasing.Vendor tables:
 */

SELECT v.Name
FROM Purchasing.Vendor v
LEFT JOIN Purchasing.ProductVendor pv ON v.BusinessEntityID = pv.BusinessEntityID
WHERE pv.BusinessEntityID IS NULL

 /*
 3 A)Find manufacturers whose drugs were not sold in 2019 
 (hint: to extract the year from the date, you must use one of the date functions).
 
 SELECT p.Name 
 FROM Producers p
 JOIN pharmaceuticals ph ON p.id_firm=ph.id_firm
 JOIN Sales s ON ph.id_pharm=s.id_pharm
 JOIN Sales s ON c.id_cheak=s.id_cheak
 (SELECT Date FROM Cheak c
 WHERE YEAR(Date) NOT IN 2019)

 */

 /* 3B)
 Output the doubled price of drugs of type A.

 SELECT (2*Price) AS double_price
 FROM Types_of_pharmaceuticals tph
 JOIN pharmaceuticals ph ON tph.id_type=ph.id_type
 WHERE type like 'A'


 3C)Find manufacturers and the number of pharmaceuticals for each of them, where the drug is not type A.

 SELECT p.name, COUNT(ph.name) as total_number
 FROM pharmaceuticals ph 
 JOIN Producers p ON ph.id_firm=p.id_firm
 JOIN Types_of_pharmaceuticals tph ON ph.id_Type=tph.id_type
 WHERE not type like 'A'
 GROUP BY p.name


 3D)
 write the name of the pharmacy and the names of pharmaceuticals that were sold there on Saturdays.

 SELECT pn.Name, ph.Name
 FROM Pharmacy_Name pn
 JOIN Sales s ON pn.id_pharm_name=s.pharm_name
 JOIN pharmaceuticals ph ON s.id_pharm=ph.id_pharm
(SELECT Date FROM Cheak c
 WHERE WEEKDAY(Date)=7)

 */

/* 4.a)I  want to find the name of the product with red color which StandardCost more or equal average total StandardCost  and round it to 2 sighns

 SELECT Name, Color,StandardCost 
 FROM Production.Product
 WHERE StandardCost>= (SELECT ROUND(AVG(StandardCost),2)
 FROM Production.Product)
 AND Color LIKE 'RED'



 4b) next like little query for customer decision: if the average rate of USDAUD is more than 1.6, client decision is that it is too high for him, and opposite, like, lets buy !


 SELECT c.CurrencyRateID, FromCurrencyCode,ToCurrencyCode,AverageRate, s.CustomerID, IIF (AverageRate > 1.6,'Too High','Lets buy') AS Client_decision
 FROM Sales.CurrencyRate c
 JOIN Sales.SalesOrderHeader s ON c.CurrencyRateID = s.CurrencyRateID
 WHERE FromCurrencyCode LIKE 'USD'
 AND ToCurrencyCode LIKE 'AUD'



 4c) i want to call clients and i need their phone and name and surname, so i decided to join tables and via function concat i know together first and last name of people

 SELECT CONCAT(p.FirstName,' ', p.LastName) AS Name_Surname,pp.PhoneNumber
 FROM Person.Person p
 JOIN Person.PersonPhone pp ON p.BusinessEntityID = pp.BusinessEntityID


 4d) i want to know only 2 letters from ProductNumber and size of product

 SELECT SUBSTRING(ProductNumber,1,2) as first_letters ,size
 FROM Production.Product
 WHERE Size is not null