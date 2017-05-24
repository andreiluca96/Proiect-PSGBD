DECLARE
  TYPE cur_typ IS REF CURSOR;
  c cur_typ;
  v_id number;
  v_count integer;
  v_string_type varchar2(32767);
  v_number_type number(10, 0);
  v_long_type long;
  v_date_type date;
  v_timestamp_type timestamp(6);
  v_char_type char;
  v_clob_type clob;
  v_blob_type blob;
  TYPE myNumber IS TABLE OF NUMBER INDEX BY VARCHAR2(10);
  numbers myNumber;
  file_id UTL_FILE.FILE_TYPE;
  v_query varchar2(32767);
  v_cursor_id  number;
  v_cursor_id2 number;
  v_num_columns integer;
  v_num_rows integer;
  v_desc_tab DBMS_SQL.DESC_TAB;
  v_insert_query varchar2(32767);
BEGIN
  file_id := UTL_FILE.FOPEN('MY_DIR', 'Lab10.sql', 'W');
  FOR v_linie IN (select dbms_metadata.get_ddl(object_type,object_name) as ddl from all_objects where owner = 'PROIECT_PSGBD' and object_type='TABLE') LOOP
--    DBMS_OUTPUT.PUT_LINE(v_linie.ddl);
    UTL_FILE.PUT_LINE(file_id, v_linie.ddl);
  END LOOP;
  
  FOR v_linie IN (select dbms_metadata.get_ddl(object_type,object_name) as ddl from all_objects where owner = 'PROIECT_PSGBD' and object_type='FUNCTION') LOOP
--    DBMS_OUTPUT.PUT_LINE(v_linie.ddl);
    UTL_FILE.PUT_LINE(file_id, v_linie.ddl);
  END LOOP;
  
 
    FOR v_linie IN (select dbms_metadata.get_ddl(object_type,object_name) as ddl from all_objects where owner = 'PROIECT_PSGBD' and object_type='PROCEDURE') LOOP
--    DBMS_OUTPUT.PUT_LINE(v_linie.ddl);
    UTL_FILE.PUT_LINE(file_id, v_linie.ddl);
  END LOOP;

  FOR v_linie IN (select dbms_metadata.get_ddl(object_type,object_name) as ddl from all_objects where owner = 'PROIECT_PSGBD' and object_type='VIEW') LOOP
--    DBMS_OUTPUT.PUT_LINE(v_linie.ddl);
    UTL_FILE.PUT_LINE(file_id, v_linie.ddl);
  END LOOP;

  FOR v_linie IN (select dbms_metadata.get_ddl(object_type,object_name) as ddl from all_objects where owner = 'PROIECT_PSGBD' and object_type='SEQUENCE') LOOP
--    DBMS_OUTPUT.PUT_LINE(v_linie.ddl);
    UTL_FILE.PUT_LINE(file_id, v_linie.ddl);
  END LOOP;

  FOR v_linie IN (select dbms_metadata.get_ddl(object_type,object_name) as ddl from all_objects where owner = 'PROIECT_PSGBD' and object_type='TRIGGER') LOOP
--    DBMS_OUTPUT.PUT_LINE(v_linie.ddl);
    UTL_FILE.PUT_LINE(file_id, v_linie.ddl);
  END LOOP;
  
    FOR v_linie IN (select dbms_metadata.get_ddl(object_type,object_name) as ddl from all_objects where owner = 'PROIECT_PSGBD' and object_type='INDEX') LOOP
--    DBMS_OUTPUT.PUT_LINE(v_linie.ddl);
    UTL_FILE.PUT_LINE(file_id, v_linie.ddl);
  END LOOP;
  
  v_count := 0;
  v_cursor_id := DBMS_SQL.OPEN_CURSOR;
  FOR v_linie IN (select object_name as table_name from all_objects where owner = 'PROIECT_PSGBD' and object_type='TABLE') LOOP
    v_query := 'SELECT * from ' || v_linie.table_name;
    DBMS_SQL.PARSE(v_cursor_id, v_query, DBMS_SQL.V7);
    
    dbms_sql.describe_columns(v_cursor_id, v_num_columns, v_desc_tab);
    
    OPEN c FOR 'select id from ' || v_linie.table_name;
    LOOP
      FETCH c INTO v_id;
      EXIT WHEN c%NOTFOUND;
      v_insert_query := 'INSERT INTO ' || v_linie.table_name || '(';
      FOR v_column_index IN 1..(v_num_columns-1) LOOP
        v_insert_query := v_insert_query || v_desc_tab(v_column_index).col_name || ', ';
      END LOOP;
      v_insert_query := v_insert_query || v_desc_tab(v_num_columns).col_name || ') VALUES(';
      FOR v_column_index IN 1..v_num_columns - 1 LOOP
        v_query := 'SELECT ' || v_desc_tab(v_column_index).col_name || ' FROM ' || v_linie.table_name || ' WHERE id = '|| v_id; 
        IF (v_desc_tab(v_column_index).col_type = 1) THEN
          EXECUTE IMMEDIATE v_query INTO v_string_type;
          v_insert_query := v_insert_query || '''' || v_string_type ||''', ';
          CONTINUE;
        END IF;
        IF (v_desc_tab(v_column_index).col_type = 2) THEN
  --        DBMS_OUTPUT.PUT_LINE(v_query);
          EXECUTE IMMEDIATE v_query INTO v_number_type;
          v_insert_query := v_insert_query || v_number_type ||', ';
          CONTINUE;
        END IF;
        IF (v_desc_tab(v_column_index).col_type = 8) THEN
          EXECUTE IMMEDIATE v_query INTO v_long_type;
          v_insert_query := v_insert_query || v_long_type ||', ';
          CONTINUE;
        END IF;
        IF (v_desc_tab(v_column_index).col_type = 12) THEN
          v_query := 'SELECT to_char(' || v_desc_tab(v_column_index).col_name || ', ''DD/MM/YYYY'') FROM ' || v_linie.table_name || ' WHERE id = '|| v_id; 
          EXECUTE IMMEDIATE v_query INTO v_string_type;
--          DBMS_OUTPUT.PUT_LINE(v_date_type);
          v_insert_query := v_insert_query || 'to_date(''' || v_string_type || ''', ''DD/MM/YYYY'') ';
          CONTINUE;
        END IF;
        IF (v_desc_tab(v_column_index).col_type = 180) THEN
          EXECUTE IMMEDIATE v_query INTO v_timestamp_type;
          v_insert_query := v_insert_query || 'TO_TIMESTAMP(''' ||  v_timestamp_type || ''', ''YYYY/MON/DD HH:MI:SS'')';
          CONTINUE;
        END IF;
        IF (v_desc_tab(v_column_index).col_type = 96) THEN
          EXECUTE IMMEDIATE v_query INTO v_char_type;
          v_insert_query := v_insert_query || v_char_type ||', ';
          CONTINUE;
        END IF;
        IF (v_desc_tab(v_column_index).col_type = 112) THEN
          EXECUTE IMMEDIATE v_query INTO v_clob_type;
          v_insert_query := v_insert_query || v_clob_type ||', ';
          CONTINUE;
        END IF;
        IF (v_desc_tab(v_column_index).col_type = 113) THEN
          EXECUTE IMMEDIATE v_query INTO v_blob_type;
          v_insert_query := v_insert_query || 'utl_raw.cast_to_raw(''' || UTL_RAW.CAST_TO_VARCHAR2(v_blob_type)|| ''', ';
          CONTINUE;
        END IF;
      END LOOP;
      
      IF (v_desc_tab(v_num_columns).col_type = 1) THEN
          EXECUTE IMMEDIATE v_query INTO v_string_type;
          v_insert_query := v_insert_query || '''' || v_string_type ||'''';
        END IF;
        IF (v_desc_tab(v_num_columns).col_type = 2) THEN
          EXECUTE IMMEDIATE v_query INTO v_number_type;
          v_insert_query := v_insert_query || v_number_type;
        END IF;
        IF (v_desc_tab(v_num_columns).col_type = 8) THEN
          EXECUTE IMMEDIATE v_query INTO v_long_type;
          v_insert_query := v_insert_query || v_long_type;
        END IF;
        IF (v_desc_tab(v_num_columns).col_type = 12) THEN
          v_query := 'SELECT to_char(' || v_desc_tab(v_num_columns).col_name || ', ''DD/MM/YYYY'') FROM ' || v_linie.table_name || ' WHERE id = '|| v_id; 
          EXECUTE IMMEDIATE v_query INTO v_string_type;
--          DBMS_OUTPUT.PUT_LINE(v_date_type);
          v_insert_query := v_insert_query || 'to_date(''' || v_string_type || ''', ''DD/MM/YYYY'') ';
        END IF;
        IF (v_desc_tab(v_num_columns).col_type = 180) THEN
          EXECUTE IMMEDIATE v_query INTO v_timestamp_type;
          v_insert_query := v_insert_query || 'TO_TIMESTAMP(''' ||  v_timestamp_type || ''', ''YYYY/MON/DD HH:MI:SS'')';
        END IF;
        IF (v_desc_tab(v_num_columns).col_type = 96) THEN
          EXECUTE IMMEDIATE v_query INTO v_char_type;
          v_insert_query := v_insert_query || v_char_type;
        END IF;
        IF (v_desc_tab(v_num_columns).col_type = 112) THEN
          EXECUTE IMMEDIATE v_query INTO v_clob_type;
          v_insert_query := v_insert_query || v_clob_type;
        END IF;
        IF (v_desc_tab(v_num_columns).col_type = 113) THEN
          EXECUTE IMMEDIATE v_query INTO v_blob_type;
          v_insert_query := v_insert_query || 'utl_raw.cast_to_raw(''' || UTL_RAW.CAST_TO_VARCHAR2(v_blob_type)|| ''', ';
        END IF;
        
      v_insert_query := v_insert_query || ')';
      
      UTL_FILE.PUT_LINE(file_id, v_insert_query, true);
      v_count := v_count + 1;
--      UTL_FILE.FFLUSH(file_id);
     END LOOP;
--     UTL_FILe.FFLUSH(file_id);
  END LOOP;
END;

UPDATE flights set departuredate = to_date('06/03/2017', 'MM/DD/YYYY'), arrivaldate=to_date('06/03/2017', 'MM/DD/YYYY')  where id = 1;
UPDATE flights set departuredate = to_date('06/09/2017', 'MM/DD/YYYY'), arrivaldate=to_date('06/09/2017', 'MM/DD/YYYY') where id = 3;
UPDATE flights set departuredate = to_date('05/23/2017', 'MM/DD/YYYY'), arrivaldate=to_date('06/10/2017', 'MM/DD/YYYY') where id = 2;

select departuredate from flights;

select * from customers where id = 1873;
delete from customers where id = 1873;

INSERT INTO CUSTOMERS(ID, FIRSTNAME, LASTNAME, ADRESS, DATEOFBIRTH) VALUES(1873, 'Popescu', 'Catalin', 'Istanbul', to_date('25/05/1997', 'DD/MM/YYYY'));

select count(*) from airplanes;
commit;

