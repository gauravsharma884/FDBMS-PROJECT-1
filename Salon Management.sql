create database Salon_Mgmnt ;
use Salon_Mgmnt ;
CREATE TABLE ZipCodes
(
zipcode INT(6) NOT NULL,
city VARCHAR(30),
state VARCHAR(30),
PRIMARY KEY (zipcode)
) ;


CREATE TABLE Customer
(
CustomerID VARCHAR(10) NOT NULL,
FirstName VARCHAR(40),
LastName VARCHAR(40),
PhoneNumber VARCHAR(10),
Street VARCHAR(40),
ZipCode INT(6),
Gender VARCHAR(10),
PRIMARY KEY (CustomerID),
FOREIGN KEY (ZipCode) REFERENCES ZipCodes(ZipCode)
) ;

CREATE TABLE Appointment
(
AppointmentID VARCHAR(10) NOT NULL,
AppointmentDate DATE,
CustomerID VARCHAR(10) NOT NULL,
PRIMARY KEY (AppointmentID),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
) ;

CREATE TABLE SalonService
(
ServiceID VARCHAR(10) NOT NULL, 
ServiceName VARCHAR(40),
ServiceDuration FLOAT, 
ServicePrice FLOAT, 
ServiceMaterials VARCHAR(255),
PRIMARY KEY (ServiceID)
) ;

CREATE TABLE Employee 
(
EmployeeID VARCHAR(10) NOT NULL,
FirstName VARCHAR(40), 
LastName VARCHAR(40), 
Street VARCHAR(40), 
ZipCode INT(6), 
PayRate Float,
PRIMARY KEY (EmployeeID),
FOREIGN KEY (ZipCode) REFERENCES ZipCodes(ZipCode)
) ;

CREATE TABLE ServiceRendered 
( 
AppointmentID VARCHAR(10) NOT NULL,
LineItemNumber INTEGER NOT NULL, 
ServiceID VARCHAR(10) NOT NULL, 
ServiceExtendedPrice Float, 
EmployeeID VARCHAR(10) NOT NULL,
PRIMARY KEY (AppointmentID, LineItemNumber),
FOREIGN KEY (ServiceID) REFERENCES SalonService(ServiceID),
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
) ;

CREATE TABLE rel_ZIPCODES_EMPLOYEE
(
ZipCode INT(6) NOT NULL,
EmployeeID VARCHAR(10) NOT NULL,
FOREIGN KEY (ZipCode) REFERENCES ZipCodes(ZipCode),
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
) ;

CREATE TABLE rel_ZIPCODES_CUSTOMER
(
ZipCode INT(6) NOT NULL,
CustomerID VARCHAR(10) NOT NULL,
FOREIGN KEY (ZipCode) REFERENCES ZipCodes(ZipCode),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
) ;

CREATE TABLE rel_CUSTOMER_APPOINTMENT
(
CustomerID VARCHAR(10) NOT NULL,
AppointmentID VARCHAR(10) NOT NULL,
AppointmentDate DATE,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
) ;

CREATE TABLE rel_APPOINTMENT_SERVICERENDERED
(
AppointmentID VARCHAR(10) NOT NULL,
LineItemNumber INTEGER NOT NULL,
FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
) ;

CREATE TABLE rel_SERVICERENDERED_SALONSERVICE
(
AppointmentID VARCHAR(10) NOT NULL,
LineItemNumber INTEGER NOT NULL,
ServiceID VARCHAR(10) NOT NULL,
FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID),
FOREIGN KEY (ServiceID) REFERENCES SalonService(ServiceID)
) ;

CREATE TABLE rel_SERVICERENDERED_EMPLOYEE
(
AppointmentID VARCHAR(10) NOT NULL,
LineItemNumber INTEGER NOT NULL,
EmployeeID VARCHAR(10) NOT NULL,
FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID),
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
) ;

INSERT INTO ZipCodes VALUES ('110070', 'Vasant Kunj', 'Delhi');
INSERT INTO ZipCodes VALUES ('124008', 'Faridabad', 'Haryana');
INSERT INTO ZipCodes VALUES ('163423', 'Jaipur', 'Rajasthan');
INSERT INTO ZipCodes VALUES ('182010', 'Noida', 'UP');
INSERT INTO ZipCodes VALUES ('110532', 'Janakpuri', 'Delhi');


INSERT INTO Customer VALUES ('C101', 'Rajbir', 'Kadian', '8823159647', '89 Balaji Road', '124008', 'M');
INSERT INTO Customer VALUES ('C102', 'Ashish', 'Rana', '8642153575', '56 Radhe Marg', '182010', 'M');
INSERT INTO Customer VALUES ('C103', 'Aakash', 'Balyan', '9462351122', '34 Maharana Road', '110532', 'M');
INSERT INTO Customer VALUES ('C104', 'Jasbir', 'Sharma', '9582992008', '52 Rani Bagh', '110070', 'M');
INSERT INTO Customer VALUES ('C105', 'Manvi', 'Goel', '9975331624', '66 Gandhi Marg', '110532', 'F');
INSERT INTO Customer VALUES ('C106', 'Sonakshi', 'Gulia', '9006352876', '420 Marine Road', '182010', 'F');
INSERT INTO Customer VALUES ('C107', 'Mehul', 'Batra', '9126243578', '15 Mahatama Road', '163423', 'M');
INSERT INTO Customer VALUES ('C108', 'Neha', 'Hooda', '9784565812', '23 Sector 9', '124008', 'F');

INSERT INTO SalonService VALUES ('SV101', 'Men''s Haircut', 20, 22, 'None');
INSERT INTO SalonService VALUES ('SV102', 'Women''s Haircut', 30, 32, 'None');
INSERT INTO SalonService VALUES ('SV103', 'Child Haircut', 20, 15, 'None');
INSERT INTO SalonService VALUES ('SV104', 'Women''s Hair Color', 60, 76, 'Color, Reagent, Gloves, Reagent Brush, Foil');
INSERT INTO SalonService VALUES ('SV105', 'Women''s Hair Style', 45, 56, 'Shampoo, Conditioner');
INSERT INTO SalonService VALUES ('SV106', 'Men''s Hair Style', 45, 46, 'Shampoo, Conditioner');


INSERT INTO Employee VALUES ('E300', 'Mahima', 'Sharma', '46 Barakhamba Road', '110070', 18);
INSERT INTO Employee VALUES ('E400', 'Bittoo', 'Goel', '12 Nangal Dewat', '182010', 22);
INSERT INTO Employee VALUES ('E500', 'Ravi', 'Batra', '70 Silly Street', '124008', 20);
INSERT INTO Employee VALUES ('E600', 'Shreya', 'Makhija', '73 Roshan Nagar', '110532', 18);
INSERT INTO Employee VALUES ('E700', 'Priti', 'Jain', '2 Dev Colony', '110070', 23);
INSERT INTO Employee VALUES ('E800', 'Sonal', 'Girdhar', '215 Prem Nagar', '110532', 23);

INSERT INTO Appointment VALUES ('A400', '2017/10/22', 'C101');
INSERT INTO Appointment VALUES ('A401', '2017/11/06', 'C102');
INSERT INTO Appointment VALUES ('A402', '2017/12/07', 'C106');
INSERT INTO Appointment VALUES ('A403', '2017/12/18', 'C106');
INSERT INTO Appointment VALUES ('A404', '2017/12/21', 'C108');
INSERT INTO Appointment VALUES ('A405', '2017/12/31', 'C107');
INSERT INTO Appointment VALUES ('A406', '2018/01/11', 'C103');
INSERT INTO Appointment VALUES ('A407', '2018/01/12', 'C104');
INSERT INTO Appointment VALUES ('A408', '2018/01/22', 'C105');

INSERT INTO ServiceRendered VALUES ('A400', 1, 'SV104', 75, 'E400');
INSERT INTO ServiceRendered VALUES ('A400', 2, 'SV102', 25, 'E400');
INSERT INTO ServiceRendered VALUES ('A401', 1, 'SV101', 22, 'E500');
INSERT INTO ServiceRendered VALUES ('A402', 1, 'SV104', 75, 'E600');
INSERT INTO ServiceRendered VALUES ('A402', 2, 'SV102', 30, 'E800');
INSERT INTO ServiceRendered VALUES ('A403', 1, 'SV105', 50, 'E300');
INSERT INTO ServiceRendered VALUES ('A404', 1, 'SV105', 55, 'E300');
INSERT INTO ServiceRendered VALUES ('A405', 1, 'SV102', 30, 'E700');
INSERT INTO ServiceRendered VALUES ('A405', 2, 'SV104', 70, 'E700');
INSERT INTO ServiceRendered VALUES ('A405', 3, 'SV105', 50, 'E700');

COMMIT ;

DELETE FROM EMPLOYEE WHERE PayRate = 18 ;
ROLLBACK ;

CREATE USER 'aman'@'localhost' IDENTIFIED BY 'aman' ;
CREATE USER 'ali'@'localhost' IDENTIFIED BY 'ali' ;
CREATE USER 'john'@'localhost' IDENTIFIED BY 'john' ;
CREATE USER 'ravi'@'localhost' IDENTIFIED BY 'ravi' ;
CREATE USER 'ambika'@'localhost' IDENTIFIED BY 'ambika' ;

GRANT create, drop, select  ON *.*  TO 'aman'@'localhost' with grant option ;
GRANT select, insert, update, delete   ON salon_mgmnt.*  TO 'ali'@'localhost' ;
GRANT select, insert, update, delete   ON salon_mgmnt.*  TO 'john'@'localhost' ;
GRANT select   ON salon_mgmnt.*  TO 'ravi'@'localhost' ;


