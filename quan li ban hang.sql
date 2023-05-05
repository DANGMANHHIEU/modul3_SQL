create database quanlibanhang;
use quanlibanhang;

create table customer(
cID int not null primary key auto_increment,
cName varchar(60) not null,
cage datetime);

create table product(
pID int not null primary key auto_increment,
pName varchar(60) not null,
pPrice float);

create table ORDERS (
oID int not null primary key auto_increment,
cid int ,
foreign key(cid) references customer(cid),
odate datetime,
ototalPrice float);

create table orderdetail(
oid int,
pid int,
primary key(oid,pid),
foreign key (oid) references orders(oid),
foreign key(pid) references product(pid),
odQTY int not null);

