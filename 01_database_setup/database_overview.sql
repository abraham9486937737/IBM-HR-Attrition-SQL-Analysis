-- Database Overview
-- Project: IBM HR Employee Attrition Analysis

USE IBM_HR_Emp_Attrition;
GO

-- View table structure
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'IBM_HR_Analytics_Employee_Attrition';

-- Preview top records
SELECT TOP 10 *
FROM IBM_HR_Analytics_Employee_Attrition;

-- Total number of records
SELECT COUNT(*) AS Total_Employees
FROM IBM_HR_Analytics_Employee_Attrition;
