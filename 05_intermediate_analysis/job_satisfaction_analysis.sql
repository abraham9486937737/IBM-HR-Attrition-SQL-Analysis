-- Attrition by Job Satisfaction
USE IBM_HR_Emp_Attrition;
GO

SELECT
    Job_Satisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM vw_hr_attrition_clean
GROUP BY Job_Satisfaction
ORDER BY Attrition_Rate DESC;
