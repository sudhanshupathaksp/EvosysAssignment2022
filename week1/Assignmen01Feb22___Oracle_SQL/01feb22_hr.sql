-- ################################################################
-- 11.4 Sort the all employees details as per department in ascending by emp no descending
-- ################################################################
SELECT 
    deptno,empno,ename,job,mgr,hiredate,sal,comm,branchno    
FROM
    emp
ORDER BY
    deptno,empno DESC;
-- ################################################################
-- 11.5 Sort the all employees details as per department no, salary
-- ################################################################
SELECT
    deptno,empno,ename,job,mgr,hiredate,sal,comm,branchno
FROM 
    emp
ORDER BY
    deptno,sal;
-- ################################################################
-- 11.6 Sort the all employees details as per salary
-- ################################################################
SELECT 
    deptno,empno,ename,job,mgr,hiredate,sal,comm,branchno
FROM 
    emp
ORDER BY
    sal;

-- ################################################################
-- 12. WHERE CLAUSE  - Restriction
-- Where caluse with in,not in, is null, is not null, between, not between
-- Where caluse with Comparison Operator (<,>,<=,>=,=,<>,!=)
-- Where caluse with Logical Operator (AND,OR,NOT)
-- ################################################################
-- ################################################################
-- 12.1 Display all emp working in deptno 10
-- ################################################################
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
WHERE deptno=10;
-- ################################################################
-- 12.2 Display employee no,name working department no 10
-- ################################################################
SELECT 
    empno,ename,deptno
FROM
    emp
WHERE deptno=10;

-- ################################################################
-- 12.3 Display all employees working in department no 10 or 20
-- using OR
-- using IN
-- ################################################################
SELECT 
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno=10 or deptno=20;
--
SELECT 
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno IN (10,20);

-- ################################################################
-- 12.3 Display all employees working in department no 10 or 20 OR 30
-- ################################################################
SELECT 
    empno,ename,deptno
FROM
    emp
WHERE 
    deptno IN (10,20,30);
-- ################################################################
-- 12.4 Display all employees not working in 10,20,30
-- ################################################################
SELECT
    empno,ename,deptno
FROM
    emp
WHERE
    deptno not in (10,20,30);
-- ################################################################
-- 12.4 Display all employees not working in any department i.e. deptno is null
-- ################################################################

SELECT
    empno,ename,deptno
FROM
    emp
WHERE
    deptno is null;
-- ################################################################
-- 12.4 Display all employees who is working in some department i.e. deptno not null
-- ################################################################

SELECT
    empno,ename,deptno
FROM
    emp
WHERE
    deptno is not null;
-- ################################################################
-- 12.7 Display employee no,name,comm working department no 30 and earning some commission
-- ################################################################
SELECT 
    empno,ename,comm
FROM 
    emp
WHERE 
    deptno=30 and comm is not null and comm <>0;
-- Below query retuns zero records as we can't compare null with values
SELECT 
    empno,ename,comm
FROM 
    emp
WHERE 
    deptno=30 and comm not in (null,0);-- comm!=null or comm!=0
-- ################################################################
-- 12.8 Display all employees not earning any commission
-- ################################################################
SELECT
    empno,ename,comm
FROM
    emp
WHERE 
    comm is null or comm = 0;

-- ################################################################
-- 12.9 Display all employees earning salary in range 1000 to 3000 including boundry values
-- ################################################################
SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal>=1000 and sal<=3000
ORDER BY
    sal;
    
    

SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal BETWEEN 1000 AND 3000
ORDER BY
    sal;


-- ################################################################
-- 12.10 Display all employees earning salary in range 1000 to 3000 excluding boundry values
-- ################################################################
SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal>1000 and sal<3000
ORDER BY
    sal;

SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal BETWEEN 1001 AND 2999
ORDER BY
    sal;

SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal BETWEEN (1000+1) AND (3000-1)
ORDER BY
    sal;


-- ################################################################
-- 12.11 Display all employees earning salary not in range 1000 to 3000
-- ################################################################
SELECT
    empno,ename,sal
FROM
        emp
WHERE
    sal not between 1000 and 3000
ORDER BY
    sal;
    
    
-- ################################################################
-- 12.12 Display all employees earning 5000salary 
-- ################################################################
SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal=5000
ORDER BY 
    sal;
-- ################################################################
-- 12.13 Display all employees not earning 5000 salary 
-- ################################################################
SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal!=5000
ORDER BY
    sal;
--    <>
SELECT
    empno,ename,sal
FROM
    emp
WHERE
    sal<>5000
ORDER BY
    sal;

-- ################################################################
-- 13. Where caluse with like
--     WHERE WITH ESCAPE Clause
--   = comparison ->equality-> exact match
-- ################################################################
-- ################################################################
-- 13.1 Display all details of SMITH
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename='SMITH'
ORDER BY
    ename;
--    below query won't return any record as data saved in a cell is Case Sensetive
SELECT
    empno,ename
FROM
    emp
WHERE
    ename='Smith'
ORDER BY
    ename;    

-- ################################################################
-- 13.2 Display all details of EMPLOYEE who's name starts with S
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename LIKE 'S%'
ORDER BY
    ename;    

-- ################################################################
-- 13.3 Display all details of EMPLOYEE who's name ends with S
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename LIKE '%S'
ORDER BY
    ename;    

-- ################################################################
-- 13.4 Display all details of EMPLOYEE who's name contains LL
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename LIKE '%LL%'
ORDER BY
    ename;    

-- ################################################################
-- 13.5 Display all details of EMPLOYEE who's name contains _
-- ################################################################
SELECT
    empno,ename
FROM
    emp
WHERE
    ename LIKE '%\_%' ESCAPE '\' 
ORDER BY
    ename;    
-- ################################################################
-- 14. Aggregate Function max,min,sum,avg,count 
--     SUM
--     AVG
--     COUNT
--     MAX
--     MIN
-- ################################################################
-- 14.1 Display count of employees
-- count(*) including null values 
-- ################################################################
SELECT
    COUNT(*)
FROM 
    emp;
-- ################################################################
-- 14.2 Display count of employees WORKING IN SOME DEPT
-- count(deptno) excludes the null vlaue 
-- ################################################################
SELECT
    COUNT(*),COUNT(deptno),COUNT(EMPNO)
FROM
    emp;
-- ################################################################
-- 14.3 Display max,min,sum,avg salary of employees
-- ################################################################
SELECT
    MIN(sal),MAX(sal),SUM(sal),AVG(sal),COUNT(sal)
FROM 
    emp;

-- ################################################################
-- 15. Aggregate Function max,min,sum,avg,count  and grouping
-- ################################################################
-- 15.1 Display department wise count of employees
-- 15.1 Display  job wise count of employees
-- ################################################################
SELECT
        deptno,count(empno)
FROM
        emp
GROUP BY 
        deptno
ORDER BY 
        deptno;
-- 15.1 Display  job wise count of employees        
SELECT
        job,count(empno)
FROM
        emp
GROUP BY 
        job
ORDER BY 
        job;        
-- 15.1 Display  job wise count of employees                
SELECT
        job,count(empno)
FROM
        emp
GROUP BY 
        job
ORDER BY 
        count(empno);
        
-- ################################################################
-- 15.2 Display department wise max,min,avg salary
-- ################################################################
SELECT
    deptno,min(sal),max(sal),avg(sal,sum(sal)
FROM
    emp
GROUP BY
        deptno
ORDER BY 
        deptno;


SELECT
    deptno,min(sal),max(sal),round(avg(sal),2),sum(sal)
FROM
    emp
GROUP BY
        deptno
HAVING 
        deptno=30
ORDER BY 
        deptno;
-- ################################################################
-- 15.3 Display department wise max,min,avg salary where avg(sal)<2500
-- ################################################################
SELECT 
    deptno,min(sal),max(sal),avg(sal),sum(sal)
FROM
        emp
GROUP BY
        deptno
HAVING 
        avg(sal)<2500
ORDER BY
        deptno;

-- ################################################################
-- 16. Special functions nvl() 
-- If comm is null display 0
-- ################################################################
SELECT
    empno,ename,sal,comm, sal+comm
FROM 
    emp
ORDER BY
    comm;

-- correct solution
SELECT
    empno,ename,sal,comm,sal+comm, sal+nvl(comm,0),sal+nvl(comm,100)
FROM 
    emp
ORDER BY
    comm;



SELECT
    empno,ename,deptno,nvl(deptno,99),
    case 
                            when deptno is null 
                                then 'No Department'
                            end
FROM
    emp
ORDER BY 
    deptno;


        