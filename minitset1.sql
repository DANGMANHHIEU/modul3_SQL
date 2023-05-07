create database minitest1;
use minitest1;

create table Address(
id int not null primary key auto_increment,
address varchar(255));

create table Classes(
id int not null primary key auto_increment,
name varchar(255),
language varchar(255),
 description text(1000));
 
 create table Students(
 id int not null primary key auto_increment,
 fullname varchar(255),
 address_id int,
 foreign key(address_id) references Address(id),
 phone varchar(13) unique,
 classes_id int,
 foreign key(classes_id) references Classes(id));
 
 create table Course(
 id int not null primary key auto_increment,
 name varchar(255),
 description text(1000));
 
create table Point(
id int not null primary key auto_increment,
course_id int,
foreign key(course_id) references Course(id),
student_id int,
foreign key(student_id) references Students(id),
point float);

alter table students 
add age int check(age>=18) ;

 
  -- thêm 5 bản ghi trong bảng Address--
 insert into Address(address) values("Nam Định"),("Hà Nội"),("Thái Bình"),("Hưng Yên"),("Hải Dương");
 
 -- thêm 5 bản ghi trong bảng Course --
 insert into Course(name, description) values("Java","Java cơ bản");
 insert into Course(name, description) values("PHP","PHP cơ bản");
 insert into Course(name, description) values("CSS","CSS cơ bản");
 insert into Course(name, description) values("C++","C++ cơ bản");
 insert into Course(name, description) values("C#","C# cơ bản");
 
 -- thêm 5 bản ghi trong bảng classes --
 insert into classes(name,language, description)values("C0223G1","Tiếng Anh","người mới bắt đầu");
 insert into classes(name,language, description)values("C0222h1","Tiếng Trung","người mới bắt đầu");
 insert into classes(name,language, description)values("C0225I1","Tiếng Nhật","người mới bắt đầu");
 insert into classes(name,language, description)values("C0103A1","Tiếng Pháp","người mới bắt đầu");
 insert into classes(name,language, description)values("C0230B1","Tiếng Hàn","người mới bắt đầu");

-- thêm 10 bản ghi trong bảng students --
insert into students(fullname,address_id, phone, classes_id,age)values("Đặng Mạnh Hiếu","1","0123456789","1","18");
insert into students(fullname,address_id, phone, classes_id,age)values("Nguyễn Văn Hoàng","2","123456789","3","22");
insert into students(fullname,address_id, phone, classes_id,age)values("Trần Thị Nhung","3","888888888","2","23");
insert into students(fullname,address_id, phone, classes_id,age)values("Nguyễn Thu Nhài","4","1234567890","5","24");
insert into students(fullname,address_id, phone, classes_id,age)values("Nguyễn Văn A","1","9999999999","4","25");
insert into students(fullname,address_id, phone, classes_id,age)values("Lê Đức Thọ","5","666666666","5","23");
insert into students(fullname,address_id, phone, classes_id,age)values("Phạm Hùng","3","5555555555","2","28");
insert into students(fullname,address_id, phone, classes_id,age)values("Hồ Tùng Mậu","4","0888888888888","2","21");
insert into students(fullname,address_id, phone, classes_id,age)values("Lê Văn Lương","2","099999999","3","26");
insert into students(fullname,address_id, phone, classes_id,age)values("Trần Hoàng Long","5","0666666666","5","23");
  
							
                                  
-- thêm 15 bản ghi trong bảng Point --
insert into point(course_id,student_id,point) values("1","1","8");
insert into point(course_id,student_id,point) values("1","2","8");
insert into point(course_id,student_id,point) values("2","3","7");
insert into point(course_id,student_id,point) values("2","4","9");
insert into point(course_id,student_id,point) values("3","5","8");
insert into point(course_id,student_id,point) values("3","6","9");
insert into point(course_id,student_id,point) values("4","7","7");
insert into point(course_id,student_id,point) values("4","8","9");
insert into point(course_id,student_id,point) values("5","9","8");
insert into point(course_id,student_id,point) values("5","10","8");
insert into point(course_id,student_id,point) values("1","1","9");
insert into point(course_id,student_id,point) values("2","2","6");
insert into point(course_id,student_id,point) values("3","3","7");
insert into point(course_id,student_id,point) values("4","4","8");
insert into point(course_id,student_id,point) values("5","5","9");

-- tìm kiếm học viên có tên họ Nguyễn --
select * from minitest1.students 
where fullname like'Nguyễn%';

-- tìm kiếm học viên có tên Anh --
select * from minitest1.students
where fullname like 'Anh';

-- tìm kiếm học viên có độ tuổi từ 18-25 --
select fullname,age from minitest1.students
where age between 18 and 25;

-- tìm kiếm học viên có id=12 hoặc id=13 --
select id,fullname from minitest1.students
where id="12" or id="13";

-- thống kê số lượng học viên các lớp --
select classes.name, count(students.id) as 'count_student'
from students 
inner join classes on students.classes_id = classes.id
group by classes.name;

-- số học viên tại các tỉnh --
select address.address, count(students.id) as 'count_address'
from students
inner join address on students.address_id = address.id
group by address.address;

--  tính điểm trung bình --
create view avg_point as
select course.name, avg(point.point) as 'avg_point'
from point
inner join course on course.id = point.course_id
group by course.name;

  select * from avg_point;
  
  -- khóa học có điểm trung bình cao nhất --
 set @maxAvg = (select max(avg_point)
  from avg_point);
  
select *from avg_point
where avg_point = @maxAvg; 
   
