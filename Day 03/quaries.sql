-- DataBase Management System
-- SmartMart Retail Management System

-- ============================================================
-- Tables
-- ============================================================

CREATE DATABASE SmartmartDb;
USE SmartmartDb;

CREATE TABLE suppliers(
    supplier_id INT,
    supplier_name VARCHAR(100),
    contact_number INT,
    city VARCHAR(50)
);
DESC suppliers;

INSERT INTO suppliers VALUES
(1, 'TechSource', '0771234567', 'Colombo'),
(2, 'OfficeMart', '0712345678', 'Kandy'),
(3, 'FutureLink', '0753456789', 'Galle'),
(4, 'CityWholesale', '0764567890', 'Jaffna'),
(5, 'PrimeSupply', '0785678901', 'Matara'),
(6, 'NextGen Traders', '0726789012', 'Colombo'),
(7, 'SmartLine', '0747890123', 'Kurunegala'),
(8, 'Metro Suppliers', '0708901234', 'Kandy');
SELECT * FROM suppliers;

CREATE TABLE products(
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10,3),
    stock_quantity INT,
    supplier_id INT
);
DESC products;

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 150000.00, 10, 1),
(2, 'Mouse', 'Electronics', 2500.00, 50, 1),
(3, 'Keyboard', 'Electronics', 5000.00, 35, 6),
(4, 'Office Chair', 'Furniture', 18000.00, 12, 2),
(5, 'Study Desk', 'Furniture', 25000.00, 8, 2),
(6, 'Notebook', 'Stationery', 250.00, 100, 3),
(7, 'Pen Pack', 'Stationery', 500.00, 75, 3),
(8, 'Printer', 'Electronics', 45000.00, 6, 4),
(9, 'Monitor', 'Electronics', 55000.00, 9, 5),
(10, 'Router', 'Electronics', 12000.00, 15, 7);
SELECT * FROM products;

CREATE TABLE customers(
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    phone_number INT
);
INSERT INTO customers VALUES
(1, 'Amal Perera', 'Colombo', '0771112233'),
(2, 'Nadeesha Silva', 'Kandy', '0712223344'),
(3, 'Kasun Fernando', 'Galle', '0753334455'),
(4, 'Ishara Kumari', 'Matara', '0764445566'),
(5, 'Anjali De Silva', 'Colombo', '0785556677'),
(6, 'Ravindu Jayasuriya', 'Jaffna', '0726667788'),
(7, 'Tharushi Peris', 'Kurunegala', '0747778899'),
(8, 'Akash Fernando', 'Colombo', '0708889900');
DESC customers;
SELECT * FROM customers;

CREATE TABLE orders(
    order_id INT,
    order_date DATE,
    quantity INT,
    customer_id INT,
    product_id INT
);
DESC orders;
INSERT INTO orders VALUES
(1, '2026-01-05', 1, 1, 1),
(2, '2026-01-10', 2, 2, 2),
(3, '2026-01-15', 1, 3, 8),
(4, '2026-02-01', 3, 4, 6),
(5, '2026-02-08', 2, 5, 10),
(6, '2026-02-20', 1, 6, 9),
(7, '2026-03-02', 4, 7, 7),
(8, '2026-03-10', 1, 8, 4);
SELECT * FROM orders;

CREATE TABLE employees(
    employee_id INT,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,3),
    age INT,
    city VARCHAR(50)
);
DESC employees;
INSERT INTO employees VALUES
(1, 'John Silva', 'Sales', 55000.00, 26, 'Colombo'),
(2, 'Anne Perera', 'HR', 60000.00, 30, 'Kandy'),
(3, 'Michael Fernando', 'IT', 85000.00, 29, 'Galle'),
(4, 'Nimali Senanayake', 'Finance', 72000.00, 34, 'Colombo'),
(5, 'Daniel Peris', 'Sales', 50000.00, 25, 'Matara'),
(6, 'Anushka Jayawardena', 'IT', 90000.00, 31, 'Jaffna'),
(7, 'Rashmi De Alwis', 'HR', 58000.00, 28, 'Kurunegala'),
(8, 'Sahan Wickramasinghe', 'Sales', 62000.00, 35, 'Kandy');
SELECT * FROM employees;

-- ============================================================
-- Answer the following questions
-- ============================================================

-- 1. Display all records from the products table.
SELECT * FROM products;

-- 2. Display all records from the products table.
SELECT * FROM products;

-- 3. Display only the product name and price from the products table.
SELECT product_name,price FROM products;

-- 4. Display only the product name and price from the products table.
SELECT product_name,price FROM products;

-- 5. Display only the employee name and department from the employees table.
SELECT employee_name,department FROM employees;

-- 6. Display all products where the category is Electronics.
SELECT * FROM products WHERE category='Electronics';

-- 7. Display employees whose salary is greater than 60000.
SELECT * FROM employees WHERE salary>60000;

-- 8. Display suppliers who are located in Kandy.
SELECT * FROM suppliers WHERE city='Kandy';

-- 9. Display products where the stock quantity is less than 20.
SELECT * FROM products WHERE stock_quantity>20;

-- 10. Display products where the stock quantity is less than 20.
SELECT * FROM products WHERE stock_quantity>20;

-- 11. Display all products sorted by price in ascending order.
SELECT * FROM products ORDER by price ASC;

-- 12. Display all customers sorted alphabetically by customer name.
SELECT * FROM customers ORDER by customer_name ASC;

-- 13. Display the first 5 products in the products table.
SELECT * FROM products LIMIT 5;

-- 14. Display the first 5 products in the products table.
SELECT * FROM products LIMIT 5;

-- 15. Display the top 3 most expensive products.
SELECT * FROM products ORDER by price DESC LIMIT 5;

-- 16. Display products where the price is between 10000 and 60000.
SELECT * FROM products WHERE price<60000 AND price>10000;

-- 17. Display employees whose age is between 25 and 35.
SELECT * FROM employees WHERE age<35 AND age>25;

-- 18. Display employees whose age is between 25 and 35.
SELECT * FROM employees WHERE age<35 AND age>25;

-- 19. Display orders placed between '2026-01-01' and '2026-03-01'.
SELECT * FROM orders WHERE order_date BETWEEN '2026-01-01' AND '2026-03-01';

-- 20. Display orders placed between '2026-01-01' and '2026-03-01'.
SELECT * FROM orders WHERE order_date BETWEEN '2026-01-01' AND '2026-03-01';

-- 21. Display products supplied by supplier IDs 1, 3, and 5.
SELECT * FROM suppliers WHERE supplier_id IN (1, 3, 5);

-- 22. Display products whose names start with 'L'.
SELECT * FROM products WHERE product_name LIKE 'L%';

-- 23. Display customers whose names start with 'A'.
SELECT * FROM customers WHERE customer_name LIKE 'A%';

-- 24. Display suppliers whose names end with 'Mart'.
SELECT * FROM suppliers WHERE supplier_name LIKE '%Mart';

-- 25. Display employees whose names contain 'an'.
SELECT * FROM employees WHERE employee_name LIKE '%an%';

-- 26. Display each product with its total stock value.
SELECT SUM(stock_quantity) AS total_stock_value FROM products;

-- 27. Display each order with its total order value.
SELECT
    o.order_id,
    o.order_date,
    o.customer_id,
    o.product_id,
    o.quantity,
    p.product_name,
    p.price,
    (o.quantity * p.price) AS total_order_value
FROM orders o
JOIN products p
ON o.product_id = p.product_id;

-- 28. Display employee salary after adding a 10% bonus
SELECT employee_name,(salary*110/100) AS salary_with_bonus FROM employees;

-- 29. Display product price after adding 15% tax.
SELECT product_name,price,(price*115/100) AS tax_price FROM products;

-- 30. Display the product name, price, and stock quantity for all products that belong to the Electronics
-- category and have a stock quantity greater than 10
SELECT product_name,price,stock_quantity FROM products WHERE category='Electronics' AND stock_quantity>10;
