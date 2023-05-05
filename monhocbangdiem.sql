create database QuanLiDiemThi;
use QuanLiDiemThi;

create table HocSinh(
MaHS varchar(20) primary key not null,
TenHS varchar(60),
NgaySinh datetime,
Lop varchar(20),
GT varchar(20));

create table MonHoc(
MaMH varchar(20) primary key not null,
TenMH varchar(25),
MaGV varchar(20));

create table BangDiem(
MaHS varchar(20),
MaMH varchar(20),
DiemThi int,
NgayKT datetime,
primary key (MaHS,MaMH),
foreign key (MaHS) references HocSinh(MaHS),
foreign key (MaMH) references MonHoc(MaMH));

insert into HocSinh values ("SV123","Hieu","1996-12-26","CODEGYM","C0223G1");
insert into MonHoc values ("123","Java","123456789");
insert into BangDiem values("SV123","123",8,"2022-12-12");