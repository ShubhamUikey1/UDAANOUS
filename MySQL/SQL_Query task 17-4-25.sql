/* Task 1 */
USE employee_details;

CREATE TABLE purchases (
    CustomerID INT,
    PurchaseDate DATE,
    ReturnDate DATE
);

INSERT INTO purchases (CustomerID, PurchaseDate, ReturnDate) VALUES
(1, '2024-01-01', '2024-01-05'),
(2, '2024-01-02', '2024-01-06'),
(3, '2024-01-03', '2024-01-07'),
(4, '2024-01-04', '2024-01-08'),
(5, '2024-01-05', '2024-01-09'),
(6, '2024-01-06', '2024-01-10'),
(7, '2024-01-07', '2024-01-11'),
(8, '2024-01-08', '2024-01-12'),
(9, '2024-01-09', '2024-01-13'),
(10, '2024-01-10', '2024-01-14');

SELECT *, 
    PurchaseDate,
    CONCAT(
        DATE_FORMAT(PurchaseDate, '%y-%M-'),
        CASE 
            WHEN DAY(PurchaseDate) IN (11,12,13) THEN CONCAT(DAY(PurchaseDate), 'th')
            WHEN DAY(PurchaseDate) % 10 = 1 THEN CONCAT(DAY(PurchaseDate), 'st')
            WHEN DAY(PurchaseDate) % 10 = 2 THEN CONCAT(DAY(PurchaseDate), 'nd')
            WHEN DAY(PurchaseDate) % 10 = 3 THEN CONCAT(DAY(PurchaseDate), 'rd')
            ELSE CONCAT(DAY(PurchaseDate), 'th')
        END
    ) AS FormattedDate
FROM purchases;

Select *,date_format(purchasedate, "%Y-%M-%D") as purchase_date from purchases;

/* Task 2 */
CREATE TABLE purchases_2 (
    CustomerID INT,
    PurchaseDate DATE,
    ReturnDate DATE
);

INSERT INTO purchases_2 (CustomerID, PurchaseDate, ReturnDate) VALUES
(1, '2024-01-01', '2024-01-09'),
(2, '2024-01-02', '2024-01-16'),
(3, '2024-01-03', '2024-01-11'),
(4, '2024-01-04', '2024-01-08'),
(5, '2024-01-05', '2024-01-09'),
(6, '2024-01-06', '2024-01-10'),
(7, '2024-01-07', '2024-01-21'),
(8, '2024-01-08', '2024-01-29'),
(9, '2024-01-09', '2024-01-13'),
(10, '2024-01-10', '2024-01-24');

SELECT *,
    DATEDIFF(ReturnDate , PurchaseDate) AS DateDifference
FROM purchases_2;

SELECT *,ReturnDate - PurchaseDate AS Difference_date FROM Purchases_2;

/* Task 3 */

SELECT *,
    YEAR(ReturnDate) AS YearsData
FROM purchases;

SELECT *,
    YEAR(PurchaseDate) AS Year_date
FROM Purchases
WHERE YEAR(PurchaseDate) >= 2022;
/* Task 4 */
select * from `sales dataset`;

select city,state, sum(Amount)
from `sales dataset` 
group by city,State
order by State desc
limit 5;

select Quantity,Category,`Sub-Category`
from `sales dataset` 
order by `Sub-Category` desc
limit 5;

/* Task 5 */

use udaanous;

select * from student_information;
select * from enrollments_data;

-- Inner Join

select S.`Student ID`,S.`First Name`,S.`Last Name`,S.Department,E.Semester,E.Grade
from student_information as S
inner join enrollments_data as E
on S.`Student ID`=E.`Student ID`;

-- Left Join

select S.`Student ID`,S.`First Name`,S.`Last Name`,S.Department,E.Semester,E.Grade
from enrollments_data as E
left join student_information as S
on S.`Student ID`=E.`Student ID`;

-- Right Join

select S.`Student ID`,S.`First Name`,S.`Last Name`,S.Department,E.Semester,E.Grade
from enrollments_data as E
right join student_information as S
on S.`Student ID`=E.`Student ID`;

-- Cross Join
 
select S.`Student ID`,S.`First Name`,S.`Last Name`,S.Department,E.Semester,E.Grade
from student_information as S
cross join enrollments_data as E
on S.`Student ID`=E.`Student ID`;
