-- Data Exploration Queries
USE IBM_HR_Emp_Attrition;
GO

-- Distinct departments
SELECT DISTINCT Department
FROM IBM_HR_Analytics_Employee_Attrition;

-- Distinct job roles
SELECT DISTINCT JobRole
FROM IBM_HR_Analytics_Employee_Attrition;

-- Gender distribution
SELECT 
    Gender,
    COUNT(*) AS Employee_Count
FROM IBM_HR_Analytics_Employee_Attrition
GROUP BY Gender;

-- Marital status distribution
SELECT 
    MaritalStatus,
    COUNT(*) AS Employee_Count
FROM IBM_HR_Analytics_Employee_Attrition
GROUP BY MaritalStatus;

-- Age distribution (min, max, avg)
SELECT 
    MIN(Age) AS Min_Age,
    MAX(Age) AS Max_Age,
    AVG(Age) AS Avg_Age
FROM IBM_HR_Analytics_Employee_Attrition;
