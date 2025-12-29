/*
Salary vs Attrition using Window Functions
*/

USE IBM_HR_Emp_Attrition;
GO

SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome,
    Attrition,
    AVG(MonthlyIncome) OVER (PARTITION BY Department) AS Avg_Dept_Salary,
    AVG(MonthlyIncome) OVER (PARTITION BY JobRole) AS Avg_Role_Salary
FROM vw_hr_attrition_clean
ORDER BY Department, MonthlyIncome DESC;
