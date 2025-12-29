-- Data Validation Checks

USE IBM_HR_Emp_Attrition;
GO

-- Check for duplicate employees
SELECT 
    EmployeeNumber,
    COUNT(*) AS Duplicate_Count
FROM IBM_HR_Analytics_Employee_Attrition
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- Check NULL values column-wise
SELECT
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Nulls,
    SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS Attrition_Nulls,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Department_Nulls,
    SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS MonthlyIncome_Nulls
FROM IBM_HR_Analytics_Employee_Attrition;

-- Validate Attrition values
SELECT DISTINCT Attrition
FROM IBM_HR_Analytics_Employee_Attrition;

-- Validate Gender values
SELECT DISTINCT Gender
FROM IBM_HR_Analytics_Employee_Attrition;
