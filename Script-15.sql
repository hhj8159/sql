-- 주소록 테이블 생성
-- id varchar(100), name varchar(100)
CREATE TABLE ADDR (
	ID VARCHAR2 (100),
	NAME VARCHAR2(100)
);

-- 주소록에 컬럼추가 birth date
ALTER TABLE ADDR ADD (BIRTH DATE);

SELECT * FROM ADDR2;

-- 주소록에 COMMENTS 컬럼 추가 VARCHAR(200) 기본값 'NO COMMRNTS'
ALTER TABLE ADDR ADD (COMMENTS VARCHAR2(200) DEFAULT 'NO COMMENT');

INSERT INTO ADDR (ID) VALUES ('id1');

-- 주소록에 COMMENTS 컬럼 삭제
ALTER TABLE ADDR DROP (COMMENTS);

-- 주소록 ID컬럼의 크기를 10 BYTE로 변경
ALTER TABLE ADDR MODIFY ID VARCHAR(10);

-- ADDR 테이블 이름을 ADDR2로 변경
RENAME ADDR TO ADDR2;

-- ADDR2 테이블에 '주소록'이라는 COMMENT 추가
COMMENT ON TABLE ADDR2 IS '주소록';

-- ADDR2의 NAME 컬럼에 '이름'이라는 COMMENT 추가
COMMENT ON COLUMN ADDR2.NAME IS '이름';

-- 데이터 무결성 (비즈니스 로직

-- 테이블 생성과 동시에 생성해야 좋다 (SYS_CN) 기본키에 적용
 
-- ****무결성 제약조건 생성 예 시험 나옴***** 534P

-- 강좌 테이블 생성(SUBJECT)
-- SUBNO 번호
-- SUBNAME 이름
-- TERM 학기 (1~2)
-- TYPE 필수 여부 CHAR(1)

CREATE TABLE SUBJECT (
	SUBNO NUMBER CONSTRAINT SUBJECT_PK PRIMARY KEY,
 	SUBNAME VARCHAR(200) CONSTRAINT SUBNAME_NN NOT NULL,
	TERM CHAR(1) CONSTRAINT TERM_CK CHECK (TERM IN('1', '2')),
	TYPE CHAR(1)
);

ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_PK PRIMARY KEY(STUDNO);

CREATE TABLE SUGANG (
	STUDNO CONSTRAINT SUGANG_STUDNO_FK REFERENCES STUDENT,
	SUBNO NUMBER,
	REGDATE DATE,
	RESULT NUMBER(3),
	CONSTRAINT SUGANG_SUBNO_FK FOREIGN KEY(SUBNO) REFERENCES SUBJECT(SUBNO),
	CONSTRAINT SUGANG_PK PRIMARY KEY(STUDNO, SUBNO)
);

-- 학과테이블에 계약조건 넣기
-- pk : deptno, dname : NN, COLLEGE <> DEPTNO FK
-- PK는 이름 잘지어라 
ALTER TABLE DEPARTMENT MODIFY (DEPTNO CONSTRAINT DEPATMENT_PK PRIMARY KEY);
ALTER TABLE DEPARTMENT MODIFY (DNAME NOT NULL);
ALTER TABLE DEPARTMENT MODIFY (COLLEGE REFERENCES DEPARTMENT(DEPTNO));

SELECT * FROM PROFESSOR p ;

-- 교수 테이블에 제약조건 넣기
-- PK, 이름 NN , 아이디 UNIQUE
ALTER TABLE PROFESSOR ADD CONSTRAINT PROFESSOR_PK PRIMARY KEY(PROFNO);
ALTER TABLE PROFESSOR MODIFY (NAME NOT NULL);
ALTER TABLE PROFESSOR ADD CONSTRAINT PROF_USERID_UK UNIQUE(USERID);
ALTER TABLE PROFESSOR ADD FOREIGN KEY(DEPTNO) REFERENCES DEPARTMENT;

SELECT * FROM STUDENT s ;

-- 학생
-- 이름 NN, 아이디 UNIQUE, 주민번호 UNIQUE, FK DEPTNO, FK PROFNO
ALTER TABLE STUDENT MODIFY (NAME NOT NULL);
ALTER TABLE STUDENT MODIFY (USERID CONSTRAINT STUD_USERID_UK UNIQUE);
ALTER TABLE STUDENT ADD CONSTRAINT STUD_IDNUM_UK UNIQUE(IDNUM);
ALTER TABLE STUDENT MODIFY (DEPTNO REFERENCES DEPARTMENT);
ALTER TABLE STUDENT ADD FOREIGN KEY(PROFNO) REFERENCES PROFESSOR;














