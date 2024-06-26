

SELECT * FROM tb_sal_his;

-- 집계함수 (다중행 함수)
-- 여러 행을 묶어서 한번에 함수를 적용


SELECT 
    COUNT(*) "지급 횟수",
    SUM(pay_amt) "지급 총액",
    ROUND(AVG(pay_amt), 2) "평균 지급액",
    MAX(pay_amt) "최대 지급액",
    MIN(pay_amt) "최소 지급액"
FROM tb_sal_his
;
SELECT 
    SUBSTR(emp_nm, 1, 1)
FROM tb_emp
;

SELECT * FROM tb_emp;

SELECT  -- 41건
    COUNT(*)
FROM tb_emp
;

SELECT -- 41건
    direct_manager_emp_no
FROM tb_emp;

SELECT  -- 40건
    COUNT(direct_manager_emp_no)
FROM tb_emp
;
SELECT -- 13줄
    emp_nm
FROM tb_emp
WHERE emp_nm LIKE '김%'
;
SELECT -- 13건
    COUNT(emp_nm)
FROM tb_emp
WHERE emp_nm LIKE '김%'
;

------------------------------
-- GROUP BY

SELECT 
    COUNT(emp_no) "총 사원수",
    MIN(birth_de) "최연장자 생일",
    MAX(birth_de) "최연소자 생일"
FROM tb_emp
;

-- 부서별로 사원수가 몇명인지
-- 부서별로 최연장자의 생일은 언젠지?

-- GROUP BY: 지정된 컬럼으로 소그룹화한 후 
-- 각 그룹별로 집계함수를 각각 적용

SELECT 
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
ORDER BY dept_cd
;

SELECT 
    dept_cd 부서코드,
    COUNT(emp_no) "부서별 사원수",
    MIN(birth_de) "부서 최연장자 생일",
    MAX(birth_de) "부서 최연소자 생일"
FROM tb_emp
GROUP BY dept_cd
ORDER BY dept_cd
;
-- PK 기준으로 그룹화하면 행 수만큼 집계 41건
SELECT 
    COUNT(*)
FROM tb_emp
GROUP BY emp_no
;
SELECT 
    dept_cd,
    COUNT(*) "부서별 사원수"
FROM tb_emp
GROUP BY dept_cd
;

SELECT
    emp_no,
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') "사원별 급여평균",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고급여",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no
;
SELECT
    pay_de,
    SUM(pay_amt)
FROM tb_sal_his
GROUP BY pay_de
ORDER BY pay_de
;
-- GROUP BY절에 사용한 컬럼만
-- SELECT에서 직접조회 가능
SELECT 
    emp_no,
--    emp_nm,
--    dept_cd,
    MAX(birth_de)
FROM tb_emp
GROUP BY emp_no
;

SELECT 
    dept_cd 부서코드 , sex_cd 성별코드 , COUNT(*)
FROM tb_emp
GROUP BY dept_cd, sex_cd
ORDER BY dept_cd
;

---------------------------------------------------
-- HAVING
-- 사원별로 2019년에 급여 평균액, 
-- 최소지급액, 최대지급액 조회

SELECT
    emp_no,
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') "사원별 급여평균",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고급여",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
--HAVING SUBSTR(pay_de, 1, 4) = '2019'
ORDER BY emp_no
;

-- WHERE : 집계 전 필터링
-- HAVING : 집계 후 필터링
SELECT
    emp_no,
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') "사원별 급여평균",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고급여",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING  AVG(pay_amt) >= 4000000
ORDER BY emp_no
;

-- 부서별로 가장 어린사람의 생년월일, 연장자의 생년월일, 부서별 총 사원 수를 조회
-- 그런데 부서별 사원이 1명인 부서의 정보는 조회하고 싶지 않음.

SELECT
    dept_cd 부서코드,
    MAX(birth_de),
    MIN(birth_de),
    COUNT(*)
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(*) > 1
ORDER BY 부서코드 
;

-------------------------------------------------------------------------

-- ORDER BY : 정렬
-- ASC : 오름차 정렬 (기본값), DESC : 내림차 정렬
-- 항상 SELECT절의 맨 마지막에 위치

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no
;

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm ASC
;

SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY dept_cd, emp_nm DESC
;


SELECT 
    emp_no AS 사번
    , emp_nm AS 이름
    , addr AS 주소
FROM tb_emp
ORDER BY 이름 DESC
;

SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, 1 DESC
;


SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, emp_no DESC
;

SELECT emp_no AS 사번, emp_nm AS 이름, addr AS 주소
FROM tb_emp
ORDER BY 이름, 1 DESC
;

SELECT 
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;

SELECT 
	EMP_NM ,
	DIRECT_MANAGER_EMP_NO 
FROM TB_EMP
ORDER BY DIRECT_MANAGER_EMP_NO DESC
;


-- 사원별로 2019년 월평균 수령액이 450만원 이상인 사원의 사원번호와 2019년 연봉 조회
SELECT 
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
--ORDER BY SUM(pay_amt) DESC
ORDER BY 연봉 DESC
;

-- null 정렬
SELECT 
    emp_nm
    , direct_manager_emp_no
FROM tb_emp
ORDER BY direct_manager_emp_no DESC
;
