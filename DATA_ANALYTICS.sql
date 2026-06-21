create database Data_Analytics;
use Data_Analytics;

create table departments(
dept_id int primary key,
dept_name varchar(50),
location varchar(70)
);
select * from departments;

create table employess(
emp_id int primary key,
emp_name varchar(50),
dept_id int,
dept_name int,
manager_id int,
salary int,
hire_date date,
city varchar(50),
foreign key (dept_id) references departments (dept_id)
);

create table customers(
customer_id int primary key,
customer_name varchar(50),
city varchar(50),
signup_date date);

create table orders(
order_id int primary key,
customer_id int,
order_date date,
amount decimal(10,4),
status varchar(50),
foreign key (customer_id) references customers (customer_id)
);

create table products(
product_id int primary key,
product_name varchar(50),
category varchar(60),
price decimal(10,4)
);

create table order_items(
order_item_id int primary key,
order_id int,
product_id int,
quantity int,
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);

-- > RENAME COLUMN EMP_NAME TO EMPLOYEE_NAME.
alter table employess rename column emp_name to employee_name;
select * from employess;

-- > DROP COLUMN CITY FROM EMPLOYEES.
alter table employess drop column city;
select * from employess;

-- > MODIFY ORDERS TABLE WITH AMOUNT HAVING 2 DECIMAL POINTS.
alter table orders modify column amount decimal(10,2);

-- > DROP THE PRODUCTS TABLE.
drop table products;

-- > TRUNCATE THE ORDER_ITEMS TABLE.
truncate table order_items;

-- > MODIFY SALARY COLUMN TO BIGINT.
alter table employess modify column salary bigint;

-- > INSERTING VALUES INTO TABLES
Insert into departments values
(101,'IT','Chennai'),
(102,'HR','Bangalore'),
(103,'Finance','Mumbai'),
(104,'Sales','Delhi'),
(105,'Marketing','Hyderabad'),
(106,'Support','Pune');
select * from departments;

INSERT INTO employess VALUES
(1,'Ravi',101,101,NULL,90000,'2018-05-10'),
(2,'Arun',101,101,1,70000,'2021-03-15'),
(3,'Ajay',101,101,1,65000,'2022-01-12'),
(4,'Kumar',101,101,1,55000,'2019-07-20'),
(5,'Anitha',101,101,1,60000,'2023-04-01'),
(6,'Aakash',101,101,1,50000,'2021-08-10'),
(7,'Priya',102,102,NULL,80000,'2017-02-15'),
(8,'Sneha',102,102,7,45000,'2022-06-10'),
(9,'Divya',102,102,7,42000,'2023-01-05'),
(10,'Vijay',103,103,NULL,95000,'2016-09-12'),
(11,'Karthik',103,103,10,55000,'2021-11-25'),
(12,'Meena',103,103,10,58000,'2020-05-18'),
(13,'Suresh',104,104,NULL,85000,'2018-08-01'),
(14,'Rahul',104,104,13,48000,'2022-03-15'),
(15,'Deepak',104,104,13,47000,'2023-02-20'),
(16,'Lakshmi',105,105,NULL,88000,'2019-04-11'),
(17,'Pooja',105,105,16,52000,'2021-07-22'),
(18,'Manoj',106,106,NULL,75000,'2018-12-10'),
(19,'Hari',106,106,18,40000,'2022-09-14'),
(20,'Ashwin',106,106,1,30000,'2024-01-10');
select * from employess;

INSERT INTO customers VALUES
(1,'Ram','Chennai','2023-01-10'),
(2,'Shyam','Chennai','2023-02-15'),
(3,'Arun Kumar','Chennai','2023-03-20'),
(4,'Priya','Chennai','2023-04-01'),
(5,'Meena','Chennai','2023-05-10'),
(6,'Vijay','Chennai','2023-06-15'),
(7,'Kiran','Chennai','2023-07-18'),
(8,'Divya','Chennai','2023-08-20'),
(9,'Pooja','Chennai','2023-09-11'),
(10,'Hari','Chennai','2023-10-05'),
(11,'Ajay','Chennai','2023-11-15'),
(12,'Rakesh','Mumbai','2024-01-01'),
(13,'Sonia','Delhi','2024-01-15'),
(14,'Karthik','Bangalore','2024-02-01'),
(15,'Lakshmi','Hyderabad','2024-02-15'),
(16,'Deepa','Madurai','2024-03-01'),
(17,'Naveen','Coimbatore','2024-03-15'),
(18,'Anu','Pune','2024-04-01'),
(19,'Kumar','Salem','2024-04-15'),
(20,'Rani','Trichy','2024-05-01');
select * from customers;

INSERT INTO products VALUES
(1,'Laptop Pro','Electronics',75000),
(2,'Mobile Pro','Electronics',50000),
(3,'Smart Watch','Electronics',12000),
(4,'Headphones','Electronics',3000),
(5,'Office Chair','Furniture',8000),
(6,'Study Table','Furniture',12000),
(7,'Notebook','Stationery',100),
(8,'Printer','Electronics',15000),
(9,'Gaming Pro Mouse','Electronics',2500),
(10,'Keyboard','Electronics',2000),
(11,'Pen Pack','Stationery',500),
(12,'Water Bottle','Accessories',700);
select * from products;

INSERT INTO orders VALUES
(101,1,'2024-01-05',80000,'Completed'),
(102,2,'2024-01-10',50000,'Completed'),
(103,3,'2024-01-15',15000,'Pending'),
(104,4,'2024-02-01',12000,'Completed'),
(105,5,'2024-02-15',3000,'Cancelled'),
(106,6,'2024-03-01',2500,'Completed'),
(107,7,'2024-03-10',12000,'Completed'),
(108,8,'2024-04-05',50000,'Pending'),
(109,9,'2024-04-15',75000,'Completed'),
(110,10,'2024-05-01',2000,'Completed'),
(111,11,'2024-05-15',8000,'Completed'),
(112,12,'2024-06-01',12000,'Completed');
select * from orders;

INSERT INTO order_items VALUES
(1,101,1,1),
(2,102,2,1),
(3,103,8,1),
(4,104,3,1),
(5,105,4,1),
(6,106,9,1),
(7,107,6,1),
(8,108,2,1),
(9,109,1,1),
(10,110,10,1),
(11,111,5,1),
(12,112,3,1);
select * from order_items;

-- > UPDATE SALARY OF EMPLOYEES WORKING IN DEPT 101.
update employess set salary = salary + 5000 where dept_id=101;
select * from employess;

-- > INCREASE SALARY BY 10% FOR ALL EMPLOYEES.
set sql_safe_updates=0;
update employess set salary = salary * 1.10;
select * from employess;

-- > DELETE EMPLOYEES WITH SALARY < 20000.
delete from employess where salary <20000;
select * from employess;

-- > UPDATE CITY AS ‘BANGALORE’ FOR ALL CUSTOMERS.
update customers set city = 'Bangalore';
select * from customers;

-- > DELETE ORDERS WITH STATUS = 'CANCELLED'.
DELETE FROM orders WHERE order_id = 105;
select * from orders;

-- > INSERT DATA INTO ORDERS USING SELECT.
INSERT INTO orders(order_id, customer_id, order_date, amount, status)
SELECT
customer_id + 500,
customer_id,
CURDATE(),
2000,
'Pending'
FROM customers
WHERE customer_id <= 5;
select * from orders;

--  >UPDATE DEPARTMENT FOR A SPECIFIC EMPLOYEE.
update departments set dept_name = 'Tele_Caller' where dept_id=106;
select * from departments;

-- > DELETE ALL RECORDS FROM ORDER_ITEMS.
delete from order_items;
select * from order_items;

-- > INSERT TODAY’S DATE INTO ORDER_DATE.
insert into orders values (301, 1, CURDATE(), 5000, 'Pending');
select * from orders;

-- > UPDATE NULL CITY VALUES AS ‘UNKNOWN’.
update customers set city='Unknown' where city is null;
select * from customers;

-- > INSERT DATA RESPECTING FOREIGN KEY CONSTRAINTS.
insert into orders values (150, 1, '2024-06-18', 5000, 'Pending');
select * from orders;

-- >  ROLL BACK A DELETE OPERATION (USING TRANSACTION).
start transaction;
delete from orders where status='pending';
select * from orders;
rollback;
select * from orders;

-- > FETCH ALL RECORDS FROM EMPLOYEES.
select * from employess;

-- > DISPLAY ONLY EMP_NAME AND SALARY.
select employee_name,salary from employess;

-- > FIND EMPLOYEES WITH SALARY > 50000.
select * from employess where salary > 50000;

-- > DISPLAY DISTINCT CITIES OF CUSTOMERS.
select  distinct city orders from customers;

-- > SORT EMPLOYEES BY SALARY DESCENDING.
select * from employess order by salary desc;

-- > DISPLAY TOP 5 HIGHEST PAID EMPLOYEES.
select * from employess order by salary desc limit 5;

-- > FIND EMPLOYEES HIRED AFTER 2020.
select * from employess where year(hire_date) > 2020;

-- > DISPLAY EMPLOYEES FROM CHENNAI.
select * from customers where city='chennai'; 

-- > FETCH ORDERS PLACED IN 2024.
select * from orders where year(order_date)=2024;

-- > SHOW PRODUCTS UNDER ‘ELECTRONICS’ CATEGORY.
select * from products where category ='Electronics';

-- > COUNT EMPLOYEES IN EACH DEPARTMENT.
select dept_name , count(emp_id) as total_employee from employess group by dept_name;

-- > SHOW DEPARTMENTS HAVING MORE THAN 5 EMPLOYEES.
select dept_name , count(emp_id) as total_employee from employess group by dept_name having total_employee>5;

-- > CALCULATE TOTAL SALARY PER DEPARTMENT.
select dept_name,sum(salary) as total_salary from employess group by dept_name ;

-- > DISPLAY AVERAGE SALARY PER DEPARTMENT.
select dept_name,avg(salary) as average_salary from employess group by dept_name ;

-- > FIND CITIES HAVING MORE THAN 10 CUSTOMERS. 
select city,count(customer_id) as total_customers from customers group by city having total_customers>10;

-- > ORDER DEPARTMENTS BY TOTAL SALARY.
select dept_name,sum(salary) as total_salary from employess group by dept_name order by total_salary desc;

-- > FIND MAX SALARY IN EACH DEPARTMENT.
select dept_name,max(salary) as maximum_salary from employess group by dept_name; 

-- > SHOW MINIMUM ORDER AMOUNT PER CUSTOMER.
select customer_id,min(amount) as minimum_amount from orders group by customer_id;

-- > FETCH ONLY DEPARTMENTS WITH AVG SALARY > 60000.
select dept_name,avg(salary) as average_salary from employess group by dept_name having average_salary>60000;

-- > DISPLAY COUNT OF ORDERS BY STATUS.
select status,count(order_id) as total_count from orders group by status;

-- > INNER JOIN EMPLOYEES AND DEPARTMENTS.
select employess.employee_name,departments.dept_name
from employess
inner join departments
on employess.dept_id=departments.dept_id;

-- > LEFT JOIN EMPLOYEES WITH DEPARTMENTS.
select employess.employee_name,departments.dept_name
from employess
left join departments
on employess.dept_id=departments.dept_id;

-- > RIGHT JOIN EMPLOYEES WITH DEPARTMENTS.
select employess.employee_name,departments.dept_name
from employess
right join departments
on employess.dept_id=departments.dept_id;

-- > FIND EMPLOYEES WITHOUT DEPARTMENT.
select employess.employee_name
from employess
left join departments
on employess.dept_id=departments.dept_id
where departments.dept_id IS NULL;

-- > FIND DEPARTMENTS WITHOUT EMPLOYEES.
select departments.dept_name
from departments
left join employess
on departments.dept_id=employess.dept_id
where employess.dept_id IS NULL;

-- > JOIN CUSTOMERS AND ORDERS.
select customers.customer_name,orders.order_id
from customers
inner join orders
on customers.customer_id=orders.customer_id;

-- > FETCH CUSTOMER NAME AND TOTAL ORDER AMOUNT.
select customers.customer_name,sum(orders.amount) as total_amount
from customers
inner join orders
on customers.customer_id=orders.customer_id
group by customers.customer_name;

-- > JOIN ORDERS AND ORDER_ITEMS.
select orders.order_id,order_items.order_item_id
from orders
inner join order_items
on orders.order_id=order_items.order_id;

-- > JOIN PRODUCTS AND ORDER_ITEMS.
select products.product_name,order_items.order_item_id
from products
inner join order_items
on products.product_id=order_items.product_id;

-- > FIND TOTAL QUANTITY SOLD PER PRODUCT.
SELECT product_id, SUM(quantity) AS total_quantity_sold
FROM order_items GROUP BY product_id;

-- > SELF JOIN TO FIND EMPLOYEE-MANAGER PAIRS.
select e.employee_name as employee,
m.employee_name as manager
from employess e
left join employess m
on e.manager_id=m.emp_id;

-- > JOIN 3 TABLES: ORDERS, ORDER_ITEMS, PRODUCTS.
select orders.order_id,products.product_name,order_items.order_item_id
from orders
inner join order_items
on orders.order_id=order_items.order_id
inner join products
ON order_items.product_id = products.product_id;

-- > FIND HIGHEST SELLING PRODUCT.
SELECT p.product_name, SUM(od.quantity) AS total_sold
FROM products p
JOIN order_items od
ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 1;

-- > SHOW EMPLOYEES AND THEIR DEPARTMENT LOCATIONS.
select employess.employee_name,departments.location
from employess
inner join departments
on employess.dept_id=departments.dept_id;

-- > FIND EMPLOYEES WHOSE NAME STARTS WITH ‘A’.
select * from employess where employee_name like'A%';

-- > FIND CUSTOMERS WHOSE CITY ENDS WITH ‘AI’.
select customer_name,city from customers where city like '%ai';

-- > FETCH PRODUCTS CONTAINING WORD ‘PRO’.
select product_name from products where product_name like '%Pro%';

-- > DISPLAY TOP 3 EXPENSIVE PRODUCTS.
select product_name,price from products order by price desc limit 3;

-- > SKIP FIRST 5 EMPLOYEES AND FETCH NEXT 5.
select * from employess limit 5,5;

-- > FIND TOTAL SALARY PAID.
select  sum(salary) as total_salary from employess;

-- > FIND AVERAGE ORDER AMOUNT.
select avg(amount) as average_order_amount from orders;

-- > COUNT TOTAL NUMBER OF ORDERS.
select count(order_id) as total_orders from orders;

-- > FIND HIGHEST PRODUCT PRICE.
select max(price) as maximum_price from products;

-- > FIND LOWEST EMPLOYEE SALARY.
select min(salary) as minimum_salary from employess;

-- > COMBINE CUSTOMER AND EMPLOYEE CITIES USING UNION.
SELECT city
FROM customers
UNION
SELECT city
FROM employess;

-- > USE UNION ALL TO MERGE TWO TABLES.
select customer_name
from customers
union all
select employee_name
from employess;

-- > RENAME SALARY AS MONTHLY_SALARY.
alter table employess rename column salary to Monthly_salary;
select * from employess;

-- > ALIAS TABLE NAMES IN JOINS.
select c.customer_name, o.order_id
from customers c
join orders o
on c.customer_id = o.customer_id;

-- > DISPLAY CALCULATED COLUMN WITH ALIAS.
select product_name,price * 1.10 AS increased_price from products;

-- > FIND EMPLOYEES EARNING MORE THAN AVERAGE SALARY.
select * from employess where monthly_salary > (select avg(monthly_salary) as average_salary from employess);

-- > FIND SECOND HIGHEST SALARY.
select * from employess where monthly_salary = (select max(monthly_salary) from employess where monthly_salary < (select max(monthly_salary) from employess));

-- > ORDERS WITH AMOUNT GREATER THAN AVG ORDER AMOUNT.
select * from orders where amount > (select avg(amount) from orders);

-- > CREATE A VIEW FOR EMPLOYEE DETAILS WITH DEPARTMENT.
create view vwEmployee_Details as
select employess.emp_id,departments.dept_name
from employess
join departments
on employess.dept_id=departments.dept_id;
select * from vwEmployee_details;

-- > CREATE VIEW FOR CUSTOMER TOTAL PURCHASE.
create view vwTotal_purchase as
select customers.customer_name ,sum(orders.amount) AS total_purchase
from customers
join orders
on customers.customer_id=orders.customer_id
group by customers.customer_name;
select * from vwtotal_purchase;

-- > UPDATE DATA USING VIEW.
create view veEmployee as 
select employess.emp_id,employee_name, monthly_salary FROM employess;
update veEmployee
set monthly_salary = 50000
where emp_id = 1;
select * from veEmployee;

-- > DROP A VIEW
drop view veEmployee;

-- > CREATE INDEX ON EMP_NAME.
create index idx_name on employess(employee_name);

-- > CREATE COMPOSITE INDEX ON CUSTOMER_ID AND ORDER_DATE.
create index idx_id_date on orders(customer_id,order_id);

-- > DROP AN INDEX.
drop index idx_id_date on orders;

-- > CREATE STORED PROCEDURE TO FETCH ALL EMPLOYEES.
delimiter //
create procedure 

-- > STORED PROCEDURE TO GET EMPLOYEES BY DEPT_ID.


-- > STORED PROCEDURE TO INSERT EMPLOYEE RECORD.


-- > STORED PROCEDURE WITH IN AND OUT PARAMETERS.


-- > CREATE FUNCTION TO CALCULATE YEARLY SALARY.


-- > FUNCTION TO RETURN TOTAL ORDER AMOUNT FOR CUSTOMER.


-- > CALL STORED PROCEDURE AND FUNCTION.






