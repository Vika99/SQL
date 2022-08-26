

 /* Напишите скрипт для суммы OrderQty для каждого года и зимних месяцев из Production.WorkOrder в виде транспонированной матрицы:

 */

 -- Pivot table 
SELECT  year, 
[1] as January, [2] as February, [12] as December
FROM  
(
  Select OrderQty, Year( DueDate ) year,Month(DueDate) month
 From [AdventureWorks2017].[Production].[WorkOrder]
 where Month(DueDate) in (12,1,2)

) AS SourceTable  
PIVOT  
(  
  Sum(OrderQty)  
  FOR Month IN ([1], [2], [12]) 
) AS PivotTable;  



 /*
 Select SUM(OrderQty), Year( DueDate ) year,Month(DueDate) month
FROM [AdventureWorks2017].[Production].[WorkOrder]
where Month(DueDate) in (12,1,2)
GROUP BY Year( DueDate ),Month(DueDate) 
order by year(DueDate) desc,month(DueDate) desc
*/











 