-- Database Management for Iron & Oil Custom Garage

-- ============================================================
-- Question Number 1
-- ============================================================

-- Tables
CREATE DATABASE IronoilDB;
USE IronoilDB;

CREATE TABLE riders(
    rider_id INT,
    full_name VARCHAR(100),
    contact_name VARCHAR(100),
    membership_tier VARCHAR(100)
);
DESC Riders;

INSERT INTO riders(rider_id,full_name,contact_name,membership_tier)
VALUES
(1,'Alex Fernando','071-1111111','Standard'),
(2,'Sarah Silva','077-2222222','Standard'),
(3,'Chris Perera','070-3333333','VIP');
SELECT * FROM Riders;

CREATE TABLE Mod_parts(
    part_id INT,
    part_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10,3),
    stock_quantity INT
);
DESC Mod_parts;

INSERT INTO Mod_parts(part_id,part_name,category,price,stock_quantity)
VALUES
(201,'LED Aux Lights','Electrical',4500.00,15),
(202,'Crash Bars','protection',8500.00,4),
(203,'Sport Exhaust','Performance',12000.00,2),
(204,'Custom Grips','Accessories',1500.00,25);
SELECT * FROM Mod_parts;

CREATE TABLE workshop_jobs(
    job_ID INT,
    rider_ID INT,
    part_ID INT,
    labor_charge DECIMAL(10,2),
    job_status VARCHAR(100)
);
DESC workshop_jobs;

INSERT INTO workshop_jobs(job_ID,rider_ID,part_ID,labor_charge,job_status)
VALUES
(5001,1,202,2000.00,'In Progress'),
(5002,2,201,1500.00,'Pending'),
(5003,3,203,3500.00,'Completed');
SELECT * FROM workshop_jobs;

-- 01.
INSERT INTO riders VALUES(4,'Daniel Raj','076-4444444','Standard');
SELECT * FROM riders;

-- 02.
INSERT INTO mod_parts VALUES(205,'Touring Backrest','Comfort',6500.00,10);
SELECT * FROM mod_parts;

-- 03.
INSERT INTO workshop_jobs VALUES(5004,4,205,1000.00,'Pending');
SELECT * FROM workshop_jobs;

-- 04.
UPDATE workshop_jobs
SET job_status='Completed'
WHERE job_ID=5002;
SELECT * FROM workshop_jobs;

-- 05.
UPDATE riders
SET membership_tier='Pro-Rider'
WHERE rider_id IN(1,2);
SELECT * FROM riders;

-- 06.
UPDATE mod_parts
SET price=1000.00
WHERE stock_quantity>20;
SELECT * FROM mod_parts;

-- 07.
DELETE FROM workshop_jobs
WHERE job_ID=5001;
SELECT * FROM workshop_jobs;

-- 08.
DELETE FROM mod_parts
WHERE part_id IN(203,204);
SELECT * FROM mod_parts;

-- 09.
DELETE FROM workshop_jobs
WHERE labor_charge<1200.00;
SELECT * FROM workshop_jobs;

-- ============================================================
-- Question Number 2
-- ============================================================
-- NOTE: The base tables (guest_profiles, bookings, room_inventory) were not
-- created in the screenshots -- only the operations below were shown.

-- Ticket #1001
INSERT INTO guest_profiles VALUES(805,'Michael Scott','m.scott@paper.com',500);
INSERT INTO bookings VALUES(9901,805,402,'Checked-In');

-- Ticket #1002
UPDATE room_inventory
SET cleaning_status ='Ready?Thanks!'
WHERE room_no IN(501,502,505);

-- Ticket #1003
UPDATE room_inventory
SET nightly_rate=85.00
WHERE category='Standard';

-- Ticket #1004
DELETE FROM bookings
WHERE booking_id IN(9044,9045);

-- Ticket #1005
DELETE FROM guest_profiles
WHERE reward_points>0;
