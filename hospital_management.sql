CREATE DATABASE HospitalManagement;  

USE HospitalManagement; 

 CREATE TABLE departments (  
    department_id INT(11) AUTO_INCREMENT PRIMARY KEY,  
    department_name VARCHAR(50),  
    location VARCHAR(100)  
);  

CREATE TABLE rooms (  
    room_id INT(11) AUTO_INCREMENT PRIMARY KEY,  
    room_number VARCHAR(10),  
    room_type ENUM('General', 'Private', 'ICU'),  
    availability TINYINT(1)  
);  

CREATE TABLE medications (  
    medication_id INT(11) AUTO_INCREMENT PRIMARY KEY,  
    medication_name VARCHAR(100),  
    dosage VARCHAR(50)  
);  

CREATE TABLE patients (  
    patient_id INT(11) AUTO_INCREMENT PRIMARY KEY,  
    first_name VARCHAR(50),  
    last_name VARCHAR(50),  
    gender ENUM('Male', 'Female', 'Other'),  
    date_of_birth DATE,  
    phone_number VARCHAR(15),  
    email VARCHAR(100),  
    address VARCHAR(255)  
);  

CREATE TABLE doctors (  
    doctor_id INT(11) AUTO_INCREMENT PRIMARY KEY,  
    first_name VARCHAR(50),  
    last_name VARCHAR(50),  
    specialization VARCHAR(50),  
    phone_number VARCHAR(15),  
    email VARCHAR(100),  
    department_id INT(11),  
    FOREIGN KEY (department_id) REFERENCES departments(department_id)  
);  

CREATE TABLE staff (  
    staff_id INT(11) AUTO_INCREMENT PRIMARY KEY,  
    first_name VARCHAR(50),  
    last_name VARCHAR(50),  
    job_title VARCHAR(50),  
    phone_number VARCHAR(15),  
    email VARCHAR(100),  
    department_id INT(11),  
    FOREIGN KEY (department_id) REFERENCES departments(department_id)  
);  

CREATE TABLE appointments (  
    appointment_id INT(11) AUTO_INCREMENT PRIMARY KEY,  
    appointment_date DATE,  
    appointment_time TIME,  
    doctor_id INT(11),  
    patient_id INT(11),  
    reason VARCHAR(255),  
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),  
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)  
);  

CREATE TABLE prescriptions (  
    prescription_id INT(11) AUTO_INCREMENT PRIMARY KEY,  
    patient_id INT(11),  
    doctor_id INT(11),  
    medication_id INT(11),  
    prescription_date DATE,  
    dosage_instructions VARCHAR(255),  
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),  
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),  
    FOREIGN KEY (medication_id) REFERENCES medications(medication_id)  
);  

CREATE TABLE admissions (  
    admission_id INT(11) AUTO_INCREMENT PRIMARY KEY,  
    patient_id INT(11),  
    room_id INT(11),  
    admission_date DATE,  
    discharge_date DATE,  
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),  
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)  
);  
