-- Data Transformation using CASE statements
USE IBM_HR_Emp_Attrition;
GO

SELECT
    EmployeeNumber,
    Age,
    Gender,
    Department,
    JobRole,
    MonthlyIncome,
    Attrition,

    -- Education Mapping
    CASE Education
        WHEN 1 THEN 'Below College'
        WHEN 2 THEN 'College'
        WHEN 3 THEN 'Bachelor'
        WHEN 4 THEN 'Master'
        WHEN 5 THEN 'Doctor'
        ELSE 'Unknown'
    END AS Education_Level,

    -- Environment Satisfaction Mapping
    CASE EnvironmentSatisfaction
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
        ELSE 'Unknown'
    END AS Environment_Satisfaction,

    -- Job Satisfaction Mapping
    CASE JobSatisfaction
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
        ELSE 'Unknown'
    END AS Job_Satisfaction,

    -- Work Life Balance Mapping
    CASE WorkLifeBalance
        WHEN 1 THEN 'Bad'
        WHEN 2 THEN 'Good'
        WHEN 3 THEN 'Better'
        WHEN 4 THEN 'Best'
        ELSE 'Unknown'
    END AS Work_Life_Balance

FROM IBM_HR_Analytics_Employee_Attrition;
