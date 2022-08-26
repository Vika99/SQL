/****** Script for SelectTopNRows command from SSMS  ******/
/*SELECT TOP (1000) [id]
      ,[first_name]
      ,[last_name]
  FROM [TestSwimCompetition].[dbo].[data$]

  */


--Change 1000000 to the number of your preference for your needs
SELECT TOP 1000000
      c1.[first_name],
	  c2.[last_name]
 
  FROM [TestSwimCompetition].[dbo].[data$] c1
CROSS JOIN
[TestSwimCompetition].[dbo].[data$] c2