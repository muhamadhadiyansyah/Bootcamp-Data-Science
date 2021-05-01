show databases;
create database hotel_db;
use hotel_db;
create table hotel(
    -> hotelno varchar(10),
    -> hotelname varchar(20),
    -> city varchar(20),
    -> primary key (hotelno)
    -> );
show tables;
describe hotels;
insert into hotel values ('fb01', 'Grosvenor', 'London');
insert into hotel
    -> values ('fb02', 'Watergate', 'Paris'),
    -> ('ch01', 'Omni Shoreham', 'London'),
    -> ('ch02', 'Phoenix Park', 'London');
insert into hotel values ('dc01', 'Latham', 'Berlin');
select * from hotel;
create table guests (
    -> guestno numeric(5),
    -> guestname varchar(20),
    -> guestaddress varchar(50),
    -> primary key (guestno));
show tables;
describe guests;
insert into guests values
    -> (10001, 'John Kay', '56 High St, London'),
    -> (10002, 'Mike Ritchie', '18 Tain St, London'),
    -> (10003, 'Mary Tregear', '5 Tarbot Rd, Aberdeen'),
    -> (10004, 'Joe Keogh', '2 Fergus Dr, Aberdeen'),
    -> (10005, 'Carol Farrel', '6 Achray St, Glasgow'),
    -> (10006, 'Tina Murphy', '63 Well St, Glasgow'),
    -> (10007, 'Tony Shaw', '12 Park Pl, Glasgow');
select * from guests;
create table room(
    -> roomno numeric(5),
    -> hotelno varchar(10),
    -> type varchar(10),
    -> price decimal(5,2),
    -> primary key (roomno, hotelno),
    -> foreign key (hotelno) REFERENCES hotel(hotelno));
show tables;
describe room;
insert into room values
    -> (601, 'fb01', 'double', 29),
    -> (701, 'fb01', 'family', 39),
    -> (1001, 'fb02', 'single', 58),
    -> (1101, 'fb02', 'double', 86),
    -> (1001, 'ch01', 'single', 29.99),
    -> (1101, 'ch01', 'family', 59.99),
    -> (701, 'ch02', 'single', 10),
    -> (801, 'ch02', 'double', 15),
    -> (901, 'dc01', 'single', 18),
    -> (1001, 'dc01', 'double', 30),
    -> (1101, 'dc01', 'family', 35);
select * from room;
 create table booking(
    -> hotelno varchar(10),
    -> guestno numeric(5),
    -> datefrom date,
    -> dateto date,
    -> roomno numeric(5),
    -> primary key (hotelno, guestno, datefrom),
    -> foreign key (roomno, hotelno) REFERENCES room(roomno, hotelno),
    -> foreign key (guestno) REFERENCES guests(guestno));
show tables;
describe booking;
insert into booking values
    -> ('fb01', 10001, '04-04-01', '04-04-08', 501),
    -> ('fb01', 10004, '04-04-15', '04-05-15', 601),
    -> ('fb01', 10005, '04-05-02', '04-05-07', 501),
    -> ('fb01', 10002, '16-05-04', '04-05-29', 601),
    -> ('fb01', 10001, '04-05-01', null, 701),
    -> ('fb02', 10003, '04-04-05', '10-04-04', 1001),
    -> ('fb02', 10005, '04-05-12', '30-05-04', 1101),
    -> ('ch01', 10006, '04-04-21', null, 1101),
    -> ('ch02', 10002, '04-04-25', '04-05-06', 801),
    -> ('dc01', 10007, '04-05-13', '04-05-15', 1001),
    -> ('dc01', 10003, '04-05-20', null, 1001);
select * from booking;
