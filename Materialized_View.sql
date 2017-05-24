drop materialized view named_flights;
CREATE MATERIALIZED VIEW named_flights
BUILD IMMEDIATE
REFRESH COMPLETE
ON DEMAND
AS
(
  SELECT flights.id, experienced_crew(flights.id), airplanes.model as "Airplane_Model", a2.name as "Departure_airport", a1.name as "Arrival_airport", flights.departureDate as "Departure_date", flights.arrivalDate as "Arrival_date"
  from flights
  left join airplanes on airplaneID = airplanes.id
  left join airports a1 on a1.id = flights.airportArrivalId
  left join airports a2 on a2.id = flights.airportDepartureId
);

select * from named_flights;

drop materialized view iasi_customers;
CREATE MATERIALIZED VIEW iasi_customers
BUILD IMMEDIATE
REFRESH COMPLETE
ON demand
FOR UPDATE
AS
(
  SELECT * from customers where adress = 'Iasi'
);

select max(id) from customers;

insert into iasi_customers values(111625, 'Luca', 'Andrei', 'Iasi', to_Date('08/06/1996', 'dd/mm/yyyy'));

CREATE OR REPLACE TRIGGER insert_before_iasi_customers
  BEFORE INSERT OR UPDATE ON iasi_customers
  FOR EACH ROW
  DECLARE
    v_query varchar2(3000);
  BEGIN
    IF (:new.adress not like '%Iasi%') THEN
      RAISE_APPLICATION_ERROR(-20101, 'You cannot add other city than Iasi for this view.');
      ROLLBACK;
    END IF;
  END;
  
insert into iasi_customers values(111630, 'Luca', 'Andrei', 'Iasi', to_Date('08/06/1996', 'dd/mm/yyyy'));

select * from customers where id > 111601;

SET SERVEROUTPUT ON;

select * from iasi_customers where id > 111601;


select * from iasi_customers where id = 241; 


