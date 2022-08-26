CREATE TABLE functions
(
 
   Function_name VARCHAR(100),
   Function_count INT
  
) 


SELECT * FROM functions
SELECT * FROM  [TestSwimCompetition].[dbo].[data_for_merge$]

MERGE functions AS TARGET 
USING   [TestSwimCompetition].[dbo].[data_for_merge$] AS SOURCE  
ON 
--(TARGET.Function_name = SOURCE.[IrinaPashkovich])
--(TARGET.Function_name = SOURCE.Darya)
--(TARGET.Function_name = SOURCE.Ekaterina)
--(TARGET.Function_name = SOURCE.IrinaSelyutina)
--(TARGET.Function_name = SOURCE.Viktor)
--(TARGET.Function_name = SOURCE.Dmitriy)
--(TARGET.Function_name = SOURCE.Svetlana)
--(TARGET.Function_name = SOURCE.VikaVoronchuk)

(TARGET.Function_name = SOURCE.VikaOstopchuk)  

--When records are matched, update the records if there is any change 
--WHEN MATCHED AND TARGET.Function_name <> SOURCE.[IrinaPashkovich]
--WHEN MATCHED AND TARGET.Function_name <> SOURCE.[Darya]
--WHEN MATCHED AND TARGET.Function_name <>SOURCE.Ekaterina 
--WHEN MATCHED AND TARGET.Function_name <>SOURCE.IrinaSelyutina
--WHEN MATCHED AND TARGET.Function_name <> SOURCE.Viktor 
--WHEN MATCHED AND TARGET.Function_name<>SOURCE.Dmitriy
--WHEN MATCHED AND TARGET.Function_name <> SOURCE.Svetlana 
--WHEN MATCHED AND  TARGET.Function_name <> SOURCE.VikaVoronchuk 
WHEN MATCHED AND TARGET.Function_name <> SOURCE.VikaOstopchuk


--THEN UPDATE SET TARGET.Function_name = SOURCE.[IrinaPashkovich]
--THEN UPDATE SET TARGET.Function_name = SOURCE.Darya
--THEN UPDATE SET TARGET.Function_name =SOURCE.Ekaterina
--THEN UPDATE SET TARGET.Function_name =SOURCE.IrinaSelyutina 
--THEN UPDATE SET TARGET.Function_name = SOURCE.Viktor
--THEN UPDATE SET TARGET.Function_name=SOURCE.Dmitriy
--THEN UPDATE SET TARGET.Function_name=SOURCE.Svetlana 
--THEN UPDATE SET TARGET.Function_name = SOURCE.VikaVoronchuk
THEN UPDATE SET TARGET.Function_name = SOURCE.VikaOstopchuk


--When no records are matched, insert the incoming records from source table to target table 
WHEN NOT MATCHED BY TARGET  
--THEN INSERT (Function_name) VALUES (SOURCE.[IrinaPashkovich])
--THEN INSERT (Function_name) VALUES (SOURCE.Darya)
--THEN INSERT (Function_name) VALUES (SOURCE.Ekaterina)
--THEN INSERT (Function_name) VALUES (SOURCE.Viktor)
--THEN INSERT (Function_name) VALUES (SOURCE.Dmitriy)
--THEN INSERT (Function_name) VALUES (SOURCE.Svetlana )
--THEN INSERT (Function_name) VALUES (SOURCE.VikaVoronchuk )
THEN INSERT (Function_name) VALUES (SOURCE.VikaOstopchuk )

--When there is a row that exists in target and same record does not exist in source then delete this record target 
WHEN NOT MATCHED BY SOURCE  
THEN DELETE; 

