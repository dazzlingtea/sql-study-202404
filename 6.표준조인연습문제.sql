

-- ����� first_name, employee_id, department_id, dept_name
SELECT 
    E.employee_id
    , E.first_name
    , E.department_id
    , d.department_name
FROM employees E
INNER JOIN departments D     -- 106/107 �μ����� null�� ��� ����
ON e.department_id = d.department_id
ORDER BY E.employee_id
;
-- NATURAL JOIN
SELECT 
    E.employee_id
    , E.first_name
    , department_id
    , d.department_name
FROM employees E
NATURAL JOIN departments D     -- 32/107 
ORDER BY E.employee_id
;

SELECT 
    E.employee_id
    , E.first_name
    , E.department_id
    , d.department_name
FROM employees E
INNER JOIN departments D     
ON e.department_id = d.department_id  -- 32/107 
    AND e.manager_id = d.manager_id
ORDER BY E.employee_id
;

SELECT 
    E.employee_id
    , E.first_name
    , department_id
    , d.department_name
FROM employees E
INNER JOIN departments D     
USING (department_id)
ORDER BY E.employee_id
;
SELECT 
    E.employee_id
    , E.first_name
    , department_id
    , d.department_name
FROM employees E
INNER JOIN departments D     
USING (department_id, manager_id)
ORDER BY E.employee_id
;

-- ��������

-- 1. employees���̺�� departments���̺��� inner join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT 
    E.employee_id
    , E.first_name
    , E.last_name
    , E.department_id
    , D.department_name
FROM employees E
INNER JOIN departments D
ON e.department_id = d.department_id
;

-- 2. employees���̺�� departments���̺��� natural join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT 
    E.employee_id
    , E.first_name
    , E.last_name
    , department_id
    , D.department_name
FROM employees E
NATURAL JOIN departments D
; 


-- 3. employees���̺�� departments���̺��� using���� ����Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT 
    E.employee_id
    , E.first_name
    , E.last_name
    , department_id
    , D.department_name
FROM employees E
INNER JOIN departments D
USING (department_id)
;


-- 4. employees���̺�� departments���̺�� locations ���̺��� 
--    join�Ͽ� employee_id, first_name, department_name, city�� ��ȸ�ϼ���
SELECT
    E.employee_id
    , E.first_name
    , D.department_name
    , L.city
FROM employees E
JOIN departments D
ON e.department_id = d.department_id
JOIN locations L
ON d.location_id = l.location_id
;

-- 5. employees ���̺�� jobs ���̺��� INNER JOIN�Ͽ� 
-- ����� first_name, last_name, job_title�� ��ȸ�ϼ���.
SELECT 
    E.first_name
    , E.last_name
    , J.job_title
FROM employees E
INNER JOIN jobs J
ON e.job_id = j.job_id
;


-- 6. employees ���̺�� departments ���̺��� INNER JOIN�Ͽ� 
-- �μ���� �� �μ��� �ִ� �޿����� ��ȸ�ϼ���.
SELECT
    e.department_id
    , d.department_name �μ���
    , MAX(E.salary) �ִ�޿�
FROM employees E
INNER JOIN departments D
ON e.department_id = d.department_id
GROUP BY e.department_id, d.department_name
ORDER BY e.department_id
;
-- 7. employees ���̺�� jobs ���̺��� INNER JOIN�Ͽ� 
--    ������ ��� �޿��� ���� Ÿ��Ʋ�� ��ȸ�ϼ���.
SELECT 
    e.job_id
    , j.job_title "���� Ÿ��Ʋ"
    , AVG(E.salary) "������ ��� �޿�"
FROM employees E
INNER JOIN jobs J
ON e.job_id = j.job_id
GROUP BY e.job_id, j.job_title
ORDER BY 1
;