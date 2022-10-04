insert into CHECKED_REST(cseq,c_checkdate,id,rseq,c_people,c_checkdatetime) values ('3','2022-08-23','one','51','2','오전 11:00');
insert into CHECKED_REST(cseq,c_checkdate,id,rseq,c_people,c_checkdatetime) values ('4','2022-09-23','one','23','3','오전 11:00');
insert into CHECKED_REST(cseq,c_checkdate,id,rseq,c_people,c_checkdatetime) values ('5','2022-06-23','one','5','1','오전 11:00');
insert into CHECKED_REST(cseq,c_checkdate,id,rseq,c_people,c_checkdatetime) values ('6','2022-10-23','one','1','3','오전 11:00');



--------------------------------------------------------QnA 
DROP TABLE qna CASCADE CONSTRAINTS;


CREATE TABLE qna
(
   qseq number(10) NOT NULL,
   subject varchar2(80) NOT NULL,
   content varchar2(1000) NOT NULL,
   reply varchar2(1000),
   id varchar2(20) NOT NULL,
   qyn char(1) DEFAULT 'n',
   rseq number(4) NOT NULL,
   businessId varchar2(20),
   indate date DEFAULT SYSDATE,
   PRIMARY KEY (qseq)
);

insert into qna(qseq, subject, content, reply, id, qyn, rseq, businessId) 
   values(qna_seq.nextVal, '여기 뭐가 맛있나요?' , '질문입니다', '다 맛있습니다','two' ,'y',1,'boss1');
   
insert into qna(qseq, subject, content,  id, rseq, businessId) 
   values(qna_seq.nextVal, '언제 답변 주시나요' , '일주일 전에 문의한 내용에 답을 안해주시내요....','two' ,1,'boss1');

select * from qna ;
select * from restaurant where businessId='boss1';

drop sequence qna_seq;
create sequence qna_seq start with 1;




















