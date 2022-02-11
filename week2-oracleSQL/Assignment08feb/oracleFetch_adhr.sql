----------------------------- Oracle FETCH -------------------------

CREATE TABLE MarkList
(
    id NUMBER,
    name varchar2(20),
    mathematics NUMBER, 
    physics NUMBER,
    chemistry NUMBER
);

INSERT INTO MarkList VALUES(501,'Surya',99,97,85);
INSERT INTO MarkList VALUES(502,'Charan',99,93,88);
INSERT INTO MarkList VALUES(503,'Sravan',91,98,94);
INSERT INTO MarkList VALUES(504,'Ram',92,99,82);
INSERT INTO MarkList VALUES(505,'Aryan',94,99,88);
INSERT INTO MarkList VALUES(506,'Sathwik',91,88,91);
INSERT INTO MarkList VALUES(507,'Madhav',90,97,89);

SELECT Id, name, mathematics+physics+chemistry AS total
FROM MarkList
ORDER BY mathematics+physics+chemistry DESC
OFFSET 0 ROWS
FETCH NEXT 3 ROWS ONLY;