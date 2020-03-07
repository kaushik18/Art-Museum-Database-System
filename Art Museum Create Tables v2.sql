/*
DROP TABLE Loan
DROP TABLE Invoice
DROP TABLE Dealer
DROP TABLE Ticket
DROP TABLE Ticket_Type
DROP TABLE Customer
DROP TABLE Exhibit_Staff
DROP TABLE Display
DROP TABLE Item
DROP TABLE Exhibit
DROP TABLE Artist
DROP TABLE Staff
*/
CREATE TABLE Staff (
	staffID char(9) NOT NULL,
	fname varchar(25),
	lname varchar(25),
	salary decimal,
	start_date date,
	end_date date,
	address varchar(50),
	PRIMARY KEY (staffID)
);

CREATE TABLE Artist (
	artistID char(9) NOT NULL,
	name varchar(50),
	phone varchar(15),
	email varchar(30),
	dob date,
	country varchar(50),
	PRIMARY KEY (artistID)
);

CREATE TABLE Exhibit (
	exhibitID char(9) NOT NULL,
	title varchar(50),
	start_date date,
	end_date date,
	PRIMARY KEY (exhibitID)
);

CREATE TABLE Item (
	itemID char(9) NOT NULL,
	artistID char(9) NOT NULL,
	name varchar(50),
	description varchar(200) NOT NULL,
	created date,
	acquired date NOT NULL,
	medium varchar(20) NOT NULL,
	collection varchar(20),
	insured_value decimal,
	PRIMARY KEY (itemID),
	FOREIGN KEY (artistID) REFERENCES Artist(artistID)
);

CREATE TABLE Display (
	itemID char(9) NOT NULL,
	exhibitID char(9) NOT NULL,
	PRIMARY KEY (itemID, exhibitID),
	FOREIGN KEY (itemID) REFERENCES Item(itemID),
	FOREIGN KEY (exhibitID) REFERENCES Exhibit(exhibitID)
);

CREATE TABLE Exhibit_Staff (
	exhibitID char(9) NOT NULL,
	staffID char(9) NOT NULL,
	title varchar(50),
	fname varchar(25),
	lname varchar(25),
	position varchar(40),
	PRIMARY KEY (exhibitID, staffID),
	FOREIGN KEY (exhibitID) REFERENCES Exhibit(exhibitID),
	FOREIGN KEY (staffID) REFERENCES Staff(staffID)
);

CREATE TABLE Customer (
	customerID char(9) NOT NULL,
	fname varchar(25),
	lname varchar(25),
	phone varchar(15),
	address varchar(50),
	email varchar(30),
	PRIMARY KEY (customerID)
);
/*
Different ticket types for different levels of access.
Ex: Ticket C for general admission, Ticket B for admission plus one exhibit, etc.
*/
CREATE TABLE Ticket_Type (
	type char(1) NOT NULL,
	price decimal NOT NULL,
	description varchar(50) NOT NULL,
	PRIMARY KEY (type)
);

CREATE TABLE Ticket (
	ticketID char(9) NOT NULL,
	customerID char(9) NOT NULL,
	type char(1) NOT NULL,
	visit_date date,
	PRIMARY KEY (ticketID),
	FOREIGN KEY (customerID) REFERENCES Customer(customerID),
	FOREIGN KEY (type) REFERENCES Ticket_Type(type)
);

CREATE TABLE Dealer (
	dealerID char(9) NOT NULL,
	fname varchar(25),
	lname varchar(25),
	address varchar(50),
	phone varchar(15),
	email varchar(30),
	PRIMARY KEY (dealerID)
);

CREATE TABLE Invoice (
	invoiceID char(9) NOT NULL,
	itemID char(9) NOT NULL,
	dealerID char(9) NOT NULL,
	value decimal NOT NULL,
	tax decimal,
	total decimal NOT NULL,
	date date NOT NULL,
	PRIMARY KEY (invoiceID),
	FOREIGN KEY (itemID) REFERENCES Item(itemID),
	FOREIGN KEY (dealerID) REFERENCES Dealer(dealerID)
);

CREATE TABLE Loan (
	lenderID char(9) NOT NULL,
	itemID char(9) NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	PRIMARY KEY (lenderID, itemID, start_date, end_date),
	--FOREIGN KEY (start_date) REFERENCES Item(acquired),
	FOREIGN KEY (itemID) REFERENCES Item(itemID)
);