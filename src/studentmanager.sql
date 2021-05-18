create DATABASE studentmangar;
use studentmangar;
create table address
(
    id      int auto_increment
        primary key,
    address varchar(50) null
);
create table classes
(
    id          int auto_increment
        primary key,
    name        varchar(60) not null,
    language    varchar(30) not null,
    description varchar(60) null
);
create table course
(
    id          int auto_increment
        primary key,
    name        varchar(30) not null,
    description varchar(60) null
);
create table point
(
    id int auto_increment primary key,
    course_id  int not null,
    student_id int null,
    point      int null,
    constraint point_ibfk_1
        foreign key (course_id) references course (id),
    constraint point_ibfk_2
        foreign key (student_id) references students (id)
);
create index course_id
    on point (course_id);
create index student_id
    on point (student_id);
create table students
(
    id int auto_increment primary key,
    fullname   varchar(30) not null,
    address_id int         not null,
    phone      varchar(20) null,
    class_id   int         not null,
    constraint Students_phone_uindex unique (phone),
    constraint students_ibfk_1
        foreign key (address_id) references address (id),
    constraint students_ibfk_2
        foreign key (class_id) references classes (id)
);
create index address_id
    on students (address_id);
create index class_id
    on students (class_id);
SELECT c.name,COUNT(s.id) from students as s inner join classes c on s.class_id = c.id group by c.name;
SELECT a.address,COUNT(s.id) from students as s inner join address a on s.address_id = a.id group by a.address;
select c.name, AVG(p.point) from point as p inner join course c on p.course_id = c.id group by c.id;
select c.name from point as p inner join course c on p.course_id = c.id group by c.id order by avg(p.point) desc limit 1;
