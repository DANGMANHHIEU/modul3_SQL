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
       
       -- truy van --
       select * from subject 
       where credit<10;
       
       select s.studentID, s.studentName, c.className
       from student s join class c on s.classid =  c.classID;
       
       select s.studentID, s.studentName, c.className
       from student s join class c on s.classID = c.classID
       where c.className = 'A1';
       
       select s.studentID, s.studentName, sub.subName, m.mark
       from student s join mark m on s.studentID = m.studentID join subject sub on m.subID = sub.subID;
       
       select s.studentID, s.studentName, sub.subName, m.mark
       from student s join mark m on s.studentID = m.studentID join subject sub on m.subID = sub.subID
       where sub.subName='CF';
       
       -- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’--
       select student.studentid,student.studentName from quanli.student
       where studentName like "h%";
       
       -- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12 --
       select class.classID,class.className,class.startTime from quanli.class
       where month(starttime)=12; 
       
       -- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5 --
       select subject.subname, subject.credit from quanli.subject
       where credit between 3 and 5;
       
       -- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.--
       update student set classid =2
       where studentName="Hung";
       
       -- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần
       select s.studentName,sub.subName, m.mark 
       from student s join mark m on s.studentID = m.studentid join subject sub on m.subID= sub.subId
       order by m.mark desc, s.studentName desc;