-- Fianl Coursework

-- 1.
CREATE DATABASE citymed_hms
character set utf8mb4;
use citymed_hms;

-- 2.
create table departments(
dept_id int primary key auto_increment,
dept_name varchar(100) not null unique,
location varchar(100) not null,
phone_ext varchar(10) not null,
head_doctor varchar(100)
);




-- 3.
create table wards(
ward_id int primary key auto_increment,
ward_name varchar(100) not null,
dept_id int not null,
foreign key (dept_id) references departments(dept_id),
capacity int not null check(capacity>0) check(capacity<101),
ward_type enum('General','ICU','Surgical','Maternity','Paediatric')default 'General'
);

-- 4.
create table doctors(
doctor_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(100) not null,
speciality varchar(100) not null,
dept_id int not null,
foreign key (dept_id) references departments(dept_id),
email varchar(50) not null unique,
phone varchar(15) not null,
hire_date date not null,
salary decimal(10,2) not null check(salary>=0)
);







-- 5.
create table nurses(
nurse_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(100) not null,
ward_id int not null,
foreign key (ward_id) references wards(ward_id),
shift enum('Morning','Evening','Night') not null,
email varchar(50) not null unique
);





-- 6.
create table patients(
patient_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(100) not null,
dob date not null,
gender enum('Male','Female','Other') not null,
blood_group enum('A+','A-','B+','B-','AB+','AB-','O+','O-') not null,
phone varchar(15) not null,
email varchar(50),
address text,
registered_on date not null default(current_date)
);








-- 7.
create table appoinments(
appoinment_id int primary key auto_increment,
patient_id int not null,
foreign key (patient_id) references patients(patient_id),
doctor_id int not null,
foreign key (doctor_id) references doctors(doctor_id),
appt_date date not null,
appt_time time not null,
reason varchar(255) not null,
status enum('Scheduled','Completed','Cancelled','No-Show') default 'Scheduled',
notes text
);






-- 8.
create table prescriptions(
prescription_id int primary key auto_increment,
appoinment_id int not null,
foreign key (appoinment_id) references appoinments(appoinment_id)
ON DELETE cascade
ON UPDATE cascade,
medicine_name varchar(150) not null,
dosage decimal(10,3) not null,
duration_days int UNSIGNED not null check (duration_days between 1 and 365),
instructions text,
issued_date date not null default (current_date),
unique (appoinment_id,medicine_name)
);






-- 9.
create table bills(
bill_id int primary key auto_increment,
appoinment_id int not null unique,
foreign key (appoinment_id) references appoinments(appoinment_id),
total_amount decimal(10,2) not null check(total_amount>=0),
paid_amount decimal(10,2) not null check(paid_amount>=0) default (0.00),
payment_status enum('Unpaid','Partial','Paid') default 'Unpaid',
billing_date date not null default (current_date),
check(paid_amount<=total_amount)
);




-- 10.
ALTER TABLE patients ADD emergency_contact VARCHAR(15);
desc patients;








-- 11.
ALTER TABLE doctors MODIFY phone varchar(30);
desc doctors;








-- 12.
ALTER TABLE appoinments
ADD constraint Check_apptdate
check (appt_date >= CURRENT_DATE);
-- 13.
drop table departments;
drop table wards;
drop table doctors;
drop table nurses;
drop table patients;
drop table appointments;
drop table prescriptions;
drop table bills;

We must drop the tables in the correct order because some tables are connected using foreign keys. These foreign keys create relationships between tables. If we try to delete a parent table first, MySQL will show an error because other tables are still depending on it. So, we first delete the child tables like prescriptions, bills, and appointments, and then we delete the parent tables like doctors, wards, patients, and departments. This order prevents errors and ensures all tables are removed safely.
-- 14.








-- 15.
INSERT INTO wards(ward_id,ward_name,dept_id,capacity,ward_type)
values
(201,'Cardio Ward',101,45,'General'),
(202,'Ortho Ward',102,63,'Surgical'),
(203,'Cardio ICU',101,10,'General'),
(204,'Ortho ICU',102,13,'Surgical'),
(205,'Neuro Ward',103,07,'General'),
(206,'Neuro ICU',103,03,'Surgical');

-- 16.








-- 17.








-- 18.




-- 19.
insert into appoinments(appoinment_id,patient_id,doctor_id,appt_date,appt_time,reason,status,notes)
values
(601,501,301,'2026-05-06','21:30:00','Chest pain','Completed','First visit'),
(602,502,302,'2026-05-10','19:30:00','Back pain','Cancelled','Given medicine'),
(603,503,303,'2026-05-12','19:00:00','Headache','Completed','Follow-up needed'),
(604,504,304,'2026-05-12','20:00:00','Fever and cough','Cancelled','Patient recovering'),
(605,505,305,'2026-05-13','07:30:00','Heart checkup','Completed','Blood test required'),
(606,506,301,'2026-05-16','09:30:00','Joint pain','Completed','Next appointment in 2 weeks'),
(607,501,302,'2026-05-20','10:00:00','Migraine','Scheduled',null),
(608,502,303,'2026-05-25','13:00:00','Routine checkup','Scheduled',null);





-- 20.









-- 21.








-- 22.


-- 23.









-- 24.










-- 25.






-- 26.
DELETE FROM appoinments
WHERE appt_date < '2024-05-16';




-- 27.




-- 28.










-- 29.









-- 30.







-- 31.









-- 32.











-- 33.






-- 34.







-- 35.








-- 36.











37. Primary Key Constraints
departments - dept_id (unique identifier for each department).
wards - ward_id (unique identifier for each ward).
doctors - doctor_id (unique identifier for each doctor).
nurses - nurse_id (unique identifier for each nurse).
patients - patient_id (unique identifier for each patient).
appointments - appointment_id (unique identifier for each appointment).
prescriptions - prescription_id (unique identifier for each prescription line).
bills - bill_id (unique identifier for each bill).
38.Foreign Key Constraints
wards.dept_id - departments.dept_id (ON DELETE CASCADE ensures wards are removed if their department is deleted).
doctors.dept_id - departments.dept_id (ON DELETE CASCADE to prevents doctors without departments).
nurses.ward_id - wards.ward_id (ON DELETE CASCADE removes nurses if their ward is deleted).
appointments.patient_id - patients.patient_id (ON DELETE CASCADE removes appointments if patient is deleted).
appointments.doctor_id -doctors.doctor_id (ON DELETE CASCADE removes appointments if doctor is deleted).
prescriptions.appointment_id - appointments.appointment_id (ON DELETE CASCADE removes prescriptions if appointment is deleted).
bills.appointment_id - appointments.appointment_id (ON DELETE CASCADE removes bills if appointment is deleted).
Foreign keys are used to connect tables together. We set ON DELETE rules because when a parent record is removed, the related child records must also be removed or blocked so the database doesn’t end up with “orphan” data. We don’t use ON UPDATE because IDs like patient_id or doctor_id are fixed auto-numbers that never change.
39. Unique Constraints
-- departments.dept_name - ensures no duplicate department names.
doctors.email - ensures each doctor has a unique email.
nurses.email - ensures each nurse has a unique email.
patients.email - optional - ensures each patient has a unique email.
-- prescriptions (appointment_id, medicine_name) → prevents the same medicine being prescribed twice in one appointment.

-- 40. Check Constraints
-- wards.capacity - must be between 1 and 100.
-- doctors.salary - must be ≥ 0.
-- prescriptions.duration_days - must be between 1 and 365.
-- bills.paid_amount ≤ bills.total_amount - prevents overpayment.
-- appointments.appt_date ≥ today - prevents booking in the past.
-- 41.
ALTER TABLE prescriptions
ADD CONSTRAINT chk_duration_days
CHECK (duration_days <= 365);

-- 42.
If a department is deleted, the foreign key rule decides what happens to the doctors linked to it. If we use ON DELETE CASCADE, all doctors in that department would also be deleted, which is not good because we don’t want to lose doctor records. If we use ON DELETE RESTRICT, the delete will be blocked until those doctors are moved to another department. This is safer because doctors should stay in the system even if their department is removed. So the better choice is to block or set their department to NULL instead of deleting them.
-- 43.
ALTER TABLE bills
ADD CONSTRAINT chk_billing_date
CHECK (billing_date >= appointment_date);

-- 44.
UNIQUE vs PRIMARY KEY
A PRIMARY KEY is the main ID of a table, it must be unique and cannot be NULL (example: doctor_id).
A UNIQUE constraint also stops duplicates but can allow NULL (example: doctor email must be unique).
-- 45.
Referential integrity means child records must always match a parent record. For example, an appointment must belong to a real patient. The foreign key appointments.patient_id - - > patients.patient_id makes sure you cannot add an appointment for a patient who doesn’t exist.


