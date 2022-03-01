----------------- Create Sequences ----------------

CREATE SEQUENCE id_seq
    INCREMENT BY 10
    START WITH 10
    MINVALUE 10
    MAXVALUE 100
    CYCLE
    CACHE 2;

-- To get the next value of the sequence we fire ---

SELECT 
    id_seq.NEXTVAL 
FROM 
    dual;
    
-- To get the current value of the sequence ----

SELECT 
    id_seq.CURRVAL 
FROM 
    dual;


SELECT 
    id_seq.NEXTVAL 
FROM 
    dual
CONNECT BY level <= 9;


SELECT
     id_seq.NEXTVAL
FROM
    dual;


CREATE TABLE tasks(
    id NUMBER PRIMARY KEY,
    title VARCHAR2(255) NOT NULL
);


CREATE SEQUENCE task_id_seq;


INSERT INTO tasks(id, title)
VALUES(task_id_seq.NEXTVAL, 'Create Sequence in Oracle');

INSERT INTO tasks(id, title)
VALUES(task_id_seq.NEXTVAL, 'Examine Sequence Values');


SELECT  
    id, title
FROM
    tasks;

DROP TABLE tasks;


CREATE TABLE tasks(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR2(255) NOT NULL
);


SELECT 
    a.name AS table_name,
    b.name AS sequence_name
FROM   
    sys.idnseq$ c
    JOIN obj$ a ON c.obj# = a.obj#
    JOIN obj$ b ON c.seqobj# = b.obj#
WHERE 
    a.name = 'TASKS';  


INSERT INTO tasks(title)
VALUES('Complete Assignments on time');

INSERT INTO tasks(title)
VALUES('Practice all previous queries');


SELECT
    id, title
FROM
    tasks;
    
###############################################################################
------------------------ Alter & Drop Sequences -------------------

CREATE SEQUENCE invoice_seq
    START WITH 20190001;


ALTER SEQUENCE invoice_seq
CACHE 10;


DROP SEQUENCE invoice_seq;


CREATE SEQUENCE invoice_seq
    START WITH 20200001
    CACHE 10;


