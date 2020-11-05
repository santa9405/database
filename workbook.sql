-- SQL01_SELECT(Basic) 풀기

-- 1번
SELECT DEPARTMENT_NAME "학과 명", CATEGORY 계열
FROM TB_DEPARTMENT;

-- 2번
SELECT DEPARTMENT_NAME || '의 정원은' || CAPACITY || '명 입니다.' AS "학과별 정원"
FROM TB_DEPARTMENT;

-- 3번
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE (DEPARTMENT_NO = '001') 
AND (ABSENCE_YN = 'Y')
AND (STUDENT_SSN LIKE '_______2%');

-- 4번
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO BETWEEN 'A513079' AND 'A513119';

-- 5번
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN '20' AND '30';

-- 6번
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

-- 7번
SELECT DEPARTMENT_NAME
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NO IS NULL;

-- 8번
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- 9번
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT
ORDER BY 1;

-- 10번
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ENTRANCE_DATE LIKE '02%'
AND STUDENT_ADDRESS LIKE '전주%'
AND (ABSENCE_YN = 'N');


-- SQL02_SELECT(함수) 풀기

-- 1번
SELECT STUDENT_NO 학번, STUDENT_NAME 이름, TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD') 입학년도
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY ENTRANCE_DATE;


-- 2번
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE PROFESSOR_NAME NOT LIKE '___';


-- 3번
SELECT PROFESSOR_NAME, TRUNC((SYSDATE - TO_DATE(19||SUBSTR(PROFESSOR_SSN,1,6), 'RRMMDD'))/365) 나이
FROM TB_PROFESSOR
ORDER BY 나이;

-- 4번
SELECT SUBSTR(PROFESSOR_NAME, 2,2) 이름
FROM TB_PROFESSOR;

-- 5번
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE)-EXTRACT(YEAR FROM TO_DATE(SUBSTR(STUDENT_SSN,1,6))) > 19;

-- 6번
SELECT TO_CHAR(TO_DATE('2020/12/25'), 'DAY') 크리스마스 FROM DUAL;

-- 7번
SELECT TO_CHAR(TO_DATE('99/10/11', 'YY/MM/DD'), 'YYYY"년" MM"월" DD"일"')"1", -- YY는 현재 세기를 적용
           TO_CHAR(TO_DATE('49/10/11', 'YY/MM/DD'), 'YYYY"년" MM"월" DD"일"')"1",
           TO_CHAR(TO_DATE('99/10/11', 'RR/MM/DD'), 'RRRR"년" MM"월" DD"일"')"2", -- RR은 읽어들인 값이 50년 이상이면 이전세기
           TO_CHAR(TO_DATE('49/10/11', 'RR/MM/DD'), 'RRRR"년" MM"월" DD"일"')"2" --                             50년 미만이면 현재세기 적용
FROM DUAL;

-- 8번
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%';




