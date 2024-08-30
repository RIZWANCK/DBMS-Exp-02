CREATE TABLE Customer (
    cid INT,
    cname VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Account (
    accno INT,
    acctype VARCHAR(50)
);

CREATE TABLE Depositor (
    accno INT,
    cid INT,
    amount FLOAT
);

ALTER TABLE Customer 
ADD CONSTRAINT pk_customer PRIMARY KEY (cid);

ALTER TABLE Account 
ADD CONSTRAINT pk_account PRIMARY KEY (accno);

ALTER TABLE Depositor 
ADD CONSTRAINT pk_depositor PRIMARY KEY (cid, accno);

ALTER TABLE Depositor 
ADD CONSTRAINT fk_depositor_cid FOREIGN KEY (cid) REFERENCES Customer (cid);

ALTER TABLE Depositor 
ADD CONSTRAINT fk_depositor_accno FOREIGN KEY (accno) REFERENCES Account (accno);


desc Depositor;

ALTER TABLE Account 
MODIFY acctype VARCHAR(50) NOT NULL;

ALTER TABLE Customer 
MODIFY cname VARCHAR(50) NOT NULL;

desc Customer;


ALTER TABLE Depositor 
ADD CONSTRAINT chk_amount CHECK (amount > 0);

ALTER TABLE Account 
ADD COLUMN branchname VARCHAR(50);


ALTER TABLE Account 
ADD CONSTRAINT un_branchname UNIQUE (branchname);

desc Account;


ALTER TABLE Account 
DROP INDEX un_branchname;



ALTER TABLE Customer 
MODIFY city VARCHAR(50) DEFAULT 'delhi';

INSERT INTO Customer (cid, cname, city) VALUES
(101, 'Arshad', 'Malappuram'),
(102, 'Thaju', 'Kondoty'),
(103, 'Bava', 'Kottakkal'),
(104, 'Rizwan', 'Kuttiady');

SELECT * FROM Customer;

INSERT INTO Account (accno, acctype, branchname) VALUES
(2021, 'saving', 'Calicut'),
(2022, 'current', 'Manjeri'),
(2023, 'saving', 'Kuttiady');

SELECT * FROM Account;

INSERT INTO Depositor (accno, cid, amount) VALUES
(2021, 101, 50000),
(2022, 102, 60000);

SELECT * FROM Depositor;

ALTER TABLE Depositor 
DROP FOREIGN KEY fk_depositor_cid;

ALTER TABLE Depositor 
DROP FOREIGN KEY fk_depositor_accno;
