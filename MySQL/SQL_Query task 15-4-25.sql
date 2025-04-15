/*Task 1*/
use digital;
SELECT *  FROM student_information;

select  age, gender, year from student_information
where age > 20 and gender="male";

select  age, gender, year from student_information
where age > 20 or gender="male";

select `Student ID`, `First Name`,`Last Name`,gender from student_information
where not gender="female";

select Department,gender,age from student_information
where age between 18 and 22;

select Department,gender,age from student_information
where department like "e%";

select `First Name`,`Last Name`,gender,age from student_information
where age in (18,19,20);

select `First Name`,`Last Name`,gender,age from student_information
where age in (18,19,20)
limit 5;

/* Task 2*/

use new;
Select * from customers;

select CHAR_LENGTH(AccountStatus) as lengthOfString
from customers;

select *,concat(FirstName, " ",LastName) as ConcatenatedString
from customers;

select *,LOWER(FirstName) as LcaseColName
from customers;

select *,UPPER(FirstName) as UcaseColName
from customers;

select *,trim(FirstName) as TrimmedCol
from customers;

select *,replace(FirstName,"Bob","Bob Wilson") as UpdateName
from customers;

/* Task 3 */
CREATE TABLE drop_ind_tab_(
  StudentID INT,
  StudentNames VARCHAR(255), 
  Age INT
  ); 
  
  INSERT INTO drop_ind_tab_(
    StudentID ,StudentNames, Age)
    VALUES 
    (1, 'Alex',18),
    (2, 'Akash',27),
    (3, 'Ramisha',21);
    
CREATE UNIQUE INDEX idx_unique on drop_ind_tab_(StudentID);

DROP INDEX idx_unique on drop_ind_tab_;
    


