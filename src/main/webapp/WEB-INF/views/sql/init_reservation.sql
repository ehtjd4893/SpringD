
--1번 방부터 5번방까지 미리 예약테이블에 넣어둬야 검색이 가능해져서, 먼저 예약 INSERT를 함
 
INSERT INTO RESERVATION VALUES(RESERVATION_SEQ.NEXTVAL,1,0,0,TO_DATE('1111-11-11', 'YYYY-MM-DD')  ,TO_DATE('1111-11-12', 'YYYY-MM-DD'),0,0,'','','');
INSERT INTO RESERVATION VALUES(RESERVATION_SEQ.NEXTVAL,2,0,0,TO_DATE('1111-11-11', 'YYYY-MM-DD')  ,TO_DATE('1111-11-12', 'YYYY-MM-DD'),0,0,'','','');
INSERT INTO RESERVATION VALUES(RESERVATION_SEQ.NEXTVAL,3,0,0,TO_DATE('1111-11-11', 'YYYY-MM-DD')  ,TO_DATE('1111-11-12', 'YYYY-MM-DD'),0,0,'','','');
INSERT INTO RESERVATION VALUES(RESERVATION_SEQ.NEXTVAL,4,0,0,TO_DATE('1111-11-11', 'YYYY-MM-DD')  ,TO_DATE('1111-11-12', 'YYYY-MM-DD'),0,0,'','','');
INSERT INTO RESERVATION VALUES(RESERVATION_SEQ.NEXTVAL,5,0,0,TO_DATE('1111-11-11', 'YYYY-MM-DD')  ,TO_DATE('1111-11-12', 'YYYY-MM-DD'),0,0,'','','');