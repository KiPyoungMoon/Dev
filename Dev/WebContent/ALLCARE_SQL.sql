
1. 노인테이블 생성 외래키 설정

CREATE TABLE OLD(
	ID		NUMBER			PRIMARY KEY,
	NAME	VARCHAR2(20)	NOT NULL,
	BIRTH	VARCHAR2(20)	NOT NULL,
	ADDRESS VARCHAR2(50),
	TEL		VARCHAR2(15),
	FAMTEL	VARCHAR2(15),
	SPECIAL	VARCHAR2(50),
	FAMID	VARCHAR2(20),
	CONSTRAINT OLD_FAMID_FK FOREIGN KEY(FAMID) REFERENCES MEMBER(ID)
);

ALTER TABLE OLD MODIFY(BIRTH VARCHAR2(20));
ALTER TABLE OLD MODIFY(ADDRESS VARCHAR2(500));

1-1. OLD ID SEQUENCE 생성.
CREATE SEQUENCE OLD_ID_SEQ
	START		WITH	1
	INCREMENT	BY		1
	NOMAXVALUE;

2. 맴버테이블 생성

CREATE TABLE MEMBER(
	ID		VARCHAR2(20)	PRIMARY KEY,
	PW		VARCHAR2(20),
	BIRTH	VARCHAR2(20),
	TEL		VARCHAR2(15)
);

ALTER TABLE MEMBER MODIFY(BIRTH VARCHAR2(20));
ALTER TABLE MEMBER ADD(NAME VARCHAR(20)); 

3. 센서테이블 생성

CREATE TABLE SENSOR(
	MAC		VARCHAR2(30)	PRIMARY KEY,
	ID		NUMBER,
	KINDS	VARCHAR2(20),
	CONSTRAINT SENSOR_ID_FK FOREIGN KEY(ID) REFERENCES OLD(ID) 
);

4. 센서값 테이블 생성

CREATE TABLE SEN_VAL(
	IDX		NUMBER			PRIMARY KEY,
	MAC		VARCHAR2(30),
	SEN_VAL	VARCHAR2(30),
	CONSTRAINT SEN_VAL_FK FOREIGN KEY(MAC) REFERENCES SENSOR(MAC)
);

DROP TABLE SEN_VAL;
4-1. IDX SEQUENCE 생성.

CREATE SEQUENCE SEN_VAL_IDX_SEQ
	START		WITH	1
	INCREMENT	BY		1
	NOMAXVALUE; 

DROP SEQUENCE SEN_VAL_IDX_SEQ;

// 센서 테이블들 분리 4. 4-1은 삭제
// 온습도 테이블 +  복약테이블

4-2. 복약 테이블
CREATE TABLE CHK_FILL(
	IDX		NUMBER		PRIMARY KEY,
	ID		NUMBER,
	CHK		VARCHAR2(30),
	DAY		VARCHAR2(30)
)

4-2-1. 복약테이블 IDX 생성
CREATE SEQUENCE CHK_FILL_TDX_SEQ
	START		WITH	1
	INCREMENT	BY		1
	NOMAXVALUE;
	
4-3. 온습도 테이블
CREATE TABLE TH_LOG(
	IDX		NUMBER		PRIMARY KEY,
	ID		NUMBER,
	TEMP	VARCHAR2(20),
	HUMI	VARCHAR2(20),
	CONSTRAINT TH_LOG_ID_FK FOREIGN KEY(ID) REFERENCES OLD(ID)
);

4-3-1. 온습도 테이블 IDX 생성
CREATE SEQUENCE TH_LOG_IDX_SEQ
	START		WITH	1
	INCREMENT	BY		1
	NOMAXVALUE;

5. 최종 센서 반응시간 테이블 생성

CREATE TABLE SEN_LAST(
	IDX			NUMBER			PRIMARY KEY,
	ID			NUMBER,
	SEN_LAST	VARCHAR2(50),
	MAC			VALCHAR2(30),
	CONSTRAINT SEN_LAST_FK FOREIGN KEY(ID) REFERENCES OLD(ID),
	CONSTRAINT SEN_MAC_FK FOREIGN KEY(MAC) REFERENCES SENSOR(MAC)
);

ALTER TABLE SEN_LAST ADD(MAC VARCHAR2(30));
ALTER TABLE SEN_LAST MODIFY(SEN_LAST VARCHAR2(50));

ALTER TABLE SEN_LAST
	ADD CONSTRAINT SEN_MAC_FK FOREIGN KEY(MAC) REFERENCES SENSOR(MAC);
	
5-1. IDX SEQUENCE 생성.

CREATE SEQUENCE SEN_LAST_IDX_SEQ
	START		WITH 1
	INCREMENT	BY 1
	NOMAXVALUE;
	
6. 관리자 정보 테이블
CREATE TABLE MANAGER(
	ID VARCHAR2(20)	PRIMARY KEY,
	PW VARCHAR2(20)	NOT NULL
);

7. 복약시간 테이블
CREATE TABLE FILLTIME(
	ID 			NUMBER PRIMARY KEY,
	NUMOFTIMES	NUMBER,
	SETTIME		VARCHAR2(100),
	FILLNAME	VARCHAR2(100)
);

ALTER TABLE FILLTIME
	ADD CONSTRAINT FILLTIME_ID_FK FOREIGN KEY(ID) REFERENCES OLD(ID);

※ TEST SQL QUERY
DROP TABLE OLD CASCADE CONSTRAINT;
DROP TABLE MEMBER CASCADE CONSTRAINT;
DROP TABLE SENSOR CASCADE CONSTRAINT;
DROP TABLE SEN_VAL CASCADE CONSTRAINT;
DROP TABLE SEN_LAST CASCADE CONSTRAINT;

0. 관리자 테이블
INSERT INTO MANAGER VALUES('admin', '1111');
SELECT PW FROM MANAGER WHERE ID='admin';

UPDATE	OLD
	SET	NAME='김복순', BIRTH='1920/05/05'
	WHERE ID=3; 

DROP TABLE OLD CASCADE CONSTRAINT;

1. MAMBER 테이블
INSERT INTO MEMBER VALUES('05-73046883', '1111', '010-9292-2482', '1982/02/12');
UPDATE MEMBER SET NAME = '복지사1' WHERE ID = '05-73046883';
SELECT * FROM MEMBER WHERE ID='05-73046883';
SELECT * FROM MEMBER;

INSERT INTO MEMBER VALUES('mkp8202', '1111', '010-9292-2482', '1985/02/14');
UPDATE MEMBER SET NAME = '개인이용자1' WHERE ID = 'mkp8202';
SELECT * FROM MEMBER WHERE ID='mkp8202';
SELECT COUNT(*) FROM MEMBER WHERE ID='mkp8202';

SELECT * FROM MEMBER;
DELETE FROM MEMBER WHERE ID = 'sksk1234';

2. OLD 테이블
INSERT INTO OLD VALUES(OLD_ID_SEQ.NEXTVAL,'홍길동', '1938/05/05', '서울특별시 도봉구 도봉동', '010-0000-0000', NULL, '당뇨, 심장질환', '05-73046883');
INSERT INTO OLD VALUES(OLD_ID_SEQ.NEXTVAL,'홍정훈', '1935/05/15', '광주특별시 남구 송원동', '010-1111-1111', NULL, '치매, 천식', 'mkp8202');
INSERT INTO OLD VALUES(OLD_ID_SEQ.NEXTVAL,'김복순', '1930/01/01', '전남 무안군 몽탄면', '010-2222-3333', '062-377-7777', '없음', NULL);
INSERT INTO OLD VALUES(OLD_ID_SEQ.NEXTVAL,'김복순', '1931/02/02', '경남 어디군 어디면', '010-2222-3333', '062-377-8888', '없음', NULL);
INSERT INTO OLD VALUES(OLD_ID_SEQ.NEXTVAL,'김복순', '1930/01/01', '서울특별시 강남구 양재동', '010-2222-3333', '062-377-9999', '없음', NULL);
INSERT INTO OLD VALUES(OLD_ID_SEQ.NEXTVAL,'김복순', '1925/12/25', '경북 몰라군 몰라면', '010-2222-3333', '062-377-7777', '없음', '05-73046883');
INSERT INTO OLD VALUES(OLD_ID_SEQ.NEXTVAL,'김복순', '1931/02/02', '경남 어디군 어디면', '010-2222-3333', '062-377-8888', '없음', '05-73046883');
INSERT INTO OLD VALUES(OLD_ID_SEQ.NEXTVAL,'김복순', '1930/01/01', '서울특별시 강남구 양재동', '010-2222-3333', '062-377-9999', '없음', '05-73046883');
INSERT INTO OLD VALUES(OLD_ID_SEQ.NEXTVAL,'김복순', '1930/01/01', '전남 무안군 몽탄면', '010-2222-3333', '062-377-7777', '없음', '05-73046883');
INSERT INTO OLD VALUES(OLD_ID_SEQ.NEXTVAL,'김복순', '1931/02/02', '경남 어디군 어디면', '010-2222-3333', '062-377-8888', '없음', '05-73046883');
INSERT INTO OLD VALUES(OLD_ID_SEQ.NEXTVAL,'김복순', '1930/01/01', '서울특별시 강남구 양재동', '010-2222-3333', '062-377-9999', '없음', '05-73046883');

SELECT * FROM OLD ORDER BY ID DESC;
SELECT * FROM OLD WHERE FAMID = '05-73046883' ORDER BY ID DESC;
SELECT * FROM OLD WHERE FAMID IS NULL;
SELECT * FROM OLD WHERE NAME='강복순';

DELETE FROM OLD WHERE NAME='신말복';

UPDATE OLD SET FAMID = '05-73046883' WHERE ID = 3;
UPDATE OLD SET FAMID = '05-73046883' WHERE FAMID IS NULL;
SELECT * FROM OLD WHERE NAME = '김복순'
UPDATE OLD SET NAME = '강지영'  WHERE ID = 24;

delete from sensor where id = 1
select * from chk_fill where id =1;
delete from member where id = 'jjeong6230';
select * from sensor

DELETE FROM SENSOR WHERE ID = 1
SELECT * FROM TH_LOG WHERE ID = 1
DELETE FROM TH_LOG WHERE ID = 1
SELECT * FROM CHK_FILL
DELETE FROM CHK_FILL WHERE ID = 1
SELECT * FROM FILLTIME WHERE ID = 1
UPDATE FILLTIME SET ID = 1, NOOFTIM
3. 센서 테이블

INSERT INTO SENSOR VALUES('1stPIR', 1, '동작감지');
INSERT INTO SENSOR VALUES('1stVOL', 1, '스텐드');
INSERT INTO SENSOR VALUES('1stFill', 1, '약통');

4-1. 복약 테이블
INSERT INTO CHK_FILL VALUES(CHK_FILL_TDX_SEQ.NEXTVAL, 1, '08:00:00', '2018-05-08');
INSERT INTO CHK_FILL VALUES(CHK_FILL_TDX_SEQ.NEXTVAL, 1, '12:10:00', '2018-05-08');

SELECT CHK FROM CHK_FILL WHERE ID = 1 AND DAY = '2018-05-08';
select * from chk_fill where id = 1;
delete from chk_fill where id = 1 and day = '2018-05-14';

4-2 온습도 테이블
INSERT INTO TH_LOG VALUES(TH_LOG_IDX_SEQ.NEXTVAL, 1, '23', '60');
INSERT INTO TH_LOG VALUES(TH_LOG_IDX_SEQ.NEXTVAL, 1, '22', '60');
INSERT INTO TH_LOG VALUES(TH_LOG_IDX_SEQ.NEXTVAL, 1, '21', '60');
INSERT INTO TH_LOG VALUES(TH_LOG_IDX_SEQ.NEXTVAL, 1, '20', '60');

SELECT ROWNUM AS RNUM, A.TEMP, A.HUMI FROM (SELECT TEMP, HUMI FROM TH_LOG WHERE ID = 1 ORDER BY IDX DESC) A WHERE ROWNUM <=1;
SELECT * FROM TH_LOG;
DELETE FROM TH_LOG WHERE IDX = 26;
5. 최종 반응시간 테이블

INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 1, '2018-05-10 09:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 1, '2018-05-10 10:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 1, '2018-05-10 12:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 1, '2018-05-10 13:10:00', '1stVOL');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 1, '2018-05-10 14:10:00', '1stPIR');

INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 2, '2018-05-10 09:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 2, '2018-05-10 10:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 2, '2018-05-10 12:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 2, '2018-05-10 13:10:00', '1stVOL');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 2, '2018-05-10 05:10:00', '1stPIR');

INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 3, '2018-05-10 09:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 3, '2018-05-10 10:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 3, '2018-05-10 12:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 3, '2018-05-10 13:10:00', '1stVOL');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 3, '2018-05-10 05:10:00', '1stPIR');

INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 17, '2018-05-10 09:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 17, '2018-05-10 10:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 17, '2018-05-10 12:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 17, '2018-05-10 13:10:00', '1stVOL');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 17, '2018-05-10 05:10:00', '1stPIR');

INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 20, '2018-05-10 05:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 20, '2018-05-10 09:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 20, '2018-05-10 10:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 20, '2018-05-10 12:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 20, '2018-05-10 13:10:00', '1stVOL');

INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 22, '2018-05-09 12:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 22, '2018-05-09 13:10:00', '1stVOL');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 22, '2018-05-09 05:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 22, '2018-05-10 09:10:00', '1stPIR');
INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, 22, '2018-05-10 10:10:00', '1stPIR');

SELECT * FROM SEN_LAST WHERE ID='1';

7. 복약시간설정 테이블

select * from filltime where id = 1;



INSERT INTO FILLTIME VALUES(2, 0, NULL, NULL);
UPDATE FILLTIME SET NUMOFTIMES = 0, SETTIME = NULL, FILLNAME = NULL WHERE ID = 1;
UPDATE FILLTIME SET NUMOFTIMES = 3, SETTIME = '08:00 12:00 18:00', FILLNAME = '아침 점심 저녁' WHERE ID = 1;
INSERT INTO FILLTIME VALUES(1, 0, NULL, NULL);
SELECT * FROM FILLTIME where id = 1;
select * from chk_fill where id = 1;
delete from sensor where id = 1;
DELETE FROM SEN_LAST WHERE IDX < 458 AND IDX > 319
SELECT * FROM SEN_LAST ORDER BY IDX DESC;
SELECT * FROM SENSOR
UPDATE SENSOR SET KINDS = '전류센서' WHERE MAC = '1stVOL'

SELECT	ROWNUM AS RNUM, A.SEN_LAST, A.KINDS
FROM	(SELECT SEN_LAST.SEN_LAST, SENSOR.KINDS 
		FROM SEN_LAST, SENSOR 
		WHERE SEN_LAST.MAC = SENSOR.MAC AND SEN_LAST.ID = 1 
		ORDER BY SEN_LAST DESC) A
WHERE ROWNUM <=5;


SELECT ID, SEN_LAST
FROM (
		SELECT ID, SEN_LAST
	  	FROM (
		        SELECT ID, SEN_LAST
		             , ROW_NUMBER() OVER(PARTITION BY ID ORDER BY SEN_LAST DESC) rn
		          FROM SEN_LAST
		        ) a
	 	WHERE rn = 1
	 )
WHERE ID IN(1,3,17,20,22)
ORDER BY SEN_LAST;
	
SELECT ID, SEN_LAST FROM (SELECT ID, SEN_LAST FROM (SELECT ID, SEN_LAST, ROW_NUMBER() OVER(PARTITION BY ID ORDER BY SEN_LAST DESC) rn FROM SEN_LAST) a WHERE rn = 1) WHERE ID IN(1,3,17,20,22);
