create database market_co;

use market_co;

CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

drop table company;

INSERT INTO Company (CompanyID, CompanyName, Street, City, State, Zip)
VALUES 
(1, 'Urban Outfitters Inc.', '123 Silicon Ave', 'San Jose', 'CA', '95112'),
(2, 'Green Earth Ltd.', '456 Forest Rd', 'Portland', 'OR', '97205'),
(3, 'Skyline Builders', '789 Highrise Blvd', 'Chicago', 'IL', '60601'),
(4, 'Oceanic Ventures', '321 Marine Dr', 'Miami', 'FL', '33101'),
(5, 'Toll Brothers', '555 Summit St', 'Denver', 'CO', '80203'),
(6, 'NextGen Retail', '100 Commerce Ln', 'Dallas', 'TX', '75201'),
(7, 'HealthFirst Medical', '212 Wellness Way', 'Boston', 'MA', '02108'),
(8, 'AgriFuture Corp.', '98 Harvest Rd', 'Des Moines', 'IA', '50309'),
(9, 'AutoDrive Co.', '17 Motor Pkwy', 'Detroit', 'MI', '48226'),
(10, 'SmartWare LLC', '233 Tech Blvd', 'Austin', 'TX', '73301');

CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

drop table contact;

INSERT INTO Contact (ContactID, CompanyID, FirstName, LastName, Street, City, State, Zip, IsMain, Email, Phone)
VALUES
(1, 1, 'Alice', 'Johnson', '123 Silicon Ave', 'San Jose', 'CA', '95112', TRUE, 'alice.j@techinnovators.com', '408-555-1001'),
(2, 2, 'Brian', 'Smith', '456 Forest Rd', 'Portland', 'OR', '97205', TRUE, 'brian.s@greenearth.com', '503-555-2002'),
(3, 3, 'Cynthia', 'Lee', '789 Highrise Blvd', 'Chicago', 'IL', '60601', TRUE, 'c.lee@skylinebuild.com', '312-555-3003'),
(4, 4, 'Derek', 'Nguyen', '321 Marine Dr', 'Miami', 'FL', '33101', TRUE, 'd.nguyen@oceanicventures.com', '305-555-4004'),
(5, 5, 'Jack', 'Lee', '555 Summit St', 'Denver', 'CO', '80203', TRUE, 'j.lee@peaksolutions.com', '720-555-5005'),
(6, 6, 'Frank', 'Lopez', '100 Commerce Ln', 'Dallas', 'TX', '75201', TRUE, 'frank.lopez@nextgenretail.com', '214-555-6006'),
(7, 7, 'Grace', 'Taylor', '212 Wellness Way', 'Boston', 'MA', '02108', TRUE, 'grace.t@healthfirst.com', '617-555-7007'),
(8, 8, 'Hannah', 'Moore', '98 Harvest Rd', 'Des Moines', 'IA', '50309', TRUE, 'h.moore@agrifuture.com', '515-555-8008'),
(9, 9, 'Ian', 'Kim', '17 Motor Pkwy', 'Detroit', 'MI', '48226', TRUE, 'ian.kim@autodriveco.com', '313-555-9009'),
(10, 10, 'Julia', 'Reed', '233 Tech Blvd', 'Austin', 'TX', '73301', TRUE, 'j.reed@smartware.com', '512-555-1010');

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone)
VALUES
(1, 'Sarah', 'Miller', 75000.00, '2020-06-15', 'Project Manager', 'sarah.m@company.com', '555-123-4567'),
(2, 'James', 'Anderson', 62000.00, '2021-03-22', 'Software Engineer', 'james.a@company.com', '555-234-5678'),
(3, 'Linda', 'Garcia', 58000.00, '2019-11-08', 'HR Specialist', 'linda.g@company.com', '555-345-6789'),
(4, 'Lesley', 'Bland', 87000.00, '2018-07-12', 'Senior Developer', 'lesley.b@company.com', '555-456-7890'),
(5, 'Emily', 'Davis', 54000.00, '2022-01-05', 'Marketing Analyst', 'emily.d@company.com', '555-567-8901'),
(6, 'Dianne', 'Connors', 93000.00, '2017-10-03', 'Data Scientist', 'dianne.c@company.com', '555-678-9012'),
(7, 'Jessica', 'Martinez', 69000.00, '2021-09-19', 'UI Designer', 'jessica.m@company.com', '555-789-0123'),
(8, 'William', 'Taylor', 61000.00, '2020-12-11', 'QA Engineer', 'william.t@company.com', '555-890-1234'),
(9, 'Karen', 'Hernandez', 79000.00, '2019-04-23', 'Product Owner', 'karen.h@company.com', '555-901-2345'),
(10, 'David', 'Lee', 56000.00, '2023-06-01', 'Business Analyst', 'david.l@company.com', '555-012-3456');

CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100)
);

INSERT INTO ContactEmployee (ContactEmployeeID, ContactID, EmployeeID, ContactDate, Description)
VALUES
(1, 1, 2, '2024-12-01', 'Discussed software project scope and deadlines.'),
(2, 3, 1, '2025-01-15', 'Reviewed contract requirements and deliverables.'),
(3, 5, 3, '2025-03-10', 'Initial HR onboarding contact with company representative.'),
(4, 4, 3, '2025-02-05', 'HR policy clarification.'),
(5, 5, 5, '2025-02-20', 'Marketing strategy discussion.'),
(6, 5, 6, '2025-03-01', 'Data analysis collaboration.'),
(7, 7, 7, '2025-03-12', 'UI/UX review session.'),
(8, 8, 8, '2025-03-25', 'QA feedback and bug reporting.'),
(9, 9, 9, '2025-04-05', 'Product roadmap planning.'),
(10, 10, 10, '2025-04-15', 'Business analysis kickoff meeting.');

-- 1) Statement to create the Contact table
CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

-- 2) Statement to create the Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

-- 3) Statement to create the ContactEmployee table
CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100)
);

-- HINT: Use DATE as the datatype for ContactDate. It allows you to store the
-- date in this format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014).

-- 4) In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800
update employee
set phone = '215-555-8800'
where firstname = 'Lesley' and lastname = 'Bland';

select * from employee;

-- 5) In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters”.
update company
set companyname = 'Urban Outfitters'
where companyname = 'Urban Outfitters Inc.';

select * from company;

-- 8) What is the significance of “%” and “_” operators in the LIKE statement?

-- "%":-  Matches zero or more characters
-- "_":- Matches exactly one characters

-- 9) Explain normalization in the context of databases.

-- Normalization in the context of databases is the process of organizing data in a way that reduces data redundancy
-- and improves data integrity.

-- 10) What does a join in MySQL mean?

-- Join is used to combine rows from two or more tables based on related column between them.

-- 11) What do you understand about DDL, DCL, and DML in MySQL?

-- DDL:- Data Defination Language - It is used to defined the structure of database and tables. There are four commands use.
		-- Create - Create a new database,tables,views,etc.
        -- Alter - It changes a table structure(to add a new column).
        -- Drop - It used for delete table/database permanently.
        -- Truncate - It used for all the data inside the table(but keeps the table).

-- DML:- Data Manipulation Language - Manages and manipulates data inside tables. There are three commands use.
		-- Insert - It is used to new values/data add in a table(rows)
        -- Update - It is used to existing values/data to change
        -- Delete - It is used to particular row of data delete based on condition true
	
-- DCL:- Data Control Language - Controls access and permissions to data in the database. There are two commands use.
		-- Grant - Gives a user permission to do something
        -- Revoke - Take back that permission

-- 12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins?

-- Role of the MySQL JOIN Clause:-
		-- Combines data from multiple tables
        -- Enables complex queries to retrieve related information in a single result
        -- Maintains data integrity by using defined relationships
        
-- There are five common types of JOINS Clause:-
		-- Inner Join
        -- Left Join
        -- Right Join
        -- Cross Join
        -- Full Join