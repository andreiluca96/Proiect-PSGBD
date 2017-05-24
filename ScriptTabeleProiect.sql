DROP TABLE Airports;
DROP TABLE Airplanes;
DROP TABLE Flights;
DROP TABLE Companies;
DROP TABLE Crew;
DROP TABLE Customers;
DROP TABLE Ticket;
DROP TABLE Assignment;

CREATE TABLE Airports (
id number(10) PRIMARY KEY,
Name varchar2(100) not null,
Location varchar2(100) not null,
Capacity number(10) not null
);

CREATE TABLE Companies (
id number(10) PRIMARY KEY,
Name varchar2(100) not null
);

CREATE TABLE Airplanes (
id number(10) PRIMARY KEY,
CompanyID number(10) not null,
Name varchar2(100) not null,
Model varchar2(100) not null,
Capacity number(5) not null,
ManufactureDate date not null,
LastCheckDate date not null,
FOREIGN KEY (CompanyID) REFERENCES Companies(id)
);

CREATE TABLE Crew (
id number(10) PRIMARY KEY,
Name varchar2(100) not null,
Nationality varchar2(100) not null,
EmploymentDate date not null,
Position varchar2(100) not null
);

CREATE TABLE Flights (
id number(10) PRIMARY KEY,
AirplaneID number(10) not null,
AirportDepartureID number(10) not null,
AirportArrivalID number(10) not null,
DepartureDate date not null,
ArrivalDate date not null,
FOREIGN KEY (AirplaneID) REFERENCES Airplanes(id),
FOREIGN KEY (AirportDepartureID) REFERENCES Airports(id),
FOREIGN KEY (AirportArrivalID) REFERENCES Airports(id)
);

CREATE TABLE Ticket (
id number(10) PRIMARY KEY,
FlightID number(10) not null,
CustomerID number(10) not null,
Price number(10) not null,
FOREIGN KEY (FlightID) REFERENCES Flights(id),
FOREIGN KEY (CustomerID) REFERENCES Customers(id)
);

CREATE TABLE Customers (
id number(10) PRIMARY KEY,
FirstName varchar2(100) not null,
LastName varchar2(100) not null,
Adress varchar2(100) not null,
DateOfBirth date
);

CREATE TABLE Assignment (
id number(10) PRIMARY KEY,
CrewMemberID number(10),
FlightID number(10),
FOREIGN KEY (FlightID) REFERENCES Flights(id),
FOREIGN KEY (CrewMemberID) REFERENCES Crew(id)
);

drop table airplanename;
drop table airplanemodel;
drop table FirstNamesfemei;
drop table FirstNamesbaieti;
drop table FirstNamesmen;
drop table FirstNamewomen;
drop table Nume;
drop table LastName;
drop table Locations;


Create table FirstNamesfemei(
nameid number(10),
name varchar2(100)
);Create table FirstNamesbaieti(
nameid number(10),
name varchar2(100)
);Create table FirstNamesmen(
nameid number(10),
name varchar2(100)
);Create table FirstNamewomen(
nameid number(10),
name varchar2(100)
);
Create table Nume(
nameid number(10),
name varchar2(100)
);
Create table LastName(
nameid number(10),
name varchar2(100)
);

Create table Locations (
name varchar2(100)
);

drop table airport_names;

INSERT INTO FirstNamesfemei (nameid,name) values (1,'Ioana') ;
INSERT INTO FirstNamesfemei (nameid,name) values (2,'Ariana');
INSERT INTO FirstNamesfemei (nameid,name) values (3,'Denisa');
INSERT INTO FirstNamesfemei (nameid,name) values (4,'Mihaela');
INSERT INTO FirstNamesfemei (nameid,name) values (5,'Camelia');
INSERT INTO FirstNamesfemei (nameid,name) values (6,'Miruna');
INSERT INTO FirstNamesfemei (nameid,name) values (7,'Isabela');
INSERT INTO FirstNamesfemei (nameid,name) values (8,'Alexandra');
INSERT INTO FirstNamesfemei (nameid,name) values (9,'Maria');
INSERT INTO FirstNamesfemei (nameid,name) values (10,'Letitia');
INSERT INTO FirstNamesfemei (nameid,name) values (11,'Claudia');
INSERT INTO FirstNamesfemei (nameid,name) values (12,'Petronela');
INSERT INTO FirstNamesfemei (nameid,name) values (13,'Madalina');
INSERT INTO FirstNamesfemei (nameid,name) values (14,'Ana');
INSERT INTO FirstNamesfemei (nameid,name) values (15,'Andreea');
INSERT INTO FirstNamesfemei (nameid,name) values (16,'Catalina');
INSERT INTO FirstNamesfemei (nameid,name) values (17,'Dana');
INSERT INTO FirstNamesfemei (nameid,name) values (18,'Diana');
INSERT INTO FirstNamesfemei (nameid,name) values (19,'Mirabela');
INSERT INTO FirstNamesfemei (nameid,name) values (20,'Doina');
INSERT INTO FirstNamesfemei (nameid,name) values (21,'Iulia');
INSERT INTO FirstNamesfemei (nameid,name) values (21,'Adriana');
INSERT INTO FirstNamesfemei (nameid,name) values (22,'Marina');
INSERT INTO FirstNamesfemei (nameid,name) values (23,'Teodora');
INSERT INTO FirstNamesfemei (nameid,name) values (24,'Bianca');
INSERT INTO FirstNamesfemei (nameid,name) values (25,'Irina');
INSERT INTO FirstNamesfemei (nameid,name) values (26,'Andra');
INSERT INTO FirstNamesfemei (nameid,name) values (27,'Cornelia');
INSERT INTO FirstNamesfemei (nameid,name) values (28,'Monica');
INSERT INTO FirstNamesfemei (nameid,name) values (29,'Ingrid');
INSERT INTO FirstNamesfemei (nameid,name) values (30,'Liliana');

INSERT INTO FirstNamesbaieti(nameid,name) values  (1,'Ion') ;
INSERT INTO FirstNamesbaieti(nameid,name) values (2,'Adrian');
INSERT INTO FirstNamesbaieti(nameid,name) values (3,'Denis');
INSERT INTO FirstNamesbaieti(nameid,name) values (4,'Mihai');
INSERT INTO FirstNamesbaieti(nameid,name) values (5,'Codrin');
INSERT INTO FirstNamesbaieti(nameid,name) values (6,'Mircea');
INSERT INTO FirstNamesbaieti(nameid,name) values (7,'Cristian');
INSERT INTO FirstNamesbaieti(nameid,name) values (8,'Alexandru');
INSERT INTO FirstNamesbaieti(nameid,name) values (9,'Marian');
INSERT INTO FirstNamesbaieti(nameid,name) values (10,'Lucian');
INSERT INTO FirstNamesbaieti(nameid,name) values (11,'Cezar');
INSERT INTO FirstNamesbaieti(nameid,name) values (12,'Petru');
INSERT INTO FirstNamesbaieti(nameid,name) values (13,'Madalin');
INSERT INTO FirstNamesbaieti(nameid,name) values (14,'Nicolae');
INSERT INTO FirstNamesbaieti(nameid,name) values (15,'Andrei');
INSERT INTO FirstNamesbaieti(nameid,name) values (16,'Catalin');
INSERT INTO FirstNamesbaieti(nameid,name) values (17,'Dan');
INSERT INTO FirstNamesbaieti(nameid,name) values (18,'Flavian');
INSERT INTO FirstNamesbaieti(nameid,name) values (19,'Iustin');
INSERT INTO FirstNamesbaieti(nameid,name) values (20,'Dorel');
INSERT INTO FirstNamesbaieti(nameid,name) values (21,'Iulian');
INSERT INTO FirstNamesbaieti(nameid,name) values (21,'Adrian');
INSERT INTO FirstNamesbaieti(nameid,name) values (22,'Marin');
INSERT INTO FirstNamesbaieti(nameid,name) values (23,'Teodor');
INSERT INTO FirstNamesbaieti(nameid,name) values (24,'Bogdan');
INSERT INTO FirstNamesbaieti(nameid,name) values (25,'Irinel');
INSERT INTO FirstNamesbaieti(nameid,name) values (26,'Matei');
INSERT INTO FirstNamesbaieti(nameid,name) values (27,'Cornel');
INSERT INTO FirstNamesbaieti(nameid,name) values (28,'Marius');
INSERT INTO FirstNamesbaieti(nameid,name) values (29,'Daniel');
INSERT INTO FirstNamesbaieti(nameid,name) values (30,'Laurentiu');

INSERT INTO FirstNamesmen(nameid,name) values (1,'John');
INSERT INTO FirstNamesmen(nameid,name) values(2,'Jack');
INSERT INTO FirstNamesmen(nameid,name) values(3,'Dennis');
INSERT INTO FirstNamesmen(nameid,name) values(4,'Michael');
INSERT INTO FirstNamesmen(nameid,name) values(5,'Chuck');
INSERT INTO FirstNamesmen(nameid,name) values(6,'David');
INSERT INTO FirstNamesmen(nameid,name) values(7,'Christian');
INSERT INTO FirstNamesmen(nameid,name) values(8,'Alexander');
INSERT INTO FirstNamesmen(nameid,name) values(9,'Mason');
INSERT INTO FirstNamesmen(nameid,name) values(10,'Jacob');
INSERT INTO FirstNamesmen(nameid,name) values(11,'James');
INSERT INTO FirstNamesmen(nameid,name) values(12,'Petre');
INSERT INTO FirstNamesmen(nameid,name) values(13,'Willian');
INSERT INTO FirstNamesmen(nameid,name) values(14,'Nicholas');
INSERT INTO FirstNamesmen(nameid,name) values(15,'Andrew');
INSERT INTO FirstNamesmen(nameid,name) values(16,'Paul');
INSERT INTO FirstNamesmen(nameid,name) values(17,'Oliver');
INSERT INTO FirstNamesmen(nameid,name) values(18,'Chuck');
INSERT INTO FirstNamesmen(nameid,name) values(19,'Albert');
INSERT INTO FirstNamesmen(nameid,name) values(20,'Logan');
INSERT INTO FirstNamesmen(nameid,name) values(21,'Ethan');
INSERT INTO FirstNamesmen(nameid,name) values(21,'Carter');
INSERT INTO FirstNamesmen(nameid,name) values(22,'Benjamin');
INSERT INTO FirstNamesmen(nameid,name) values(23,'Theodor');
INSERT INTO FirstNamesmen(nameid,name) values(24,'Jackson');
INSERT INTO FirstNamesmen(nameid,name) values(25,'Samuel');
INSERT INTO FirstNamesmen(nameid,name) values(26,'Mathew');
INSERT INTO FirstNamesmen(nameid,name) values(27,'Julian');
INSERT INTO FirstNamesmen(nameid,name) values(28,'Aaron');
INSERT INTO FirstNamesmen(nameid,name) values(29,'Nate');
INSERT INTO FirstNamesmen(nameid,name) values(30,'Jeremiah');

INSERT INTO FirstNamewomen(nameid,name) values (1,'Mia');
INSERT INTO FirstNamewomen(nameid,name)values (2,'Sophia');
INSERT INTO FirstNamewomen(nameid,name) values (3,'Matilda');
INSERT INTO FirstNamewomen(nameid,name) values (4,'Maraya');
INSERT INTO FirstNamewomen(nameid,name) values (5,'Charlotte');
INSERT INTO FirstNamewomen(nameid,name) values (6,'Sarah');
INSERT INTO FirstNamewomen(nameid,name) values (7,'Kimberly');
INSERT INTO FirstNamewomen(nameid,name) values (8,'Harper');
INSERT INTO FirstNamewomen(nameid,name) values (9,'Amelia');
INSERT INTO FirstNamewomen(nameid,name) values (10,'Mila');
INSERT INTO FirstNamewomen(nameid,name) values (11,'Luna');
INSERT INTO FirstNamewomen(nameid,name) values (12,'Lilian');
INSERT INTO FirstNamewomen(nameid,name) values (13,'Ariana');
INSERT INTO FirstNamewomen(nameid,name) values (14,'Maison');
INSERT INTO FirstNamewomen(nameid,name) values (15,'Hannah');
INSERT INTO FirstNamewomen(nameid,name) values (16,'Samantha');
INSERT INTO FirstNamewomen(nameid,name) values (17,'Carrey');
INSERT INTO FirstNamewomen(nameid,name) values (18,'Diana');
INSERT INTO FirstNamewomen(nameid,name) values (19,'Allison');
INSERT INTO FirstNamewomen(nameid,name) values (20,'Stella');
INSERT INTO FirstNamewomen(nameid,name) values (21,'Carmen');
INSERT INTO FirstNamewomen(nameid,name) values (21,'Cruela');
INSERT INTO FirstNamewomen(nameid,name) values (22,'Britney');
INSERT INTO FirstNamewomen(nameid,name) values (23,'Thriss');
INSERT INTO FirstNamewomen(nameid,name) values (24,'Jackie');
INSERT INTO FirstNamewomen(nameid,name) values (25,'Antonia');
INSERT INTO FirstNamewomen(nameid,name) values (26,'Mary');
INSERT INTO FirstNamewomen(nameid,name) values (27,'Julian');
INSERT INTO FirstNamewomen(nameid,name) values (28,'Astrid');
INSERT INTO FirstNamewomen(nameid,name) values (29,'Alexa');
INSERT INTO FirstNamewomen(nameid,name) values (30,'Melany');

INSERT INTO Nume(nameid,name) values  (1,'Popescu');
INSERT INTO Nume(nameid,name) values (2,'Ionescu');
INSERT INTO Nume(nameid,name) values (3,'Pascanu');
INSERT INTO Nume(nameid,name) values (4,'Diaconu');
INSERT INTO Nume(nameid,name) values (5,'Luca');
INSERT INTO Nume(nameid,name) values (6,'Opariuc');
INSERT INTO Nume(nameid,name) values (7,'Gavril');
INSERT INTO Nume(nameid,name) values (8,'Sandu');
INSERT INTO Nume(nameid,name) values (9,'Georgescu');
INSERT INTO Nume(nameid,name) values (10,'Petrescu');
INSERT INTO Nume(nameid,name) values (11,'Serban');
INSERT INTO Nume(nameid,name) values (12,'Andrei');
INSERT INTO Nume(nameid,name) values (13,'Anton');
INSERT INTO Nume(nameid,name) values (14,'Mihai');
INSERT INTO Nume(nameid,name) values (15,'Corzescu');
INSERT INTO Nume(nameid,name) values (16,'Samanta');
INSERT INTO Nume(nameid,name) values (17,'Doncescu');
INSERT INTO Nume(nameid,name) values (18,'Petran');
INSERT INTO Nume(nameid,name) values (19,'Cobzar');
INSERT INTO Nume(nameid,name) values (20,'Serafim');
INSERT INTO Nume(nameid,name) values (21,'Croitoru');
INSERT INTO Nume(nameid,name) values (22,'Cristescu');
INSERT INTO Nume(nameid,name) values (23,'Tunceac');
INSERT INTO Nume(nameid,name) values (24,'Avram');
INSERT INTO Nume(nameid,name) values (25,'Matei');
INSERT INTO Nume(nameid,name) values (26,'Alexandrescu');
INSERT INTO Nume(nameid,name) values (27,'Creanga');
INSERT INTO Nume(nameid,name) values (28,'Andone');
INSERT INTO Nume(nameid,name) values (29,'Pasa');
INSERT INTO Nume(nameid,name) values (30,'Pascan');

INSERT INTO LastName(nameid,name) values (1,'Smith');
INSERT INTO LastName(nameid,name) values (2,'Johnson');
INSERT INTO LastName(nameid,name) values(3,'William');
INSERT INTO LastName(nameid,name) values(4,'Jones');
INSERT INTO LastName(nameid,name) values(5,'Brown');
INSERT INTO LastName(nameid,name) values(6,'Miller');
INSERT INTO LastName(nameid,name) values(7,'Davis');
INSERT INTO LastName(nameid,name) values(8,'Taylor');
INSERT INTO LastName(nameid,name) values(9,'Moore');
INSERT INTO LastName(nameid,name) values(10,'Anderson');
INSERT INTO LastName(nameid,name) values(11,'Thomas');
INSERT INTO LastName(nameid,name) values(12,'Jackson');
INSERT INTO LastName(nameid,name) values(13,'White');
INSERT INTO LastName(nameid,name) values(14,'Harris');
INSERT INTO LastName(nameid,name) values(15,'Martin');
INSERT INTO LastName(nameid,name) values(16,'Thompson');
INSERT INTO LastName(nameid,name) values(17,'Garcia');
INSERT INTO LastName(nameid,name) values(18,'Robinson');
INSERT INTO LastName(nameid,name) values(19,'Hill');
INSERT INTO LastName(nameid,name) values(20,'Green');
INSERT INTO LastName(nameid,name) values(21,'Taylor');
INSERT INTO LastName(nameid,name) values(22,'Lopez');
INSERT INTO LastName(nameid,name) values(23,'Mitchell');
INSERT INTO LastName(nameid,name) values(24,'Petrez');
INSERT INTO LastName(nameid,name) values(25,'Baker');
INSERT INTO LastName(nameid,name) values(26,'Campbell');
INSERT INTO LastName(nameid,name) values(27,'Evans');
INSERT INTO LastName(nameid,name) values(28,'Morris');
INSERT INTO LastName(nameid,name) values(29,'Sanchez');
INSERT INTO LastName(nameid,name) values(30,'Turner');

INSERT INTO Locations values ('Iasi');
INSERT INTO Locations values ('Shanghai');
INSERT INTO Locations values ('Karachi');
INSERT INTO Locations values ('Beijing');
INSERT INTO Locations values ('Dhaka');
INSERT INTO Locations values ('Delhi');
INSERT INTO Locations values ('Lagos');
INSERT INTO Locations values ('Istanbul');
INSERT INTO Locations values ('Tokyo');
INSERT INTO Locations values ('Guangzhou');
INSERT INTO Locations values ('Mumbai');
INSERT INTO Locations values ('Moscow');

drop table AirplaneName;
DROP TABLE airplaneModel;

CREATE TABLE AirplaneName (
  name varchar2(100)
);
CREATE TABLE AirplaneModel (
  name varchar2(100)
);

INSERT INTO AirplaneName values ('Airabonita');
INSERT INTO AirplaneName values ('Baltimore');
INSERT INTO AirplaneName values ('Canso');
INSERT INTO AirplaneName values ('Dauntless');
INSERT INTO AirplaneName values ('Eagle');
INSERT INTO AirplaneName values ('Falcon');
INSERT INTO AirplaneName values ('Gannet');
INSERT INTO AirplaneName values ('Harvard');
INSERT INTO AirplaneName values ('Kingfisher');
INSERT INTO AirplaneName values ('Marauder');
INSERT INTO AirplaneName values ('Seagull');
INSERT INTO AirplaneName values ('Rocket');
INSERT INTO AirplaneName values ('Superfortress');

INSERT INTO AirplaneModel values ('Airbus A340 300');
INSERT INTO AirplaneModel values ('Airbus A340 500');
INSERT INTO AirplaneModel values ('Airbus A340 600');
INSERT INTO AirplaneModel values ('Boeing 777 200');
INSERT INTO AirplaneModel values ('Airbus A380 700');
INSERT INTO AirplaneModel values ('Boeing 777 300');
INSERT INTO AirplaneModel values ('Boeing 747 400');
INSERT INTO AirplaneModel values ('Boeing 747 8');
INSERT INTO AirplaneModel values ('Airbus A380 800');
INSERT INTO AirplaneModel values ('Airbus A380 900');
INSERT INTO AirplaneModel values ('Airbus A340 200');
INSERT INTO AirplaneModel values ('Airbus A340 100');
INSERT INTO AirplaneModel values ('Airbus A340 150');


