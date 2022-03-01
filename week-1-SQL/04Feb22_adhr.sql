-- Subqueries in DML FOR THAT WE ARE CREATING A DUMMY TABLE EMP_DUMMY
SELECT * FROM EMP;
--DROP TABLE EMP_DUMMY;
-- CREATE A COPY OF EMP IN ADHR DB  CONNCECTION INSTANCE
--CREATE TABLE <TABLE_NAME>(COL_NAME <DATATYPE>,...)
-- BELOW QUERY ONLY coppies the data and column description i.e.
-- copy structure and data of the orginal table but skips the constraints
CREATE TABLE EMP_DUMMY 
AS
    SELECT * FROM EMP;

SELECT  * FROM EMP_DUMMY;
-- Lets do DML OPERATION
DELETE FROM EMP_DUMMY ; -- SIMPLE QUERY DELETING ALL RECORS FROM EMP_DUMMY
ROLLBACK;
SELECT  * FROM EMP_DUMMY;
--#################################################
-- INSERT
-- DELETE
-- UPDATE
--#################################################
--(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
--INSERT INTO EMP_DUMMY  VALUES (?,?,?,?,?,?,?,?)
-- USE SUBQUERY TO INSERT DATA INTO EMP_DUMMY
INSERT INTO EMP_DUMMY (SELECT * FROM EMP WHERE DEPTNO=30);
SELECT * FROM EMP_DUMMY 
WHERE DEPTNO=30
ORDER BY EMPNO
-- WHEN WE CREATE TABLE USING 'AS SELECT' ON CREATE STEATEMENT
-- TABLE ONLY HAS INFORMATION ABOUT COLUMN:DATATYPE OF THE COLUMN
-- WE CAN DUPLICATE VALUES IN THIS TABLE AS THERE ARE NO CONSTRAINTS ON THE COLUMN
-- WHY WE ARE CREATING THIS TABLE : ITS USED FOR rnd purpose
-- once work done drop these tables 
-- instead delete we also can use TRUNCATE ON TABLE WHICH KEEPS THE STRUCTURE
-- BUT DELETE ALL RECORDS
TRUNCATE TABLE emp_dummy;

SELECT * FROM EMP_DUMMY;
-- ################################################################
--  EMP WHERE EMP ARE WORKING IN NEW YORK LOCATION
-- ################################################################
-- SELECT BRANCHNO FROM BRANCH WHERE LOCATION='NEW YORK';
-- SELECT DEPTNO FROM DEPT WHERE BRANCHNO IN (SELECT BRANCHNO FROM BRANCH WHERE LOCATION='NEW YORK');
-- SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE BRANCHNO IN (SELECT BRANCHNO FROM BRANCH WHERE LOCATION='NEW YORK'))
INSERT INTO EMP_DUMMY (
SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE BRANCHNO IN (SELECT BRANCHNO FROM BRANCH WHERE LOCATION='NEW YORK'))
);
    
SELECT  * FROM EMP_DUMMY;

-- Subqueries in DML FOR THAT WE ARE CREATING A DUMMY TABLE EMP_DUMMY
SELECT * FROM EMP;
--DROP TABLE EMP_DUMMY;
-- CREATE A COPY OF EMP IN ADHR DB  CONNCECTION INSTANCE
--CREATE TABLE <TABLE_NAME>(COL_NAME <DATATYPE>,...)
-- BELOW QUERY ONLY coppies the data and column description i.e.
-- copy structure and data of the orginal table but skips the constraints
CREATE TABLE EMP_DUMMY 
AS
    SELECT * FROM EMP;

SELECT  * FROM EMP_DUMMY;
-- Lets do DML OPERATION
DELETE FROM EMP_DUMMY ; -- SIMPLE QUERY DELETING ALL RECORS FROM EMP_DUMMY
ROLLBACK;
SELECT  * FROM EMP_DUMMY;
--#################################################
-- INSERT
-- DELETE
-- UPDATE
--#################################################
--(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
--INSERT INTO EMP_DUMMY  VALUES (?,?,?,?,?,?,?,?)
-- USE SUBQUERY TO INSERT DATA INTO EMP_DUMMY
INSERT INTO EMP_DUMMY (SELECT * FROM EMP WHERE DEPTNO=30);
SELECT * FROM EMP_DUMMY 
WHERE DEPTNO=30
ORDER BY EMPNO
-- WHEN WE CREATE TABLE USING 'AS SELECT' ON CREATE STEATEMENT
-- TABLE ONLY HAS INFORMATION ABOUT COLUMN:DATATYPE OF THE COLUMN
-- WE CAN DUPLICATE VALUES IN THIS TABLE AS THERE ARE NO CONSTRAINTS ON THE COLUMN
-- WHY WE ARE CREATING THIS TABLE : ITS USED FOR rnd purpose
-- once work done drop these tables 
-- instead delete we also can use TRUNCATE ON TABLE WHICH KEEPS THE STRUCTURE
-- BUT DELETE ALL RECORDS
TRUNCATE TABLE emp_dummy;

SELECT * FROM EMP_DUMMY;
-- ################################################################
--  EMP WHERE EMP ARE WORKING IN NEW YORK LOCATION
-- ################################################################
-- SELECT BRANCHNO FROM BRANCH WHERE LOCATION='NEW YORK';
-- SELECT DEPTNO FROM DEPT WHERE BRANCHNO IN (SELECT BRANCHNO FROM BRANCH WHERE LOCATION='NEW YORK');
-- SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE BRANCHNO IN (SELECT BRANCHNO FROM BRANCH WHERE LOCATION='NEW YORK'))
INSERT INTO EMP_DUMMY (
SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE BRANCHNO IN (SELECT BRANCHNO FROM BRANCH WHERE LOCATION='NEW YORK'))
);
COMMIT;    
SELECT  * FROM EMP_DUMMY ORDER BY COMM;
-- BELOW IS BASIC SYNTAX FOR UPDATING A SPECIFIC RECORD IN TABLE
UPDATE EMP_DUMMY
    SET COMM=0.1
    WHERE COMM IS NULL;
SELECT  * FROM EMP_DUMMY ORDER BY COMM;    
ROLLBACK;    
SELECT  * FROM EMP_DUMMY ORDER BY COMM;


-- HOW TO CREATE TABLE USING CREATE TABLE <TABLE_NAME> AS SELECT QUERY
-- HOW TO ADD DATA USING INSERT INTO <TABLE_NAME> (SELECT QUERY)
-- HOW TO UPDATE DATA USING UPDATE <TABLE_NAME> SET COL=VALUE WHERE COL=(SUBQUERY)
-- HOW TO DELETE DATA USING SUBQUERY
-- DELETE FROM <TABLE_NAME> WHERE EMPNO IN()
-- ################################################################
-- UPDATE SALARY BY 10% WHO ARE WORKING IN ACCOUNTING DEPARTMENT 
-- ################################################################
-- DEPTARTMENT NO OF ACCOUNTING
--SELECT DEPTNO FROM DEPT WHERE DNAME='ACCOUNTING';
--EMPLOYEES WORKING IN ACCOUNTING DEPARTMENT
SELECT * FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='ACCOUNTING');

SELECT * FROM EMP_DUMMY WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='ACCOUNTING');

UPDATE EMP_DUMMY
    SET SAL=SAL+SAL*0.10
    WHERE EMPNO IN (SELECT EMPNO FROM EMP_DUMMY WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='ACCOUNTING'));

SELECT * FROM EMP_DUMMY WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='ACCOUNTING');
COMMIT;

-- ################################################################
-- DELETE RECORDS OF EMPLOYEE WORKING IN ACCOUNTING DEPARTMENT
-- ################################################################
DELETE FROM EMP_DUMMY
WHERE EMPNO IN (SELECT EMPNO FROM EMP_DUMMY WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='ACCOUNTING'));

SELECT * FROM EMP_DUMMY;