CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(10) NOT NULL,
    price NUMBER(10) DEFAULT 1000,
    reg_date DATE    
);

-- INSERT
INSERT INTO goods 
    (id, goods_name, price, reg_date)
VALUES 
    (1, '��ǳ��', 120000, sysdate);

INSERT INTO goods 
    (id, goods_name, price, reg_date)
VALUES 
    (2, '��Ź��', 2000000, sysdate);

INSERT INTO goods 
    (goods_name, price, reg_date)
VALUES 
    ('�ް�', 1500, sysdate);
    
INSERT INTO goods 
    (id, price, reg_date)
VALUES 
    (3, 1500, sysdate);

INSERT INTO goods 
    (id, goods_name, reg_date)
VALUES 
    (3, '�ް�', sysdate);
    
INSERT INTO goods 
    (id, goods_name)
VALUES 
    (4, '���');

INSERT INTO goods 
    (goods_name, id, reg_date, price)
VALUES 
    ('����', 5, sysdate, '49000');

-- �÷��� ������ ���̺��� ������� �ڵ� ����
INSERT INTO goods 
VALUES 
    (6, '�����', 1000000, sysdate);


-- UPDATE
UPDATE goods
SET goods_name = '������'
WHERE id = 1;

UPDATE goods
SET price = 9999;

UPDATE goods
SET id = 11
WHERE id = 4;

-- ������ ������ �ߺ��Ǹ� ����
UPDATE goods
SET id = 1
WHERE id = 11;

UPDATE goods
SET price = null
WHERE id = 3;

UPDATE goods
SET goods_name = 'û����', 
    price = 299000
WHERE id = 3;

-- DELETE

DELETE FROM goods
WHERE id = 11;

-- ���� ���� delete�ϸ� ��ü���� ��
-- �ٸ� �� ������ ������ ������
--DELETE FROM goods;
--TRUNCATE TABLE goods; -- ���� �Ұ� & CREATE TABLE �������� ���ư�
--DROP TABLE goods; -- ���� �Ұ�, ���̺� ��ü�� ����

--DELETE FROM goods
--WHERE price >= 110000;


SELECT * FROM goods;

-- SELECT �⺻

SELECT 
    certi_cd,
    certi_nm,
    issue_insti_nm
FROM tb_certi;

SELECT 
    certi_nm,
    certi_cd,
    issue_insti_nm
FROM tb_certi;

-- �ߺ� ����
SELECT DISTINCT
    issue_insti_nm
FROM tb_certi;

-- ��� �÷� ��ȸ
SELECT *
FROM tb_certi;

-- �� ��Ī �ο�
SELECT 
    emp_nm AS "�����",
    addr AS "�ּ�"
FROM tb_emp;

SELECT 
    emp_nm �����,
    addr �ּ�
FROM tb_emp;

SELECT 
    emp_nm �����,
    addr ������ �ּ�
FROM tb_emp;


-- ���ڿ� �����ϱ�
SELECT
    '�ڰ���: ' || certi_nm AS "�ڰ��� ����"
FROM tb_certi;

SELECT 
    certi_nm || ' (' || issue_insti_nm || ')' AS "�ڰ���"
FROM tb_certi;

