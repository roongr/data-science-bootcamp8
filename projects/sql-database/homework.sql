-- restaurant database

-- 5 tables
-- write 3-5 queries
-- 1x WITH
-- 1x SUBQUERY
-- 1x AGGREGATE FUNCTION

.open restaurant.db
.mode column
.header on

drop table menus;
drop table customers;
drop table employee;
drop table receipt;
drop table satisfaction;

-- CREATE TABLE
CREATE TABLE menus (
  menu_id int,
  menus_name text,
  menus_price int
);

CREATE TABLE customers (
  customer_id int,
  customer_name text
);

CREATE TABLE employee (
  employee_id int,
  employee_name text
);

CREATE TABLE receipt (
  receipt_id int,
  customer_id int,
  employee_id int,
  menu_id int
);

CREATE TABLE satisfaction (
  customer_id int,
  satisfaction_id int,
  clean int,
  taste int,
  service int,
  price int
);

-- INSERT INTO
insert into customers VALUES
	  (1, 'Roong'),
    (2, 'Friend'),
    (3, 'Baipor'),
    (4, 'Fah'),
    (5, 'Aoom'),
    (6, 'Se');
insert into employee VALUES
  	(1, 'John'),
    (2, 'Palm'),
    (3, 'Joryor'),
    (4, 'Aii');
insert into menus values
	  (1, 'steak', 150),
    (2, 'salad', 70),
    (3, 'Burger', 80),
    (4, 'spagetti', 120),
    (5, 'pizza', 230),
    (6, 'cake', 100),
    (7, 'sushi', 80),
    (8, 'coke', 30),
    (9, 'noodles', 60);
insert into receipt VALUES
    (1, 1, 3, 6),
    (1, 1, 3, 2),
    (1, 1, 3, 8),
    (2, 3, 1, 1),
    (2, 3, 1, 7),
    (2, 3, 1, 4),
    (4, 5, 4, 1),
    (3, 4, 2, 5),
    (3, 4, 2, 1),
    (5, 3, 4, 8),
    (6, 6, 4, 9),
    (7, 6, 3, 2),
	  (7, 6, 3, 5),
	  (8, 1, 2, 1),
	  (9, 3, 1, 3);
insert into satisfaction VALUES
  	(1, 5, 5, 4, 4, 1),
    (2, 5, 5, 5, 5, 2),
    (3, 4, 3, 4, 4, 3),
    (4, 5, 5, 4, 4, 4),
    (5, 4, 4, 5, 5, 5),
    (6, 4, 5, 5, 4, 6);

-- QUERY FIND CUSTOMER WHO IS MAX SALE
with sales as (
  	select
	  rec.receipt_id,
    cus.customer_name,
    emp.employee_name,
    menu.menus_name,
    menu.menus_price
	from receipt AS rec
	join customers AS cus on rec.customer_id = cus.customer_id
	join employee AS emp on rec.employee_id = emp.employee_id
	JOIN menus AS menu on rec.menu_id = menu.menu_id)
SELECT 
	name,
	max(sale_sum) total
from(select 
	  sales.customer_name name,
    sum(sales.menus_price) sale_sum
from sales
group by 1);

-- QUERY BAIPOR'S MENU
select
    cus.customer_name,
    menu.menus_name menu,
    menu.menus_price
from receipt rec
join customers cus on rec.customer_id = cus.customer_id
join employee emp on rec.employee_id = emp.employee_id
JOIN menus menu on rec.menu_id = menu.menu_id
join satisfaction sat on sat.customer_id = cus.customer_id
where cus.customer_name = 'Baipor';
