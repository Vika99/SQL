CREATE TABLE Patients (
    PatientsID int IDENTITY (1,1) PRIMARY KEY,
	FirstName Nvarchar(255),
    LastName Nvarchar(255) NOT NULL,
    SSN uniqueidentifier NOT NULL DEFAULT NEWID() ROWGUIDCOL,
	Temp int CHECK (Temp<= 45),
	CreatedDate DATETIME,
	
);

ALTER TABLE Patients 
ADD
Email AS UPPER(LEFT(FirstName,1)) + LOWER(LEFT(LastName,3)) + '@mail.com'


--INSERT INTO Patients (FirstName,LastName,Temp,CreatedDate) VALUES ('Yasha','Bobrov',36,'2021-08-11')
--INSERT INTO Patients (FirstName,LastName,Temp,CreatedDate) VALUES ('MASHA','LI',36,'2021-08-20')
--INSERT INTO Patients (FirstName,Temp,CreatedDate) VALUES ('',37,'2021-08-20')

ALTER TABLE Patients 
ADD TempType as (CASE 
WHEN Temp <38 THEN '< 38°C'
ELSE '>= 38°C'
END)

SELECT * FROM Patients

CREATE VIEW Patients_v
AS
SELECT *
FROM Patients

SELECT * FROM Patients_v

ALTER VIEW Patients_v
AS
SELECT *, ((Temp*9/5)+32) as Fahrenheit_Temp
FROM Patients

