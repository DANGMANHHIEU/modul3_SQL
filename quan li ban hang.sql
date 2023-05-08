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

alter table customer 
modify cage int not null;

-- nhập liệu --
insert into customer(cName,cage) values ('Minh Quan',10),('Ngoc Oanh',20),('Hong Ha',50); 

insert into orders(cid,odate,ototalprice) values (1,'2006-3-21',default),(2,'2006-3-23',default),(1,'2006-3-16',default);

insert into product(pName,pPrice) values ('May Giạt',3),('Tu Lanh',5),('Dieu Hoa',7),('Quat',1),('Bep Dien',2);

insert into orderdetail values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

-- hiển thị danh sách đã mua hàng và danh sách sản phẩm được mua bởi khách hàng --
select c.cname, p.pName, count(p.pname) as "Số lần mua"
from customer c inner join orders on c.cid = orders.cid
 inner join orderdetail o on orders.oid = o.oid 
 inner join product p on p.pid=o.pid
 group by  c.cname,p.pname;

-- hiển thị những khách hàng không mua bất kì sản phẩm nào --
select c.cname
from orders od right join customer c on od.cid = c.cid
where od.cid is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn --
select  orders.oID, orders.oDATE, sum(product.pPrice * OrderDetail.odQTY) as 'total'
from orders inner join OrderDetail on orders.oID = OrderDetail.oID
inner join product on orderdetail.pid = product.pid
group by  orders.oID, orders.oDATE;
