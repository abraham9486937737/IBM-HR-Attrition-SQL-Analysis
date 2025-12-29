-- Create analytical view with cleaned data
USE IBM_HR_Emp_Attrition;
GO

CREATE OR ALTER VIEW vw_hr_attrition_clean AS
SELECT
    EmployeeNumber,
    Age,
    Gender,
    Department,
    JobRole,
    MonthlyIncome,
    YearsAtCompany,
    TotalWorkingYears,
    Attrition,

    CASE Education
        WHEN 1 THEN 'Below College'
        WHEN 2 THEN 'College'
        WHEN 3 THEN 'Bachelor'
        WHEN 4 THEN 'Master'
        WHEN 5 THEN 'Doctor'
    END AS Education_Level,

    CASE JobInvolvement
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END AS Job_Involvement,

    CASE JobSatisfaction
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END AS Job_Satisfaction,

    CASE WorkLifeBalance
        WHEN 1 THEN 'Bad'
        WHEN 2 THEN 'Good'
        WHEN 3 THEN 'Better'
        WHEN 4 THEN 'Best'
    END AS Work_Life_Balance

FROM IBM_HR_Analytics_Employee_Attrition;
