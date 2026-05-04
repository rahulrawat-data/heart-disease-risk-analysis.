create database heart_disease;

use heart_disease;

select count(*) from heart_disease;
-- 1. Data Retrieval
-- Retrieve all records of patients aged above 50 who have high cholesterol.
SELECT 
    Age, Cholesterol_level
FROM
    heart_disease
WHERE
    Cholesterol_level > 240;


-- Find the number of patients categorized by exercise habits.
SELECT 
    Exercise_Habits, COUNT(*) Number_of_Patients
FROM
    heart_disease
GROUP BY Exercise_Habits;

-- Retrieve the Avg BMI of patients who have heart disease.
SELECT 
    Heart_Disease_Status, AVG(Bmi) Avg_BMI_Heart_Disease
FROM
    heart_disease where Heart_Disease_Status = "Yes"
GROUP BY Heart_Disease_Status;

-- 2. Risk Analysis
-- Find how many patients with high blood pressure also have diabetes.
select 
 count(*) Number_of_Patients_With_High_BP_And_Diabetes from
 heart_disease where High_Blood_Pressure ="Yes" and Diabetes ="Yes";

-- What percentage of heart disease patients consume high levels of alcohol?
SELECT 
    ROUND(COUNT(*) * 100 / (SELECT 
                    COUNT(*)
                FROM
                    heart_disease
                WHERE
                    Heart_Disease_Status = 'Yes'),
            2) Percentage_High_Alcohol_Consumption
FROM
    heart_disease
WHERE
    Heart_Disease_Status = 'Yes'
        AND Alcohol_Consumption = 'High';


-- 3. Aggregation & Grouping
-- What is the average cholesterol level for male vs. female patients?
select gender,round(avg(Cholesterol_level),2) avg_Cholesterol_level from heart_disease
 group by gender ;

-- Count the number of heart disease cases grouped by age categories (e.g., 30-40, 40-50, etc.).
select Age_group,count(age) Heart_Disease_Count
 from heart_disease where Heart_Disease_Status = "Yes"
 group by Age_group order by 1 ;

-- What is the most common combination of exercise habits and stress levels among heart disease patients?

SELECT 
    Exercise_Habits, Stress_Level, COUNT(*) AS Frequency
FROM
    heart_disease
WHERE
    Heart_Disease_Status = 'Yes'
GROUP BY Exercise_Habits , Stress_Level
ORDER BY Frequency DESC
LIMIT 1;

-- 4. Advanced Queries
-- Identify the percentage of patients with low HDL cholesterol but high LDL cholesterol.
SELECT 
    (COUNT(*) * 100.0 / (SELECT 
            COUNT(*)
        FROM
            heart_disease)) AS Percentage_Low_HDL_High_LDL
FROM
    heart_disease
WHERE
    High_LDL_Cholesterol = 'yes'
        AND Low_HDL_Cholesterol = 'yes';
 
-- Check how the average sleep hours vary for patients with vs. without heart disease.
SELECT 
    Heart_Disease_Status,
    ROUND(AVG(Sleep_Hours), 2) 'Sleep Hours'
FROM
    heart_disease
GROUP BY Heart_Disease_Status;

-- c) Identify the risk factors among heart disease patients
SELECT 
    'High_Blood_Pressure' Risk_Factor, COUNT(*) Frequency
FROM
    heart_disease
WHERE
    High_Blood_Pressure = 'Yes'
        AND Heart_Disease_Status = 'Yes' 
UNION ALL SELECT 
    'smoking', COUNT(*)
FROM
    heart_disease
WHERE
    smoking = 'Yes'
        AND Heart_Disease_Status = 'Yes' 
UNION ALL SELECT 
    'high_Cholesterol_level', COUNT(*)
FROM
    heart_disease
WHERE
    Cholesterol_level > 240
        AND Heart_Disease_Status = 'yes'
ORDER BY Frequency DESC
;
