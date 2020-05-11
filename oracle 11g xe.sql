DROP TABLE tbl_pdt;
CREATE TABLE tbl_pdt(
    pno NUMBER PRIMARY KEY,
    pname VARCHAR2(500) NOT NULL,
    ptype VARCHAR2(200) NOT NULL,
    pmemo VARCHAR2(1000),    
    price NUMBER DEFAULT 0,
    avail_cnt NUMBER DEFAULT 0,
    sale_cnt NUMBER DEFAULT 0,
    p_img VARCHAR2(300),
    regdate DATE DEFAULT SYSDATE    
);

DROP SEQUENCE seq_pdt;
CREATE SEQUENCE seq_pdt
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;



SELECT * FROM (SELECT rownum rnum , best.* FROM(SELECT * FROM tbl_pdt WHERE avail_cnt > 0 ORDER 
BY sale_cnt DESC )best ) WHERE rnum between 1 and 8; 

DROP TABLE tbl_news;
CREATE TABLE tbl_news(
    nno NUMBER PRIMARY KEY,
    ntitle VARCHAR2(4000) NOT NULL,
    nhref VARCHAR2(200) NOT NULL,
    ncontent VARCHAR2(4000),        
    regdate DATE DEFAULT SYSDATE    
);

DROP SEQUENCE seq_news;
CREATE SEQUENCE seq_news
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;



DROP TABLE tbl_member;
CREATE TABLE tbl_member(
    id VARCHAR2(100) PRIMARY KEY,
    pw VARCHAR2(200) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    phone VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    postcode VARCHAR2(30) NOT NULL,
    addr1 VARCHAR2(300) NOT NULL,
    addr2 VARCHAR2(300) NOT NULL,
    useon VARCHAR2(20) NOT NULL,
    primaryon VARCHAR2(20) NOT NULL,
    locon VARCHAR2(20) DEFAULT 'false',
    eventon VARCHAR2(20) DEFAULT 'false',
    useyn VARCHAR2(200) DEFAULT 'n',
    regdate DATE DEFAULT SYSDATE
);






DROP SEQUENCE seq_board;
CREATE SEQUENCE seq_board
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;
DROP TABLE tbl_board CASCADE CONSTRAINTS;
CREATE TABLE tbl_board(
    bno number(10, 0),
    type CHAR(4) NOT NULL,
    title VARCHAR2(200) NOT NULL,
    view_content VARCHAR2(4000) NOT NULL,
    search_content VARCHAR2(4000) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    viewcnt NUMBER DEFAULT 0,
    replycnt NUMBER DEFAULT 0,
    goodcnt NUMBER DEFAULT 0,
    filecnt NUMBER DEFAULT 0,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE,
    show CHAR(1) DEFAULT 'y',
    ref NUMBER DEFAULT 1 ,
    re_step NUMBER DEFAULT 1,
    re_level NUMBER DEFAULT 0
);
ALTER TABLE tbl_board ADD CONSTRAINT pk_board
PRIMARY KEY (bno);





DROP SEQUENCE seq_reply;
CREATE SEQUENCE seq_reply
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;
DROP TABLE tbl_reply;
CREATE TABLE tbl_reply(
    rno NUMBER,
    type CHAR(4) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    writer VARCHAR2(100) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    bno NUMBER NOT NULL
);
ALTER TABLE tbl_reply ADD CONSTRAINT pk_reply
PRIMARY KEY(rno);
DROP TABLE tbl_attach CASCADE CONSTRAINTS;
CREATE TABLE tbl_attach(
    fullname VARCHAR2(150) NOT NULL,
    bno NUMBER NOT NULL,
    regdate DATE DEFAULT SYSDATE
);
ALTER TABLE tbl_attach ADD CONSTRAINT pk_attach
PRIMARY KEY(fullname);

ALTER TABLE tbl_attach
ADD CONSTRAINT fk_attach_bno
FOREIGN KEY(bno) REFERENCES tbl_board(bno)
ON DELETE CASCADE;
DELETE FROM tbl_board
commit;
select*FROM tbl_attach;












