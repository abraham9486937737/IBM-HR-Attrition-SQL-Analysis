select * from IBM_HR_Analytics_Employee_Attrition
select distinct
	--Education
	case when education=1 then 'Below College'
	 when education=2 then 'College'
	 when education=3 then 'Bachelor'
	 when education=4 then 'Master'
	 when education=5 then 'Doctor'
	else 'Other' end as Education
from
[dbo].[IBM_HR_Analytics_Employee_Attrition]
order by Education asc

select distinct
--EnvironmentSatisfaction
	case 
	when EnvironmentSatisfaction = 1 then 'Low'
	when EnvironmentSatisfaction = 2 then 'Medium'
	when EnvironmentSatisfaction = 3 then 'High'
	when EnvironmentSatisfaction = 4 then 'Very High'
	end as EnvironmentSatisfaction
from
[dbo].[IBM_HR_Analytics_Employee_Attrition]
order by EnvironmentSatisfaction asc

select distinct
	--JobInvolvement
	case
	when JobInvolvement = 1 then 'Low'
	when JobInvolvement = 2 then 'Medium'
	when JobInvolvement = 3 then 'High'
	when JobInvolvement = 4 then 'Very High'
	end as JobInvolvement
from
[dbo].[IBM_HR_Analytics_Employee_Attrition]
order by JobInvolvement asc

select distinct
	--Job Satisfaction
	case
	when JobSatisfaction = 1 then 'Low'
	when JobSatisfaction = 2 then 'Medium'
	when JobSatisfaction = 3 then 'High'
	when JobSatisfaction = 4 then 'Very High'
	end as JobSatisfaction
from
[dbo].[IBM_HR_Analytics_Employee_Attrition]
order by JobSatisfaction asc

select distinct
	--Performance
	case
	when PerformanceRating = 1 then 'Low'
	when PerformanceRating = 2 then 'Good'
	when PerformanceRating = 3 then 'Excellent'
	when PerformanceRating = 4 then 'Outstanding'
	end as PerformanceRating
from
[dbo].[IBM_HR_Analytics_Employee_Attrition]
order by PerformanceRating asc

select distinct
	--RelationshipSatisfaction
	case
	when RelationshipSatisfaction = 1 then 'Low'
	when RelationshipSatisfaction = 2 then 'Medium'
	when RelationshipSatisfaction = 3 then 'High'
	when RelationshipSatisfaction = 4 then 'Very High'
	end as RelationshipSatisfaction
from
[dbo].[IBM_HR_Analytics_Employee_Attrition]
order by RelationshipSatisfaction asc

select distinct
	--WorkLifeBalance
	case
	when WorkLifeBalance = 1 then 'Bad'
	when WorkLifeBalance = 2 then 'Good'
	when WorkLifeBalance = 3 then 'Better'
	when WorkLifeBalance = 4 then 'Best'
	end as WorkLifeBalance
from IBM_HR_Analytics_Employee_Attrition
order by WorkLifeBalance asc

select count(*) as Total_Employees from IBM_HR_Analytics_Employee_Attrition--1470 employees

select 
	Gender,
	count(*) as Total_Employees
from IBM_HR_Analytics_Employee_Attrition
group by Gender --Male:882, Female:588

select 
	Attrition,
	count(*) as Total_Employees
from IBM_HR_Analytics_Employee_Attrition
group by Attrition--Attrition(Yes:237, No:1233)

select 
	Min(HourlyRate) as Min_Hourly_Rate, --30
	Max(HourlyRate) as Max_Hourly_Rate, --100
	Round(Avg(HourlyRate),2) as Avg_Hourly_Rate, --65.89 
	Min(MonthlyRate) as Min_Monthly_Rate, --2094
	Max(MonthlyRate) as Max_Monthly_Rate, --26999
	Round(Avg(MonthlyRate),2) as Avg_Monthly_Rate, --14313.1
	Min(MonthlyIncome) as Min_Monthly_Income, --1009
	Max(MonthlyIncome) as Max_Monthly_Income, --19999
	Round(Avg(MonthlyIncome),2) as Avg_Monthly_Income --6502.93
from 
IBM_HR_Analytics_Employee_Attrition

select 
Department, --R&D: 133, Sales: 92 and HR: 12
count(*) as Total_Employees
from IBM_HR_Analytics_Employee_Attrition 
where Attrition = 'Yes'
group by Department
order by Total_Employees desc

select 
Gender, --Male: 150 and Female: 87
count(*) as Total_Employees
from IBM_HR_Analytics_Employee_Attrition 
where Attrition = 'Yes'
group by Gender
order by Total_Employees desc

select
BusinessTravel, --Travel_Rarely: 156, Travel_Frequently: 69, Non-Travel: 12
count(*) as Total_Employees
from
IBM_HR_Analytics_Employee_Attrition
where Attrition = 'Yes'
group by BusinessTravel
order by Total_Employees desc

select
DistanceFromHome, --distancefromhome: 2: 28, 1: 26 and 3: 14 employees quite the job and even 24: 12 
count(*) as Total_Employees
from
IBM_HR_Analytics_Employee_Attrition
where Attrition = 'Yes'
group by DistanceFromHome
order by Total_Employees desc

select 
	--Education
	case when education=1 then 'Below College' --31 employees quite
	 when education=2 then 'College' -- 44 employees quite
	 when education=3 then 'Bachelor' -- 99  employees quite
	 when education=4 then 'Master' -- 58 employees quite
	 when education=5 then 'Doctor' -- 5 employees quite
	else 'Other' end as Education,
	count(*) as Total_Employees
from
[dbo].[IBM_HR_Analytics_Employee_Attrition]
where Attrition = 'Yes'
group by Education
order by Total_Employees desc

select 
	EmployeeNumber as Employee_ID,
	Age, 
	Gender, 
	case 
		when Education = 1 then 'Below College'
		when Education = 2 then 'College'
		when Education = 3 then 'Bachelor'
		when Education = 4 then 'Master'
		when Education = 5 then 'Doctor' 
	end as Education, 
	Department, 
	MaritalStatus, 
	MonthlyIncome, 
	TotalWorkingYears, 
	case 
		when EnvironmentSatisfaction = 1 then 'Low'
		when EnvironmentSatisfaction = 2 then 'Medium'
		when EnvironmentSatisfaction = 3 then 'High'
		when EnvironmentSatisfaction = 4 then 'Very High'
	end as EnvironmentSatisfaction,
	JobRole, 
	case 
		when JobLevel = 1 then 'Entry Level'
		when JobLevel = 2 then 'Junior-Mid Level'
		when JobLevel = 3 then 'Mid Level'
		when JobLevel = 4 then 'Senior Level'
		when JobLevel = 5 then 'Executive Level' 
	end as JobLevel, 
	case 
		when JobInvolvement = 1 then 'Low'
		when JobInvolvement = 2 then 'Medium' 
		when JobInvolvement = 3 then 'High'
		when JobInvolvement = 4 then 'Very High' 
	end as JobInvolvement,
	case 
		when JobSatisfaction = 1 then 'Low'
		when JobSatisfaction = 2 then 'Medium'
		when JobSatisfaction = 3 then 'High'
		when JobSatisfaction = 4 then 'Very High' 
	end as Job_Satisfaction,
	case 
		when PerformanceRating = 1 then 'Low'
		when PerformanceRating = 2 then 'Good'
		when PerformanceRating = 3 then 'Excellent'
		when PerformanceRating = 4 then 'Outstanding'
	end as PerformanceRating,
	case 
		when RelationshipSatisfaction = 1 then 'Low'
		when RelationshipSatisfaction = 2 then 'Medium'
		when RelationshipSatisfaction = 3 then 'High'
		when RelationshipSatisfaction = 4 then 'Very High'
	end as RelationshipSatisfaction,
	case 
		when WorkLifeBalance = 1 then 'Bad'
		when WorkLifeBalance = 2 then 'Good'
		when WorkLifeBalance = 3 then 'Better'
		when WorkLifeBalance = 4 then 'Best'
	end as WorkLifeBalance
from 
	[dbo].[IBM_HR_Analytics_Employee_Attrition] 
where 
	Attrition = 'Yes' 
order by 
	JobSatisfaction asc, MonthlyIncome asc

select distinct JobLevel from IBM_HR_Analytics_Employee_Attrition