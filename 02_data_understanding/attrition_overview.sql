-- Attrition Overview Analysis
USE IBM_HR_Emp_Attrition;
GO

-- Overall attrition count
SELECT 
    Attrition,
    COUNT(*) AS Employee_Count
FROM IBM_HR_Analytics_Employee_Attrition
GROUP BY Attrition;

-- Attrition percentage
SELECT 
    Attrition,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM IBM_HR_Analytics_Employee_Attrition) 
        AS Attrition_Percentage
FROM IBM_HR_Analytics_Employee_Attrition
GROUP BY Attrition;

-- Attrition by department
SELECT 
    Department,
    Attrition,
    COUNT(*) AS Employee_Count
FROM IBM_HR_Analytics_Employee_Attrition
GROUP BY Department, Attrition
ORDER BY Department, Attrition;

-- Attrition by gender
SELECT 
    Gender,
    Attrition,
    COUNT(*) AS Employee_Count
FROM IBM_HR_Analytics_Employee_Attrition
GROUP BY Gender, Attrition
ORDER BY Gender;
