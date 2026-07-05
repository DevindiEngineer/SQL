-- Final Assignment: Food Delivery Database Management

-- ============================================================
-- Tables  (viewing the existing table structures and data)
-- ============================================================
-- NOTE: The PDF only shows the DESC/SELECT output for these base tables
-- (Restaurents, Couriers, Deliveries). The original CREATE TABLE and the
-- initial INSERT statements were NOT included in the screenshots.

DESC Restaurents;
SELECT * FROM REstaurents;

DESC couriers;
SELECT * FROM Couriers;

DESC Deliveries;
SELECT * FROM Deliveries;

-- ============================================================
-- PART A
-- ============================================================

-- 1.
INSERT INTO Restaurents VALUES(4,'Taco Town',4.6,'Open');
SELECT * FROM Restaurents;

-- 2.
INSERT INTO Couriers VALUES(104,'Ruwan','Scooter',0);
SELECT * FROM Couriers;

-- 3.
INSERT INTO Deliveries VALUES(5004,4,104,250.00,'Pending');
SELECT * FROM Deliveries;

-- ============================================================
-- PART B
-- ============================================================

-- 4.
UPDATE Deliveries
SET status='Completed'
WHERE delivery_id=5002;
SELECT * FROM Deliveries;

-- 5.
UPDATE Deliveries
SET delivery_fee=500.00
WHERE delivery_id IN(5001,5003);
SELECT * FROM Deliveries;

-- 6.
UPDATE Restaurents
SET status='Needs Review'
WHERE rating<4.00;
SELECT * FROM Restaurents;

-- 7.
DELETE FROM Deliveries
WHERE delivery_id IN (5003);
SELECT * FROM Deliveries;

-- 8.
DELETE FROM Couriers
WHERE total_deliveries<50;
SELECT * FROM Couriers;
