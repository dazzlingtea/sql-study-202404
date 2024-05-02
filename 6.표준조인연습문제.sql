

-- 사원의 first_name, employee_id, department_id, dept_name
SELECT 
    E.employee_id
    , E.first_name
    , E.department_id
    , d.department_name
FROM employees E
INNER JOIN departments D     -- 106/107 부서정보 null인 사원 누락
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

-- 연습문제

-- 1. employees테이블과 departments테이블을 inner join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
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

-- 2. employees테이블과 departments테이블을 natural join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT 
    E.employee_id
    , E.first_name
    , E.last_name
    , department_id
    , D.department_name
FROM employees E
NATURAL JOIN departments D
; 


-- 3. employees테이블과 departments테이블을 using절을 사용하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
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


-- 4. employees테이블과 departments테이블과 locations 테이블을 
--    join하여 employee_id, first_name, department_name, city를 조회하세요
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

-- 5. employees 테이블과 jobs 테이블을 INNER JOIN하여 
-- 사원의 first_name, last_name, job_title을 조회하세요.
SELECT 
    E.first_name
    , E.last_name
    , J.job_title
FROM employees E
INNER JOIN jobs J
ON e.job_id = j.job_id
;


-- 6. employees 테이블과 departments 테이블을 INNER JOIN하여 
-- 부서명과 각 부서의 최대 급여값을 조회하세요.
SELECT
    e.department_id
    , d.department_name 부서명
    , MAX(E.salary) 최대급여
FROM employees E
INNER JOIN departments D
ON e.department_id = d.department_id
GROUP BY e.department_id, d.department_name
ORDER BY e.department_id
;
-- 7. employees 테이블과 jobs 테이블을 INNER JOIN하여 
--    직무별 평균 급여와 직무 타이틀을 조회하세요.
SELECT 
    e.job_id
    , j.job_title "직무 타이틀"
    , AVG(E.salary) "직무별 평균 급여"
FROM employees E
INNER JOIN jobs J
ON e.job_id = j.job_id
GROUP BY e.job_id, j.job_title
ORDER BY 1
;