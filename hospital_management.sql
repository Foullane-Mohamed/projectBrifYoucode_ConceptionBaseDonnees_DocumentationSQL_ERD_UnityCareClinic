CREATE DATABASE HospitalManagement;  

USE HospitalManagement; 

 CREATE TABLE departments (  
    department_id INT(11) AUTO_INCREMENT PRIMARY KEY,  
    department_name VARCHAR(50),  
    location VARCHAR(100)  
);  