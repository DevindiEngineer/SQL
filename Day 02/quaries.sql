-- Database Management System
-- Data Definition Language - DDL - Practical Exercise

-- ============================================================
-- AirportManagement
-- ============================================================

CREATE DATABASE AirportManagement;
USE AirportManagement;

CREATE TABLE Airline(
    airline_id INT,
    airline_name VARCHAR(100),
    country VARCHAR(50)
);
DESC Airline;

CREATE TABLE Flight(
    flight_id INT,
    airline_id INT,
    flight_number VARCHAR(20),
    origin VARCHAR(50),
    destination VARCHAR(50),
    departure_time datetime,
    arrival_time DATETIME
);
DESC Flight;

CREATE TABLE Ticket(
    ticket_id INT,
    flight_id INT,
    ticket_price DECIMAL(10,2),
    ticket_class VARCHAR(20)
);
DESC Ticket;

CREATE TABLE Passenger(
    passenger_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    age INT,
    seat_number VARCHAR(10),
    ticket_id INT
);
-- DESC Passengers;   -- (typed in the session; errored: table 'airportmanagement.passengers' doesn't exist)
DESC Passenger;

INSERT INTO Airline(airline_id,airline_name,country)
VALUES
(1,'Skywings','USA'),
(2,'BlueBird Airways','UK'),
(3,'Oceanic Air','Australia'),
(4,'FalconFly','UAE'),
(5,'GlobalJet','Germany');
SELECT * FROM Airline;

INSERT INTO Flight(flight_id,airline_id,flight_number,origin,destination,departure_time,arrival_time)
VALUES
(1,1,'SW101','New York','Los Angeles','2025-08-01 08:00:00','2025-08-11 11:30:00'),
(2,2,'BB202','London','Paris','2025-08-02 09:00:00','2025-08-02 10:20:00'),
(3,3,'OA303','Sydney','Melbourne','2025-08-03 07:15:00','2025-08-03 08:45:00'),
(4,4,'FF404','Dubai','Mumbai','2025-08-04 14:00:00','2025-08-04 07:15:00'),
(5,5,'GJ505','Berlin','Rome','2025-08-05 10:00:00','2025-08-05 12:10:00');
SELECT * FROM Flight;

INSERT INTO Ticket(ticket_id,flight_id,ticket_price,ticket_class)
VALUES
(1,1,199.99,'Economy'),
(2,2,89.50,'Business'),
(3,3,120.75,'Economy'),
(4,4,220.00,'First'),
(5,5,150.00,'Economy');
SELECT * FROM Ticket;

INSERT INTO Passenger(passenger_id,first_name,last_name,email,age,seat_number,ticket_id)
VALUES
(1,'John','Doe','john.doe@example.com',30,'12A',1),
(2,'Emily','Smith','emily.smith@example.com',27,'4B',2),
(3,'Carlos','Garcia','carlos.garcia@example.com',35,'8C',3),
(4,'Aisha','Khan','aisha.khan@example.com',22,'1A',4),
(5,'Luca','Rossi','luca.rossi@example.com',40,'16D',5);
-- SELECT * FROM Passengers;   -- (typed in the session; errored: table doesn't exist)
SELECT * FROM Passenger;

-- ------------------------------------------------------------
-- Question 1
-- ------------------------------------------------------------

-- 01.
ALTER TABLE Airline ADD rating DECIMAL(3,1);
DESC Airline;

-- 02.
ALTER TABLE Passenger CHANGE COLUMN seat_number seat_code VARCHAR(10);
DESC Passenger;

-- 03.
ALTER TABLE Ticket MODIFY ticket_class VARCHAR(50);
DESC Ticket;

-- 04.
ALTER TABLE Passenger DROP COLUMN age;
DESC Passenger;

-- 05.
ALTER TABLE Flight ADD status VARCHAR(20);
DESC Flight;

-- ============================================================
-- Question 2  (Bookshop)
-- ============================================================
-- NOTE: no "USE Bookshop;" statement was shown in the screenshots after
-- CREATE DATABASE Bookshop.

CREATE DATABASE Bookshop;

CREATE TABLE Book(
    ISBN INT,
    Name VARCHAR(100),
    Price DECIMAL(10,2),
    publish_date DATE
);
DESC Book;

CREATE TABLE Author(
    Author_id INT,
    Name VARCHAR(100),
    Biography VARCHAR(200)
);
DESC Author;

CREATE TABLE Customer(
    customer_id INT,
    Name VARCHAR(100),
    Email VARCHAR(50),
    Address VARCHAR(100)
);
DESC Customer;

CREATE TABLE Orders(
    orderID INT,
    customerID INT,
    order_date DATE
);
DESC Orders;

CREATE TABLE Review(
    Review_id INT,
    rating DECIMAL(3,2),
    comment VARCHAR(250)
);
DESC Review;

-- NOTE: Book row 1 (1,'Physics with newton',8799.90,'2015-07-05') appears in the
-- data but its INSERT was not shown in the screenshots. The visible INSERT below
-- covers rows 2-8 (7 rows affected).
INSERT INTO Book(ISBN,Name,Price,publish_date)
VALUES
(2,'Harry Potter',4990.90,'2010-02-01'),
(3,'Mother',790.90,'2020-11-21'),
(4,'Wooden arts',1779.50,'2012-11-11'),
(5,'Learn English',2770.50,'2000-01-31'),
(6,'Buddhism - Theravadi',4990.50,'2000-11-21'),
(7,'Science and technology',2780.50,'2016-12-31'),
(8,'Kathak Dancing',690.88,'2008-02-28');
SELECT * FROM Book;

-- NOTE: the Biography text below contains apostrophes (e.g. "Newton's"). In the
-- terminal these showed as special characters; they may need checking to run.
INSERT INTO Author(Author_id,Name,Biography)
VALUES
(1,'Dr. Alan Pierce','Physicist and lecturer, writes accessible science texts inspired by Newton''s laws.'),
(2,'J.K. Rowling','British novelist, best known for the Harry Potter series, inspiring millions worldwide.'),
(3,'Maxim Gorky','Russian writer and political thinker, known for realist novels highlighting social struggles.'),
(4,'Emily Carter','Artisan and author specializing in traditional woodworking and cultural crafts.'),
(5,'Prof. David Brown','Language educator, author of English learning guides for non-native speakers.'),
(6,'Ven. Ananda Thero','Buddhist monk and scholar, writes on Theravada teachings and meditation practices.'),
(7,'Ritu Sharma','Researcher in applied sciences, author of books connecting technology with daily life.'),
(8,'Pariyanka Narayan','Classical dancer and writer, promotes Kathak through performances and cultural studies.');
SELECT * FROM Author;

INSERT INTO Customer(customer_id,Name,Email,Address)
VALUES
(101,'Amal Perera','amal@gmail.com','Colombo');

INSERT INTO Customer(customer_id,Name,Email,Address)
VALUES
(102,'Kamal Perera','kamal@gmail.com','Galle'),
(103,'Bimal Perera','bimal@gmail.com','Gampaha'),
(104,'Sunal Perera','Sunal@gmail.com','Kalutara'),
(105,'Saman Perera','saman@gmail.com','Kagalle'),
(106,'Dumal Perera','dumal@gmail.com','Kandy'),
(107,'Ridma Perera','ridma@gmail.com','Peradeniya'),
(108,'Hasun Perera','kasun@gmail.com','Kaluaaggala');
SELECT * FROM Customer;

INSERT INTO Orders(orderID,customerID,order_date)
VALUES
(1,101,'2025-01-01'),
(2,102,'2025-01-02'),
(3,103,'2025-01-03'),
(4,104,'2025-01-04'),
(5,105,'2025-01-05'),
(6,106,'2025-01-06'),
(7,107,'2025-01-07'),
(8,108,'2025-01-08');
SELECT * FROM Orders;

INSERT INTO Review(Review_id,rating,comment)
VALUES
(1,4.50,'Excellent explanation of Newton''s laws.'),
(2,9.50,'Magical and unforgettable story.'),
(3,3.80,'Emotional but a bit heavy to read.'),
(4,6.8,'Beautiful craft ideas, very inspiring.'),
(5,2.75,'Helpful for beginners learning English.'),
(6,7.85,'Deep insights into Theravada Buddhism.'),
(7,9.3,'Good overview of modern science topics.'),
(8,4.2,'Wonderful guide to Kathak dance.');
SELECT * FROM Review;

-- a.
ALTER TABLE Book ADD Genre VARCHAR(50);
DESC Book;

-- b.
ALTER TABLE Customer ADD Phone VARCHAR(15);
DESC Customer;

-- c.
ALTER TABLE Orders CHANGE COLUMN Order_Date PurchaseDate DATE;
DESC Orders;

-- ============================================================
-- Question 3  (PuffycafeDB)
-- ============================================================

CREATE DATABASE PuffycafeDB;
USE puffycafeDB;

CREATE TABLE customer(
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone INT,
    address VARCHAR(100),
    city VARCHAR(50),
    craeted_at DATE
);
-- DESC customers;   -- (typed in the session; errored: table 'puffycafedb.customers' doesn't exist)
DESC customer;

INSERT INTO customer(customer_id,first_name,last_name,email,phone,address,city,craeted_at)
VALUES
(1,'Amal','Perera','amal@gmail.com',0771234657,'No.123,dadigamuwa','Nawagamuwa','2025-08-07');

INSERT INTO customer(customer_id,first_name,last_name,email,phone,address,city,craeted_at)
VALUES
(2,'Kamal','Perera','kamal@gmail.com',077468767,'No.222,Kottawa','Pannipitiya','2025-01-30'),
(3,'Samal','Lal','lal@gmail.com',012558538,'No.234,Kudaamaduwa','Piliyandala','2024-09-30'),
(4,'Dumal','Bandara','banda@gmail.com',01875658,'No.456,Siddamulla','Miriswatta','2024-09-07'),
(5,'Reema','Dany','dany@gmail.com',08952233,'No.88,Arewmala','Maharagama','2023-10-07');

INSERT INTO customer(customer_id,first_name,last_name,email,phone,address,city,craeted_at)
VALUES
(6,'Sugath','Perera','sugath@gmail.com',07895622,'No.789,Prime Lands-Kottawa','Mattegoda','2023-08-22'),
(7,'Leelananda','Perera','lnperera@gmail.com',074643322,'No.01,Pedro','Jaffna','2021-08-20'),
(8,'Ramani','Perera','ramani@gmail.com',0114562589,'No.11,Gamsabawa','Nugegoda','2020-11-20'),
(9,'Darshani','Perera','dara@gmail.com',011457789,'No.23,Sumanagala Mawatha','Wijerama','2025-12-31'),
(10,'Mahari','Perera','mahari111@gmail.com',045557789,'No.3,Araliya Homes','wellawatta','2026-01-11');
SELECT * FROM customer;

CREATE TABLE orders(
    order_id INT,
    customer_id INT,
    order_date DATE,
    order_total DECIMAL(10,2),
    payment_method VARCHAR(50),
    order_status VARCHAR(50),
    notes VARCHAR(200)
);
DESC Orders;

INSERT INTO Orders(order_id,customer_id,order_date,order_total,payment_method,order_status,notes)
VALUES
(1,1,'2024-10-02',2536.20,'Cash','Completed','Mochiato Coffee and cream bun'),
(2,2,'2025-12-05',1237.50,'Credit card','Pending','Matcha Tea and croissant'),
(3,3,'2024-02-15',5623.25,'Debit card','Cancelled','Boba cult bubble tea'),
(4,4,'2025-12-04','789.35','Cash','Completed','Cappuchino with brown sugar cookies'),
(5,5,'2026-01-12',4561.25,'Credit card','Pending','Pistachio cake slice');

INSERT INTO Orders(order_id,customer_id,order_date,order_total,payment_method,order_status,notes)
VALUES
(6,6,'2026-02-02','459.25','Cash','Completed','Ceylon green tea'),
(7,7,'2024-12-05','1895.50','Credit card','Pending','Hot Chocolate and Lava cake slice'),
(8,8,'2024-12-15',5789.25,'Debit card','Cancelled','Blueberry cheese cake'),
(9,9,'2026-02-04',7819.35,'Cash','Completed','chicken floss submarine'),
(10,10,'2024-11-12',3261.25,'Credit card','Pending','Pamasan cheese pizza');
SELECT * FROM Orders;

-- ============================================================
-- Question 4  (LCPortDB)
-- ============================================================

-- 4.1
CREATE DATABASE LCPortDB;
USE LCPortDb;

CREATE TABLE ships(
    ship_id INT,
    ship_name VARCHAR(100),
    origion_port VARCHAR(100),
    destination_port VARCHAR(100),
    arrival_date DATE,
    depature_date DATE
);
DESC ships;

INSERT INTO ships(ship_id,ship_name,origion_port,destination_port,arrival_date,depature_date)
VALUES
(1,'Blubby','Iceland','China','2024-12-13','2024-12-30'),
(2,'Cheezy Star','Switzerland','Singapore','2025-01-13','2025-04-30'),
(3,'Loan Star','USA','UAE','2025-06-13','2025-08-30'),
(4,'Dolphin wave','Portugal','UK','2025-07-10','2025-09-15'),
(5,'whale hunter','India','Russia','2025-09-21','2025-12-15');
SELECT * FROM ships;

-- 4.2
CREATE TABLE Containers(
    container_id INT,
    ship_id INT,
    container_type VARCHAR(100),
    weight DECIMAL(10,3),
    status VARCHAR(100)
);
DESC containers;

INSERT INTO containers(container_id,ship_id,container_type,weight,status)
VALUES
(1,1,'Food',1200.50,'Loaded'),
(2,2,'Clothing',500.25,'Damaged'),
(3,3,'Machinery',1000.50,'unloaded'),
(4,4,'Medicines',200.50,'loaded'),
(5,5,'Toys',3000.25,'In transit');
SELECT * FROM containers;

-- 4.3
CREATE TABLE Cargo(
    cargo_id INT,
    container_id INT,
    description VARCHAR(200),
    weight DECIMAL(10,3),
    cargo_type VARCHAR(200)
);
DESC Cargo;

INSERT INTO Cargo (cargo_id, container_id, description, weight, cargo_type)
VALUES
(1, 1, 'Fresh fruits', 500.250, 'Food'),
(2, 2, 'Smartphones shipment', 300.000, 'Electronics'),
(3, 3, 'Wooden chairs', 1200.750, 'Furniture'),
(4, 4, 'Winter clothes', 450.500, 'Clothing'),
(5, 5, 'Industrial engine parts', 2500.000, 'Machinery');
SELECT * FROM cargo;

-- 4.4
CREATE TABLE employees(
    employee_id INT,
    full_name VARCHAR(100),
    role VARCHAR(100),
    shift VARCHAR(100),
    contact_number INT
);
DESC employees;

INSERT INTO employees (employee_id, full_name, role, shift, contact_number)
VALUES
(1, 'Amal Perera', 'Chef', 'Morning', 771234567),
(2, 'Kamal Silva', 'Waiter', 'Evening', 772345678),
(3, 'Dumal Rathnayake', 'Manager', 'Night', 773456789),
(4, 'Nimal Fernando', 'Cleaner', 'Morning', 774567890),
(5, 'Sunil Jayasuriya', 'Cashier', 'Evening', 775678901);
SELECT * FROM employees;

-- 4.5
CREATE TABLE Schedules(
    schedule_id INT,
    ship_id INT,
    berth_number VARCHAR(100),
    schedule_arrival DATE,
    schedule_departure DATETIME
);
DESC Schedules;

INSERT INTO Schedules (schedule_id, ship_id, berth_number, schedule_arrival, schedule_departure)
VALUES
(1, 101, 'B1', '2026-03-21', '2026-03-21 08:00:00'),
(2, 102, 'B2', '2026-03-22', '2026-03-22 14:30:00'),
(3, 103, 'B3', '2026-03-23', '2026-03-23 09:15:00'),
(4, 104, 'B4', '2026-03-24', '2026-03-24 18:45:00'),
(5, 105, 'B5', '2026-03-25', '2026-03-25 11:00:00');
SELECT * FROM Schedules;
