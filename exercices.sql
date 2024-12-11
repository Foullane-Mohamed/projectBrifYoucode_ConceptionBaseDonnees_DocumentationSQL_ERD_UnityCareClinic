-- 1
INSERT INTO patients (first_name, last_name, gender, date_of_birth, phone_number)
VALUES ('mohamed', 'rida', 'Male', '1996-02-13', '1122');
       ('aymen', 'yara', 'Male', '1997-07-13', '22334');
       ('ali', 'ait hssain', 'Male', '1998-04-12', '22112334');
       ('hamza', 'foullane', 'Male', '1999-06-11', '2234556');


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

--9


SELECT 
    *,
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 18 THEN 'Enfant'
        WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 65 THEN 'Adulte'
        ELSE 'Senior'
    END AS age_category
FROM patients;


SELECT COUNT(*) as total_appointments FROM appointments;


SELECT d.department_name, COUNT(doc.doctor_id) as doctor_count
FROM departments d
LEFT JOIN doctors doc ON d.department_id = doc.department_id
GROUP BY d.department_id;


SELECT AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) as average_age 
FROM patients;


SELECT MAX(appointment_date) as last_appointment FROM appointments;


SELECT r.room_number, COUNT(a.admission_id) as total_admissions
FROM rooms r
LEFT JOIN admissions a ON r.room_id = a.room_id
GROUP BY r.room_id;


SELECT * FROM patients WHERE email IS NULL OR email = '';


SELECT 
    a.appointment_date,
    CONCAT(p.first_name, ' ', p.last_name) as patient_name,
    CONCAT(d.first_name, ' ', d.last_name) as doctor_name
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;


DELETE FROM appointments WHERE YEAR(appointment_date) < 2024;


UPDATE departments 
SET department_name = 'Cancer Treatment' 
WHERE department_name = 'Oncology';


SELECT gender, COUNT(*) as patient_count
FROM patients
GROUP BY gender
HAVING patient_count >= 2;


CREATE VIEW active_admissions AS
SELECT 
    a.admission_id,
    p.first_name,
    p.last_name,
    r.room_number,
    a.admission_date
FROM admissions a
JOIN patients p ON a.patient_id = p.patient_id
JOIN rooms r ON a.room_id = r.room_id
WHERE a.discharge_date IS NULL;


SELECT 
    CONCAT(p.first_name, ' ', p.last_name) as patient_name,
    CONCAT(d.first_name, ' ', d.last_name) as doctor_name
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
JOIN appointments apt ON p.patient_id = apt.patient_id
JOIN doctors d ON apt.doctor_id = d.doctor_id;


SELECT 
    d.department_name,
    a.appointment_date,
    p.first_name as patient_name,
    doc.first_name as doctor_name
FROM appointments a
JOIN doctors doc ON a.doctor_id = doc.doctor_id
JOIN departments d ON doc.department_id = d.department_id
JOIN patients p ON a.patient_id = p.patient_id;


SELECT 
    CONCAT(d.first_name, ' ', d.last_name) as doctor_name,
    m.medication_name,
    p.dosage_instructions
FROM doctors d
JOIN prescriptions p ON d.doctor_id = p.doctor_id
JOIN medications m ON p.medication_id = m.medication_id;


SELECT 
    a.admission_id,
    p.first_name,
    p.last_name,
    r.room_number,
    r.room_type,
    a.admission_date
FROM admissions a
JOIN patients p ON a.patient_id = p.patient_id
JOIN rooms r ON a.room_id = r.room_id;



SELECT 
    d.department_name,
    COUNT(DISTINCT a.patient_id) as patient_count
FROM departments d
JOIN doctors doc ON d.department_id = doc.department_id
JOIN appointments a ON doc.doctor_id = a.doctor_id
GROUP BY d.department_id;