DROP TABLE CART;
DROP TABLE RESERVATION;
DROP TABLE ROOM;
DROP TABLE BOARD_REPLY;
DROP TABLE BOARD;
DROP TABLE MEMBER;
DROP TABLE EVENT;
DROP TABLE ADMIN;

CREATE TABLE EVENT
(
    ENO NUMBER,
    ONSALE NUMBER,
    ENAME VARCHAR2(100),
    ESTART DATE,
    EEND DATE,
    EPERCENT NUMBER,
    EDUPLICATE NUMBER
    
);

CREATE TABLE MEMBER
(
    MNO NUMBER,
    MNAME VARCHAR2(50) NOT NULL,
    MID VARCHAR2(50) NOT NULL UNIQUE,
    MPW VARCHAR2(50) NOT NULL,
    MEMAIL VARCHAR2(100) NOT NULL UNIQUE,
    MPHONE VARCHAR2(20) NOT NULL,
    MGRADE VARCHAR2(20),
    MREGDATE DATE
);

CREATE TABLE BOARD
(
    BIDX NUMBER NOT NULL,
    MID VARCHAR2(50) NOT NULL,
    BTITLE VARCHAR2(100),
    BCONTENT VARCHAR2(2000),
    BHIT NUMBER,
    BFILENAME1 VARCHAR2(2000),
    BFILENAME2 VARCHAR2(2000),
    BFILENAME3 VARCHAR2(2000),
    BPOSTDATE DATE
);

CREATE TABLE BOARD_REPLY
(
    IDX NUMBER,
    WRITER VARCHAR2(50) NOT NULL,
    CONTENT VARCHAR2(2000),
    BIDX NUMBER NOT NULL,
    POSTDATE DATE
);

CREATE TABLE ROOM
(
    RNO NUMBER NOT NULL,
    RNAME VARCHAR2(100) NOT NULL UNIQUE,
    RPRICE NUMBER NOT NULL,
    RGRADE NUMBER NOT NULL,
    RIMG VARCHAR2(100),
    RIMG1 VARCHAR2(100),
    RIMG2 VARCHAR2(100),
    RIMG3 VARCHAR2(100),
    RIMG4 VARCHAR2(100),
    RIMG5 VARCHAR2(100),
    RACCEPT NUMBER,
    RSIZE NUMBER
);


CREATE TABLE RESERVATION
(
    RENO NUMBER,
    RNO NUMBER NOT NULL,
    MNO NUMBER NOT NULL,
    PEOPLE NUMBER,
    CHECKIN DATE,
    CHECKOUT DATE,
    FOOD NUMBER,
    TOTALPAY NUMBER,
    BOOKER VARCHAR2(32)
);

CREATE TABLE CART
(
    CNO NUMBER NOT NULL,
    MID VARCHAR2(50) NOT NULL,
    RNO NUMBER NOT NULL,
    CAMOUNT NUMBER NOT NULL,
    CPRICE NUMBER
);

CREATE TABLE ADMIN
(
    MID VARCHAR2(50) NOT NULL UNIQUE,
	MNAME VARCHAR2(50) NOT NULL,
    MPW VARCHAR2(50) NOT NULL
);

ALTER TABLE EVENT ADD CONSTRAINT EVENT_PK PRIMARY KEY(ENO);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_PK PRIMARY KEY(MNO);
ALTER TABLE BOARD ADD CONSTRAINT BOARD_PK PRIMARY KEY(BIDX);
ALTER TABLE BOARD_REPLY ADD CONSTRAINT BOARD_REPLY_PK PRIMARY KEY(IDX);
ALTER TABLE ROOM ADD CONSTRAINT ROOM_PK PRIMARY KEY(RNO);
ALTER TABLE RESERVATION ADD CONSTRAINT RESERVATION_PK PRIMARY KEY(RENO);
ALTER TABLE CART ADD CONSTRAINT CART_PK PRIMARY KEY(CNO);

ALTER TABLE BOARD ADD CONSTRAINT BOARD_MEMBER_FK FOREIGN KEY(MID) REFERENCES MEMBER(MID);
ALTER TABLE BOARD_REPLY ADD CONSTRAINT BOARD_REPLY_MEMBER_FK FOREIGN KEY(WRITER) REFERENCES MEMBER(MID);
ALTER TABLE BOARD_REPLY ADD CONSTRAINT BOARD_REPLY_BOARD_FK FOREIGN KEY(BIDX) REFERENCES BOARD(BIDX);
ALTER TABLE RESERVATION ADD CONSTRAINT RESERVATION_ROOM_FK FOREIGN KEY(RNO) REFERENCES ROOM(RNO);
ALTER TABLE RESERVATION ADD CONSTRAINT RESERVATION_MEMBER_FK FOREIGN KEY(MNO) REFERENCES MEMBER(MNO);
ALTER TABLE CART ADD CONSTRAINT CART_MEMBER_FK FOREIGN KEY(MID) REFERENCES MEMBER(MID);
ALTER TABLE CART ADD CONSTRAINT CART_ROOM_FK FOREIGN KEY(RNO) REFERENCES ROOM(RNO);

DROP SEQUENCE EVENT_SEQ;
DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE BOARD_SEQ;
DROP SEQUENCE BOARD_REPLY_SEQ;
DROP SEQUENCE ROOM_SEQ;
DROP SEQUENCE RESERVATION_SEQ;
DROP SEQUENCE CART_SEQ;

CREATE SEQUENCE EVENT_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;
CREATE SEQUENCE MEMBER_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;
CREATE SEQUENCE BOARD_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;
CREATE SEQUENCE BOARD_REPLY_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;
CREATE SEQUENCE ROOM_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;
CREATE SEQUENCE RESERVATION_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;
CREATE SEQUENCE CART_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;
