/*
Ranking Job Roles by Attrition Rate
*/

SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate,
    RANK() OVER (
        ORDER BY 
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) DESC
    ) AS Attrition_Rank
FROM vw_hr_attrition_clean
GROUP BY JobRole
ORDER BY Attrition_Rank;
