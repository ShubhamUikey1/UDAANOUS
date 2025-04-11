/*Task */
USE digital;

SELECT *  FROM Employiess_Data_2;

create index Sal
on Employiess_Data_2(Salary);

create unique index Sal_1
on Employiess_Data_2(id);

alter table Employiess_Data_2 
drop index sal;

 /* Task 2*/

select * from employiess_data_2
where salary is null;

select * from employiess_data_2
where salary is not null;