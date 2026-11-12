# 🏥 Medical Data History Analysis and Evaluation

## 📌 Project Overview

This project focuses on analyzing medical healthcare data using **MySQL** to identify meaningful insights into patient demographics, admissions, diagnoses, doctors, and regional healthcare patterns.

Performed SQL-based data exploration, data quality checks, aggregations, and multi-table analysis.

---

## 🎯 Project Objectives

- Analyze patient demographic information.
- Explore hospital admission records.
- Examine patient diagnoses and medical conditions.
- Identify missing values and check data quality.
- Analyze doctor and province-related information.
- Discover patterns and insights using SQL queries.

---

## 🗂️ Database Overview

**Database Name:** `project_medical_data_history`

The database contains four tables:

| Table Name | Description |
|---|---|
| `patients` | Contains patient demographic and medical information. |
| `admissions` | Contains patient admission and discharge details. |
| `doctors` | Contains doctor names and specialties. |
| `province_names` | Contains province IDs and province names. |

### 🔗 Database Relationships

- `patients.patient_id` → `admissions.patient_id`
- `doctors.doctor_id` → `admissions.attending_doctor_id`
- `province_names.province_id` → `patients.province_id`

---

## 🛠️ Tools and Technologies

- **MySQL** – Database querying and analysis.
- **MySQL Workbench** – Database management and SQL execution.
- **SQL** – Data exploration, filtering, aggregation, and multi-table analysis.

---

## 🔍 SQL Analysis

This project covers **34 SQL analysis tasks**, organized into four major sections.

### 1️⃣ Patient Information and Demographic Analysis

- Patient gender distribution.
- Missing allergy information.
- Patient name filtering.
- Weight range analysis.
- Patient full names and province details.
- Birth-year analysis.
- Height comparisons.

### 2️⃣ Admission and Patient Condition Analysis

- Total admission records.
- Same-day admissions and discharges.
- Patient admission history.
- Province-based city analysis.
- Diagnosis-based patient analysis.

### 3️⃣ Gender, Repeat Admissions, and City Analysis

- Male and female patient counts.
- Repeated patient and diagnosis combinations.
- Patient distribution across cities.
- Combining patient and doctor records.
- Allergy distribution.

### 4️⃣ Date, Formatting, Province, Weight, and Multi-Table Analysis

- Birth-year analysis.
- Name formatting and sorting.
- Total patient height by province.
- Weight difference analysis.
- Admission counts by day of the month.
- Weight-range grouping.
- BMI-based classification.
- Multi-table analysis using SQL joins.

---

## 📊 Key Findings

| Metric | Result |
|---|---:|
| Total Patients | 4,530 |
| Total Admissions | 5,067 |
| Total Doctors | 27 |
| Total Provinces | 13 |
| Male Patients | 2,468 |
| Female Patients | 2,062 |
| NULL Allergy Values | 2,059 |
| Same-Day Admissions | 481 |

### ⚠️ Data Quality Notes

- The **2,059 NULL allergy values** indicate missing or unrecorded information. They do not confirm that patients have no allergies.
- An attempted UPDATE operation could not be completed because the database account did not have UPDATE permission.

---

## 💡 Skills Demonstrated

- SQL Query Writing
- Data Exploration
- Data Quality Checking
- NULL Value Analysis
- Filtering and Sorting
- Aggregate Functions
- GROUP BY and HAVING
- String and Date Functions
- Multi-Table Joins
- Data Interpretation
- Problem-Solving

---

## 📁 Project Files

| File | Description |
|---|---|
| Business Problem Statement PDF | Contains the project requirements and analysis questions. |
| Project Report PDF | Documents the project overview, database structure, SQL analysis, and findings. |
| SQL Queries File | Contains the SQL queries used to perform the analysis. |

---

## 🚀 Conclusion

This project provided practical experience in analyzing healthcare data using MySQL. By completing **34 SQL analysis tasks**, I explored patient demographics, hospital admissions, diagnoses, doctors, and regional healthcare patterns while strengthening my SQL querying and data analysis skills.

---

⭐ **Thank you for visiting my project repository!**
