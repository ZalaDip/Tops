create database assessment_work;

use assessment_work;

CREATE TABLE Worker (
    WORKER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(50)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES
(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00', 'Admin');

-- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME
-- Ascending and DEPARTMENT Descending.
select * from worker
order by first_name asc, department desc;

-- 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish”
-- from the Worker table.
select * from worker
where first_name in ('Vipul','Satish');

-- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and
-- contains six alphabets.
select * from worker
where first_name like '_____h' and length(first_name) = 6;

-- 4. Write an SQL query to print details of the Workers whose SALARY lies between 1.


-- 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table.


-- 6. Write an SQL query to show the top 6 records of a table.
select * from worker
limit 6;

-- 7. Write an SQL query to fetch the departments that have less than five people in them.
select department from worker
group by department
having count(worker_id) < 5;

-- 8. Write an SQL query to show all departments along with the number of people in there.
select department, count(worker_id) as No_of_people from worker
group by department;

-- 9. Write an SQL query to print the name of employees having the highest salary in each department. 
select first_name, last_name, salary, department from worker w
where salary = (
select max(salary) from worker
where department = w.department
);


-- Question 2: Open school database, then select student table and use following SQL statements.
-- TYPE THE STATEMENT, PRESS ENTER AND NOTE THE OUTPUT 

CREATE TABLE Students (
    StdID INT PRIMARY KEY,
    StdName VARCHAR(100),
    Sex VARCHAR(10),
    Percentage INT,
    Class INT,
    Sec CHAR(1),
    Stream VARCHAR(20),
    DOB DATE
);

INSERT INTO Students 
VALUES 
(1001, 'Surekha Joshi', 'Female', 82, 12, 'A', 'Science', '1998-03-08'),
(1002, 'MAAHI AGARWAL', 'Female', 56, 11, 'C', 'Commerce', '2008-11-23'),
(1003, 'Sanam Verma', 'Male', 59, 11, 'C', 'Commerce', '2006-06-29'),
(1004, 'Ronit Kumar', 'Male', 63, 11, 'C', 'Commerce', '1997-11-05'),
(1005, 'Dipesh Pulkit', 'Male', 78, 11, 'B', 'Science', '2003-09-14'),
(1006, 'JAHANVI Puri', 'Female', 60, 11, 'B', 'Commerce', '2008-11-07'),
(1007, 'Sanam Kumar', 'Male', 23, 12, 'F', 'Commerce', '1998-03-08'),
(1008, 'SAHIL SARAS', 'Male', 56, 11, 'C', 'Commerce', '2008-11-07'),
(1009, 'AKSHRA AGARWAL', 'Female', 72, 12, 'B', 'Commerce', '1998-10-14'),
(1010, 'STUTI MISHRA', 'Female', 39, 11, 'F', 'Science', '2008-11-23'),
(1011, 'HARSH AGARWAL', 'Male', 42, 11, 'C', 'Science', '1998-03-08'),
(1012, 'NIKUNJ AGARWAL', 'Male', 49, 12, 'C', 'Commerce', '1998-06-28'),
(1013, 'AKRITI SAXENA', 'Female', 89, 12, 'A', 'Science', '2008-11-23'),
(1014, 'TANI RASTOGI', 'Female', 82, 12, 'A', 'Science', '2008-11-23');

-- 1 To display all the records from STUDENT table.
select * from students;

-- 2. To display any name and date of birth from the table STUDENT.
select stdname, dob from students;

-- 3. To display all students record where percentage is greater of equal to 80 FROM student table. 
select * from students
where percentage >= 80;

-- 4. To display student name, stream and percentage where percentage of student is more than 80
select stdname, stream, percentage from students
where percentage > 80;

-- 5. To display all records of science students whose percentage is more than 75 form student table.
select * from students
where stream = 'Science' and percentage > 75;
