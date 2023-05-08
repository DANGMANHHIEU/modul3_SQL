use quanli;

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

insert into student(studentName,address, phone, status,classID) values('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student(studentName,address, phone, status,classID) values('Hoa', 'Hai phong','8888888888', 1, 1);
insert into student(studentName,address, phone, status,classID) values('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
       drop table mark;
       
       create table mark(
markID int not null primary key auto_increment,
subID int not null ,
studentID int not null ,
foreign key(subID) references subject(subID),
foreign key(studentID) references student(studentID),
mark float default 0 check ( mark between 0 and 100),
examTimes tinyint default 1);
      
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
       