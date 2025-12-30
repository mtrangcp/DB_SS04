create database mini_proj;
use mini_proj;
drop database mini_proj;

create table Student (
	id varchar(10) primary key,
    full_name varchar(50) not null,
    dob date not null,
    email varchar(50) not null unique
);
create table Teacher(
	id varchar(10) primary key,
    full_name varchar(50) not null,
    email varchar(50) not null unique
);
create table Course(
	id varchar(10) primary key,
    course_name varchar(50) not null,
    course_describe varchar(100) not null,
    number_session int not null,
    teacher_id varchar(10),
    
    constraint chb_number_session check(number_session > 0),
    constraint fk_course_teacher foreign key(teacher_id) references Teacher(id)
);
create table Enrollment(
	student_id varchar(10),
    course_id varchar(10),
    registration_date date not null,
    
    constraint pk_enroll primary key(student_id, course_id),
    constraint fk_score_student foreign key(student_id) references Student(id),
    constraint fk_enroll_course foreign key(course_id) references Course(id)
);
create table Score(
	student_id varchar(10),
    course_id varchar(10),
    progress_grade decimal(4,2) not null,
    final_grade decimal(4,2) not null,
    
    constraint pk_score primary key(student_id, course_id),
    constraint chb_progress check(progress_grade between 0 and 10),
    constraint chb_final check(final_grade between 0 and 10),
    constraint fk_score_student foreign key(student_id) references Student(id),
    constraint fk_score_course foreign key(course_id) references Course(id)
);

alter table Enrollment drop constraint fk_score_student;
alter table Enrollment drop fk_enroll_course;
insert into Student values 
('SV001', 'Nguyễn Thành Nam', '2000-05-15', 'namnt@gmail.com'),
('SV002', 'Lê Thu Hà', '2000-10-20', 'halt@gmail.com'),
('SV003', 'Trần Văn Đức', '2000-01-12', 'ductv@gmail.com'),
('SV004', 'Phạm Thùy Linh', '2000-03-08', 'linhpt@gmail.com'),
('SV005', 'Hoàng Quốc Anh', '2000-12-30', 'anhhq@gmail.com'),
('SV006', 'Vũ Minh Quân', '2000-07-25', 'quanvm@gmail.com');
select * from Student;
update Student set email = 'nam1234@gmail.com' where id = 'SV001';

insert into Teacher values 
('GV001', 'Nguyễn Văn A', 'anv@example.com'),
('GV002', 'Trần Thị B', 'btt@example.com'),
('GV003', 'Lê Văn C', 'clv@example.com'),
('GV004', 'Phạm Minh D', 'dpm@example.com'),
('GV005', 'Hoàng Lan E', 'ehl@example.com'),
('GV006', 'Đỗ Hoàng G', 'gdh@example.com');
select * from Teacher;

insert into Course values
('CS101', 'SQL Cơ bản', 'Học về truy vấn dữ liệu SQL', 12, 'GV001'),
('CS102', 'Java Core', 'Lập trình Java cơ bản đến nâng cao', 24, 'GV002'),
('CS103', 'Web Design', 'Thiết kế giao diện với HTML/CSS', 15, 'GV003'),
('CS104', 'Python Pro', 'Lập trình Python cho phân tích dữ liệu', 20, 'GV004'),
('CS105', 'Data Structure', 'Cấu trúc dữ liệu và giải thuật', 18, 'GV005'),
('CS106', 'Cloud Computing', 'Tổng quan về điện toán đám mây', 10, 'GV006');
select * from Course;

update Course set 
course_describe = 'Thiết kế giao diện với HTML/CSS; Đồng thời thiết kế giao diện figma' 
where id = 'CS103';

insert into Enrollment values 
('SV001', 'CS101', '2025-01-05'),
('SV002', 'CS102', '2025-01-06'),
('SV003', 'CS103', '2025-01-07'),
('SV004', 'CS104', '2025-01-08'),
('SV005', 'CS105', '2025-01-09'),
('SV006', 'CS106', '2025-01-10');
select * from Enrollment;
delete from Enrollment where student_id = 'SV006' and course_id = 'CS106';

insert into Score values
('SV001', 'CS101', 8.50, 9.00),
('SV002', 'CS102', 7.00, 8.00),
('SV003', 'CS103', 9.00, 8.50),
('SV004', 'CS104', 6.50, 7.50),
('SV005', 'CS105', 8.00, 8.00),
('SV006', 'CS106', 10.00, 9.50);
select * from Score;
update Score set final_grade = 10 where student_id = 'SV004' and course_id = 'CS104';
delete from Score where student_id = 'SV006' and course_id = 'CS106';