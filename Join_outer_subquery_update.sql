SELECT *
	FROM 사원
	JOIN 부서    # 이렇게 쓰면 안됨. 곱하기 연산이 나오게 됨. 
	  ON 사원.`소속부서` = 부서.`부서번호'
	
SELECT * FROM 부서;

SELECT *
 FROM ACCIDENT, EMP, NOODLE;
 
 SELECT*FROM EMP;
 SELECT*FROM DEPT;
 
 SELECT *
  FROM EMP, DEPT
  WHERE EMP.DEPTNO = DEPT.DEPTNO;
  
SELECT *
 FROM EMP
 JOIN DEPT
   ON EMP.DEPTNO = DEPT.DEPTNO;
  
SELECT * FROM EMP;
SELECT * FROM DEPT;



#BANANA 고객이 주문한 제품의 이름

SELECT *
 FROM 주문
 JOIN 제품
   ON 주문.주문제품 = 제품.제품번호
 WHERE 주문.주문고객 = 'banana'
 
 
 
 SELECT 주문.주문일자
   FROM 고객
   JOIN 주문
   ON 고객.고객아이디 = 주문.주문고객
   WHERE 고객.나이 >=30;
   
   
   

SELECT *
 FROM 고객 C
 JOIN 주문 O
   ON C.`고객아이디` = O.`주문고객`
 JOIN 제품 P
   ON O.`주문제품` = P.제품번호
 WHERE C . 고객이름 = '고영석';
 
 
 
 
 SELECT P.`제품명`, O.`수량`, O.`주문일자`
  FROM 주문 O 
  JOIN 고객 C
    ON O.`주문고객`= C.고객아이디
  JOIN 제품 P
    ON P.`제품번호` = O.`주문제품`
  WHERE O.`배송지` = '서울시 마포구';
  
  
SELECT ENAME,DEPT.DEPTNO,DEPT.DNAME
 FROM EMP
 JOIN DEPT
   ON EMP.DEPTNO = DEPT.DEPTNO;
  
  
  SELECT *
 FROM EMP
 JOIN DEPT
   ON EMP.DEPTNO = DEPT.DEPTNO;
   
   
   SELECT ENAME,COMM,SAL,DEPT.LOC 
 FROM EMP
 JOIN DEPT
   ON EMP.DEPTNO = DEPT.DEPTNO
 WHERE COMM IS NOT NULL;  
 
 
    SELECT SUM(SAL),DEPT.DNAME 
 FROM EMP
 JOIN DEPT
   ON EMP.DEPTNO = DEPT.DEPTNO
   WHERE DEPT.LOC = 'NEW YORK' OR DEPT.LOC ='DALLAS'
   GROUP BY DEPT.DNAME
 
 
 
SELECT E1.EMPNO, E1.ENAME,E1.MGR, E2.ENAME
 FROM EMP E1
 JOIN EMP E2
 ON   E1.MGR = E2.EMPNO;
 
 
 
 # OUTER, LEFT
 
 SELECT * FROM 제품;
 SELECT * FROM 주문 ; 
 
 #LEFT 를 더 많이 씀 !! 
 SELECT * 
  FROM 제품 P #수가 더 많은 것
  LEFT JOIN 주문 O #수가 더 적은 것. 
    ON P.`제품번호`=O.`주문제품`;
    
SELECT * 
  FROM 주문 O #수가 더 적은 것
  RIGHT JOIN 제품 P #수가 더 많은 것. 
    ON P.`제품번호`=O.`주문제품`;
 
 
 
 
 CREATE TABLE IT_MEMBER (
 NUM INT
 , NAME VARCHAR(10)
 , COURSE_NO INT
);
INSERT INTO IT_MEMBER VALUES (1, 'AA', 1);
INSERT INTO IT_MEMBER VALUES (2, 'BB', 1);
INSERT INTO IT_MEMBER VALUES (3, 'CC', 2);
INSERT INTO IT_MEMBER VALUES (4, 'DD', 2);
INSERT INTO IT_MEMBER VALUES (5, 'EE', 4);
INSERT INTO IT_MEMBER VALUES (6, 'FF', NULL);


CREATE TABLE COURSE02 (
 COURSE_NO INT
 , COURSE_NAME VARCHAR(20)
);
INSERT INTO COURSE02 VALUES (1, 'DIGITAL');
INSERT INTO COURSE02 VALUES (2, 'BIG DATA');
INSERT INTO COURSE02 VALUES (3, 'CLOUD');
INSERT INTO COURSE02 VALUES (4, 'NFC');



SELECT *
 FROM COURSE02 C
 JOIN IT_MEMBER I
 ON C.COURSE_NO = I.COURSE_NO
 
 
 
SELECT *
 FROM IT_MEMBER I
 LEFT JOIN COURSE02 C
 ON C.COURSE_NO = I.COURSE_NO
 
 
 
 SELECT NUM,NAME,C.COURSE_NO, COURSE_NAME
 FROM COURSE02 C
 RIGHT JOIN IT_MEMBER I
 ON C.COURSE_NO = I.COURSE_NO
 
 
 
 --SUBQUERY
 
 SELECT * FROM EMP;
 
 SELECT *
  FROM EMP
  WHERE SAL IN  (
                SELECT SAL
                 FROM EMP
                 WHERE SAL = 1250
                 );
                 
                 
SELECT * 
 FROM EMP
 WHERE SAL >= ( SELECT SAL
 					  FROM EMP
 					  WHERE ENAME = 'ALLEN');
 					  

SELECT * 
 FROM EMP
 WHERE DEPTNO = (SELECT *
                 FROM EMP
                 WHERE MGR IS NULL) ;	
					  


SELECT *
  FROM EMP
  WHERE SAL < ( SELECT AVG(SAL)
 						 FROM EMP
  							WHERE DEPTNO = (SELECT DEPTNO
  													FROM EMP
  													WHERE COMM = 0))
  													
  													
  													
  													
-- UPDATE

SELECT * FROM 제품;

UPDATE 제품 SET 제품명 = '쿵떡파이' 
WHERE 제품명 = '통큰파이'; 
#WHERE 조건을 항상 열어야 한다 !!!! 



#※ DB 접속 툴 HeidiSQL 사용 시 Auto Commit 비활성화
 SET @@AUTOCOMMit = 0;
ROLLBACK;


  


  				  



 
                 
 
 
 