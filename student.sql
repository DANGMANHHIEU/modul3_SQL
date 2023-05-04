create database `students`;
create table `students`.`class`(
`id` int not null auto_increment primary key,
`name` varchar(45))
select * from class;
insert into class(name) values("Hieu"),("Cong");
create table `students`.`teacher`(
`id` int not null auto_increment primary key,
`name` varchar(45),
`age` int ,
`country` varchar(45))
select * from teacher;
insert into teacher(name,age,country) values("Hieu", 27,"ND");
insert into teacher(name,age,country) values("Anh", 28,"ND");

