-- Basic Attrition KPIs
USE IBM_HR_Emp_Attrition;
GO

-- Total employees
SELECT COUNT(*) AS Total_Employees
FROM vw_hr_attrition_clean;

-- Attrition count
SELECT 
    Attrition,
    COUNT(*) AS Employee_Count
FROM vw_hr_attrition_clean
GROUP BY Attrition;

-- Attrition rate (%)
SELECT 
    Attrition,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM vw_hr_attrition_clean) 
        AS Attrition_Percentage
FROM vw_hr_attrition_clean
GROUP BY Attrition;
