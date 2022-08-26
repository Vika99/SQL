


-- CREATE VIEW...PROCEDURE
SELECT top 50  FirstName,LastName

FROM (
SELECT T.FirstName,T.LastName,RANK() OVER (PARTITION BY year(CompDate) ORDER BY [ResTime] asc) as rnk, ResTime
,case 

WHEN RANK() OVER (PARTITION BY year(CompDate) ORDER BY [ResTime]) between 1 and 100 then '1'
when RANK() OVER (PARTITION BY year(CompDate) ORDER BY [ResTime]) between 101 and 201 then '2'
when  RANK() OVER (PARTITION BY year(CompDate) ORDER BY [ResTime]) between 202 and 203 then '3'
else '4'
end as 'WinnerPlace'

  FROM [TestSwimCompetition].[dbo].[Trainer] T
  JOIN [TestSwimCompetition].[dbo].[Swimmer] S ON T.TrainerID=S.TrainerID
  JOIN [TestSwimCompetition].[dbo].[Competitions] C ON S.SwimmerID=C.SwimmerId
  JOIN [TestSwimCompetition].[dbo].[Styles] ST ON C.StyleID=ST.StyleID
 WHERE ResTime IS NOT NULL

 
  ) P;

select distinct t.FirstName,t.LastName, min(restime) as min
from [TestSwimCompetition].[dbo].[Trainer] T
  JOIN [TestSwimCompetition].[dbo].[Swimmer] S ON T.TrainerID=S.TrainerID
  JOIN [TestSwimCompetition].[dbo].[Competitions] C ON S.SwimmerID=C.SwimmerId
  JOIN [TestSwimCompetition].[dbo].[Styles] ST ON C.StyleID=ST.StyleID
 WHERE ResTime IS NOT NULL
 group by t.FirstName,t.LastName
