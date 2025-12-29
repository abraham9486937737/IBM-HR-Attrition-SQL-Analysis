-- Attrition by Work Life Balance
USE IBM_HR_Emp_Attrition;
GO

SELECT
    Work_Life_Balance,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM vw_hr_attrition_clean
GROUP BY Work_Life_Balance
ORDER BY Attrition_Rate DESC;
