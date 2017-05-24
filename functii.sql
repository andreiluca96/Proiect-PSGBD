CREATE OR REPLACE FUNCTION experienced_crew(p_id_flight flights.id%type)
RETURN number AS
   v_count_total number := 0;
   v_count_exp number := 0;
   v_years number := 0;
   v_procent number:=0;
BEGIN
    FOR v_std_linie IN (select * from Crew where id in(select id from Assignment where id=p_id_flight)) LOOP
      v_count_total:=v_count_total+1;
      select floor(months_between(sysdate, to_date(to_char(v_std_linie.EmploymentDate,'YYYY-MM-DD'),'YYYY-MM-DD'))/12) into v_years from dual;
      if(v_years>=2) then
        v_count_exp:=v_count_exp+1;
      end if;
    END LOOP;
    IF (v_count_total = 0) THEN
      RETURN 0;
    END IF;
    v_procent:=v_count_exp/v_count_total;
    if(v_procent>=0.75) then
      return 1;
    else return 0;
    end if;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      raise_application_error(-20001,'Nu am gasit date!!');
END;

CREATE OR REPLACE FUNCTION count_flights RETURN NUMBER AS
  v_count NUMBER(10);
BEGIN
  SELECT max(id) INTO v_count FROM FLIGHTS;
  
  RETURN v_count + 1;

  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    raise_application_error (-20001,'Nu am gasit date!!');
END;
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION is_current_flight(p_flight_id flights.id%TYPE) RETURN NUMBER AS 
  v_departure_date DATE;
  v_arrival_date DATE;
BEGIN
  SELECT DEPARTUREDATE, ARRIVALDATE into v_departure_date, v_arrival_date
  FROM flights
  where id=p_flight_id;
  
  IF (SYSDATE BETWEEN v_departure_date AND v_arrival_date) THEN
    RETURN 1;
  END IF;
  
  RETURN 0;
  
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      raise_application_error (-20001,'Nu am gasit date!!');
END;

CREATE OR REPLACE FUNCTION is_upcoming_flight(p_flight_id flights.FLIGHTID%TYPE) RETURN NUMBER AS 
  v_departure_date DATE;
BEGIN
  SELECT DEPARTUREDATE into v_departure_date FROM FLIGHTS WHERE FLIGHTID=p_flight_id;
  
  IF (v_departure_date BETWEEN SYSDATE AND ADD_MONTHS(SYSDATE, 1)) THEN
    return 1;
  END IF;
  
  RETURN 0;
  
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN 0;
      EXCEPTION
      raise_application_error (-20001,'Nu am gasit date!!');
END;

BEGIN
  DBMS_OUTPUT.put_line(count_flights());
END;

SELECT * FROM (SELECT airplanes.* , ROWNUM AS "R" FROM AIRPLANES) WHERE R <= 10 AND R >= 5;

INSERT INTO Assignment VALUES (1, 2);
INSERT INTO Assignment VALUES (15, 2);
INSERT INTO Assignment VALUES (10, 2);
INSERT INTO Assignment VALUES (6, 2);
INSERT INTO Assignment VALUES (5, 2);

INSERT INTO Assignment VALUES (9, 4);
INSERT INTO Assignment VALUES (3, 4);
INSERT INTO Assignment VALUES (13, 4);
INSERT INTO Assignment VALUES (8, 4);

INSERT INTO Assignment VALUES (5, 5);
INSERT INTO Assignment VALUES (3, 5);
INSERT INTO Assignment VALUES (17, 5);
INSERT INTO Assignment VALUES (20, 5);
INSERT INTO Assignment VALUES (4, 5);

INSERT INTO Assignment VALUES (4, 6);
INSERT INTO Assignment VALUES (21, 6);
INSERT INTO Assignment VALUES (19, 6);
INSERT INTO Assignment VALUES (5, 6);

INSERT INTO Assignment VALUES (6, 7);
INSERT INTO Assignment VALUES (8, 7);
INSERT INTO Assignment VALUES (17, 7);
INSERT INTO Assignment VALUES (13, 7);

INSERT INTO Assignment VALUES (7, 8);
INSERT INTO Assignment VALUES (17, 8);
INSERT INTO Assignment VALUES (9, 8);
INSERT INTO Assignment VALUES (21, 8);

INSERT INTO Assignment VALUES (3, 9);
INSERT INTO Assignment VALUES (15, 9);
INSERT INTO Assignment VALUES (2, 9);
INSERT INTO Assignment VALUES (7, 9);

INSERT INTO Assignment VALUES (9, 10);
INSERT INTO Assignment VALUES (20, 10);
INSERT INTO Assignment VALUES (14, 10);
INSERT INTO Assignment VALUES (7, 10);

INSERT INTO Assignment VALUES (11, 1);
INSERT INTO Assignment VALUES (1, 1);
INSERT INTO Assignment VALUES (2, 1);
INSERT INTO Assignment VALUES (4, 1);


