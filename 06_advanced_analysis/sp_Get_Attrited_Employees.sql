/*****************************************************************************************************************************
Object Name: sp_Get_Attrited_Employees
Created Date: 2026-01-01
Author: Abraham PonnuRaj
Purpose: 
	Returns attrited employee profiles with optional filtering by department and job level. 
	Used for HR reporting and analysis.
Parameters:
	@Department - optional department filter
	@JobLevel	- optional job level filter

Change History:
-----------------------------------------------------------------------------------------------------------------------------
S.No	|	Change Date	|	Author										|	Description
-----------------------------------------------------------------------------------------------------------------------------
1			2026-01-01		Abraham PonnuRaj								Initial Creation
-----------------------------------------------------------------------------------------------------------------------------
*****************************************************************************************************************************/
CREATE PROCEDURE sp_Get_Attrited_Employees
@Department NVARCHAR(255) = NULL,
@JobLevel INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		ROW_NUMBER() OVER (
			ORDER BY JobSatisfaction ASC, MonthlyIncome ASC
		) as S_No,
		EmployeeNumber as Employee_ID,
		Age, 
		Gender, 
		CASE 
			WHEN Education = 1 THEN 'Below College'
			WHEN Education = 2 THEN 'College'
			WHEN Education = 3 THEN 'Bachelor'
			WHEN Education = 4 THEN 'Master'
			WHEN Education = 5 THEN 'Doctor' 
		END AS Education, 
		Department, 
		MaritalStatus, 
		MonthlyIncome, 
		TotalWorkingYears, 
		CASE 
			WHEN EnvironmentSatisfaction = 1 THEN 'Low'
			WHEN EnvironmentSatisfaction = 2 THEN 'Medium'
			WHEN EnvironmentSatisfaction = 3 THEN 'High'
			WHEN EnvironmentSatisfaction = 4 THEN 'Very High'
		END AS EnvironmentSatisfaction,
		JobRole, 
		CASE 
			WHEN JobLevel = 1 THEN 'Entry Level'
			WHEN JobLevel = 2 THEN 'Junior-Mid Level'
			WHEN JobLevel = 3 THEN 'Mid Level'
			WHEN JobLevel = 4 THEN 'Senior Level'
			WHEN JobLevel = 5 THEN 'Executive Level' 
		END AS JobLevel, 
		CASE 
			WHEN JobInvolvement = 1 THEN 'Low'
			WHEN JobInvolvement = 2 THEN 'Medium' 
			WHEN JobInvolvement = 3 THEN 'High'
			WHEN JobInvolvement = 4 THEN 'Very High' 
		END AS JobInvolvement,
		CASE 
			WHEN JobSatisfaction = 1 THEN 'Low'
			WHEN JobSatisfaction = 2 THEN 'Medium'
			WHEN JobSatisfaction = 3 THEN 'High'
			WHEN JobSatisfaction = 4 THEN 'Very High' 
		END AS Job_Satisfaction,
		CASE 
			WHEN PerformanceRating = 1 THEN 'Low'
			WHEN PerformanceRating = 2 THEN 'Good'
			WHEN PerformanceRating = 3 THEN 'Excellent'
			WHEN PerformanceRating = 4 THEN 'Outstanding'
		END AS PerformanceRating,
		CASE 
			WHEN RelationshipSatisfaction = 1 THEN 'Low'
			WHEN RelationshipSatisfaction = 2 THEN 'Medium'
			WHEN RelationshipSatisfaction = 3 THEN 'High'
			WHEN RelationshipSatisfaction = 4 THEN 'Very High'
		END AS RelationshipSatisfaction,
		CASE 
			WHEN WorkLifeBalance = 1 THEN 'Bad'
			WHEN WorkLifeBalance = 2 THEN 'Good'
			WHEN WorkLifeBalance = 3 THEN 'Better'
			WHEN WorkLifeBalance = 4 THEN 'Best'
		END AS WorkLifeBalance
	FROM 
		[dbo].[IBM_HR_Analytics_Employee_Attrition] 
	WHERE 
		Attrition = 'Yes' 
		AND (@Department IS NULL OR Department = @Department)
		AND (@JobLevel IS NULL OR JobLevel = @JobLevel)
	ORDER BY 
		JobSatisfaction ASC, MonthlyIncome ASC
END
