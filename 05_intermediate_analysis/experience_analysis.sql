-- Attrition by Years at Company (Bucketed)
USE IBM_HR_Emp_Attrition;
GO

SELECT
    CASE
        WHEN YearsAtCompany < 3 THEN '0-2 Years'
        WHEN YearsAtCompany BETWEEN 3 AND 6 THEN '3-6 Years'
        WHEN YearsAtCompany BETWEEN 7 AND 10 THEN '7-10 Years'
        ELSE '10+ Years'
    END AS Experience_Band,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM vw_hr_attrition_clean
GROUP BY
    CASE
        WHEN YearsAtCompany < 3 THEN '0-2 Years'
        WHEN YearsAtCompany BETWEEN 3 AND 6 THEN '3-6 Years'
        WHEN YearsAtCompany BETWEEN 7 AND 10 THEN '7-10 Years'
        ELSE '10+ Years'
    END
ORDER BY Attrition_Rate DESC;
