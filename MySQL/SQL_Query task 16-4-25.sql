/* task 1 */
use employee_details;

select * from product_financial_data;

select abs(profit) as UDate from product_financial_data;


select sum(amount) as TAmount from product_financial_data;


select avg(Revenue) as avg_profit from product_financial_data;


select count(`Product ID`) as total_id from product_financial_data;

select revenue div amount as Ucol from product_financial_data;

select min(Revenue) as min_rev from product_financial_data;

select max(Profit) as max_profit from product_financial_data;

/*Task 2 */

select power(Revenue,2) from product_financial_data;

select round(amount,1) from product_financial_data;

select sqrt(profit) from product_financial_data;

select log(amount) from product_financial_data;

/* task 3 */

CREATE TABLE exam_info (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50),
    Scores integer
);

INSERT INTO exam_info (FirstNames, LastNames, Scores) VALUES
('John', 'Doe',  80),
('Alice', 'Smith',  75),
('Bob', 'Johnson',  78),
('Emily', 'Brown',  60),
('Michael', 'Davis', 86),
('Sarah', 'Wilson', 90),
('David', 'Lee', 75),
('Jessica', 'Taylor', 75),
('Chris', 'Evans',  55),
('Emma', 'Thompson',  67);

SELECT *,
    POWER(Scores, 3) AS CubeScores
FROM exam_info;

/* task 4 */

CREATE TABLE exam_info_2 (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50),
    Scores float
);

INSERT INTO exam_info_2 (FirstNames, LastNames, Scores) VALUES
('John', 'Doe',  80.345544),
('Alice', 'Smith',  75.6355),
('Bob', 'Johnson',  78.5364565),
('Emily', 'Brown',  60.3565),
('Michael', 'Davis', 86.5353656),
('Sarah', 'Wilson', 90.535464),
('David', 'Lee', 75.567765),
('Jessica', 'Taylor', 75.34242),
('Chris', 'Evans',  55.09098),
('Emma', 'Thompson',  67.34535);

SELECT *,
    round(Scores, 2) AS RScores
FROM exam_info_2;

/* task 5 */
select * from `sales dataset`;

select date_format(`Order Date`,"%d-%m-%y")
from`sales dataset`;

select datediff(curdate(),`Order Date`) as different_date
from `sales dataset`;

select day(`Order Date`)
from `sales dataset`;