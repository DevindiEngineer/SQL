-- DBMS Assignment Week_08
-- Activity 1
Create database RestaurentDB;
use RestaurentDB;
create table Customers(
customer_number INT unique primary key,
full_name varchar(100) ,
phone_number varchar(10)
);
create table Waiters(
staff_number INT unique primary key,
name varchar(100),
shift enum('Morning','Evening')
);
create table Menu(
item_number int unique primary key,
dish_name varchar(100),
price decimal(10,3)
);
create table Orders(
order_number int unique primary key,
order_date date,
customer_number int,
staff_number int,
FOREIGN KEY (customer_number) REFERENCES Customers(customer_number),
FOREIGN KEY (staff_number) REFERENCES Waiters(staff_number)
);
create table orderdetails(
orderdetails_number int unique primary key,
order_number int,
item_number int,
quantity int not null,
FOREIGN KEY (item_number) REFERENCES Menu(item_number),
FOREIGN KEY (order_number) REFERENCES Orders(order_number)
);
INSERT INTO Customers VALUES
(101, 'Nimal Perera', '0771234567'),
(102, 'Kavindi Silva', '0719876543'),
(103, 'Sahan Fernando', '0754567890');
INSERT INTO Waiters VALUES
(201, 'Kasun Madushanka', 'Morning'),
(202, 'Dilani Perera', 'Evening');
INSERT INTO Menu VALUES
(301, 'Chicken Kottu', 1200.000),
(302, 'Egg Fried Rice', 950.000),
(303, 'String Hoppers', 400.000),
(304, 'Milk Tea', 150.000),
(305, 'Fish Bun', 100.000);
INSERT INTO Orders VALUES
(401, '2026-05-10', 101, 201),
(402, '2026-05-10', 102, 202),
(403, '2026-05-11', 103, 201);
INSERT INTO OrderDetails VALUES
(501, 401, 301, 2),
(502, 401, 304, 2),
(503, 402, 302, 1),
(504, 402, 305, 3),
(505, 403, 303, 4),
(506, 403, 304, 4);
-- 1.
select Customers.full_name, Orders.order_date
from Customers
inner join Orders
on Customers.customer_number = Orders.customer_number;
-- 2.
select Orders.order_number, Waiters.name
from Orders
inner join Waiters
on Orders.staff_number = Waiters.staff_number;
-- 3.
select Menu.dish_name, orderdetails.quantity
from Menu
inner join orderdetails
on Menu.item_number = orderdetails.item_number;
-- 4.
select Orders.order_number, Waiters.name
from Orders
inner join Waiters
on Orders.staff_number = Waiters.staff_number
where Waiters.shift='Morning';
-- 5.
select Customers.full_name, Customers.phone_number,
-- Orders.order_number
from Customers
inner join Orders
on Customers.customer_number = Orders.customer_number
where Orders.order_date='2026-05-10';
-- Activity 2
create database unilibraryDB;
use unilibraryDB;
create table Students(
student_id int unique primary key,
student_name varchar(100) not null,
department varchar(50) not null
);
create table categories(
Category_id int unique primary key,
category_name varchar(100) not null
);
create table Books(
Book_id int unique primary key,
book_title varchar(100) not null,
Category_id int,
foreign key (Category_id) references categories(category_id)
);
create table BorrowRecords(
record_id int unique primary key,
student_id int,
Book_id int,
borrow_date date not null,
foreign key (student_id) references Students(student_id),
foreign key (Book_id) references Books(Book_id)
);
insert into Students values
(1,'Kasun Perera','IT'),
(2,'Nimali Silva','Management'),
(3,'Ashen Fernando','Engineering'),
(4,'Dilani Jayasuriya','Science'),
(5,'Ravindu Kumara','Business');
insert into categories values
(101,'Programming'),
(102,'Management'),
(103,'Engineering'),
(104,'Science'),
(105,'History');
insert into Books values
(1001,'Java Basics',101),
(1002,'Business Management',102),
(1003,'Electrical Fundamentals',103),
(1004,'Physics for Beginners',104),
(1005,'Sri Lankan History',105);
insert into BorrowRecords values
(1,1,1001,'2026-05-01'),
(2,2,1002,'2026-05-02'),
(3,3,1003,'2026-05-03'),
(4,4,1004,'2026-05-04'),
(5,5,1005,'2026-05-05');
-- 1.
select Books.book_title, categories.category_name
from Books
inner join categories
on Books.Category_id = categories.Category_id;
-- 2.
select Students.student_name, BorrowRecords.borrow_date
from Students
inner join BorrowRecords
on Students.student_id = BorrowRecords.student_id;
-- 3.
select
-- Students.student_name,
-- Books.book_title
from BorrowRecords
inner join Students on Students.student_id = BorrowRecords.student_id
inner join Books on Books.Book_id = BorrowRecords.Book_id;
-- 4.
select
-- Books.book_title,
-- BorrowRecords.borrow_date,
-- categories.category_name
from BorrowRecords
inner join Books on Books.Book_id = BorrowRecords.Book_id
inner join categories on categories.Category_id = Books.Category_id;
-- Activity 3
create database storeDB;
use storeDB;
create table customers(
customer_id int unique primary key,
customer_name varchar(100) not null,
city varchar(50) not null
);
create table orders(
order_id int unique primary key,
customer_id int,
order_date date not null,
total double (10,3),
foreign key (customer_id) references customers(customer_id)
);
create table categories(
category_id int unique primary key,
category_name varchar(50) not null
);
create table products(
product_id int unique primary key,
product_name varchar(50) not null,
price decimal(10,3) not null,
category_id int,
foreign key (category_id) references categories(category_id)
);
insert into customers values
(1,'Kamal Perera','Colombo'),
(2,'Nimal Silva','Kandy'),
(3,'Saman Kumara','Galle'),
(4,'Amali Fernando','Kurunegala'),
(5,'Dilani Jayasuriya','Matara');
insert into categories values
(101,'Beverages'),
(102,'Snacks'),
(103,'Stationery'),
(104,'Electronics'),
(105,'Household');
insert into products values
(1001,'Anchor Milk Powder',1450.000,101),
(1002,'Munchee Biscuit',250.000,102),
(1003,'Atlas Book',120.500,103),
(1004,'USB Mouse',1850.750,104),
(1005,'Soap Pack',450.250,105);
insert into orders values
(5001,1,'2026-05-01',1450.000),
(5002,2,'2026-05-02',250.000),
(5003,3,'2026-05-03',120.500),
(5004,4,'2026-05-04',1850.750),
(5005,5,'2026-05-05',450.250);
-- 1.
select customers.customer_name, orders.order_id,orders.order_date
from customers
inner join orders
on customers.customer_id = orders.customer_id;
-- 2.
select products.product_name, products.price,categories.category_name
from products
inner join categories
on products.category_id = categories.category_id;
-- 3.
select customers.customer_name, orders.total
from customers
inner join orders
on customers.customer_id = orders.customer_id
where orders.total>1000;
-- 4.
select customers.customer_name, orders.order_id
from customers
inner join orders
on customers.customer_id = orders.customer_id
where customers.city='Colombo';
-- Activity 4
create database technovaDB;
use technovaDB;
create table department(
dept_id int unique primary key,
dept_name varchar(100) not null
);
create table employees(
emp_id int unique primary key,
emp_name varchar(100) not null,
dept_id int,
foreign key (dept_id) references department(dept_id)
);
create table companycars(
car_id int unique primary key,
car_model varchar(100) not null,
emp_id int,
foreign key (emp_id) references employees(emp_id)
);
insert into department values
(1,'Human Resources'),
(2,'Finance'),
(3,'Software Engineering'),
(4,'Marketing'),
(5,'Customer Support'),
(6,'Research and Development'),
(7,'Legal Division');
insert into companycars values
(201,'Toyota Prius',101),
(202,'Honda Vezel',102),
(203,'Suzuki WagonR',103),
(204,'Nissan Leaf',104),
(205,'Toyota Aqua',105),
(206,'Honda Civic',null),
(207,'Toyota Corolla',null),
(208,'Suzuki Alto',null);
insert into employees values
(101,'Kamal Perera',1),
(102,'Nimali Silva',2),
(103,'Sahan Fernando',3),
(104,'Dilani Peris',4),
(105,'Ashan Kumar',5),
(106,'Ravindu Silva',1),
(107,'Nethmi Fernando',3),
(108,'Pasindu Perera',5),
(109,'Chathura Silva',null),
(110,'Ishara Perera',null),
(111,'Dinuka Fernando',null);
-- 1.
select employees.emp_name, department.dept_name
from employees
inner join department
on employees.dept_id = department.dept_id;
-- 2.
select employees.emp_name, companycars.car_model
from employees
left join companycars
on employees.emp_id = companycars.emp_id;
-- 3.
select employees.emp_name, department.dept_name
from employees
left join department
on employees.dept_id = department.dept_id;
-- 4.
select employees.emp_name, department.dept_name
from employees
right join department
on employees.dept_id = department.dept_id;
-- 5.
select companycars.car_model,employees.emp_name
from employees
right join companycars
on employees.emp_id = companycars.emp_id;
