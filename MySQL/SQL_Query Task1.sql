CREATE DATABASE udaanous;

USE udaanous;

SELECT * FROM student_information;

SELECT `Student ID`, `First Name`, `Last Name`, `Age` 
FROM student_information 
LIMIT 0, 1000;

SELECT DISTINCT `Student ID`, `First Name`, `Last Name`, `Age` 
FROM student_information;


SELECT 'Student ID' AS id 
FROM student_information AS id;

SELECT s1.`Student ID`, s2.`Age`, s3.`Department`
FROM student_information AS s1,
     student_information AS s2,
     student_information AS s3;

SELECT * FROM student_information WHERE Age = 18;

SELECT * FROM student_information WHERE Age < 24;

SELECT * FROM student_information WHERE Age > 18;

SELECT t1.`Course ID`, t2.`Enrollment ID`, t3.`Last Name`
FROM courses_data AS t1
JOIN enrollments_data AS t2 ON t1.`Course ID` = t2.`Course ID`
JOIN student_information AS t3 ON t2.`Student ID` = t3.`Student ID`
LIMIT 0, 1000;

select t1.`Course ID`, t2.`Enrollment ID`, t3.`Last Name` from courses_data as t1 , enrollments_data as t2 , student_information as t3;


SELECT courses_data.`Course Name`, 
       courses_data.`Course ID`, 
       enrollments_data.Semester, 
       enrollments_data.`Student ID`
FROM courses_data
INNER JOIN enrollments_data 
    ON courses_data.`Course ID` = enrollments_data.`Course ID`;
