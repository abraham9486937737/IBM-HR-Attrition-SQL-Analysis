/******************************************************************************************************************
File Name		: key_findings.sql
Project			: IBM HR Attrition Analysis
Author			: Abraham PonnuRaj
Purpose			:
	This file contains SQL queries used to derive key analytical findings and business insights related to 
	employee attrition.

Notes: 
- Queries are grouped in insight category
- Reqults are referenced in 07_business_insights/README.md
******************************************************************************************************************/

/*
1. Dataset Overview
*/
--Total numbers of employees
select 
	count(*) as Total_Employees 
from 
IBM_HR_Analytics_Employee_Attrition	--1470 employees

--Attrition distribution
select 
	Attrition,
	count(*) as Total_Employees
from 
IBM_HR_Analytics_Employee_Attrition
group by Attrition	--Attrition(Yes:237, No:1233)

/*
2. Demographic Analysis
*/
--Gender Distribution
select 
	Gender,
	count(*) as Total_Employees
from 
IBM_HR_Analytics_Employee_Attrition
group by Gender --Male:882, Female:588

--Attrition by gender
SELECT 
    Gender,
    COUNT(*) AS Attrition_Count
FROM 
	IBM_HR_Analytics_Employee_Attrition
WHERE Attrition = 'Yes'
GROUP BY Gender	--Male: 150, Female: 87

/*
3. Compensation Overview
*/
SELECT 
	MIN(HourlyRate) AS Min_Hourly_Rate, --30
	MAX(HourlyRate) AS Max_Hourly_Rate, --100
	ROUND(AVG(HourlyRate),2) AS Avg_Hourly_Rate, --65.89 
	MIN(MonthlyRate) AS Min_Monthly_Rate, --2094
	MAX(MonthlyRate) AS Max_Monthly_Rate, --26999
	ROUND(AVG(MonthlyRate),2) AS Avg_Monthly_Rate, --14313.1
	MIN(MonthlyIncome) AS Min_Monthly_Income, --1009
	MAX(MonthlyIncome) AS Max_Monthly_Income, --19999
	ROUND(AVG(MonthlyIncome),2) AS Avg_Monthly_Income --6502.93
FROM 
IBM_HR_Analytics_Employee_Attrition

/*
4. Department-Level Attrition
*/
SELECT 
	Department, --R&D: 133, Sales: 92 and HR: 12
	COUNT(*) AS Attrition_Count
FROM 
	IBM_HR_Analytics_Employee_Attrition 
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY Attrition_Count DESC

/*
5. Job Satisfaction & Work-Life Balance
*/
--Job Satisfaction categories
SELECT DISTINCT
    CASE 
        WHEN JobSatisfaction = 1 THEN 'Low'
        WHEN JobSatisfaction = 2 THEN 'Medium'
        WHEN JobSatisfaction = 3 THEN 'High'
        WHEN JobSatisfaction = 4 THEN 'Very High'
    END AS JobSatisfaction
FROM IBM_HR_Analytics_Employee_Attrition

-- Work Life Balance categories
SELECT DISTINCT
    CASE
        WHEN WorkLifeBalance = 1 THEN 'Bad'
        WHEN WorkLifeBalance = 2 THEN 'Good'
        WHEN WorkLifeBalance = 3 THEN 'Better'
        WHEN WorkLifeBalance = 4 THEN 'Best'
    END AS WorkLifeBalance
FROM IBM_HR_Analytics_Employee_Attrition

/*
6. Education & Attrition
*/
SELECT 
    CASE 
        WHEN Education = 1 THEN 'Below College'
        WHEN Education = 2 THEN 'College'
        WHEN Education = 3 THEN 'Bachelor'
        WHEN Education = 4 THEN 'Master'
        WHEN Education = 5 THEN 'Doctor'
    END AS Education,
    COUNT(*) AS Attrition_Count
FROM 
	IBM_HR_Analytics_Employee_Attrition
WHERE Attrition = 'Yes'
GROUP BY Education
ORDER BY Attrition_Count DESC

/*
7. Travel, Distance & Attrition
*/
-- Business Travel impact
SELECT
    BusinessTravel,
    COUNT(*) AS Attrition_Count
FROM 
	IBM_HR_Analytics_Employee_Attrition
WHERE Attrition = 'Yes'
GROUP BY BusinessTravel
ORDER BY Attrition_Count DESC

-- Distance from Home impact
SELECT
    DistanceFromHome,
    COUNT(*) AS Attrition_Count
FROM 
	IBM_HR_Analytics_Employee_Attrition
WHERE Attrition = 'Yes'
GROUP BY DistanceFromHome
ORDER BY Attrition_Count DESC

/*
8. Detailed Attrited Employee Profile (Reference Query)
*/
-- Detailed profile of employees who left
SELECT *
FROM 
	dbo.vw_Attrited_Employee_Profile
ORDER BY 
	Job_Satisfaction, MonthlyIncome



