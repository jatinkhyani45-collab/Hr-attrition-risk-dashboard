CREATE DATABASE HR_Analytics;
USE HR_Analytics;
CREATE TABLE hr_attrition (

Age INT,
Attrition VARCHAR(5),
BusinessTravel VARCHAR(30),
DailyRate INT,
Department VARCHAR(50),
DistanceFromHome INT,
Education INT,
EducationField VARCHAR(50),
EmployeeCount INT,
EmployeeNumber INT PRIMARY KEY,
EnvironmentSatisfaction INT,
Gender VARCHAR(15),
HourlyRate INT,
JobInvolvement INT,
JobLevel INT,
JobRole VARCHAR(100),
JobSatisfaction INT,
MaritalStatus VARCHAR(20),
MonthlyIncome INT,
MonthlyRate INT,
NumCompaniesWorked INT,
Over18 VARCHAR(5),
OverTime VARCHAR(5),
PercentSalaryHike INT,
PerformanceRating INT,
RelationshipSatisfaction INT,
StandardHours INT,
StockOptionLevel INT,
TotalWorkingYears INT,
TrainingTimesLastYear INT,
WorkLifeBalance INT,
YearsAtCompany INT,
YearsInCurrentRole INT,
YearsSinceLastPromotion INT,
YearsWithCurrManager INT,

Attrition_Binary INT,
Age_Group VARCHAR(20),
Income_Band VARCHAR(30),
Experience_Level VARCHAR(30),
Company_Tenure VARCHAR(30),
Promotion_Status VARCHAR(30),
Overtime_Flag INT

);
DESCRIBE hr_attrition;

-- Total Employees
SELECT COUNT(*) AS Total_Employees FROM hr_attrition;

-- Total Employees Who Left
SELECT COUNT(*) AS Employees_Left FROM hr_attrition WHERE Attrition = 'Yes';

-- Overall Attrition Rate
SELECT ROUND(AVG(Attrition_Binary) * 100, 2) AS Attrition_Rate FROM hr_attrition;

-- Average Employee Age
SELECT ROUND(AVG(Age), 2) AS Average_Age FROM hr_attrition;

-- Average Monthly Income
SELECT ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income FROM hr_attrition;

-- Highest & Lowest Salary
SELECT MAX(MonthlyIncome) AS Highest_Salary,MIN(MonthlyIncome) AS Lowest_Salary FROM hr_attrition;

-- Gender Distribution
SELECT Gender,COUNT(*) AS Employee_Count FROM hr_attrition GROUP BY Gender ORDER BY Employee_Count DESC;

-- Department-wise Employee Count
SELECT Department,COUNT(*) AS Total_Employees FROM hr_attrition GROUP BY Department ORDER BY Total_Employees DESC;

-- Job Role Distribution
SELECT JobRole,COUNT(*) AS Employee_Count FROM hr_attrition GROUP BY JobRole ORDER BY Employee_Count DESC;

-- Education Field Distribution
SELECT EducationField,COUNT(*) AS Employee_Count FROM hr_attrition GROUP BY EducationField ORDER BY Employee_Count DESC;

-- Marital Status Distribution
SELECT MaritalStatus,COUNT(*) AS Employee_Count FROM hr_attrition GROUP BY MaritalStatus ORDER BY Employee_Count DESC;

-- Overtime Distribution
SELECT OverTime,COUNT(*) AS Employee_Count FROM hr_attrition GROUP BY OverTime;

-- Total Employees & Attrition Rate (KPI)
SELECT COUNT(*) AS Total_Employees,SUM(Attrition_Binary) AS Employees_Left,ROUND(AVG(Attrition_Binary) * 100, 2) AS Attrition_Rate FROM hr_attrition;

-- Department-wise Attrition
SELECT Department,COUNT(*) AS Employees,SUM(Attrition_Binary) AS Attrition_Count,ROUND(AVG(Attrition_Binary) * 100, 2) AS Attrition_Rate FROM hr_attrition GROUP BY Department ORDER BY Attrition_Rate DESC;

-- Create an HR Summary View
CREATE VIEW vw_HR_Summary AS SELECT Department,COUNT(*) AS Total_Employees,SUM(Attrition_Binary) AS Employees_Left,ROUND(AVG(MonthlyIncome), 2) AS Average_Salary,ROUND(AVG(Attrition_Binary) * 100, 2) AS Attrition_Rate FROM hr_attrition GROUP BY Department;
SELECT * FROM vw_HR_Summary;

-- High-Risk Department & Job Role
SELECT Department,JobRole,COUNT(*) AS Employees,ROUND(AVG(Attrition_Binary) * 100, 2) AS Attrition_Rate FROM hr_attrition GROUP BY Department, JobRole ORDER BY Attrition_Rate DESC LIMIT 10;




