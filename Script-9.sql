SELECT STUDNO, NAME, STUDENT.DEPTNO D1, DEPARTMENT.DEPTNO D2, DNAME 
FROM SAMPLE.STUDENT, DEPARTMENT
WHERE STUDENT.DEPTNO = DEPARTMENT.DEPTNO;
-- <>: 비동등 연산자

-- 학생 16명
-- 학과 7개

-- 카티션 프로덕트
SELECT COUNT(*) FROM DEPARTMENT;

SELECT STUDNO, NAME, S.DEPTNO , DNAME 
FROM STUDENT s , DEPARTMENT d 
WHERE S.DEPTNO = D.DEPTNO;

-- 전인하 학생의 학번, 이름, 학과이름, 학과위치를 조회
SELECT STUDNO , NAME 
FROM STUDENT s 
WHERE NAME = '전인하';

SELECT STUDNO, NAME, DNAME, LOC 
FROM STUDENT s , DEPARTMENT d 
WHERE NAME = '전인하' AND S.DEPTNO = D.DEPTNO ;

-- 몸무게가 80KG 이상인 학생의 학번, 이름, 체중, 학과이름, 학과위치 조회
SELECT S.STUDNO , NAME, DNAME, LOC, WEIGHT
FROM STUDENT s , DEPARTMENT d
WHERE S.DEPTNO = D.DEPTNO AND WEIGHT >= 80 ;

-- 1호관 소속 학생의 학번, 이름, 학과이름 조회
SELECT LOC, DNAME, STUDNO, NAME 
FROM DEPARTMENT d, STUDENT s 
WHERE LOC = '1호관' AND S.DEPTNO = D.DEPTNO;


-- ANSI 99 (SQL 표준)
SELECT STUDNO, NAME, DNAME 
FROM DEPARTMENT d 
CROSS JOIN STUDENT s 
WHERE LOC = '1호관';


-- 자연조인을 사용해서 학번, 이름, 학과번호, 학과이름 조회
SELECT STUDNO, NAME, DNAME, DEPTNO 
FROM STUDENT s 
NATURAL JOIN DEPARTMENT d ;

SELECT * 
FROM STUDENT s 
NATURAL JOIN DEPARTMENT d ;


SELECT *
FROM STUDENT s , DEPARTMENT d 
WHERE S.DEPTNO = D.DEPTNO;


-- JOIN ~ USING, JOIN ~ ON
SELECT *
FROM STUDENT s 
JOIN DEPARTMENT d USING(DEPTNO);

SELECT S.DEPTNO 
FROM STUDENT s 
JOIN DEPARTMENT d ON S.DEPTNO = D.DEPTNO;


-- NATURAL JOIN을 사용 교수번호, 교수이름, 학과번호, 학과이름 조회
SELECT PROFNO, NAME, DEPTNO, DNAME 
FROM PROFESSOR p
NATURAL JOIN DEPARTMENT d ;

-- 교수별 급여 등급을 조회, 대상테이블 : PROFESSOR, SALGRADE
SELECT * FROM SALGRADE s ;

SELECT PROFNO, NAME, SAL
FROM PROFESSOR, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL;

SELECT PROFNO, NAME, SAL, GRADE
FROM PROFESSOR p 
JOIN SALGRADE s 
ON SAL >= LOSAL AND SAL <= HISAL


SELECT * FROM STUDENT s ;

-- 학번, 이름, 교수번호, 담당교수이름 조회
SELECT STUDNO, S.NAME, PROFNO, P.NAME 
FROM PROFESSOR p 
FULL JOIN STUDENT s USING(PROFNO)
ORDER BY STUDNO, PROFNO;

-- (+)를 사용한 OUTER JOIN

SELECT *
FROM STUDENT s , PROFESSOR p 
WHERE S.PROFNO(+) = P.PROFNO ;
-- WHERE S.PROFNO = P.PROFNO(+) ;
-- WHERE S.PROFNO(+) = P.PROFNO(+) ;  : FULL JOIN 안된다


-- 탄생 월별 학생 숫자 구하기
SELECT M, NVL(CNT, 0) CNT
FROM (
	SELECT TO_CHAR(BIRTHDATE, 'MM') M, COUNT(*) CNT
	FROM STUDENT s 
	GROUP BY TO_CHAR(BIRTHDATE, 'MM')
) A
RIGHT JOIN (
	SELECT LTRIM(TO_CHAR(ROWNUM, '00')) M
	FROM STUDENT s 
	WHERE ROWNUM <= 12
) B USING (M)
ORDER BY 1;


-- DEPARTMENT를 대상으로 부서이름과 상위부서이름을 조회


SELECT * FROM TAB;
SELECT * FROM LOCATIONS L;
SELECT * FROM EMPLOYEES E ;
SELECT * FROM DEPARTMENT d ;

SELECT D.DNAME || '의 소속학과는 ' || NVL2(D2.DNAME, D2.DNAME || '입니다', '없습니다')
FROM DEPARTMENT d 
LEFT JOIN DEPARTMENT d2 ON D.COLLEGE=D2.DEPTNO ;

-- 사번, 성, 상사의 사번, 상사의 성
--SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.MANAGER_ID, E2.LAST_NAME
--FROM EMPLOYEES E
--LEFT JOIN EMPLOYEES E2 ON E.MANAGER_ID = E2.EMPLOYEE_ID
--ORDER BY 1;

-- 학생의 학번, 이름, 담당교수의 교수번호, 교수이름, 학생의 소속학과이름을 조회
-- 단 모든 학생의 정보를 조회
--SELECT STUDNO, NAME, DNAME
SELECT STUDNO, S.NAME, PROFNO, P.NAME, DNAME 
FROM STUDENT s 
NATURAL JOIN DEPARTMENT d
LEFT JOIN PROFESSOR p USING(PROFNO);

-- 서브쿼리
-- 학번, 이름, 학과번호, 학과이름 조회
SELECT 
	STUDNO,
	NAME,
	DEPTNO,
	(SELECT DNAME FROM DEPARTMENT d WHERE D.DEPTNO = S.DEPTNO) DNAME,
	(SELECT NAME FROM PROFESSOR p WHERE P.PROFNO = S.DEPTNO) PNAME
FROM STUDENT S;














