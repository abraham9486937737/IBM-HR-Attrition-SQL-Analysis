/*
Experience vs Salary vs Attrition
*/

SELECT
    Experience_Band,
    COUNT(*) AS Total_Employees,
    AVG(MonthlyIncome) AS Avg_Monthly_Income,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM (
    SELECT
        EmployeeNumber,
        MonthlyIncome,
        Attrition,
        CASE
            WHEN YearsAtCompany < 3 THEN '0-2 Years'
            WHEN YearsAtCompany BETWEEN 3 AND 6 THEN '3-6 Years'
            WHEN YearsAtCompany BETWEEN 7 AND 10 THEN '7-10 Years'
            ELSE '10+ Years'
        END AS Experience_Band
    FROM vw_hr_attrition_clean
) t
GROUP BY Experience_Band
ORDER BY Attrition_Count DESC;
