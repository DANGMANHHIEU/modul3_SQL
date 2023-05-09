create database quanli;
use quanli;

create table class(
classID int not null primary key auto_increment,
className varchar(60) not null,
startTime datetime not null,
status bit );

create table student(
studentID int not null primary key auto_increment,
studentName varchar(30) not null ,
address varchar(50),
phone varchar(20),
status bit,
classID int not null,
foreign key(classID) references class(classID));

create table subject(
subId int not null primary key auto_increment,
subName varchar(30) not null,
credit tinyint not null default 1 check(credit>=1),
status bit default 1);

create table mark(
markID int not null primary key auto_increment,
subID int not null unique,
studentID int not null unique,
foreign key(subID) references subject(subID),
foreign key(studentID) references student(studentID),
mark float default 0 check ( mark between 0 and 100),
examTimes tinyint default 1);

-- hiển thị sinh viên ở từng nơi --
select address, count(studentID) as ' số lượng học viên'
from student
group by address;
 
 -- tính điểm trung bình các môn học của mỗi học viên --
 select s.studentID, s.studentName, avg(mark)
 from student s join mark m on s.studentID = m.studentID
 group by studentID,studentName;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15 --
select s.studentID, s.studentName , avg(mark)
from student s join mark m on s.studentID = m.studentID
group by studentID,studentName
having avg(mark)>15;

-- hiển thị thông tin học viên có điểm trung bình  lớn nhất --
select s.studentID,s.studentName, avg(mark)
from student s join mark m on s.studentID = m.studentID
group by studentID, studentName
having avg(mark) >= all (select avg(mark) from mark group by mark.studentID);

-- hiển thị thông tin môn học có credit lớn nhất --
set @max = (select max(credit) from subject);
select subName,credit
from subject
group by subName,credit5
having credit= @max;

-- hiển thị các thông tin môn học có điểm thi lớn nhất --

set @max= (select max(mark) from mark);

select  s.studentName, c.className, sub.subName, m.mark
from class c join student s on c.classID = s.classID join mark m on s.studentID = m.studentID join subject sub on m.subId = sub.subID
group by sub.subname, s.studentName, c.className, m.mark
having mark = @max;

-- hiển thị thông tin sinh viên và điểm trung bình mỗi sinh viên, xếp hạng theo thứ tự giảm dần --

select s.studentID, s.studentName, c.className, sub.subName,avg(mark) as tb
from class c join student s on c.classID = s.classID join mark m on s.studentID = m.studentID join subject sub on m.subId = sub.subID
group by sub.subname, s.studentID
having avg(mark) 
order by tb desc;