create database erd;
use erd;

create table phieuXuat(
SoPX int not null primary key auto_increment,
ngaySuat datetime);

create table VatTu(
MaVatTu int not null primary key auto_increment,
TenVatTu varchar(60) not null);

create table PhieuNhap(
SoPN int not null primary key auto_increment,
NgayNhap datetime);

create table NHACC(
MaNCC int not null primary key auto_increment,
TenNCC varchar(60) not null,
DiaChi varchar(60) not null,
phone varchar(13) unique);

create table DonDH(
SoDH int not null primary key auto_increment,
NgayDH datetime,
MANCC int,
foreign key(MaNCC) references NHACC(MaNCC));

create table ChiTietPhieuXuat
(
	SoPx 		int,
	MaVatTu 	int,
    DGXuat 		float,
	SLXuat 		int,
	primary key(SoPX, MaVatTu),
	foreign key (SoPX) references phieuxuat (SoPX),
	foreign key (MaVatTu) references VatTu (MaVatTu)
);

create table ChiTietPhieuNhap(
MaVatTU int,
SoPN int,
DGNhap float,
SLNhap int,
primary key(MaVatTu,SoPN),
foreign key(MaVatTu) references VatTu(MaVatTu),
foreign key(SoPN) references PhieuNhap(SoPN));

create table ChiTietDonDatHang(
MaVatTu int,
SoDH int,
primary key (MaVatTu,SoDH));

alter table ChiTietDonDatHang
add  foreign key(MaVatTu) references VatTU(MAVAttu),
add foreign key (SoDH) references DonDH(SoDH);








