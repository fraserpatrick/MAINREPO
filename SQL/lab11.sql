/* prompt the user for a value */
\prompt 'Enter the lowest value for employee number!\n' enumber


/* execute the query on the database */
SELECT TO_CHAR ( current_date, 'DD/Mon/YY' ) TODAY ,
EMPNO, DEPTNO, ENAME, SAL
FROM EMP
WHERE EMPNO >= (:enumber);
