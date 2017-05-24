DECLARE
  v_counter number(10);
  v_random_date date;
BEGIN
  v_counter := 0;
  for v_linie1 IN (select * from nume) LOOP
    for v_linie2 IN (select * from FirstNamesbaieti) LOOP
      for v_linie3 IN (select * from Locations) LOOP
        for i IN 1..10 LOOP
          v_counter := v_counter + 1;
          select to_date(trunc(dbms_random.value(TO_CHAR(DATE '1997-01-01', 'J'),TO_CHAR(DATE '1997-12-31', 'J'))), 'J') into v_random_date
          from DUAL;
          INSERT INTO Customers VALUES (
          v_counter,
          v_linie1.name,
          v_linie2.name,
          v_linie3.name,
          v_random_date
          );
        end LOOP;
      end LOOP;
    end LOOP;  
  end LOOP;
END;

select * from nume;
select * from locations;
select count(*) from Customers;

DECLARE
  v_counter number(10);
  v_random_date date;
  v_random_date2 date;
  v_random_company number(10);
  v_capacity number(10);
BEGIN
  v_counter := 0;
  for v_linie1 IN (select * from AirplaneName) LOOP
    for v_linie2 IN (select * from AirplaneModel) LOOP
      v_capacity := dbms_random.value(200, 700);
      for j IN 1..10 LOOP
        select to_date(trunc(dbms_random.value(TO_CHAR(DATE '1980-01-01', 'J'),TO_CHAR(DATE '2016-12-31', 'J'))), 'J') into v_random_date2
          from DUAL;
        for i IN 1..10 LOOP
          v_counter := v_counter + 1;
          select to_date(trunc(dbms_random.value(TO_CHAR(DATE '2016-01-01', 'J'),TO_CHAR(DATE '2017-12-31', 'J'))), 'J') into v_random_date
          from DUAL;
          v_random_company := dbms_random.value(1, 10);
          INSERT INTO Airplanes VALUES (
          v_counter,
          v_random_company,
          v_linie1.name,
          v_linie2.name,
          v_capacity,
          v_random_date2,
          v_random_date
          );
        end LOOP;
      end LOOP;
    end LOOP;  
  end LOOP;
END;

select * from airplanes order by id;

INSERT INTO Airports VALUES (1, 'Otopeni', 'Bucuresti', 100);
INSERT INTO Airports VALUES (2, 'Stefan cel Mare', 'Suceava', 40);
INSERT INTO Airports VALUES (3, 'Transilvania', 'Targu Mures', 50);
INSERT INTO Airports VALUES (4, 'Delta Dunarii', 'Tulcea', 20);
INSERT INTO Airports VALUES (5, 'Avram Iancu', 'Cluj', 80);
INSERT INTO Airports VALUES (6, 'Henri Coanda', 'Bucuresti', 120);
INSERT INTO Airports VALUES (7, 'Aurel Vlaicu', 'Bucuresti', 130);
INSERT INTO Airports VALUES (8, 'George Enescu', 'Bacau', 100);
INSERT INTO Airports VALUES (9, 'Traian Vuia', 'Timisoara', 100);
INSERT INTO Airports VALUES (10, 'Mihail Kogalniceanu', 'Constanta', 100);

select * from airports;

INSERT INTO Ticket VALUES (1, 2, 3, 100);
INSERT INTO Ticket VALUES (2, 5, 6, 40);
INSERT INTO Ticket VALUES (3, 7, 9, 50);
INSERT INTO Ticket VALUES (4, 2, 1, 20);
INSERT INTO Ticket VALUES (5, 4, 5, 80);
INSERT INTO Ticket VALUES (6, 1, 2, 120);
INSERT INTO Ticket VALUES (7, 4, 6, 130);
INSERT INTO Ticket VALUES (8, 2, 8, 100);
INSERT INTO Ticket VALUES (9, 6, 7, 100);
INSERT INTO Ticket VALUES (10, 4, 8, 100);

select * from Ticket;

INSERT INTO Assignment VALUES (1, 1, 2);
INSERT INTO Assignment VALUES (2, 2, 3);
INSERT INTO Assignment VALUES (3, 3, 4);
INSERT INTO Assignment VALUES (4, 4, 5);
INSERT INTO Assignment VALUES (5, 5, 6);
INSERT INTO Assignment VALUES (6, 6, 7);
INSERT INTO Assignment VALUES (7, 7, 8);
INSERT INTO Assignment VALUES (8, 8, 9);
INSERT INTO Assignment VALUES (9, 9, 10);
INSERT INTO Assignment VALUES (10, 10, 1);

select * from Assignment;

INSERT INTO Crew(id,Name,Nationality,EmploymentDate,Position) values (1,'Ionescu Marian','Romanian',to_date('25-03-1999','dd-mm-yyyy'),'Pilot');
INSERT INTO Crew(id,Name,Nationality,EmploymentDate,Position) values (2,'Brown John','British',to_date('29-08-2006','dd-mm-yyyy'),'Flight Attendant');
INSERT INTO Crew(id,Name,Nationality,EmploymentDate,Position) values (3,'Scarlet Mary','American',to_date('02-03-2012','dd-mm-yyyy'),'Stewardes');
INSERT INTO Crew(id,Name,Nationality,EmploymentDate,Position) values (4,'Ajbanza Kurrki','Israelian',to_date('31-10-2016','dd-mm-yyyy'),'Pilot');
INSERT INTO Crew(id,Name,Nationality,EmploymentDate,Position) values (5,'Lucrezio del Mares','Italian',to_date('10-09-2009','dd-mm-yyyy'),'Pilot');
INSERT INTO Crew(id,Name,Nationality,EmploymentDate,Position) values (6,'Popescu Florin','Romanian',to_date('25-01-2011','dd-mm-yyyy'),'Flight Attendant');
INSERT INTO Crew(id,Name,Nationality,EmploymentDate,Position) values (7,'Ionescu Ioana','Romanian',to_date('29-12-2012','dd-mm-yyyy'),'Pilot');
INSERT INTO Crew(id,Name,Nationality,EmploymentDate,Position) values (8,'James Peter','American',to_date('25-03-2008','dd-mm-yyyy'),'Flight Attendant');
INSERT INTO Crew(id,Name,Nationality,EmploymentDate,Position) values (9,'Hill Jack','British',to_date('18-03-2009','dd-mm-yyyy'),'Pilot');
INSERT INTO Crew(id,Name,Nationality,EmploymentDate,Position) values (10,'Albu Casandra','Romanian',to_date('20-04-2014','dd-mm-yyyy'),'Stewardes');

select * from Crew;


INSERT INTO Companies(id,name) values (1,'Tarom') ;
INSERT INTO  Companies(id,name) values (2,'BlueAir');
INSERT INTO  Companies(id,name) values (3,'WizzAir');
INSERT INTO  Companies(id,name) values (4,'TurkishAirlines');
INSERT INTO Companies(id,name) values (5,'EasyJet');
INSERT INTO  Companies(id,name) values (6,'BritishAirlines');
INSERT INTO  Companies(id,name) values (7,'Ryanair');
INSERT INTO  Companies(id,name) values (8,'Korean Air');
INSERT INTO  Companies(id,name) values (9,'American Air');
INSERT INTO  Companies(id,name) values (10,'EgyptAir');

select * from Companies;

INSERT INTO Flights values (1, 1, 1, 2, to_date('25-03-1999','dd-mm-yyyy'), to_date('26-03-1999','dd-mm-yyyy'));
INSERT INTO Flights values (2, 1, 1, 2, to_date('26-03-1999','dd-mm-yyyy'), to_date('27-03-1999','dd-mm-yyyy'));
INSERT INTO Flights values (3, 2, 1, 2, to_date('27-03-1999','dd-mm-yyyy'), to_date('29-03-1999','dd-mm-yyyy'));
INSERT INTO Flights values (4, 2, 1, 2, to_date('28-03-1999','dd-mm-yyyy'), to_date('29-03-1999','dd-mm-yyyy'));
INSERT INTO Flights values (5, 3, 1, 2, to_date('29-03-1999','dd-mm-yyyy'), to_date('30-03-1999','dd-mm-yyyy'));
INSERT INTO Flights values (6, 3, 1, 2, to_date('21-03-1999','dd-mm-yyyy'), to_date('22-03-1999','dd-mm-yyyy'));
INSERT INTO Flights values (7, 6, 1, 2, to_date('22-03-1999','dd-mm-yyyy'), to_date('22-03-1999','dd-mm-yyyy'));
INSERT INTO Flights values (8, 7, 1, 2, to_date('23-03-1999','dd-mm-yyyy'), to_date('23-03-1999','dd-mm-yyyy'));
INSERT INTO Flights values (9, 9, 1, 2, to_date('12-03-1999','dd-mm-yyyy'), to_date('22-03-1999','dd-mm-yyyy'));
INSERT INTO Flights values (10, 5, 1, 2, to_date('13-03-1999','dd-mm-yyyy'), to_date('13-03-1999','dd-mm-yyyy'));

select * from flights;