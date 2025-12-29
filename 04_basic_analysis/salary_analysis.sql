-- Salary comparison by Attrition
USE IBM_HR_Emp_Attrition;
GO

SELECT
    Attrition,
    AVG(MonthlyIncome) AS Avg_Monthly_Income,
    MIN(MonthlyIncome) AS Min_Monthly_Income,
    MAX(MonthlyIncome) AS Max_Monthly_Income
FROM vw_hr_attrition_clean
GROUP BY Attrition;
