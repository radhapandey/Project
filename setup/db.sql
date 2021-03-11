drop table customer;

CREATE TABLE CUSTOMER 
   (	NAME VARCHAR2(30 BYTE) NOT NULL, 
	EMAIL VARCHAR2(30 BYTE) NOT NULL, 
	C_ID NUMBER NOT NULL, 
	C_BALANCE NUMBER(20,10), 
	 PRIMARY KEY (C_ID));
	 
insert into customer(name, email, c_balance, c_id) values ('Radha', 'radha989@gmail.com', 10000, 01);
insert into customer(name, email, c_balance, c_id) values ('Vasudev', 'vasudev11@gmail.com', 10000, 02);
insert into customer(name, email, c_balance, c_id) values ('Astha', 'astha.p3@gmail.com', 10000, 03);
insert into customer(name, email, c_balance, c_id) values ('Nistha', 'nis728@gmail.com', 10000, 04);
insert into customer(name, email, c_balance, c_id) values ('Ayushi', 'ay892@gmail.com', 10000, 05);
insert into customer(name, email, c_balance, c_id) values ('John', 'john.wick@gmail.com', 10000, 06);
insert into customer(name, email, c_balance, c_id) values ('Tim', 'tim92@gmail.com', 10000, 07);
insert into customer(name, email, c_balance, c_id) values ('Prateek', 'pta78@gmail.com', 10000, 08);
insert into customer(name, email, c_balance, c_id) values ('Neha', 'neha123@gmail.com', 10000, 09);
insert into customer(name, email, c_balance, c_id) values ('Ram', 'ram001@gmail.com', 10000, 10);


drop table TRANSACTION;

CREATE TABLE TRANSACTION 
(
  TR_ID NUMBER NOT NULL primary key
, SENDER_ID NUMBER NOT NULL
, RECEIVER_ID NUMBER NOT NULL 
, AMOUNT NUMBER(20,10) NOT NULL 
, TIME_STAMP TIMESTAMP NOT NULL 
);
