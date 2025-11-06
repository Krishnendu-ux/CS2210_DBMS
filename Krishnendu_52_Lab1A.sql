use day2;
create table s_info (
    StudentID int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Email varbinary(100) unique,
    DepartmentID int
);
insert into s_info values 
(1, 'Aman', 'Sharma', 'aman.sharma@example.com', 101),
(2, 'Neha', 'Verma', 'neha.verma@example.com', 102),
(3, 'Ravi', 'Malik', 'ravi.malik@example.com', 101),
(4, 'Priya', 'Singh', 'priya.singh@example.com', 103),
(5, 'Karan', 'Patel', 'karan.patel@example.com', 102),
(6, 'Meera', 'Chopra', 'meera.chopra@example.com', 101),
(7, 'Arjun', 'Reddy', 'arjun.reddy@example.com', 104),
(8, 'Sneha', 'Kapoor', 'sneha.kapoor@example.com', 102),
(9, 'Vikas', 'Nair', 'vikas.nair@example.com', 105),
(10, 'Pooja', 'Mishra', 'pooja.mishra@example.com', 103);
select * from s_info;
alter table s_info 
add PhoneNumber varchar(15);
alter table s_info
drop column DepartmentID;
