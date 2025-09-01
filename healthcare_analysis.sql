create database healthcare;
use healthcare;

select * from healthcare_dataset;

-- 1. What is the average billing amount by medical condition?
SELECT medical_condition, AVG(billing_amount) AS avg_billing
FROM healthcare_dataset
GROUP BY medical_condition
ORDER BY avg_billing DESC;

-- 2. Which insurance provider covers the highest total billing amount?
SELECT insurance_provider, SUM(billing_amount) AS total_billing
FROM healthcare_dataset
GROUP BY insurance_provider
ORDER BY total_billing DESC
LIMIT 1;

-- 3. What is the gender distribution of patients across different admission types?
SELECT admission_type, gender, COUNT(*) AS patient_count
FROM healthcare_dataset
GROUP BY admission_type, gender
ORDER BY admission_type;

-- 4. Which doctor has treated the highest number of patients?
SELECT doctor, COUNT(*) AS total_patients
FROM healthcare_dataset
GROUP BY doctor
ORDER BY total_patients DESC
LIMIT 1;

-- 5. Find the top 5 patients with the highest billing amounts.
SELECT name, billing_amount
FROM healthcare_dataset
ORDER BY billing_amount DESC
LIMIT 5;

-- 6. What is the average age of patients by medical condition?
SELECT medical_condition, ROUND(AVG(age), 1) AS avg_age
FROM healthcare_dataset
GROUP BY medical_condition
ORDER BY avg_age DESC;

-- 7. Which blood type patients spend the most on average billing?
SELECT blood_type, AVG(billing_amount) AS avg_spend
FROM healthcare_dataset
GROUP BY blood_type
ORDER BY avg_spend DESC;

-- 8. Count the number of patients for each test result category (Normal, Abnormal, Inconclusive).
SELECT test_results, COUNT(*) AS result_count
FROM healthcare_dataset
GROUP BY test_results;

-- 9. Which medication is prescribed most frequently across all patients?
SELECT medication, COUNT(*) AS prescription_count
FROM healthcare_dataset
GROUP BY medication
ORDER BY prescription_count DESC
LIMIT 1;

-- 10. Identify the month with the highest total billing amount.
SELECT MONTH(date_of_appointment) AS month, SUM(billing_amount) AS total_billing
FROM healthcare_dataset
GROUP BY MONTH(date_of_appointment)
ORDER BY total_billing DESC
LIMIT 1;

-- 11. What percentage of patients have each admission type?
SELECT admission_type, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM healthcare_dataset) AS percentage
FROM healthcare_dataset
GROUP BY admission_type
ORDER BY percentage DESC;

-- 12. Which insurance provider has the highest number of patients covered?
SELECT insurance_provider, COUNT(*) AS patient_count
FROM healthcare_dataset
GROUP BY insurance_provider
ORDER BY patient_count DESC
LIMIT 1;

-- 13. Who are the top 3 highest spending patients overall?
SELECT name, SUM(billing_amount) AS total_spent
FROM healthcare_dataset
GROUP BY name
ORDER BY total_spent DESC
LIMIT 3;

-- 14. Find the average billing amount for patients with abnormal test results.
SELECT test_results, AVG(billing_amount) AS avg_billing
FROM healthcare_dataset
WHERE test_results = 'Abnormal'
GROUP BY test_results;

-- 15. Which combination of medical condition and medication is most common?
SELECT medical_condition, medication, COUNT(*) AS frequency
FROM healthcare_dataset
GROUP BY medical_condition, medication
ORDER BY frequency DESC
LIMIT 5;

-- 16. How many patients visited each month (trend analysis)?
SELECT MONTH(date_of_appointment) AS month, COUNT(*) AS patient_count
FROM healthcare_dataset
GROUP BY MONTH(date_of_appointment)
ORDER BY month;

-- 17. Which gender has higher total billing across all records?
SELECT gender, SUM(billing_amount) AS total_billing
FROM healthcare_dataset
GROUP BY gender
ORDER BY total_billing DESC;

-- 18. Which doctor generates the highest average billing per patient?
SELECT doctor, AVG(billing_amount) AS avg_billing
FROM healthcare_dataset
GROUP BY doctor
ORDER BY avg_billing DESC
LIMIT 1;

-- 19. Find the top 3 medical conditions with the highest average billing amount.
SELECT medical_condition, AVG(billing_amount) AS avg_billing
FROM healthcare_dataset
GROUP BY medical_condition
ORDER BY avg_billing DESC
LIMIT 3;

-- 20. What is the distribution of patients by age group (e.g., <20, 20-40, 40-60, >60)?
SELECT CASE 
           WHEN age < 20 THEN '<20'
           WHEN age BETWEEN 20 AND 40 THEN '20-40'
           WHEN age BETWEEN 41 AND 60 THEN '41-60'
           ELSE '60+'
       END AS age_group,
       COUNT(*) AS patient_count
FROM healthcare_dataset
GROUP BY age_group
ORDER BY age_group;