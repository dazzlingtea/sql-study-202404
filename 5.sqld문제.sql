
CREATE TABLE quiz_50 (
    col1 NUMBER(10),
    col2 NUMBER(10),
    col3 NUMBER(10)
);

INSERT INTO quiz_50 VALUES (10, 20, null);
INSERT INTO quiz_50 VALUES (15, null, null);
INSERT INTO quiz_50 VALUES (50, 70, 20);

SELECT * FROM quiz_50;

--1번 90
SELECT SUM(col2) FROM quiz_50;
--2번 140
SELECT SUM(col1 + col2 + col3) FROM quiz_50;
--3번 90
SELECT SUM(col2 + col3) FROM quiz_50;
--4번 110
SELECT SUM(col2) + SUM(col3) FROM quiz_50;

DROP TABLE quiz_27;
CREATE TABLE quiz_27_1 (
    tabkey NUMBER(10),
    cola NUMBER(10),
    colb CHAR(4),
    colc NUMBER(10)
);

INSERT INTO quiz_27_1(tabkey, cola, colb, colc) VALUES(1, null, '가', null);
INSERT INTO quiz_27_1(tabkey, cola, colb, colc) VALUES(2, 1, '가', 5);
INSERT INTO quiz_27_1(tabkey, cola, colb, colc) VALUES(3, null, '나', 2);
INSERT INTO quiz_27_1(tabkey, cola, colb, colc) VALUES(4, 3, '나', 0);
INSERT INTO quiz_27_1(tabkey, cola, colb, colc) VALUES(5, null, null, 3);
INSERT INTO quiz_27_1(tabkey, cola, colb, colc) VALUES(6, 5, '다', 0);
INSERT INTO quiz_27_1(tabkey, cola, colb, colc) VALUES(7, null, '다', null);

SELECT colb
    ,MAX(cola) cola1
    ,MIN(cola) cola2
    ,sum(cola + colc) sumac
FROM quiz_27_1
group by colb
order by colb
; 


select * from quiz_27_1;