-- DBMS - DAY 5
-- Week 5

-- ============================================================
-- Activity 01
-- ============================================================

-- 1.
CREATE DATABASE DriveSafeDB;
USE DrivesafeDB;

-- 2.
-- (A first attempt was cancelled in the terminal with Ctrl-C:
--    CREATE TABLE Customers( customerID INT, NIC_Number VARCHAR(15), FullName VARCHAR(100 ^C )
CREATE TABLE Customers(
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    NIC_NUMBER VARCHAR(15) UNIQUE NOT NULL,
    FullName VARCHAR(100) NOT NULL
);
DESC Customers;

-- 3.
CREATE TABLE Vehicles(
    VehicleNo VARCHAR(15) PRIMARY KEY,
    VehicleType ENUM('Car','Van','SUV'),
    DailyRate DECIMAL(10,2) CHECK (DailyRate>0)
);
DESC Vehicles;

-- 4.  And  5.
CREATE TABLE Rentals(
    CustomerID INT,
    VehicleNo VARCHAR(15),
    RentDate DATE,
    Status ENUM('Pending','Returned') DEFAULT 'Pending',
    PRIMARY KEY (CustomerID,VehicleNo,RentDate),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    ON DELETE CASCADE,
    FOREIGN KEY (VehicleNo) REFERENCES Vehicles(VehicleNo)
    ON UPDATE CASCADE
);
DESC Rentals;

-- 6.
SET FOREIGN_KEY_CHECKS =0;
DROP TABLE Oldlogs;
DROP TABLE OldLogs;
SET FOREIGN_KEY_CHECKS = 1;

-- 7.
INSERT INTO Customers(NIC_NUMBER,FullName)
VALUES
('199012345V','Saman Kumara'),
('198598765V','Nimali Perera');
SELECT * FROM Customers;

-- 8.
INSERT INTO Vehicles(VehicleNo,VehicleType,DailyRate)
VALUES
('WP-CAR-1111','Car',5000.00),
('WP-SUV-9999','SUV',12000.00);
SELECT * FROM Vehicles;

-- 9.
INSERT INTO Rentals(CustomerID,VehicleNo,RentDate)
VALUES
(1,'WP-SUV-9999','2023-10-25');
SELECT * FROM Rentals;

-- 10.
DELETE FROM Customers
WHERE customerID=1;
SELECT * FROM Customers;
SELECT * FROM Rentals;

-- Explanation:
-- MySQL will automatically delete all rentals belonging to that customer. Because Rentals.CustomerID has
-- a FOREIGN KEY with ON DELETE CASCADE, all rental records linked to CustomerID = 1 will also be
-- automatically deleted.

-- ============================================================
-- Activity 02
-- ============================================================

-- Task 1
CREATE DATABASE TitanGym;
USE TitanGym;
CREATE TABLE GymMembers(
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE
);
DESC GymMembers;

-- Task 2
CREATE TABLE GymPlans(
    PlanID INT PRIMARY KEY,
    PlanType ENUM('Monthly','Quarterly','Annually'),
    Price DECIMAL(10,2) CHECK(price>1000)
);
DESC GymPlans;

-- Task 3
CREATE TABLE Subscriptions(
    MemberID INT,
    PlanID INT,
    StartDate DATE,
    PRIMARY KEY(MemberID,PlanID,StartDate),
    FOREIGN KEY (MemberID) REFERENCES GymMembers(MemberID)
    ON DELETE CASCADE,
    FOREIGN KEY (PlanID) REFERENCES GymPlans(PlanID)
    ON UPDATE CASCADE
);
DESC Subscriptions;

-- Task 4
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE GymMembers,GymPlans,Subscriptions;
SET FOREIGN_KEY_CHECKS =1;

-- ============================================================
-- Activity 03
-- ============================================================

CREATE DATABASE HappyPawsDB;
USE HappyPawsDB;
CREATE TABLE PetOwners(
    OwnerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(150) NOT NULL,
    Email VARCHAR(30) UNIQUE
);
CREATE TABLE Pets(
    PetID INT PRIMARY KEY,
    PetName VARCHAR(100),
    Age DECIMAL(5,2) CHECK(Age>0),
    Category ENUM('Dog','Cat','Bird'),
    OwnerID INT,
    FOREIGN KEY (OwnerID) REFERENCES PetOwners(OwnerID)
    ON DELETE CASCADE
);
CREATE TABLE Appointments(
    OwnerID INT,
    PetID INT,
    AppointmentDate DATE,
    PRIMARY KEY(PetID,AppointmentDate),
    Service_Type ENUM('Consultation','Vaccination','Grooming'),
    Fee DECIMAL(10,2) CHECK (Fee>=500),
    FOREIGN KEY (PetID) REFERENCES Pets(PetID)
    ON UPDATE CASCADE,
    FOREIGN KEY (OwnerID) REFERENCES PetOwners(OwnerID)
);
DESC PetOwners;
DESC Pets;
DESC Appointments;
