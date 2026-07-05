-- DATABASE
-- Basics
To stop lining - CTRL-Control+C or ;

To clear the command line - system cls;

To see all databases - SHOW DATABASES;

create a database - CREATE DATABASE SchoolDB;

Delete a database - DROP DATABASE SchoolDB;

To Use a database - USE SchoolDB;
--  What is utf8mb4?
utf8mb4 is a character set (encoding system) used in MySQL to store text.
-- It tells the database how to store letters, symbols, and emojis correctly.
CREATE DATABASE citymed_hms
character set utf8mb4;

Create a table -
CREATE TABLE students(
    -> id INT,
    -> name VARCHAR(50),
    -> age INT
    -> );

To see tables - SHOW TABLES;

To Delete tables - DROP TABLES;
DROP TABLE IF EXISTS departments;
DROP TABLE departments;
-- What happens without IF EXISTS?
-- ✔ If table exists:
-- It will drop successfully
-- ❌ If table does NOT exist:
-- You get an error like:
-- ERROR 1051: Unknown table

To describe tables - DESCRIBE students;

                   - DESC students;

-- To insert to the table -
INSERT INTO students(id,name,age)
    -> VALUES
    -> (2,'Sunil',23),
    -> (3,'Kamal',20),
    -> (4,'Sunimali',42);

To show table/Retrieve all students -SELECT * FROM students;

To add a new column to the table - ALTER TABLE PlayerProfile ADD country VARCHAR(30);

To add another column to the table - ALTER TABLE Employee ADD Salary INT;

To delete a column from the table - ALTER TABLE PlayerProfile DROP COLUMN Ranking;

To Modify the data(VARCHAR to TEXT)- ALTER TABLE PlayerProfile MODIFY useraname TEXT;

To Modify the data(type 25 to 50)- ALTER TABLE PlayerProfile MODIFY useraname VARCHAR(50);

TO Rename the column name - ALTER TABLE PlayerProfile CHANGE COLUMN score total_points INT;

-- Full list of common SQL data types with examples

- INT → whole numbers
Example: age INT → 25
-- INT UNSIGNED - only positive numbers (0 and above)

- BIGINT → very large integers
Example: population BIGINT → 9876543210

- VARCHAR → variable-length text
Example: name VARCHAR(50) → 'Alice'

- CHAR → fixed-length text
-- Example: gender CHAR(1) → 'M'

- TEXT → long text
Example: description TEXT → 'This is a long note'

- DATE → calendar date
Example: birth_date DATE → '2026-03-07'

- DATETIME → date + time
Example: created_at DATETIME → '2026-03-07 09:36:00'

- TIMESTAMP → date + time (with automatic time zone handling)
Example: updated_at TIMESTAMP → '2026-03-07 09:36:00'

- TIME → time of day
Example: meeting_time TIME → '14:30:00'

-- - YEAR → year only
-- Example: graduation YEAR → 1986

How to get year from a date using select query-
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    DAY(order_date) AS order_day
FROM orders;

- DECIMAL(p,s) → fixed precision numbers
Example: price DECIMAL(8,2) → 199.99
DECIMAL(10,3) → up to 10 digits total, with 3 digits after the decimal.That means: 7 digits before the decimal + 3 digits after.

-- - FLOAT → approximate decimal values
-- Example: temperature FLOAT → 36.6

-- - DOUBLE → larger floating-point numbers
-- Example: distance DOUBLE → 12345.6789

-- - BOOLEAN / TINYINT(1) → true/false values
-- Example: is_active BOOLEAN → -  TRUE or 1

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- Filters

To choose a column from a table - SELECT user_name FROM attendance;

To show selected columns only - SELECT name,department FROM employees;

-- To show filters more

SELECT * FROM employees WHERE department='IT';

SELECT * FROM employees WHERE salary>60000;

SELECT * FROM products WHERE price<60000 AND price>10000;

SELECT * FROM orders WHERE order_date BETWEEN '2026-01-01' AND '2026-03-01';

SELECT * FROM suppliers WHERE supplier_id IN (1, 3, 5);

SELECT * FROM suppliers WHERE supplier_id = 1 OR supplier_id = 3 OR supplier_id = 5;


select * from bootcamp_students
where course_name='Python'
order by enrollment_date desc;


start with -
SELECT * FROM products WHERE product_name LIKE 'L%';

end with -
mysql> SELECT * FROM suppliers WHERE supplier_name LIKE '%Mart';

-- contains with (Include)-
SELECT * FROM employees WHERE employee_name LIKE '%an%';

Group by function
SELECT course_name, AVG(score) AS avg_score
FROM bootcamp_students
GROUP BY course_name;
















having
--  What HAVING Does- HAVING is used after GROUP BY to filter groups (not individual rows).
-- It’s like WHERE, but WHERE filters rows before grouping, while HAVING filters groups after grouping.
-- You typically use HAVING with aggregate functions (COUNT, SUM, AVG, etc.).
SELECT student_id, COUNT(*) AS exam_count
FROM Exam_Marks
GROUP BY student_id
HAVING COUNT(*) > 1;

-- Two or more rules

SELECT * FROM employees WHERE salary>40000 AND age>30;

-- - AND → Both conditions must be true
Example: SELECT * FROM employees WHERE salary > 50000 AND age > 30;

-- - OR → At least one condition must be true
Example: SELECT * FROM employees WHERE salary > 50000 OR age > 30;

-- - NOT → Negates the condition (true if condition is false)
Example: SELECT * FROM employees WHERE NOT (age < 25);

-- - BETWEEN → Value must be within a range (inclusive)
Example: SELECT * FROM employees WHERE salary BETWEEN 40000 AND 60000;
duration_days int not null check (duration_days between 1 and 365),

-- - IN → Value must match one from a list
Example: SELECT * FROM employees WHERE department IN ('HR', 'IT', 'Finance');

-- - LIKE → Pattern matching with wildcards (% for many characters, _ for one character)

Example: SELECT * FROM employees WHERE name LIKE 'A%';- start with A Amela
Example: SELECT * FROM employees WHERE name LIKE '%A';- end with A Mila
-- you can use one or more letter - like an – ana

-- ------------------------------------------------------------

-- - IS NULL → Checks if a column has no value
Example: SELECT * FROM employees WHERE manager_id IS NULL;

-- - = → Equal to
Example: SELECT * FROM employees WHERE department = 'HR';

-- - != or <> → Not equal to
Example: SELECT * FROM employees WHERE department != 'HR';
-- - < → Less than
Example: SELECT * FROM employees WHERE age < 30;

-- - > → Greater than
Example: SELECT * FROM employees WHERE age > 30;

-- - <= → Less than or equal to
Example: SELECT * FROM employees WHERE age <= 30;

-- - >= → Greater than or equal to
Example: SELECT * FROM employees WHERE age >= 30;






Select top raw employees - SELECT * FROM employees LIMIT 5;

Ascending order - SELECT * FROM employees ORDER by salary ASC;

Descending order - SELECT * FROM employees ORDER by salary DESC;

SELECT * FROM products ORDER by price DESC LIMIT 5;



-- Make temporary column and do logics

 -  SELECT customer_name,price,quantity,(price*quantity) AS total_value FROM orders;

select concat(first_name,' ',last_name) as full_name from customers;

Upper case-
SELECT UPPER(name) AS upper_name FROM students;
select upper (concat(first_name,' ',last_name)) as full_name from customer;
convert - SELECT UPPER('hello world');

Lower case-
SELECT LOWER(name) AS lower_name FROM students;
Convert - SELECT LOWER('HELLO WORLD');

-- Wanna do two queries in one –
select
SUM(total_amount) as total_revenue,
MAX(total_amount) as maximum_value
from orders;

UPDATE Appointments
SET notes =
CASE
    WHEN status = 'Completed' THEN 'Treatment finished'
    WHEN status = 'Cancelled' THEN 'Appointment cancelled'
    ELSE 'Waiting for appointment'
END;
UPDATE bills
SET
-- paid_amount = paid_amount+5000,
-- payment_status =
CASE
    WHEN (paid_amount+5000) >= total_amount THEN 'Paid'
    ELSE 'Partial'
END
WHERE bill_id = 805;

-- Advanced stage:
-- Generate a custom report showing acc_name, balance, and a new temporary column called Account_Category.
* If balance is greater than 50000, label it as 'Premium'
-- * If balance is between 10000 and 50000, label it as
-- 'Standard'.
* If balance is less than 10000, label it as "Low Balance'

-- Method 1:
select acc_name,balance,
case
	when balance>50000 then 'Premium'
	when balance>10000 then 'Standard'
	else 'Low Balance'
end as account_category
from bank_accounts;

or
-- method 2 :
select acc_name,balance,
case
	when balance>50000 then 'Premium'
	when balance between 10000 and 50000 then 'Standard'
	else 'Low Balance'
end as account_category
from bank_accounts;

-- ===========================================================


-- Arithmetic Operations
-- - + (Addition) → Add values
Example: SELECT salary + bonus AS total_income FROM employees;
-- - - (Subtraction) → Subtract values
Example: SELECT salary - deductions AS net_salary FROM employees;
-- - * (Multiplication) → Multiply values
Example: SELECT salary * 12 AS yearly_salary FROM employees;
-- - / (Division) → Divide values
Example: SELECT salary / 2 AS half_salary FROM employees;


-- Aggregate Functions
-- - SUM() → Add up all values in a column
Example: SELECT SUM(salary) AS total_salary FROM employees;

-- - AVG() → Calculate average value
Example: SELECT AVG(salary) AS average_salary FROM employees;

-- - MIN() → Find smallest value
Example: SELECT MIN(age) AS youngest_employee FROM employees;

-- - MAX() → Find largest value
Example: SELECT MAX(salary) AS highest_salary FROM employees;

-- - COUNT() → Count number of rows
Example: SELECT COUNT(*) AS total_employees FROM employees;

SELECT COUNT(*) AS student_above_70 FROM students WHERE marks>70;
-- Practical world example-
select course_name,
count(student_id) as total_students from bootcamp_students
group by course_name;


-- String length –
select first_name from customer where length(first_name)>4;

ROUND FUNCTION –
SELECT ROUND(123.4567, 2);- Two decimals
SELECT ROUND(amount, 2) AS rounded_amount FROM orders;


-- Changing data in SQL

-- DATA INSERT-INSERT
mysql> INSERT INTO Customers VALUES(3,'Charlie Brown','charlie@emaail.com');

-- DATA MODIFICATION-UPDATE
mysql> UPDATE attendance
    -> SET status ='Present'
    -> WHERE student_id=2;

mysql> UPDATE attendance
    -> SET student_id=101
    -> WHERE student_id=1;

-- DATA DELETION-DELETE
mysql> DELETE FROM attendance
    -> WHERE student_id=5;

-- Bank trasfers- single deduction
select * from bank_accounts;
update bank_accounts
set balance=balance-5000
where acc_no=307;
Double entry–transaction– deduction and addition same time
-- Cant see the deduction in here (refer below)
update bank_accounts
set balance=balance-5000
where acc_no=306;

update bank_accounts
set balance=balance+5000
where acc_no=307;
select * from bank_accounts
-- Advance part(Can see the change)using start transaction and commit

start transaction

select * from bank_accounts;
update bank_accounts
set balance=balance-5000
where acc_no=307;

update bank_accounts
set balance=balance+5000
where acc_no=306;

commit;
select * from bank_accounts;


-- Modifying Multiple Rows

-- ===Using the IN Operator

UPDATE Orders
SET status = 'Shipped'
WHERE order_id IN (101, 102, 103);

-- SQL
DELETE FROM Users
WHERE user_id IN (5, 8, 12);

-- ===Using a Common Condition


DELETE FROM Orders
WHERE status = 'Cancelled';
-- ============================================================ DATA Constraints
- NOT NULL → Ensures a column cannot have NULL values.
FirstName VARCHAR(50) NOT NULL

- UNIQUE → Ensures all values in a column are different.
Email VARCHAR(100) UNIQUE

Add later-
ALTER TABLE CustomerInfo
ADD UNIQUE (Email);

- PRIMARY KEY → Combines NOT NULL + UNIQUE; uniquely identifies each row. Only one in a table -only one rare chance composite primary key.

StudentID INT PRIMARY KEY

make primary key later -
ALTER TABLE CustomerInfo
ADD PRIMARY KEY (CustomerID);

- FOREIGN KEY → Enforces referential integrity between tables.

FOREIGN KEY (DepartmentID) REFERENCES Departments(DeptID)
-- Ex- create table Orders(
order_number int unique primary key,
order_date date,
customer_number int,
staff_number int,
FOREIGN KEY (customer_number) REFERENCES Customers(customer_number),
FOREIGN KEY (staff_number) REFERENCES Waiters(staff_number)
);

appoinment_id int not null,
foreign key (appoinment_id) references appoinments(appoinment_id)
ON DELETE cascade
ON UPDATE cascade,

-- - CHECK → Ensures values meet a condition (e.g., rating between 0 and 5).
 Age INT CHECK (Age >= 18)

- DEFAULT → Provides a default value if none is given.

Country VARCHAR(50) DEFAULT 'Sri Lanka'
order_date DATE DEFAULT CURRENT_DATE

Ex- ('Samal','Perera','Python','2026-10-22',default);

ward_type enum('General','ICU','Surgical','Maternity','Paediatric')default 'General'

-- Advanced Constraints

1. AUTO_INCREMENT
add- UserID INT AUTO_INCREMENT PRIMARY KEY
use- INSERT INTO Users (UserName)
VALUES
('Kamal'),
('Dumal'),
('Amal');

2.Composite Primary Keys (Two Columns = One Key)
we can combine two or more columns to create a single Primary Key.
PRIMARY KEY (StudentID, CourseID)

What is a Composite UNIQUE Constraint?
A composite UNIQUE constraint means:
************You use TWO or more columns together to make sure the combination is unique.
UNIQUE (appointment_id, medicine_name)

-- 3.ENUM Data Type (The "List" Restriction)
-- to choose a value from a predefined list
Gender ENUM('Male', 'Female', 'Other'),

4.Disabling Foreign Key Checks (For Maintenance)
temporarily turn off the Foreign Key rules do your work, and then turn them back on.


-- Turn OFF
SET FOREIGN_KEY_CHECKS = 0;
-- Do your work here
-- Turn the rules back ON
SET FOREIGN_KEY_CHECKS = 1;

-- Cascading

ON DELETE CASCADE
ON UPDATE CASCADE

-- How to add later
-- 1.ALTER TABLE tabel_name
DROP FOREIGN KEY const_name;

-- 2.ALTER TABLE tabel_name
ADD CONSTRAINT const_name
FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID)
ON DELETE CASCADE
ON UPDATE CASCADE;




