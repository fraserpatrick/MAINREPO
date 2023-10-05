--This code will only run when all occurrences of <ENTER> are replaced with meaningful code.

CREATE OR REPLACE FUNCTION add_rooms() RETURNS <ENTER> AS 

$$

DECLARE
   bedrooms <ENTER>;
   total <ENTER>;
   num CURSOR FOR <ENTER>;

BEGIN
 total = 0;
 OPEN num;
  LOOP 
  FETCH num INTO bedrooms;
    EXIT WHEN NOT FOUND; 
  <ENTER>
  END LOOP; 
 CLOSE num; 
 RETURN total;
END;
$$

LANGUAGE 'plpgsql';

