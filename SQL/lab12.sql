
-- Query 1

SELECT ename, job FROM emp WHERE hiredate < '01-Jan-1982'AND hiredate >'01-May-1981';

-- Query 2

SELECT job FROM emp WHERE job LIKE '%ANA%';

-- Note that the % works as a wildcard for zero or more arbitrary
-- characters and the key word LIKE indicates that we are matching
-- a pattern involving wildcards to a given attribute.

-- Query 3

SELECT ename, dname from emp, dept;

-- Query 4

SELECT ename, dname from emp, dept where dept.deptno = emp.deptno;