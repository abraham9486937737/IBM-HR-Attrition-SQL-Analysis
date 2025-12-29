-- Attrition by Department
USE IBM_HR_Emp_Attrition;
GO

SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) 
        AS Attrition_Rate
FROM vw_hr_attrition_clean
GROUP BY Department
ORDER BY Attrition_Rate DESC;
