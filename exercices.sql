-- 1
INSERT INTO patients (first_name, last_name, gender, date_of_birth, phone_number)
VALUES ('Alex', 'Johnson', 'Male', '1990-07-15', '1234567890');

-- 2 
SELECT department_name, location FROM departments;

-- 3
SELECT * FROM patients ORDER BY date_of_birth ASC;

-- 4
SELECT DISTINCT gender FROM patients;

-- 5
SELECT * FROM doctors LIMIT 3;

-- 6
SELECT * FROM patients WHERE YEAR(date_of_birth) > 2000;

-- 7
SELECT d.* FROM doctors d
JOIN departments dept ON d.department_id = dept.department_id
WHERE dept.department_name IN ('Cardiology', 'Neurology');

-- 8
SELECT * FROM admissions
WHERE admission_date BETWEEN '2024-12-01' AND '2024-12-07';

