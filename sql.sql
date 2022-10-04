/* Drop Tables */

DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE checked_rest CASCADE CONSTRAINTS;
DROP TABLE images CASCADE CONSTRAINTS;
DROP TABLE Menu CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE wishlist CASCADE CONSTRAINTS;
DROP TABLE restaurant CASCADE CONSTRAINTS;
DROP TABLE business CASCADE CONSTRAINTS;
DROP TABLE Members CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE workers CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;

select avg(rating1) as avg from review;
select*from review;

/* Create Tables */

CREATE TABLE business
(
   businessId varchar2(20) NOT NULL,
   businessPwd varchar2(20) NOT NULL,
   name varchar2(20) NOT NULL,
   phone varchar2(20) NOT NULL,
   email varchar2(20) NOT NULL,
   PRIMARY KEY (businessId)
);

select * from business;
select * from checked_rest;

CREATE TABLE checked_rest
(
   cseq number(10) NOT NULL,
   c_checkdate varchar2(40),
   id varchar2(20) NOT NULL,
   rseq number(4) NOT NULL,
   c_people number(2) NOT NULL,
   c_checkdatetime varchar2(40),
   PRIMARY KEY (cseq)
);

ALTER TABLE checked_rest ADD cyn char(1) default 'n';

CREATE TABLE images
(
   r_img varchar2(250) DEFAULT 'noImage.jpg',
   m_img varchar2(250) DEFAULT 'noImage.jpg',
   s_img varchar2(250) DEFAULT 'noImage.jpg',
   rseq number(4) NOT NULL
);


CREATE TABLE Members
(
   id varchar2(20) NOT NULL,
   pwd varchar2(20) NOT NULL,
   name varchar2(20) NOT NULL,
   email varchar2(40) NOT NULL,
   phone varchar2(20) NOT NULL,
   gender char(1) NOT NULL,
   indate date DEFAULT SYSDATE,
   PRIMARY KEY (id)
);


CREATE TABLE Menu
(
   r_mseq number(10) NOT NULL,
   r_mname1 varchar2(100) DEFAULT '-',
   r_mprice1 number(10) DEFAULT 0,
   r_mname2 varchar2(100) DEFAULT '-',
   r_mprice2 number(10) DEFAULT 0,
   rseq number(4) NOT NULL,
   PRIMARY KEY (r_mseq)
);


CREATE TABLE notice
(
   nseq number(10) NOT NULL,
   subject varchar2(200) NOT NULL,
   content varchar2(1500) NOT NULL,
   indate date DEFAULT SYSDATE,
   workId varchar2(20) NOT NULL,
   PRIMARY KEY (nseq)
);


CREATE TABLE qna
(
   qseq number(10) NOT NULL,
   subject varchar2(80) NOT NULL,
   content varchar2(1000) NOT NULL,
   reply varchar2(1000),
   id varchar2(20) NOT NULL,
   qyn char(1) DEFAULT 'n',
   rseq number(4) NOT NULL,
   businessId varchar2(20) NOT NULL,
   indate date DEFAULT SYSDATE,
   PRIMARY KEY (qseq)
);


CREATE TABLE restaurant
(
   rseq number(4) NOT NULL,
   r_kind varchar2(15) NOT NULL,
   r_name varchar2(40) NOT NULL,
   r_address varchar2(100) NOT NULL,
   r_phone varchar2(20) NOT NULL,
   r_runtime varchar2(20) NOT NULL,
   r_content varchar2(1500),
   m_image varchar2(255),
   r_map varchar2(1000),
   rating number(2) DEFAULT 0,
   ryn char(1) DEFAULT 'n',
   businessId varchar2(20) NOT NULL,
   PRIMARY KEY (rseq)
);
ALTER TABLE restaurant ADD indate date default sysdate;

CREATE TABLE review
(
   rwseq number(2) NOT NULL,
   content varchar2(200) NOT NULL,
   indate date DEFAULT SYSDATE,
   rating1 number(2) NOT NULL,
   id varchar2(20) NOT NULL,
   rseq number(4) NOT NULL,
   PRIMARY KEY (rwseq)
);


CREATE TABLE wishlist
(
   wseq number(10) NOT NULL,
   result char(1) DEFAULT '1',
   indate date DEFAULT SYSDATE,
   id varchar2(20) NOT NULL,
   rseq number(4) NOT NULL,
   PRIMARY KEY (wseq)
);


CREATE TABLE workers
(
   workId varchar2(20) NOT NULL,
   workPwd varchar2(20) NOT NULL,
   name varchar2(20) NOT NULL,
   phone varchar2(20) NOT NULL,
   PRIMARY KEY (workId)
);



/* Create Foreign Keys */

ALTER TABLE qna
   ADD FOREIGN KEY (businessId)
   REFERENCES business (businessId)
;


ALTER TABLE restaurant
   ADD FOREIGN KEY (businessId)
   REFERENCES business (businessId)
;


ALTER TABLE checked_rest
   ADD FOREIGN KEY (id)
   REFERENCES Members (id)
;


ALTER TABLE qna
   ADD FOREIGN KEY (id)
   REFERENCES Members (id)
;


ALTER TABLE review
   ADD FOREIGN KEY (id)
   REFERENCES Members (id)
;


ALTER TABLE wishlist
   ADD FOREIGN KEY (id)
   REFERENCES Members (id)
;


ALTER TABLE checked_rest
   ADD FOREIGN KEY (rseq)
   REFERENCES restaurant (rseq)
;


ALTER TABLE images
   ADD FOREIGN KEY (rseq)
   REFERENCES restaurant (rseq)
;


ALTER TABLE Menu
   ADD FOREIGN KEY (rseq)
   REFERENCES restaurant (rseq)
;


ALTER TABLE review
   ADD FOREIGN KEY (rseq)
   REFERENCES restaurant (rseq)
;


ALTER TABLE wishlist
   ADD FOREIGN KEY (rseq)
   REFERENCES restaurant (rseq)
;


ALTER TABLE notice
   ADD FOREIGN KEY (workId)
   REFERENCES workers (workId)
;


