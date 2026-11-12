use project_medical_data_history;
show databases;
show tables;

-- Count Rows in All 4 Tables 
SELECT
    (SELECT COUNT(*) FROM patients) AS total_patients,
    (SELECT COUNT(*) FROM admissions) AS total_admissions,
    (SELECT COUNT(*) FROM doctors) AS total_doctors,
    (SELECT COUNT(*) FROM province_names) AS total_provinces;
    
    -- To find the total number of columns in each of the 4 tables
    SELECT
    TABLE_NAME,
    COUNT(*) AS total_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'project_medical_data_history'
GROUP BY TABLE_NAME
ORDER BY TABLE_NAME;  

-- structure (columns, data types, keys, NULL settings)
DESCRIBE patients; 
DESCRIBE admissions;
DESCRIBE doctors;
DESCRIBE province_names;  

select * from patients; 

-- finding null values 

SELECT
    SUM(patient_id IS NULL) AS null_patient_id,
    SUM(first_name IS NULL) AS null_first_name,
    SUM(last_name IS NULL) AS null_last_name,
    SUM(gender IS NULL) AS null_gender,
    SUM(birth_date IS NULL) AS null_birth_date,
    SUM(city IS NULL) AS null_city,
    SUM(province_id IS NULL) AS null_province_id,
    SUM(allergies IS NULL) AS null_allergies,
    SUM(height IS NULL) AS null_height,
    SUM(weight IS NULL) AS null_weight
FROM patients; 

-- Duplicate Records
SELECT patient_id, COUNT(*) AS total_count
FROM patients
GROUP BY patient_id
HAVING COUNT(*) > 1; 

-- checking invalid heights 

SELECT *
FROM patients
WHERE height <= 0;

-- checking invalid weights 

SELECT *
FROM patients
WHERE weight <= 0;

select * from admissions;

-- 1. Total Number of Records in admission table 

SELECT COUNT(*) AS total_records
FROM admissions;

-- 2. Total Number of Columns in admission table 
SELECT COUNT(*) AS total_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'project_medical_data_history'
AND TABLE_NAME = 'admissions';


-- 3. Check NULL Values in All Columns
SELECT
    SUM(patient_id IS NULL) AS null_patient_id,
    SUM(admission_date IS NULL) AS null_admission_date,
    SUM(discharge_date IS NULL) AS null_discharge_date,
    SUM(diagnosis IS NULL) AS null_diagnosis,
    SUM(attending_doctor_id IS NULL) AS null_attending_doctor_id
FROM admissions;

-- 4. Check Duplicate Values in the First Column
SELECT patient_id, COUNT(*) AS total_count
FROM admissions
GROUP BY patient_id
HAVING COUNT(*) > 1; 

SELECT
    patient_id,
    admission_date,
    discharge_date,
    diagnosis,
    attending_doctor_id,
    COUNT(*) AS total_count
FROM admissions
GROUP BY
    patient_id,
    admission_date,
    discharge_date,
    diagnosis,
    attending_doctor_id
HAVING COUNT(*) > 1;   


-- ✅ Step 1: Total Records
SELECT COUNT(*) AS total_records
FROM doctors; 

-- ✅ Step 2: Total Columns
SELECT COUNT(*) AS total_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'project_medical_data_history'
AND TABLE_NAME = 'doctors';

--  Step 3: NULL Values in All Columns 
 SELECT
    SUM(doctor_id IS NULL) AS null_doctor_id,
    SUM(first_name IS NULL) AS null_first_name,
    SUM(last_name IS NULL) AS null_last_name,
    SUM(specialty IS NULL) AS null_specialty
FROM doctors;

-- ✅ Step 4: Duplicate Values in First Column 
 SELECT doctor_id, COUNT(*) AS total_count
FROM doctors
GROUP BY doctor_id
HAVING COUNT(*) > 1;

-- 1. Total Records
SELECT COUNT(*) AS total_records
FROM province_names;


-- 2. Total Columns
SELECT COUNT(*) AS total_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'project_medical_data_history'
AND TABLE_NAME = 'province_names';

describe province_names;

SELECT
    SUM(province_id IS NULL) AS null_province_id,
    SUM(province_name IS NULL) AS null_province_name
FROM province_names;

SELECT province_id, COUNT(*) AS total_count
FROM province_names
GROUP BY province_id
HAVING COUNT(*) > 1;

-- Question 1: Display the first name, last name, and gender
-- of patients whose gender is 'M'.

SELECT
    first_name,
    last_name,
    gender
FROM patients
WHERE gender = 'M'; 


-- Question 2: Display first and last names of patients
-- whose allergies value is NULL.

SELECT
    first_name,
    last_name
FROM patients
WHERE allergies IS NULL;

-- Question 3: Display first names of patients
-- whose first name starts with the letter 'C'.

SELECT
    first_name
FROM patients
WHERE first_name LIKE 'C%'; 

-- Question 4: Display first and last names of patients
-- whose weight is between 100 and 120, including both limits.

SELECT
    first_name,
    last_name
FROM patients
WHERE weight BETWEEN 100 AND 120; 


-- Question 5: Preview patients whose allergies value is NULL
-- before replacing those NULL values with 'NKA'.

SELECT
    patient_id,
    first_name,
    last_name,
    allergies
FROM patients
WHERE allergies IS NULL; 


-- Question 5: Replace NULL allergy values with 'NKA'.
UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS NULL; 

-- Purpose: Grant UPDATE permission on the patients table.
GRANT UPDATE ON project_medical_data_history.patients
TO 'dm_team4'@'157.35.94.230';  


-- Question 6: Combine first_name and last_name
-- into a single column to display each patient's full name.

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM patients; 


-- Question 7: Display each patient's first name,
-- last name, and full province name by joining the tables.

SELECT
    p.first_name,
    p.last_name,
    pn.province_name
FROM patients AS p
JOIN province_names AS pn
    ON p.province_id = pn.province_id;
    
    -- Question 8: Count the number of patients born in 2010.

SELECT
    COUNT(*) AS total_patients
FROM patients
WHERE YEAR(birth_date) = 2010;

-- Question 9: Display the first name, last name, and height
-- of the patient or patients with the greatest height.

SELECT
    first_name,
    last_name,
    height
FROM patients
WHERE height = (
    SELECT MAX(height)
    FROM patients
);

-- Question 10: Display all columns for patients
-- whose patient_id is 1, 45, 534, 879, or 1000.

SELECT *
FROM patients
WHERE patient_id IN (1, 45, 534, 879, 1000);


-- Question 11: Count the total number of admission records.

SELECT
    COUNT(*) AS total_admissions
FROM admissions; 

-- Question 12: Display all admission records where
-- the admission date and discharge date are the same.

SELECT *
FROM admissions
WHERE admission_date = discharge_date;

-- Question 13: Count the total admissions for patient_id 579.
-- Purpose: Find how many admission records belong to patient 579.

SELECT
    COUNT(*) AS total_admissions
FROM admissions
WHERE patient_id = 579; 


-- 14 Optional practice: Display unique NS cities alphabetically.

SELECT DISTINCT city
FROM patients
WHERE province_id = 'NS'
ORDER BY city ASC;  

-- Question 15: Display the first name, last name, and birth date
-- of patients whose height is greater than 160
-- and whose weight is greater than 70.

SELECT
    first_name,
    last_name,
    birth_date
FROM patients
WHERE height > 160
  AND weight > 70;
  
  -- Question 16: Display unique birth years in ascending order.
-- Purpose: Extract birth years, remove duplicates,
-- and arrange the years from smallest to largest.

SELECT DISTINCT
    YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year ASC;

-- Question 17: Display first names that occur only once.
-- Purpose: Group identical first names and keep names
-- that appear exactly one time in the patients table.

SELECT
    first_name
FROM patients
GROUP BY first_name
HAVING COUNT(*) = 1; 

-- Question 18: Display patient_id and first_name for patients
-- whose first name starts with 's', ends with 's',
-- and contains at least 6 characters.

SELECT
    patient_id,
    first_name
FROM patients
WHERE first_name LIKE 's%'
  AND first_name LIKE '%s'
  AND LENGTH(first_name) >= 6;
 
-- Question 19: Display patient ID, first name, and last name
-- for patients whose diagnosis is 'Dementia'.
-- Purpose: Join patients with admissions and filter
-- admission records by the required diagnosis.

SELECT
    p.patient_id,
    p.first_name,
    p.last_name
FROM patients AS p
JOIN admissions AS a
    ON p.patient_id = a.patient_id
WHERE a.diagnosis = 'Dementia';  

-- Question 20: Display every patient's first name.
-- Purpose: Sort names by length first, then alphabetically.

SELECT
    first_name
FROM patients
ORDER BY
    LENGTH(first_name) ASC,
    first_name ASC;
    
    -- Question 21: Count male and female patients in one row.
-- Purpose: Display the total male and female patients
-- in separate columns within a single result row.

SELECT
    SUM(gender = 'M') AS male_patients,
    SUM(gender = 'F') AS female_patients
FROM patients;  

-- Question 23: Find patients admitted multiple times
-- for the same diagnosis.
-- Purpose: Group admission records by patient and diagnosis,
-- and display groups with more than one admission.

SELECT
    patient_id,
    diagnosis
FROM admissions
GROUP BY
    patient_id,
    diagnosis
HAVING COUNT(*) > 1; 

-- Question 24: Count the total number of patients in each city.
-- Purpose: Group patients by city and sort by patient count
-- from highest to lowest, then by city name alphabetically.

SELECT
    city,
    COUNT(*) AS total_patients
FROM patients
GROUP BY city
ORDER BY
    total_patients DESC,
    city ASC; 
    
    -- Question 25: Display first name, last name, and role
-- for every person who is a patient or a doctor.

SELECT
    first_name,
    last_name,
    'Patient' AS role
FROM patients

UNION ALL

SELECT
    first_name,
    last_name,
    'Doctor' AS role
FROM doctors;

-- Question 26: Display allergies ordered by popularity.
-- Purpose: Count each allergy and sort from most common
-- to least common, excluding NULL allergy values.

SELECT
    allergies,
    COUNT(*) AS allergy_count
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY allergy_count DESC;

-- Question 27: Display patients born in the 1970s.
-- Purpose: Filter birth dates from 1970-01-01
-- up to, but not including, 1980-01-01.
-- Sort patients from earliest to latest birth date.

SELECT
    first_name,
    last_name,
    birth_date
FROM patients
WHERE birth_date >= '1970-01-01'
  AND birth_date < '1980-01-01'
ORDER BY birth_date ASC;

-- Question 28: Display each patient's full name in a specific format.
-- Purpose: Show the last name in uppercase first,
-- followed by a comma and the first name in lowercase.
-- Sort by first_name in descending order.

SELECT
    CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS full_name
FROM patients
ORDER BY first_name DESC; 

-- Question 29: Find provinces where the total patient height
-- is greater than or equal to 7000.
-- Purpose: Calculate the sum of patient heights for each province
-- and display only provinces meeting the minimum total.

SELECT
    province_id,
    SUM(height) AS total_height
FROM patients
GROUP BY province_id
HAVING SUM(height) >= 7000;

-- Question 30: Find the difference between the largest
-- and smallest weights of patients with last name Maroni.

SELECT
    MAX(weight) - MIN(weight) AS weight_difference
FROM patients
WHERE last_name = 'Maroni'; 

-- Question 31: Display all days of the month (1–31)
-- and the total number of admissions on each day.
-- Purpose: Include all calendar days, even when
-- no admissions occurred on a particular day.

SELECT
    days.day_of_month,
    COUNT(a.admission_date) AS total_admissions
FROM
(
    SELECT 1 AS day_of_month UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4 UNION ALL
    SELECT 5 UNION ALL
    SELECT 6 UNION ALL
    SELECT 7 UNION ALL
    SELECT 8 UNION ALL
    SELECT 9 UNION ALL
    SELECT 10 UNION ALL
    SELECT 11 UNION ALL
    SELECT 12 UNION ALL
    SELECT 13 UNION ALL
    SELECT 14 UNION ALL
    SELECT 15 UNION ALL
    SELECT 16 UNION ALL
    SELECT 17 UNION ALL
    SELECT 18 UNION ALL
    SELECT 19 UNION ALL
    SELECT 20 UNION ALL
    SELECT 21 UNION ALL
    SELECT 22 UNION ALL
    SELECT 23 UNION ALL
    SELECT 24 UNION ALL
    SELECT 25 UNION ALL
    SELECT 26 UNION ALL
    SELECT 27 UNION ALL
    SELECT 28 UNION ALL
    SELECT 29 UNION ALL
    SELECT 30 UNION ALL
    SELECT 31
) AS days
LEFT JOIN admissions AS a
    ON DAY(a.admission_date) = days.day_of_month
GROUP BY days.day_of_month
ORDER BY total_admissions DESC;


-- Question 32: Group patients into 10-unit weight groups.
-- Purpose: Calculate the weight group for each patient,
-- count patients in each group, and sort groups descending.

SELECT
    FLOOR(weight / 10) * 10 AS weight_group,
    COUNT(*) AS total_patients
FROM patients
WHERE weight IS NOT NULL
GROUP BY FLOOR(weight / 10) * 10
ORDER BY weight_group DESC;

-- Question 33: Display patient_id, weight, height,
-- and isObese as a Boolean value (0 or 1).
-- Purpose: Calculate BMI using weight in kg
-- and height converted from centimeters to meters.
-- BMI >= 30 is considered obese.

SELECT
    patient_id,
    weight,
    height,
    CASE
        WHEN height > 0
             AND weight / POW(height / 100, 2) >= 30
        THEN 1
        ELSE 0
    END AS isObese
FROM patients;

-- Question 34: Find patients diagnosed with Epilepsy
-- who were attended by a doctor whose first name is Lisa.
-- Purpose: Join patients, admissions, and doctors tables
-- to display patient details and the doctor's specialty.

SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    d.specialty
FROM patients AS p
JOIN admissions AS a
    ON p.patient_id = a.patient_id
JOIN doctors AS d
    ON a.attending_doctor_id = d.doctor_id
WHERE a.diagnosis = 'Epilepsy'
  AND d.first_name = 'Lisa';


