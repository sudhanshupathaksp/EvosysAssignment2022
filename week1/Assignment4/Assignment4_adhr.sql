================================================================================
                            ASSIGNMENT
================================================================================
-- Q1.  Display all the information of the EMP table?

SELECT * FROM emp;

-- Q2.  Display unique Jobs from EMP table?

SELECT DISTINCT job FROM emp;

-- Q3. List the emps in the asc order of their Salaries?

SELECT
    Ename,sal
FROM
    emp
ORDER BY
    sal;

-- Q4. List the details of the emps in asc order of the Dptnos and desc of Jobs?
  
SELECT
    Empno,Ename,deptno,job
FROM
    emp
ORDER BY
    Deptno asc,
    Job desc;
    
-- Q5. Display all the unique job groups in the descending order?

SELECT DISTINCT 
    job
FROM
    emp
ORDER BY
    job desc;
    
-- Q6. Display all the details of all ‘Mgrs’

SELECT
        empno,ename,hiredate,job,mgr,sal,deptno,comm
FROM emp
WHERE empno IN
    (SELECT mgr
     FROM emp);

-- Q7. List the emps who joined before 1981

SELECT *
FROM
    emp
WHERE
    hiredate < ('01-01-1981');
    
-- Q8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal

SELECT
    Empno, Ename, Sal,round((Sal/30),2) AS Daily_Sal , Sal*12 AS Annual_Sal
FROM
    emp
ORDER BY
    Annual_sal asc;
    
-- Q9.  Display the Empno, Ename, job, Hiredate, Exp of all Mgrs

SELECT EMPNO,
       ENAME,
       JOB,
       HIREDATE,
      round( (MONTHS_BETWEEN(SYSDATE,HIREDATE)/12),2) AS EXP_IN_YEARS
FROM EMP
WHERE EMPNO IN
    (SELECT MGR
     FROM EMP);

-- Q10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369

SELECT EMPNO,
       ENAME,
       round( (MONTHS_BETWEEN(SYSDATE,HIREDATE)/12),2) AS EXP_IN_YEARS
FROM
    emp
WHERE
    mgr = 7369;
    
-- Q11. Display all the details of the emps whose Comm  Is more than their Sal

SELECT 
    empno,ename,hiredate,job,mgr,sal,deptno,comm
FROM
    emp 
WHERE
    comm > sal;
    
-- Q12. List the emps along with their Exp and Daily Sal is more than Rs 100

SELECT Ename,
       round( (MONTHS_BETWEEN(SYSDATE,HIREDATE)/12),2) AS EXP_IN_YEARS,
       round((Sal/30),2) AS Daily_sal
FROM
    emp
WHERE
    sal/30 > 100;
    
-- Q13. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order

SELECT 
    Empno,Ename,job,Deptno
FROM
    emp
WHERE
    job IN ('CLERK','ANALYST')
ORDER BY
    job desc;
    
-- Q14. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority

SELECT
    Empno,Ename,job,hiredate
FROM
    emp
WHERE
       HIREDATE IN ('1-MAY-81',
                             '3-DEC-81',
                             '17-DEC-81',
                             '19-JAN-80')
ORDER BY
    HIREDATE ASC;
    
-- Q15. List the emp who are working for the Deptno 10 or20

SELECT 
    Ename, Empno, job, mgr, hiredate,deptno
FROM
    emp
WHERE
    deptno IN (10,20);
    
-- Q16. List the emps who are joined in the year 81

SELECT *
FROM
    emp
WHERE
    EXTRACT(Year from HIREDATE) = '1981';

-- Q17. List the emps Who Annual sal ranging from 22000 and 45000

SELECT 
    Ename, Empno, job, sal
FROM 
    emp
WHERE
    Sal*12 BETWEEN 22000 AND 45000;
    
-- Q18. List the Enames those are having five characters in their Names

SELECT 
    Ename,
    LENGTH(ename) AS Name_Length
FROM
    emp
WHERE
    LENGTH(Ename) = 5;
    
-- Q19. List the Enames those are starting with ‘S’ and with five characters

SELECT 
    Ename,
    LENGTH(ename) AS Name_Length
FROM
    emp
WHERE
    LENGTH(Ename) = 5
    AND
    ename LIKE 'S%';

-- Q20. List the emps those are having four chars and third character must be ‘R’

SELECT 
    ename,empno,job,mgr,sal,hiredate,LENGTH(ename) AS Name_Length
FROM
    emp
WHERE
    LENGTH(Ename) = 4
    AND
    ename LIKE '__R%';
    
-- Q21. List the Five character names starting with ‘S’ and ending with ‘H’

SELECT
    ename,empno,job,mgr,sal,hiredate,LENGTH(ename) AS Name_Length
FROM
    emp
WHERE
    LENGTH(Ename) = 5
    AND
    ename LIKE 'S%H';
    
-- Q22. List the emps who joined in January

SELECT *
FROM
    emp
WHERE
    EXTRACT(Month from HIREDATE) = '01';
    
-- Q23. List the emps whose names having a character set ‘ll’ together

SELECT 
    ename,empno,job,mgr,sal,hiredate
FROM
    emp
WHERE
    ename LIKE '%LL%';
    
-- Q24.List the emps who does not belong to Deptno 20

SELECT 
    ename,empno,deptno
FROM
    emp
WHERE
    deptno != 20;
    
-- Q25.List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries

SELECT 
    ename,empno,job,mgr,sal
FROM
    emp
WHERE
    JOB NOT IN('PRESIDENT','MANAGER')
ORDER BY
    sal; 
    
-- Q26. List the emps whose Empno not starting with digit 78

SELECT
    ename,empno,job,mgr,sal
FROM
    emp
WHERE
    empno NOT LIKE '78%';

-- Q27. List the emps who are working under ‘MGR’  

SELECT
    e.ename ,  m.ename
FROM 
    emp e , emp m
WHERE
    e.mgr = m.empno;
    
-- Q28. List the emps who joined in any year but not belongs to the month of March

SELECT
    ename,empno,job,mgr,sal,hiredate
FROM
    emp
WHERE
    EXTRACT(MONTH FROM HIREDATE)!= '03';
    
-- Q29. List all the Clerks of Deptno 20

SELECT 
    ename,empno,job,mgr,sal,hiredate,deptno
from
    emp
where 
    job = 'CLERK' AND deptno = 20;
    
-- Q30. List the emps of Deptno 30 or 10 joined in the year 1981

SELECT 
    ename,empno,job,mgr,sal,hiredate,deptno
from
    emp
where 
    deptno IN(10,30) and EXTRACT(YEAR FROM HIREDATE)= '1981';
    
-- Q31. Display the details of SMITH

SELECT *
FROM
    emp
WHERE
    ename = 'SMITH';
    
-- Q32.  Display the location of SMITH

SELECT
    emp.ename,branch.location
FROM 
    emp JOIN dept 
    ON emp.deptno=dept.deptno
    JOIN branch
    ON dept.branchno=branch.branchno
WHERE
    ename = 'SMITH';

================================================================================
    