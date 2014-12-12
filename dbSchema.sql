DROP TABLE IF EXISTS `Student_Info`;

CREATE TABLE `Student_Info` (
	`UIN` INT PRIMARY KEY,
    `First_name` VARCHAR(100) NOT null,
    `Last_name` VARCHAR(100) NOT null,
    `Email` VARCHAR(100) NOT null
    );
    
DROP TABLE IF EXISTS `Class`;

CREATE TABLE `Class` (
	`Class_code` VARCHAR(50) PRIMARY KEY,
    `Class_name` VARCHAR(100) NOT null,
    `Class_description` TEXT,
    `Prereq` VARCHAR(50) REFERENCES Class(Class_code),
	`Category` VARCHAR(100)
    );
    
DROP TABLE IF EXISTS `Class_Enrollment`;

CREATE TABLE `Class_Enrollment` (
	`UIN` INT,
    `Class_code` VARCHAR(50),
    `Class_date` DATE,
    `Attendance` VARCHAR(10),
    PRIMARY KEY (`UIN`, `Class_code`, `Class_date`)
    );
	
    
