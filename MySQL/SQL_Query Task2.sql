/* Task 1*/
CREATE database Digital;
Use digital;
Select * From courses_data;
Select * From Enrollments_data;
Select * From Student_information;

truncate table Courses_data;

Create Table Employee_Data(Id int unique,Name varchar(255) not null, Department Varchar(50) not null,
Salary int not null);

Insert into Employee_Data(ID, Name, Department, Salary)
values (101, "Ashish", "DA", 15000),(102,"Anil","DA",25000),(103,"Rishabh","Frontend",30000),
(104,"Shivam","Backend",40000);

Select * From Employee_Data;

Update Employee_Data
Set Salary = "40000", Salary = "30000"
Where Id = "104";

Delete From Employee_Data
Where Id = 102;

truncate Table Employee_Data;

Drop Table Employee_data;

-------------------------------------------------------------------------------------------------
/*Task 2*/ 
Create Table Client_Data(Id int unique,Name varchar(255) not null, Department Varchar(50) not null,
Salary int not null);

Insert into Client_Data(ID, Name, Department, Salary)
values (101, "Ashish", "DA", 15000),(102,"Anil","DA",25000),(103,"Rishabh","Frontend",30000),
(104,"Shivam","Backend",40000);

Select * From Client_Data;

Alter Table Client_Data
Add Email varchar(255);

Alter Table Client_data
rename Column Salary to Emp_Salary;

Alter Table Client_data
Drop column Email;



CREATE TABLE Data_1 (
    Dept_Name VARCHAR(50) PRIMARY KEY
);

INSERT INTO Data_1 (Dept_Name)
VALUES ('DA'), ('Frontend'), ('Backend');

CREATE TABLE Employiess_Data_2 (
    Id INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary INT NOT NULL
);

INSERT INTO Employiess_Data_2 (Id, Name, Department, Salary)
VALUES 
     (101, "Ashish", "DA", 15000),
     (102,"Anil","DA",25000),
     (103,"Rishabh","Frontend",30000),
(104,"Shivam","Backend",40000);

ALTER TABLE Client_Data
ADD CONSTRAINT FK_Department
FOREIGN KEY (Department)
REFERENCES Data_1 (Dept_Name);

