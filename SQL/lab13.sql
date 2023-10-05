CREATE OR REPLACE FUNCTION add_salaries() 
RETURNS emp.sal%TYPE AS 

$$

DECLARE
   salary emp.sal%TYPE;
   total emp.sal%TYPE;
   c_emp CURSOR FOR select sal from emp where empno >= 7700;

BEGIN
 total = 0;
 OPEN c_emp;
  LOOP 
  FETCH c_emp INTO salary;
    EXIT WHEN NOT FOUND; 
  total = total + salary;
  END LOOP; 
 CLOSE c_emp; 
 RETURN total;
END;
$$

LANGUAGE 'plpgsql';