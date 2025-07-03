create database payment;
use payment;

create table transactions(
	customer_id int primary key,
    customer_name varchar(50),
    mode varchar(50),
	city varchar(50)
);

insert into transactions
(customer_id,customer_name,mode,city)
values
(101,'Olivia baret','Netbanking','portland'),
(102,'Ethen sinclar','Credit Card','Miami'),
(103,'Maya hernadiz','Credit Card','seathel'),
(104,'Liam','Netbanking','Denver'),
(105,'sofia','Credit Card','New orlans'),
(106,'Caleb','Debit card','portland'),
(107,'Ava','Debit Card','portland'),
(108,'Lucas','Netbanking','phoenix'),
(109,'Isabel','Netbanking','nashylle'),
(110,'JAckson','Credit card','Boston');


select mode,count(customer_name)
from transactions
group by mode
order by count(customer_name) asc;