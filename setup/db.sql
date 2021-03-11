drop table customer;

CREATE TABLE CUSTOMER 
   (	NAME VARCHAR2(30 BYTE) NOT NULL, 
	EMAIL VARCHAR2(30 BYTE) NOT NULL, 
	C_ID NUMBER NOT NULL, 
	C_BALANCE NUMBER(20,10), 
	 PRIMARY KEY (C_ID));
	 
insert into customer(name, email, c_balance, c_id) values ('Radha', 'radha@gmail.com', 10000, 01);
insert into customer(name, email, c_balance, c_id) values ('vasudev', 'vasudev@gmail.com', 10000, 02);
insert into customer(name, email, c_balance, c_id) values ('astha', 'astha@gmail.com', 10000, 03);
insert into customer(name, email, c_balance, c_id) values ('ram', 'ram@gmail.com', 10000, 04);
insert into customer(name, email, c_balance, c_id) values ('shyam', 'shyam@gmail.com', 10000, 05);
insert into customer(name, email, c_balance, c_id) values ('hari', 'hari@gmail.com', 10000, 06);
insert into customer(name, email, c_balance, c_id) values ('madhav', 'madhav@gmail.com', 10000, 07);
insert into customer(name, email, c_balance, c_id) values ('lucy', 'lucy@gmail.com', 10000, 08);
insert into customer(name, email, c_balance, c_id) values ('gauri', 'gauri@gmail.com', 10000, 09);

drop table TRANSACTION;

CREATE TABLE TRANSACTION 
(
  TR_ID NUMBER NOT NULL primary key
, SENDER_ID NUMBER NOT NULL
, RECEIVER_ID NUMBER NOT NULL 
, AMOUNT NUMBER(20,10) NOT NULL 
, TIME_STAMP TIMESTAMP NOT NULL 
);
