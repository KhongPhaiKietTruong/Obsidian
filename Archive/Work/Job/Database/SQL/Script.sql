DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Branch;
DROP TABLE IF EXISTS Client;

CREATE TABLE Employee (
	emp_id INT,
	first_name VARCHAR(30),
	last_name VARCHAR(30), 
	birth_date DATE,
	sex VARCHAR(1),
	salary INT,
	super_id INT, 
	branch_id INT,
	-- KEY --
	CONSTRAINT PK_Employee PRIMARY KEY (emp_id)
);

CREATE TABLE Branch (
	branch_id INT,
	branch_name VARCHAR(30),
	mgr_id INT,
	mgr_start_date DATE,
	-- KEY --
	CONSTRAINT PK_Branch
	PRIMARY KEY (branch_id),
	
	CONSTRAINT FK_Branch_Employee
	FOREIGN KEY (mgr_id) 
	REFERENCES Employee (emp_id) 
	ON DELETE SET NULL
);

ALTER TABLE Employee 
ADD CONSTRAINT FK_Employee_Branch
FOREIGN KEY (branch_id)
REFERENCES Branch (branch_id)
ON DELETE SET NULL;

ALTER TABLE Employee 
ADD CONSTRAINT FK_Employee_Employee
FOREIGN KEY (super_id)
REFERENCES Employee (emp_id)
ON DELETE SET NULL;

CREATE TABLE Client (
	client_id INT,
	client_name VARCHAR(30),
	branch_id INT,
	-- KEY --
	CONSTRAINT PK_Client
	PRIMARY KEY (client_id),
	
	CONSTRAINT FK_Client_Branch
	FOREIGN KEY (branch_id) 
	REFERENCES Branch (branch_id)
	ON DELETE SET NULL
);

CREATE TABLE Works_with (
	emp_id INT,
	client_id INT,
	total_sales INT,
	-- KEY --
	CONSTRAINT PK_Works_with
	PRIMARY KEY (emp_id, client_id),
	
	CONSTRAINT FK_Works_with_Employee
	FOREIGN KEY (emp_id)
	REFERENCES Employee (emp_id)
	ON DELETE CASCADE,
	
	CONSTRAINT FK_Works_with_Client
	FOREIGN KEY (client_id)
	REFERENCES Client (client_id)
	ON DELETE CASCADE
);

CREATE TABLE Branch_supplier (
	branch_id INT,
	supplier_name VARCHAR(30),
	supply_type VARCHAR(30),
	-- KEY --
	CONSTRAINT PK_Works_with
	PRIMARY KEY (branch_id, supplier_name),
	
	CONSTRAINT FK_Branch_supplier_Branch
	FOREIGN KEY (branch_id)
	REFERENCES Branch (branch_id)
	ON DELETE CASCADE
);

INSERT INTO Employee (emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES 
	(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO Branch (branch_id, branch_name, mgr_id, mgr_start_date)
VALUES 
	(1, 'Corporate', 100, '2006-02-09');

UPDATE Employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO Employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO Employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO Branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE Employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO Employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO Employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO Employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO Employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO Branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE Employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO Employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO Employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO Branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO Branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO Branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO Branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO Branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO Branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO Branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO Client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO Client VALUES(401, 'Lackawana Country', 2);
INSERT INTO Client VALUES(402, 'FedEx', 3);
INSERT INTO Client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO Client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO Client VALUES(405, 'Times Newspaper', 3);
INSERT INTO Client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO Works_with VALUES(105, 400, 55000);
INSERT INTO Works_with VALUES(102, 401, 267000);
INSERT INTO Works_with VALUES(108, 402, 22500);
INSERT INTO Works_with VALUES(107, 403, 5000);
INSERT INTO Works_with VALUES(108, 403, 12000);
INSERT INTO Works_with VALUES(105, 404, 33000);
INSERT INTO Works_with VALUES(107, 405, 26000);
INSERT INTO Works_with VALUES(102, 406, 15000);
INSERT INTO Works_with VALUES(105, 406, 130000);

SELECT DISTINCT super_id
FROM Employee;

SELECT AVG(salary)
FROM Employee;

SELECT COUNT(emp_id), sex
FROM Employee
GROUP BY sex;

-- ================================================================ -

CREATE DATABASE learning;

USE learning;

DROP TABLE IF EXISTS THISINH;

CREATE TABLE THISINH (
	SOBD INT,
	HOTEN VARCHAR(30),
	NGAYSINH DATE,
	NOISINH VARCHAR(30),
	MANGANH INT,
	NAMDUTHI INT,
	-- KEY --
	CONSTRAINT PK_THISINH PRIMARY KEY (SOBD),
	CONSTRAINT FK_THISINH_NGANHHOC FOREIGN KEY (MANGANH) REFERENCES NGANHHOC (MANGANH) ON DELETE SET NULL
	
);


CREATE TABLE NGANHHOC (
	MANGANH INT,
	TENNGANH VARCHAR(30),
	-- KEY --
	CONSTRAINT PK_NGANHHOC PRIMARY KEY (MANGANH)
);

CREATE TABLE MONTHI (
	MAMT INT,
	TENMT VARCHAR (30),
	TINHCHAT INT DEFAULT 0, 
	-- KEY --
	CONSTRAINT PK_MONTHI PRIMARY KEY (MAMT)
);

2


