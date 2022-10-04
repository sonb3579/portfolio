------------관리자 페이지에서 리뷰모아보기를 위한 뷰 생성-----
create or replace view review_view
as
select r.rseq as rseq,
	  rw.rwseq	as rwseq,
      r.r_name,
      rw.content,
      rw.rating1,
      rw.id,
      rw.indate
from restaurant r, review rw
where r.rseq = rw.rseq;

------------wishList조회시 필요한 뷰 생성------------
create or replace view wish_view
as
select r.rseq as rseq,
      r.r_name,
      r.r_runtime,
      r.m_image,
      r.r_kind,
      w.wseq,
      w.id,
      w.indate,
      w.result
from restaurant r, wishlist w
where r.rseq = w.rseq;



------------예약 조회시 예약 정보와 식당 정보를 표시하기 위한 뷰 생성------------
create or replace view check_view
as
select r.rseq as rseq,
      r.r_name,
      r.r_kind,
      r.m_image,
      r.r_phone,
      r.r_address,
      r.r_map,
      c.cseq,
      c.c_checkdate,
      c.c_checkdatetime,
      c.c_people,
      c.id,
      c.cyn,
      m.name
from restaurant r, checked_rest c, Members m
where r.rseq = c.rseq and c.id= m.id;


select*from check_view;



-----------------Rest와 images 테이블 연결한 뷰 생성-----------------------
create or replace view rest_view
as
select r.rseq as rseq, 
      r.r_kind,
      r.r_name,
      r.r_address,
      r.r_phone, 
      r.r_runtime, 
      r.r_content,
      r.r_map,
      i.r_img as r_img, 
      i.m_img as m_img, 
      i.s_img as s_img
from restaurant r, images i
where r.rseq = i.rseq;







-----workers 관리자 데이터 추가----------
insert into workers(workId, workPwd, name, phone) 
   values('admin1' ,'admin','김관원','010-1111-1111');
insert into workers(workId, workPwd, name, phone) 
   values('admin2' ,'admin','김관투','010-1111-1111');
insert into workers(workId, workPwd, name, phone) 
   values('admin' ,'admin','김관셋','010-1111-1111');

select * from workers;



-------Members 샘플 데이터 추가----------
insert into Members(id, pwd, name, email, phone, gender) 
   values('one' ,'1111','김하나','hana@naver.com','010-1111-1111','F');
insert into Members(id, pwd, name, email, phone, gender) 
   values('two' ,'2222','김둘','two@naver.com','010-1111-1111','M');
insert into Members(id, pwd, name, email, phone, gender) 
   values('three' ,'3333','김셋','three@naver.com','010-1111-1111','F');
insert into Members(id, pwd, name, email, phone, gender) 
   values('four' ,'3333','김셋','three@naver.com','010-1111-1111','F');
insert into Members(id, pwd, name, email, phone, gender) 
   values('five' ,'3333','김셋','three@naver.com','010-1111-1111','F');
insert into Members(id, pwd, name, email, phone, gender) 
   values('six' ,'3333','김셋','three@naver.com','010-1111-1111','F');
   
   
   --------boss 샘플 데이터 추기-----------
insert into business(businessId, businessPwd, name, phone, email)
   values('boss1', 'boss1', '김사장', '010-1212-1813','boss1@gamil.com');
insert into business(businessId, businessPwd, name, phone, email)
   values('boss2', 'boss2', '이사장', '010-1412-1713','boss2@gamil.com');
insert into business(businessId, businessPwd, name, phone,email)
   values('boss3', 'boss3', '박사장', '010-1512-1613','boss3@gamil.com');
insert into business(businessId, businessPwd, name, phone,email)
   values('boss4', 'boss4', '금사장', '010-1512-1613','dada123@naver.com');
insert into business(businessId, businessPwd, name, phone,email)
   values('boss5', 'boss5', '은사장', '010-1512-1613','asdw123@naver.com');
   

   


------시퀀스 생성--------

--1.레스토랑 시퀀스
drop sequence res_seq;
create sequence res_seq start with 1;

--2.공지사항 시퀀스
drop sequence notice_seq;
create sequence notice_seq start with 1;

--3.리뷰(rwseq) 시퀀스
drop sequence rwseq_seq;
create sequence rwseq_seq start with 1;

--4.예약(cseq) 시퀀스 
drop sequence cseq_seq;
create sequence cseq_seq start with 1;


/*wishlist sequence*/
drop sequence wish_seq;
create sequence wish_seq start with 1;

/*메뉴 시퀀스*/
drop sequence menu_seq;
create sequence menu_seq start with 1;


/*QNA 시퀀스*/
drop sequence qna_seq;
create sequence qna_seq start with 1;

------------QNA 데이터 추가--------------

insert into qna(qseq, subject, content, reply, id, qyn, rseq, businessId) 
   values(qna_seq.nextVal, '여기 뭐가 맛있나요?' , '질문입니다', '다 맛있습니다','one' ,'y',1,'boss1');
   
insert into qna(qseq, subject, content,  id, rseq, businessId) 
   values(qna_seq.nextVal, '언제 답변 주시나요' , '일주일 전에 문의한 내용에 답을 안해주시내요....','one' ,1,'boss1');

------------restaurant 데이터 추가--------------
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime , ryn, businessId) 
   values(res_seq.nextVal, '한식' , '옥동식', '서울 마포구 양화로7길 44-10', '010-5571-9915','11:00~21:00' ,'y','boss1');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId)
   values(res_seq.nextVal, '한식' , '정인면옥', '서울 영등포구 국회대로76길 10', '010-6488-9925','10:00~22:00','y','boss1');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '한식' , '또순이네', '서울 영등포구 선유로47길 16', '010-7851-4515','11:00~22:00','y','boss1');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId)
   values(res_seq.nextVal, '한식' , '대한옥', '서울 영등포구 영등포로51길 44', '010-6571-2015','12:00~21:00','y','boss1');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '한식' , '함반', '서울 마포구 월드컵로  43-12', '010-7851-6415','12:00~21:00','y','boss1');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '한식' , '사대부집 곳간', '서울 영등포구 여의대로 24 ', '010-8571-5477','11:00~23:00','y','boss1');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '한식' , '경주식당', '서울 마포구 와우산로13길 ', '010-6572-9815','10:00~21:00','y','boss1');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '한식' , '명동교자', '서울 중구 명동10길 ', '02-854-9915','09:00~21:00','y','boss1');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '한식' , '우래옥', '서울 중구 창경궁로 23', '02-556-9785','10:00~21:00','y','boss1');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '한식' , '광화문미진', '서울 종로구 종로 19', '010-4571-0215','12:00~22:00','y','boss2');
   
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '양식' , '미대쉐프', '서울 강남구 압구정로 46', '02-571-0715','10:00~22:00','y','boss2');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '양식' , '스탠딩스테이크', '서울 관악구 신림동 457', '010-4671-0789','15:00~22:00','y','boss2');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '양식' , '슬런치', '서울 마포구 와우산로 20', '010-8887-0335','10:00~22:00','y','boss2');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '양식' , '마쁘띠메종', '서울 용산구 원효로 141-1 2층', '0507-1321-4664','12:00~22:00','y','boss2');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '양식' , '바비레드', '서울 강남구 봉은사로6길 39', '02-3452-1515','12:00~22:00','y','boss2');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '양식' , '빌즈 잠실', '서울 송파구 올림픽로 300 롯데월드몰 1층', '0507-1403-4185','12:00~22:00','y','boss2');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '양식' , '꽁티드툴레아', '서울 강남구 도산대로49길 39', '0507-1325-8490','11:00~22:00','y','boss2');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '양식' , '오아시스 청담점', '서울 강남구 도산대로55길 20 영빌딩 1층', '02-548-8859','10:00~22:00','y','boss2');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '양식' , '쌤쌤쌤', '서울 용산구 한강대로50길 25 1층', '0507-1309-1103','10:00~22:00','y','boss2');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '양식' , '제스티살룬 성수', '서울 성동구 서울숲2길 19 2층 제스티살룬', '0507-1371-2622','11:00~22:00','y','boss3');

insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '일식' , '일식성진', '서울 중구 수표로2길 5 1층', '02-2269-5551','12:00~22:00','y','boss3');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '일식' , '우동 카덴', '서울 마포구 양화로7안길 2-1', '02-6463-6362','11:00~22:00','y','boss3');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '일식' , '진작', '서울 중구 수표로12길 12', '0507-1364-4484','10:00~20:00','y','boss3');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '일식' , '초이 다이닝', '서울 마포구 동교로36길 3 지하1층', '0507-1330-5456','10:00~22:00','y','boss3');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '일식' , '교다이야', '서울 마포구 성지길 39 합정빌딩 1층', '02-2654-2645','11:00~22:00','y','boss3');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '일식' , '오제제', '서울 중구 세종대로 136 지하 3층', '0507-1389-4653','10:00~22:00','y','boss3');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '일식' , '우와', '서울 마포구 와우산로21길 21-16 2층', '0507-1414-9500','15:00~22:00','y','boss3');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '일식' , '오복수산 여의도점', '서울 영등포구 국제금융로2길 17 3층 씨티플라자', '0507-1387-9923','12:00~22:00','y','boss3');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '일식' , '부타이 1막', '서울 강남구 테헤란로88길 22', '02-544-8422','13:00~22:00','y','boss3');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId)
   values(res_seq.nextVal, '일식' , '혼가츠', '서울 마포구 와우산로21길 36-6 1층 102호', '02-322-8850','16:00~22:00','y','boss3');
   
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId)
   values(res_seq.nextVal, '중식' , '인량훠궈', '서울 강남구 강남대로140길 9 비피유빌딩 B1', '02-516-8777','18:00~22:00','y','boss4');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId)
   values(res_seq.nextVal, '중식' , '목란', '서울 서대문구 연희로15길 21', '02-732-0054','12:00~22:00','y','boss4');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '중식' , '쮸즈', '서울 강남구 도산대로17길 13', '02-6081-9888','15:00~22:00','y','boss4');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '중식' , '란주라미엔', '서울 중구 소공로 64', '02-779-4800','11:00~22:00','y','boss4');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId)
   values(res_seq.nextVal, '중식' , '팀호완 삼성점', '서울 강남구 봉은사로86길 30 1층', '0507-1374-3082','14:00~22:00','y','boss4');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '중식' , '연교', '서울 마포구 연희로1길 65 1층', '010-5882-5112','10:00~22:00','y','boss4');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '중식' , '꺼거', '서울 용산구 한강대로48길 10', '02-516-8777','15:00~22:00','y','boss4');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '중식' , '진지아', '서울 송파구 백제고분로41길 12-9 1,2층', '02-418-5354','12:00~22:00','y','boss4');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '중식' , '쟈니덤플링 본관', '서울 용산구 보광로59길 33', '02-790-8831','11:00~20:00','y','boss4');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '중식' , '대가방 본점', '서울 강남구 선릉로145길 13 럭스웨이빌딩', '02-544-6336','10:00~20:00','y','boss4');
   
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '카페' , '후후라운지', '서울 종로구 옥인3길 8 1층', '02-737-3147','12:00~20:00','y','boss5');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '카페' , '카페 노티드 청담', '서울 강남구 도산대로53길 15 1층', '0507-1426-9399','12:00~21:00','y','boss5');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '카페' , '어글리베이커리', '서울 마포구 월드컵로13길 73 1층 어글리 베이커리', '050-1306-2018','10:00~19:00','y','boss5');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '카페' , '카페 포제', '서울 성동구 연무장9길 7', '070-8830-5994','11:00~20:00','y','boss5');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId)  
   values(res_seq.nextVal, '카페' , '서울앵무새', '서울 성동구 서울숲9길 3 B1~2F', '0507-1466-2049','11:00~20:00','y','boss5');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '카페' , '아키비스트 서촌', '서울 종로구 효자로13길 52 1층 아키비스트 서촌', '02-738-1517','11:00~20:00','y','boss5');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '카페' , '랜디스도넛 연남점', '서울 강남구 선릉로145길 13 럭스웨이빌딩', '02-544-6336','10:00~20:00','y','boss5');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '카페' , '더달달', '서울 강남구 강남대로102길 38-6', '02-562-3737','11:00~20:00','y','boss5');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '카페' , '피오니', '서울 마포구 독막로7길 51', '02-333-5325','11:00~20:00','y','boss5');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '카페' , '청수당', '서울 종로구 돈화문로11나길 31-9', '0507-1318-8215','12:00~20:00','y','boss5');
insert into restaurant(rseq, r_kind, r_name, r_address, r_phone, r_runtime, ryn, businessId) 
   values(res_seq.nextVal, '카페' , '올드페리도넛', '서울 용산구 한남대로27길 66 2층', '02-6015-2022','13:00~20:00','y','boss5');
   

select * from restaurant;

------------공지사항 샘플 데이터 추가--------------------
insert into notice(nseq, subject, content, workId) 
   values(notice_seq.nextVal, '잇플레이스 개인정보 취급방침 변경',
'안녕하세요. 잇플레이스입니다. 
회원 여러분들께 보다 편리한 로그인 방식을 제공하기 위해
아래와 같이 개인정보 취급방침이 8월 22일부로 일부 개정되었습니다.  
이에 이용약관 개정에 대한 주요 내용을 안내 드리오니,  
회원 여러분께서는 변경되는 내용을 확인하여 주시기를 당부드립니다. 

1. 개정 주요 사유  
: 잇플레이스 전화번호 로그인 지원 

2. 개정 시행일자  
: 새롭게 개정되는 이용약관은 2017년 8월 29일부로 적용될 예정입니다. 
: 이에 따라 현재 적용 중인 이용약관은 개정일을 기준으로  
효력을 상실하고 새로운 이용약관으로 대체됩니다. ','admin1' );

insert into notice(nseq, subject, content,workId) 
   values(notice_seq.nextVal, '잇플레이스 투자 유치 소식',
'안녕하세요, 여러분! 오랜만에 인사를 드리네요.

이번에 잇플레이스가 20억 규모의 시리즈A 투자를 유치하게 되었습니다.
훈훈한 연말을 보내게 되어 매우 기쁜데요, 한 해 동안 잇플레이스를 애용해주신 여러분 덕분입니다.
잇플레이스에 관심을 가져준 분들께 감사의 말씀 전합니다. 앞으로 더 멋진 서비스를 경험할 수 있는, 발전하는 잇플레이스룰 보여드리겠습니다. ','admin1' );

insert into notice(nseq, subject, content,workId) 
   values(notice_seq.nextVal, '유상증자(신주발행) 공고',
'주식회사 잇플레이스는 2020년 11월 26일 이사회의 결의로 당사 정관 
제10조의1에 의한 제3자배정방식의 신주발행(추가 투자 유치)을 결의하였기에 
상법 제418조 제4항에 따라 공고합니다.
','admin2' );

insert into notice(nseq, subject, content, workId) 
   values(notice_seq.nextVal, '잇플레이스 서비스 이용약관 변경안내',
'안녕하세요. 잇플레이스입니다.

저희 잇플레이스 서비스를 이용해주시는 회원분들께 깊은 감사의 말씀을 드립니다.

이용약관의 일부가 개정될 예정이오니, 서비스 이용에 참고하시기 바랍니다. ','admin2' );

insert into notice(nseq, subject, content, workId) 
   values(notice_seq.nextVal, '임시주주총회 기준일 및 주주명부 폐쇄기간 설정 공고',
'상법 제354조 및 우리회사 정관 제14조 3항에 의거 임시주주총회 개최를 위하여 
2018년 11월 7일 현재 주주명부에 기재되어 있는 주주에게 의결권을 부여하며, 권리주주 확정을 위해
 2018년 11월 8일부터 2018년 11월 10일까지 주식의 명의개서, 질권의 등록 및 그 변경과 말소, 
신탁재산의 표시 및 말소 등 주주명부의 기재사항 변경을 정지함을 공고합니다. ','admin1' );

insert into notice(nseq, subject, content, workId) 
   values(notice_seq.nextVal, '잇플레이스 점수체계 변경',
'안녕하세요. 잇플레이스입니다.
회원 여러분께서 잇플레이스를 보다 편리하고 유용하게 이용하실 수 있도록
아래와 같이 잇플레이스 점수체계를 변경하였습니다. 변경된 푸딩 점수체계에 대한 문의사항이 있으신 경우,
잇플레이스 고객센터(cs@fooding.com)로 문의주시면 친절하게 안내해드리겠습니다.
회원 여러분께 더욱 신뢰받는 서비스로 보답할 수 있도록 최선을 다하겠습니다. ','admin2' );

insert into notice(nseq, subject, content, workId) 
   values(notice_seq.nextVal, '잇플레이스 개인정보 취급방침 변경',
'안녕하세요. 잇플레이스입니다. 
회원 여러분들께 보다 편리한 로그인 방식을 제공하기 위해
아래와 같이 개인정보 취급방침이 8월 22일부로 일부 개정되었습니다.  
이에 이용약관 개정에 대한 주요 내용을 안내 드리오니,  
회원 여러분께서는 변경되는 내용을 확인하여 주시기를 당부드립니다. 

1. 개정 주요 사유  
: 잇플레이스 전화번호 로그인 지원 

2. 개정 시행일자  
: 새롭게 개정되는 이용약관은 2017년 8월 29일부로 적용될 예정입니다. 
: 이에 따라 현재 적용 중인 이용약관은 개정일을 기준으로  
효력을 상실하고 새로운 이용약관으로 대체됩니다. ','admin1' );

insert into notice(nseq, subject, content, workId) 
   values(notice_seq.nextVal, '잇플레이스 개인정보 처리방침 변경안내',
'안녕하세요. 잇플레이스입니다. 
개인정보 보호를 위해 아래와 같이 개인정보 처리방침이 10월 19일부로 일부 개정되었습니다.
이에 이용약관 개정에 대한 주요 내용을 안내 드리오니,  
회원 여러분께서는 변경되는 내용을 확인하여 주시기를 당부드립니다. 
 ','admin1' );

 

/*지도 좌표 추가*/


update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.1035567683693!2d126.91447920000002!3d37.5526239!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357cbcbf13b198c9%3A0x97157533c386824!2z7Jil64-Z7IudIOyEnOq1kOygkA!5e0!3m2!1sko!2skr!4v1657588890940!5m2!1sko!2skr' where rseq='1';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.0367346103653!2d126.9195606143833!3d37.53063133394302!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9f254c6085dd%3A0x2593bcbde0cd1517!2z7KCV7J2466m07Jil!5e0!3m2!1sko!2skr!4v1657590056195!5m2!1sko!2skr' where rseq='2';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.81945902334!2d126.89305651438347!3d37.535752933649924!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ec3f098ebb3%3A0x75d885bf852f9bf5!2z65iQ7Iic7J2064Sk!5e0!3m2!1sko!2skr!4v1657590190975!5m2!1sko!2skr' where rseq='3';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.5163644246545!2d126.90867961438285!3d37.519323434590056!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ee27e033277%3A0x31fd2d964dc9b9dd!2z64yA7ZWc7Jil!5e0!3m2!1sko!2skr!4v1657592622935!5m2!1sko!2skr' where rseq='4';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.2576393425675!2d126.90788991438394!3d37.54899333289208!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c99bf8680bf7b%3A0xf742e06ee32c0cfb!2z7ZWo67CY!5e0!3m2!1sko!2skr!4v1657592709242!5m2!1sko!2skr' where rseq='5';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.394137101414!2d126.91589691719882!3d37.52220537930709!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9f186f9706bd%3A0x516194881e5c23a8!2z7IKs64yA67aA7KeRIOqzs-qwhA!5e0!3m2!1sko!2skr!4v1657592826286!5m2!1sko!2skr' where rseq='6';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.2831065778346!2d126.9189280143839!3d37.548393232926436!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c98d0300e01d3%3A0x1b7c07706c663a6d!2z6rK97KO87Iud64u5!5e0!3m2!1sko!2skr!4v1657592876652!5m2!1sko!2skr' where rseq='7';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.6830383946194!2d126.98342031438442!3d37.56253083211702!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2f00d41b15b%3A0x7d50d5b6b0623a1d!2z66qF64-Z6rWQ7J6QIOuzuOygkA!5e0!3m2!1sko!2skr!4v1657592925878!5m2!1sko!2skr' where rseq='8';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.4428103014607!2d126.99652051438461!3d37.568189331792965!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca31f957798f7%3A0x733d6d9929611f90!2z7Jqw656Y7Jil!5e0!3m2!1sko!2skr!4v1657592996249!5m2!1sko!2skr' where rseq='9';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.3402650972866!2d126.97766911438465!3d37.570604531654574!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2ebf3b6d351%3A0x3c428986c0c0d5ba!2z6rSR7ZmU66y4IOuvuOynhA!5e0!3m2!1sko!2skr!4v1657593079950!5m2!1sko!2skr' where rseq='10';

update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.1501901360643!2d127.03559561438321!3d37.527956734096065!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5cd2d441437%3A0x3cffeedbabe3f28b!2z66-464yA7ImQ7ZSE!5e0!3m2!1sko!2skr!4v1657593133061!5m2!1sko!2skr' where rseq='11';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.6896631812515!2d126.99990921721006!3d37.56237477698728!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3196ead428d%3A0x3d8b3f31bd92333a!2z7Iqk7YOg65Sp7Iqk7YWM7J207YGs!5e0!3m2!1sko!2skr!4v1657593495667!5m2!1sko!2skr' where rseq='12';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.3915156248845!2d126.91863821438382!3d37.5458386330726!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c98d1f42eb09b%3A0xc2d39852d2e84f95!2z7Iqs65-w7LmYIO2Mqe2GoOumrA!5e0!3m2!1sko!2skr!4v1657593576961!5m2!1sko!2skr' where rseq='13';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.87908335949!2d126.95656451438344!3d37.53434753373039!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca38c964ae6fd%3A0x9e694a52a856dbf6!2z66eI7IGY652g66mU7KKF!5e0!3m2!1sko!2skr!4v1657593813896!5m2!1sko!2skr' where rseq='14';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.224040555325!2d127.02570801438225!3d37.502633735544684!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e29805ba2f%3A0x339ec75093d60a3b!2z67CU67mE66CI65OcIOqwleuCqOuzuOygkA!5e0!3m2!1sko!2skr!4v1657593867897!5m2!1sko!2skr' where rseq='15';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.77997492304!2d127.1016333143826!3d37.513107234945636!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca50ac4f34397%3A0x8b0c6baf33cf92cd!2z67mM7KaIIOyeoOyLpA!5e0!3m2!1sko!2skr!4v1657593928962!5m2!1sko!2skr' where rseq='16';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.2531705286997!2d127.03468981438304!3d37.52552893423494!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca24e646f64d9%3A0xe8b7e25e8bf7fc64!2z6r2B7Yuw65Oc7Yi066CI7JWEIOuPhOyCsOygkA!5e0!3m2!1sko!2skr!4v1657593976536!5m2!1sko!2skr' where rseq='17';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.285618482616!2d127.03842411438305!3d37.52476393427874!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca477fa5f6747%3A0xc403f0d7cf0630b6!2z7Jik7JWE7Iuc7Iqk!5e0!3m2!1sko!2skr!4v1657594027010!5m2!1sko!2skr' where rseq='18';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.9979105874318!2d126.96996171438326!3d37.53154653389061!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3a40ff0da5b%3A0xbc205900b3f4cc22!2z7Iyk7Iyk7Iyk!5e0!3m2!1sko!2skr!4v1657594067063!5m2!1sko!2skr' where rseq='19';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.338245496766!2d127.03870591438393!3d37.54709393300083!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5d0fce37341%3A0xf94b7ce7472383e0!2z7KCc7Iqk7Yuw7IK066OsIOyEseyImA!5e0!3m2!1sko!2skr!4v1657594110057!5m2!1sko!2skr' where rseq='20';

update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.692169722571!2d126.98861931438442!3d37.562315732129335!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e500000001%3A0xcb782d0fc54cd83c!2z7J287Iud7ISx7KeE!5e0!3m2!1sko!2skr!4v1657594200884!5m2!1sko!2skr' where rseq='21';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.144761968229!2d126.9128437143841!3d37.55165303273978!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c98d769b14d9d%3A0x1103581395e4b5ee!2z7Jqw64-ZIOy5tOuNtA!5e0!3m2!1sko!2skr!4v1657594244364!5m2!1sko!2skr' where rseq='22';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.6236560819775!2d126.98862931438451!3d37.56392963203688!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3d21fef8931%3A0x8450a473b52c029!2z7KeE7J6R!5e0!3m2!1sko!2skr!4v1657594320140!5m2!1sko!2skr' where rseq='23';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.7372695932736!2d126.92236831438449!3d37.561253332190084!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c99a4c5dffbd1%3A0xfed76dd00f654dc1!2z7LSI7J2064uk7J2064ud!5e0!3m2!1sko!2skr!4v1657594357973!5m2!1sko!2skr' where rseq='24';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.349873137747!2d126.91098651438385!3d37.54681993301651!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9eeef60c9b9f%3A0xf68f3123b4a78b32!2z6rWQ64uk7J207JW8!5e0!3m2!1sko!2skr!4v1657594395025!5m2!1sko!2skr' where rseq='25';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.4350066697066!2d126.9756013143846!3d37.56837313178239!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3f21f3de2c1%3A0xa5c0c7010beae2e1!2z7Jik7KCc7KCc!5e0!3m2!1sko!2skr!4v1657594443961!5m2!1sko!2skr' where rseq='26';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.1452882386743!2d126.91994991438408!3d37.5516406327405!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c99857ce0d33b%3A0x57e7fd967af11363!2z7Jqw7JmA!5e0!3m2!1sko!2skr!4v1657594484551!5m2!1sko!2skr' where rseq='27';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.3166534683887!2d126.92383511438304!3d37.52403223432057!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9fb28acf68ff%3A0x70389a9f5cc906e6!2z7Jik67O17IiY7IKwIOyXrOydmOuPhOygkA!5e0!3m2!1sko!2skr!4v1657594528935!5m2!1sko!2skr' where rseq='28';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.075651679696!2d127.05783821438237!3d37.50613383534457!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca540c3f41223%3A0xd2fc1b843e62a451!2z67aA7YOA7J20IDHrp4k!5e0!3m2!1sko!2skr!4v1657594571379!5m2!1sko!2skr' where rseq='29';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.1045400377925!2d126.91981591438405!3d37.552600732685576!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c98c4d300097b%3A0xa1fad1867fe111f!2z7Zi86rCA7Lig!5e0!3m2!1sko!2skr!4v1657594608084!5m2!1sko!2skr' where rseq='30';

update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.7392538975273!2d127.0190020143827!3d37.51406753489081!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3600023be69%3A0x36f8545613987e10!2z7J2465-JIO2boOq2iA!5e0!3m2!1sko!2skr!4v1657594652097!5m2!1sko!2skr' where rseq='31';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.436123295832!2d126.92828511438464!3d37.56834683178389!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca28fbc234efb%3A0x33be6850da8b50d6!2z66qp656AKOacqOiYrSk!5e0!3m2!1sko!2skr!4v1657594692246!5m2!1sko!2skr' where rseq='32';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.5141633436783!2d127.02247041438288!3d37.519375334587075!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3ec63472f51%3A0xa3a1ac670c05c2c6!2z7K647KaIKOafseWtkCk!5e0!3m2!1sko!2skr!4v1657594737834!5m2!1sko!2skr' where rseq='33';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.752581397358!2d126.97997181438441!3d37.560892632210845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2f1463ea83b%3A0x42e7268962d7fbc7!2z656A7KO87Lm866m0!5e0!3m2!1sko!2skr!4v1657594783404!5m2!1sko!2skr' where rseq='34';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8517381069023!2d127.05466471438255!3d37.51141483504245!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5be0496d8c1%3A0x198b8b7b970b1995!2z7YyA7Zi47JmEIOyCvOyEseygkA!5e0!3m2!1sko!2skr!4v1657594832302!5m2!1sko!2skr' where rseq='35';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.7238042713457!2d126.92445891438439!3d37.561570532171956!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c98e950482c9f%3A0xf3dbce15ee0eb360!2z7Jew6rWQ!5e0!3m2!1sko!2skr!4v1657594889190!5m2!1sko!2skr' where rseq='36';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.9992129360717!2d126.96892571438326!3d37.5315158338925!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca33a4b06ddc9%3A0xfbbbd257e3d1b87f!2z6rq86rGw!5e0!3m2!1sko!2skr!4v1657594941657!5m2!1sko!2skr' where rseq='37';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.0159510891053!2d127.10604021438252!3d37.50754193526406!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca50154285b69%3A0xd31abd8262773697!2z7KeE7KeA7JWE!5e0!3m2!1sko!2skr!4v1657594982034!5m2!1sko!2skr' where rseq='38';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.9023106256977!2d126.98990121438337!3d37.533800033761715!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca24a6f594ab9%3A0xca3631270804a386!2z7J-I64uI642k7ZSM66eBIOuzuOq0gA!5e0!3m2!1sko!2skr!4v1657595030836!5m2!1sko!2skr' where rseq='39';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.440207210011!2d127.03633711438283!3d37.521119134487336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3edab2841ef%3A0x7ac838afbec5fe17!2z64yA6rCA67Cp!5e0!3m2!1sko!2skr!4v1657595068203!5m2!1sko!2skr' where rseq='40';

update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3161.908084367088!2d126.96410321438512!3d37.58078203107157!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2bd698b9cef%3A0xdc59f597ca6bb5be!2z7ZuE7ZuE65287Jq07KeA!5e0!3m2!1sko!2skr!4v1657595108926!5m2!1sko!2skr' where rseq='41';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.3114449541226!2d127.03604471438302!3d37.524155034313665!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca388e8805e73%3A0xe21089929498ad66!2z7Lm07Y6Y64W47Yuw65OcIOyyreuLtA!5e0!3m2!1sko!2skr!4v1657595141299!5m2!1sko!2skr' where rseq='42';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.002655038729!2d126.90385421438411!3d37.55500123254813!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9925aef9f56f%3A0x2104ffb47ee6fa7e!2z7Ja06riA66asIOuyoOydtOy7pOumrA!5e0!3m2!1sko!2skr!4v1657595185432!5m2!1sko!2skr' where rseq='43';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.515126346845!2d127.05355241438382!3d37.54292563323942!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5120353a87d%3A0xa911a3513d32f038!2z7Lm07Y6YIO2PrOygnCAtIENhZmUgUG96ZQ!5e0!3m2!1sko!2skr!4v1657595225450!5m2!1sko!2skr' where rseq='44';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.2877450487495!2d127.0413445143839!3d37.548283932932726!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5c8137e46f1%3A0x3566c4399aa707fd!2z7ISc7Jq47JW166y07IOI!5e0!3m2!1sko!2skr!4v1657595262787!5m2!1sko!2skr' where rseq='45';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3161.848970509064!2d126.97047291438511!3d37.58217393099198!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3bbcf47ede1%3A0x46967db5fc9f0ec2!2z7JWE7YKk67mE7Iqk7Yq4!5e0!3m2!1sko!2skr!4v1657595303918!5m2!1sko!2skr' where rseq='46';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.705686213597!2d126.9219502143845!3d37.561997332147506!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c99ce45a8258f%3A0x23d1812298978dfc!2z656c65SU7Iqk64-E64SbIOyXsOuCqOygkA!5e0!3m2!1sko!2skr!4v1657595341762!5m2!1sko!2skr' where rseq='47';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.2023940925706!2d127.0262325143823!3d37.503144335515536!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e2c7728e53%3A0xe1127a9dc0408ac3!2z642UIOuLrOuLrA!5e0!3m2!1sko!2skr!4v1657595383883!5m2!1sko!2skr' where rseq='48';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.2118432794523!2d126.91753481438397!3d37.55007243283035!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c98da945e8155%3A0x1b61adc349a8dc90!2z7ZS87Jik64uI!5e0!3m2!1sko!2skr!4v1657595498574!5m2!1sko!2skr' where rseq='49';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.20196962657!2d126.98723981438494!3d37.573861531468026!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3dac593074b%3A0x9df5ccd724e68c8b!2z7LKt7IiY64u5IOyKpO2MjA!5e0!3m2!1sko!2skr!4v1657595574028!5m2!1sko!2skr' where rseq='50';
update restaurant set r_map='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.6583271845448!2d127.00071831438356!3d37.53955073343261!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3ae0f6c38f7%3A0x2f56a719cd319c7c!2z7Jis65Oc7Y6Y66as64-E64Sb!5e0!3m2!1sko!2skr!4v1657595651687!5m2!1sko!2skr' where rseq='51';





/* images insert */
/* images insert */
insert into images(r_img, m_img, s_img, rseq)
   values('k11.png','k12.jpg','k13.png','1');
insert into images(r_img, m_img, s_img, rseq)
   values('k21.jpg','k22.png','k23.jpg','2');
insert into images(r_img, m_img, s_img, rseq)
   values('k31.png','k32.png','k33.png','3');
insert into images(r_img, m_img, s_img, rseq)
   values('k41.jpg','k42.webp','k43.jpg','4');
insert into images(r_img, m_img, s_img, rseq)
   values('k51.jpg','k52.jpg','k53.jpg','5');
insert into images(r_img, m_img, s_img, rseq)
   values('k61.jpg','k62.jpg','k63.jpg','6');
insert into images(r_img, m_img, s_img, rseq)
   values('k71.jpg','k72.jpg','k73.jpg','7');
insert into images(r_img, m_img, s_img, rseq)
   values('k81.jpg','k82.jpg','k83.jpg','8');
insert into images(r_img, m_img, s_img, rseq)
   values('k91.jpg','k92.jpg','k93.jpg','9');
insert into images(r_img, m_img, s_img, rseq)
   values('k101.jpg','k102.jpg','k103.jpg','10');
   
insert into images(r_img, m_img, s_img, rseq)
   values('w11.jpg','w12.jpg','w13.jpg','11');
insert into images(r_img, m_img, s_img, rseq)
   values('w21.jpg','w22.jpg','w23.jpg','12');
insert into images(r_img, m_img, s_img, rseq)
   values('w31.jpg','w32.jpg','w33.jpg','13');
insert into images(r_img, m_img, s_img, rseq)
   values('w41.jpg','w42.jpg','w43.jpg','14');
insert into images(r_img, m_img, s_img, rseq)
   values('w51.jpg','w52.jpg','w53.jpg','15');
insert into images(r_img, m_img, s_img, rseq)
   values('w61.jpg','w62.jpg','w63.jpg','16');
insert into images(r_img, m_img, s_img, rseq)
   values('w71.jpg','w72.jpg','w73.jpg','17');
insert into images(r_img, m_img, s_img, rseq)
   values('w81.jpg','w82.jpg','w83.jpg','18');
 insert into images(r_img, m_img, s_img, rseq)
   values('w91.jpg','w92.jpg','w93.jpg','19');
insert into images(r_img, m_img, s_img, rseq)
   values('w101.jpg','w102.jpg','w103.jpg','20');
   
insert into images(r_img, m_img, s_img, rseq)
   values('j11.jpg','j12.jpg','j13.png','21');
insert into images(r_img, m_img, s_img, rseq)
   values('j21.jpg','j22.jpg','j23.jpg','22');
insert into images(r_img, m_img, s_img, rseq)
   values('j31.jpg','j32.jpg','j33.jpg','23');
insert into images(r_img, m_img, s_img, rseq)
   values('j41.jpg','j42.jpg','j43.jpg','24');
insert into images(r_img, m_img, s_img, rseq)
   values('j51.jpg','j52.jpg','j53.jpg','25');
insert into images(r_img, m_img, s_img, rseq)
   values('j61.jpg','j62.jpg','j63.jpg','26');
insert into images(r_img, m_img, s_img, rseq)
   values('j71.jpg','j72.jpg','j73.jpg','27');
insert into images(r_img, m_img, s_img, rseq)
   values('j81.jpg','j82.jpg','j83.jpg','28');
insert into images(r_img, m_img, s_img, rseq)
   values('j91.jpg','j92.jpg','j93.jpg','29');
insert into images(r_img, m_img, s_img, rseq)
   values('j101.jpg','j102.jpg','j103.jpg','30');
   
insert into images(r_img, m_img, s_img, rseq)
   values('c11.jpg','c12.jpg','c13.jpg','31');
insert into images(r_img, m_img, s_img, rseq)
   values('c21.jpg','c22.jpg','c23.jpg','32');
insert into images(r_img, m_img, s_img, rseq)
   values('c31.jpg','c32.jpg','c33.jpg','33');
insert into images(r_img, m_img, s_img, rseq)
   values('c41.jpg','c42.jpg','c43.jpg','34');
insert into images(r_img, m_img, s_img, rseq)
   values('c51.jpg','c52.jpg','c53.jpg','35');
insert into images(r_img, m_img, s_img, rseq)
   values('c61.jpg','c62.jpg','c63.jpg','36');
insert into images(r_img, m_img, s_img, rseq)
   values('c71.jpg','c72.jpg','c73.jpg','37');
insert into images(r_img, m_img, s_img, rseq)
   values('c81.jpg','c82.jpg','c83.jpg','38');
insert into images(r_img, m_img, s_img, rseq)
   values('c91.jpg','c92.jpg','c93.jpg','39');
insert into images(r_img, m_img, s_img, rseq)
   values('c101.jpg','c102.jpg','c103.jpg','40');
   
insert into images(r_img, m_img, s_img, rseq)
   values('d11.jpeg','d12.jpeg','d13.jpeg','41');
insert into images(r_img, m_img, s_img, rseq)
   values('d21.jpeg','d22.jpeg','d23.jpeg','42');
insert into images(r_img, m_img, s_img, rseq)
   values('d31.jpeg','d32.jpeg','d33.jpeg','43');
insert into images(r_img, m_img, s_img, rseq)
   values('d41.jpeg','d42.jpeg','d43.jpeg','44');
insert into images(r_img, m_img, s_img, rseq)
   values('d51.jpeg','d52.jpeg','d53.jpeg','45');
insert into images(r_img, m_img, s_img, rseq)
   values('d61.jpeg','d62.jpeg','d63.jpeg','46');
insert into images(r_img, m_img, s_img, rseq)
   values('d71.jpeg','d72.jpeg','d73.jpeg','47');
insert into images(r_img, m_img, s_img, rseq)
   values('d81.jpeg','d82.jpeg','d83.jpeg','48');
insert into images(r_img, m_img, s_img, rseq)
   values('d91.jpeg','d92.jpeg','d93.jpeg','49');
insert into images(r_img, m_img, s_img, rseq)
   values('d101.jpeg','d102.jpeg','d103.jpeg','50');
insert into images(r_img, m_img, s_img, rseq)
   values('d111.jpeg','d112.jpeg','d113.jpeg','51');


 ----restaurant 테이블 r_image 칼럼 업데이트 
----restaurant 테이블 r_image 칼럼명 변경 및  m_image 칼럼 업데이트 


update restaurant set m_image='k12.jpg'where rseq='1';
update restaurant set m_image='k22.png'where rseq='2';
update restaurant set m_image='k32.png'where rseq='3';
update restaurant set m_image='k42.webp'where rseq='4';
update restaurant set m_image='k52.jpg'where rseq='5';
update restaurant set m_image='k62.jpg'where rseq='6';
update restaurant set m_image='k72.jpg'where rseq='7';
update restaurant set m_image='k82.jpg'where rseq='8';
update restaurant set m_image='k92.jpg'where rseq='9';
update restaurant set m_image='k102.jpg'where rseq='10';

update restaurant set m_image='w12.jpg'where rseq='11';
update restaurant set m_image='w22.jpg'where rseq='12';
update restaurant set m_image='w32.jpg'where rseq='13';
update restaurant set m_image='w42.jpg'where rseq='14';
update restaurant set m_image='w52.jpg'where rseq='15';
update restaurant set m_image='w62.jpg'where rseq='16';
update restaurant set m_image='w72.jpg'where rseq='17';
update restaurant set m_image='w82.jpg'where rseq='18';
update restaurant set m_image='w92.jpg'where rseq='19';
update restaurant set m_image='w102.jpg'where rseq='20';

update restaurant set m_image='j12.jpg'where rseq='21';
update restaurant set m_image='j22.jpg'where rseq='22';
update restaurant set m_image='j32.jpg'where rseq='23';
update restaurant set m_image='j42.jpg'where rseq='24';
update restaurant set m_image='j52.jpg'where rseq='25';
update restaurant set m_image='j62.jpg'where rseq='26';
update restaurant set m_image='j72.jpg'where rseq='27';
update restaurant set m_image='j82.jpg'where rseq='28';
update restaurant set m_image='j92.jpg'where rseq='29';
update restaurant set m_image='j102.jpg'where rseq='30';

update restaurant set m_image='c12.jpg'where rseq='31';
update restaurant set m_image='c22.jpg'where rseq='32';
update restaurant set m_image='c32.jpg'where rseq='33';
update restaurant set m_image='c42.jpg'where rseq='34';
update restaurant set m_image='c52.jpg'where rseq='35';
update restaurant set m_image='c62.jpg'where rseq='36';
update restaurant set m_image='c72.jpg'where rseq='37';
update restaurant set m_image='c82.jpg'where rseq='38';
update restaurant set m_image='c92.jpg'where rseq='39';
update restaurant set m_image='c102.jpg'where rseq='40';

update restaurant set m_image='d12.jpeg'where rseq='41';
update restaurant set m_image='d22.jpeg'where rseq='42';
update restaurant set m_image='d32.jpeg'where rseq='43';
update restaurant set m_image='d42.jpeg'where rseq='44';
update restaurant set m_image='d52.jpeg'where rseq='45';
update restaurant set m_image='d62.jpeg'where rseq='46';
update restaurant set m_image='d72.jpeg'where rseq='47';
update restaurant set m_image='d82.jpeg'where rseq='48';
update restaurant set m_image='d92.jpeg'where rseq='49';
update restaurant set m_image='d102.jpeg'where rseq='50';
update restaurant set m_image='d112.jpeg'where rseq='51';













/*한식*/
insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '돼지곰탕', '10000','김치만두', '5000','1');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '평양냉면', '12000', '순면', '14000','2');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '토시살', '32000','등심', '32000','3');

insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '꼬리수육(대)', '68000', '도가니수육', '40000','4');   
   
insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '모아 함반', '14000','닭고기 함반', '12000','5');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '참도미구이반상', '55000','생대구탕반상', '53000','6');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '목살정식', '13000','고기한상', '39500','7');

insert into menu (r_mseq, r_mname1, r_mprice1,  r_mname2, r_mprice2,rseq)
   values(menu_seq.nextVal, '칼국수', '10000','만두', '11000','8');

insert into menu (r_mseq, r_mname1, r_mprice1,  r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '평양냉면', '16000','비빔냉면', '16000','9');

insert into menu (r_mseq, r_mname1, r_mprice1,  r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '냉메밀', '11000','온메밀', '11000','10');

   
/*양식*/
insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '로제소스 통닭&파스타', '25000','채끝등심스테이크', '25000','11');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '등심스테이크박스', '15900', '살치살스테이크박스', '15900','12');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '가지스테이크 분짜 샐러드', '20000','버섯 두유 크림 리조또', '19000','13');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '런치코스 1인', '55000', '디너코스 1인', '68000','14');
   
insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2,  rseq)
   values(menu_seq.nextVal, '바비 스테이크', '22000','레드 크림 파스타', '17900','15');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '빌즈 리코타 핫케이크', '19800','풀 오지', '25000','16');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '아보카도토스트', '14000','통베이컨브리오슈와플', '19500','17');

insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '타이 누들 샐러드 해물', '26000','애플햄치즈프렌치토스트', '23000','18');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, 'CALIFORNIA ST LASAGNA', '17000', 'HELLO AUNTIE SHRIMP OIL PASTA', '17000','19');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, 'Zesty garlic burger', '9800','Wasabi shrimp burger', '10800','20');

   
/*일식*/
insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2,rseq)
   values(menu_seq.nextVal, '조리장 특선 정식세트', '55000','조리장 스페셜 요라', '110000','21');

insert into menu (r_mseq, r_mname1, r_mprice1,  r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '가케우동', '8000','덴뿌라우동', '11000','22');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '진작후토마키 BEST', '16900','대창덮밥 BEST', '15900','23');

insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2,rseq)
   values(menu_seq.nextVal, '연어 후토마끼', '13000','육회 후토마끼', '13000','24');

insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2,rseq)
   values(menu_seq.nextVal, '가케우동', '8000','니꾸우동', '10000','25');

insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '안심돈가츠', '15000','등심가츠', '14000','26');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '새우토마토오코노미야끼', '17000','철판꽃갈비살', '19000','27');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2,  rseq)
   values(menu_seq.nextVal, '모듬 사시미', '75000', '우니 도로 이쿠라 관자 에비', '55000','28');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '마제소바', '10000', '모리아와세카츠', '28000','29');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '치즈돈까스', '10000','왕돈까스', '9000','30');


   
/*중식*/    
insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '훠궈', '12000','가물치 3판', '15000','31');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '동파육(소)', '45000', '멘보샤(소)', '35000','32');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '소룡포', '4000','딴딴면', '8000','33');

insert into menu (r_mseq, r_mname1, r_mprice1,  r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '삼선해물자장도삭면', '9000','사천 유슬부추도삭면', '11000','34');

insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2,rseq)
   values(menu_seq.nextVal, '하가우(3pcs)', '7000','차슈바오 번(3pcs)', '8000','35');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '성쟁바오', '7000','오향닭(소)', '12000','36');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '깨장 치킨 미엔', '14000','돼지고기 볶음면', '15000','37');

insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2,rseq)
   values(menu_seq.nextVal, '마라 곱창전골(소)', '30000','망고 크림새우', '17000','38');

insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2,rseq)
   values(menu_seq.nextVal, '군만두 반달', '10000','새우물만두', '10000','39');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '유니짜장면', '6500','매운짬뽕', '7500','40');


--카페
insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '크렘 카라멜', '5500','레몬 생크림 치즈 케이크', '7000','41');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, 'AMERICANO', '4000','CLASSIC VANILLA DONUT', '3000','42');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '말차 맘모스', '5800','감동의 대파빵', '6300','43');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, 'Cold Brew Cream COffee', '6000','Apple Cinnamon Latte', '6000','44');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '피칸시나몬롤', '5000','땅콩시나몬롤', '5000','45');

insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '아메리카노', '5000','라떼', '5500','46');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, 'Classic', '2200','Deluxe', '2500','47');

insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2,rseq)
   values(menu_seq.nextVal, '달달 초코빙수', '15000','달달 와플', '12000','48');

insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2,rseq)
   values(menu_seq.nextVal, '딸기빙수', '11000','딸기생크림 조각', '6300','49');

insert into menu (r_mseq, r_mname1, r_mprice1, r_mname2, r_mprice2,rseq)
   values(menu_seq.nextVal, '오리지날 에그 수플레 카스텔라', '16000','딸기 수플레 카스텔라', '18000','50');

insert into menu (r_mseq, r_mname1, r_mprice1,r_mname2, r_mprice2, rseq)
   values(menu_seq.nextVal, '피넛버터', '5000','버터 피스타치오', '5000','51');





   
   
-----레스토랑 테이블 식당 상세내용 추가----
--r_content update


update restaurant set r_content='屋同食에서 드시는 국밥은 남원 지리산 자락에서 키운 버크셔K(국내산순종 흑돼지)로 맛을 냈습니다. 제공되는 김치와 부재료 등은 국내산으로 지역에서 공수 받아 조리 후 서비스 됩니다. 일반적인 뽀얀 돼지국밥과 달리 맑은 곰탕의 형태로 담백한 맛이 좋습니다. 한 그릇의 국밥이지만 여유롭게 즐겨 주시기 바랍니다. 屋同食 주인장 옥동식' where rseq='1';
update restaurant set r_content='좋은 품질의 식재료와 변함없는 맛에 대한 정인면옥 대표의 고집이 냉면 한 그릇에 고스란히 담겨 있다. 북한 출신 부모님의 존함에서 한 자씩 따온 식당 이름도 전통을 계승하고자 하는 그의 의지의 반영이다. 2014년, 서울 여의도로 이전 오픈한 이곳은 현재 광명시에 있는 정인면옥과는 별개로 운영되고 있다. 직장인들이 많은 여의도에 위치한 까닭에 점심시간에는 어느 정도 대기 시간을 감안해야 한다. 아롱사태 수육, 암퇘지 편육과 접시 만두는 반 접시만도 주문이 가능하다.' where rseq='2';
update restaurant set r_content='또순이네는 넓은 주차장과 품위 있고 아늑한 실내 인테리어에 넉넉한 인심까지 또순이네는 우리의 입맛과 눈길, 마음을 사로잡기에 충분합니다. 가족단위의 모임은 물론 귀한 손님 접대에 어울리는 또순이네에 오셔서 맛있는 식사와 즐거운 시간을 가지시길 바랍니다. 최고의 맛으로 최상의 서비스를 드리는 또순이네가 되겠습니다. 감사합니다.' where rseq='3';
update restaurant set r_content='설렁탕 전문점이만 꼬리찜과 도가니수육이 유명한 오랫된 맛집. 고춧가루로 양념한 부추가 듬뿍 뿌려져 있는 것이 특징이다. 꼬리찜이나 수육을 다 먹은 후 남은 양념에는 국수 사리를 비벼 먹는 것이 정석. 가격대비 만족도가 훌륭하다.' where rseq='4';
update restaurant set r_content='다양한 함박스테이크를 오마카세 형식으로 즐기실수있는 숯불함박스테이크 전문점입니다. 따뜻한 밥과 국, 6가지 다양한소스 와 함께 맛있는 식사를 제공하겠습니다.' where rseq='5';
update restaurant set r_content='사대부집 곳간은 각 지방마다 제철에 즐기던 별미로 구성된 반상을 선보입니다.' where rseq='6';
update restaurant set r_content='상수동에위치한 경주식당입니다. 최선을다하겠습니다^^' where rseq='7';
update restaurant set r_content='1966년 창업이후 명동에서 본점과 분점, 이태원에 직영점을 운영하고 있는 칼국수 전문 음식점입니다. 명동교자는 창업 이래 음식의 맛은 정성이 과학을 앞선다.는 신념을 지키기 위하여 가격에 상관없이 최고의 음식 재료, 신선한 음식재료만을 매일매일 구입하여 사용하고 있으며 남은 음식은 100% 완전히 폐기합니다. 칼국수, 만두, 비빔국수, 콩국수를 드실 수 있으시고, 만두만 포장가능합니다.' where rseq='8';
update restaurant set r_content='서울 시내 최고의 평양식 냉면 전문점 중 하나로 손꼽히는 우래옥은 1946년 개업한 이래 꾸준히 전통을 이어오고 있는 유서 깊은 레스토랑이다. 이 집의 대표 메뉴는 전통 평양냉면과 불고기. 오랜 세월에 걸쳐 습득한 노하우와 국내산 재료만을 사용하는 뚝심으로 한결같은 맛을 자랑하는 냉면과 고품질의 한우를 제공한다. 레스토랑 내부가 상당히 넓은 편이라 많은 손님들이 몰리는 바쁜 시간에도 효율적인 좌석 배치가 가능하지만, 그럼에도 문 앞엔 항상 긴 줄이 늘어서 있다.' where rseq='9';
update restaurant set r_content='1952년부터 광화문 일대를 지켜온 터줏대감인 미진은 한국식 냉메밀국수 전문점으로, 일본식 소바 쯔유보다 진한 맛의 간장 육수와 더 쫄깃한 식감의 메밀 면발을 선보인다. 식당 지하에 운영하는 공장에서 육수와 면을 직접 생산해 손님들에게 바로바로 제공한다. 한 주전자 가득 담긴 차가운 육수와 테이블마다 인심 좋게 제공하는 메밀국수 고명은 기호에 따라 가감이 가능하다. 숙주와 두부, 신김치와 돼지고기 소로 채운 메밀전병 역시 이 집의 인기 메뉴인데, 1인분의 반인 한 줄씩도 판매한다.' where rseq='10';
update restaurant set r_content='안녕하세요. 서울특별시 강남구 신사동에 위치한 미대쉐프입니다. 저희는 한국3대장인 된장 고추장 간장을 활용한 퓨전요리전문입니다. 점심파스타식당 저녁서양식주점 파스타지만 우리나라 소주와도 마리와주시킬 수 있게 메뉴구성을 해놓았구 그날그날 재철재료를 활용한 수시로바 뀌는 오늘의 파스타나 오늘의요리도 구성되어져있습니다. 매장은 미술관같이 꾸며놓아 남녀노소 분위기있게 즐기게끔 해놓았습니다. 오늘 저희 매장에서 한잔 어떠세요?' where rseq='11';
update restaurant set r_content='안녕하세요 스탠딩스테이크 서울대점입니다. 저희 맛집은 신림에서 컵스테이크 보쌈으로 유명한 배달맛집겸 맛집이구요 고객님들이 식사를편하게 하실수 있도록 테이크아웃 및 서비스 가 되어있습니다. 신림동 서울대맛집 스탠딩스테이크 많이 사랑해주세요.' where rseq='12';
update restaurant set r_content='비건 채식주의자들을 위한 건강한 맛집' where rseq='13';
update restaurant set r_content='마쁘띠메종은 100% 예약제 프렌치 원테이블 레스토랑입니다. 집처럼 아늑한 공간에서 소중한 날, 소중한 사람들과 와인 한 잔과 프렌치 코스 요리로 따뜻한 시간 보내시길 바랍니다. :)' where rseq='14';
update restaurant set r_content='매운 소갈비 파스타의 원조! 강남역 대표 맛집 매운 갈비 파스타의 원조! 한식과 이탈리안의 독특한 만남! 스파이시 퓨전 레스토랑 바비레드입니다. BOBIRED is a unique Korean-Italian spicy fusion restaurant where the Original Spicy Rib Pasta was born.' where rseq='15';
update restaurant set r_content='올데이 다이닝 빌즈(bills)는 호주 특유의 따스하고 편안한 라이프 스타일과 식재료 본연의 맛을 그대로 살린 건강한 메뉴를 선보입니다. 오가닉 스크램블에그, 리코타 핫케이크 등 빌즈 클래식 메뉴와 다양한 건강 음료, 호주식 커피를 즐기실 수 있습니다.' where rseq='16';
update restaurant set r_content='꽁티드툴레아는 향기 관련 제품을 판매하고 소개하는 브랜드 기반으로 브런치 및 와인을 즐길 수 있는 복합 문화 공간입니다. 다양하고 재밌는 음식들과 음료 그리고 꽁티 드 툴레아의 향과 함께 즐거운 시간을 보내시길 바랍니다.' where rseq='17';
update restaurant set r_content='에그베네딕트가 맛있는 청담브런치맛집' where rseq='18';
update restaurant set r_content='삼각지의 샌프란시스코, 샘프란시스코' where rseq='19';
update restaurant set r_content='American style burger' where rseq='20';
update restaurant set r_content='저희 매장은 명동에서 20년 동안 같은 자리에서 운영하고 최근에 넓고 쾌적한 자리로 더 많은 고객님들을 모시고자 매장 위치를 이전하였습니다. 프라이빗 룸이 다수 구성되어 있으며, 농림축산부 인증받은 식당답게 항상 최상의 신선한 재료로 좋은 음식 대접해드리겠습니다.' where rseq='21';
update restaurant set r_content='맛있는 정호영 쉐프가 운영하는 합정역 우동' where rseq='22';
update restaurant set r_content='안주림의 두번째 브랜드 진작 클래식과 하이엔드의 재해석 그리고 대중화 진작은 질 좋은 재료를 가지고 변하지 않는 깊은 맛을 위해 최선을 다해 공부하고 연구합니다. 저희는 클래식한 메뉴들을 진작만의 스타일로 재해석하여 진짜 작품을 만들어 고객에게 맛과 감동을 대접하고 싶은 브랜드입니다. 일식을 베이스로 한 퓨전 요리를 선보이며 하이엔드 요리의 대명사 후토마끼 를 시그니처로 하고 대창,연어,참치,항정살 등을 활용한 덮밥류와 두툼하고 부드러운 모듬카츠 그리고 진작만의 스타일로 재해석한 파스타 등 주류와 함께 곁들여 드시기 좋은 다양한 퓨전요리를 선보이고 있습니다. 깔끔하고 정갈한 분위기와 고급스런 식사를 함께 즐기실 수있습니다. 직장 동료와의 식사, 연인과의 데이트, 팀 회식 등 다양한 모임에 적합한 장소를 제공하고 있으니 많은 방문 부탁드리겠습니다.' where rseq='23';
update restaurant set r_content='오늘도 GOOD CHOIS! 저희 초이다이닝은 담백하고 정갈한 일식과 여러가지 식재료를 사용한 양식의 이채로움 조화롭고 다양하게 해석한 식당입니다. 항상 방문하시는 분들에게 감동을 드릴 수 있도록 노력하겠습니다. 오늘도 행복한 시간 되세요.내용 더보기' where rseq='24';
update restaurant set r_content='합정역 근처의 조용한 주택가에 들어서면 나무 도마에 탁탁탁 작두날 튕기는 소리가 경쾌하게 들려온다. ‘형제의 집’을 뜻하는 교다이야는 두 형제가 운영하는 우동 전문점이다. 이곳에선 주문이 들어오는 대로 면을 써는 것을 원칙으로 한다. 면을 만들어놓으면 수분이 증발해 사누키 우동 특유의 매력을 느낄 수 없기 때문이다. 탱글탱글한 동시에 쫄깃하며 매끄러운 사누키 우동 면발, 정어리 훈제 포와 연간장으로 맛을 낸 시원한 감칠맛의 국물. 늘 한결같은 이곳의 우동 맛은 두 사장의 뚝심 있는 모습과 닮아 있다.' where rseq='25';
update restaurant set r_content='건널 : 제 이루다 : 제 오제제는 제주도에서 바다 건너온 두 청년이 서울에서의 장사의 꿈을 가지고 올라와 만들어낸 음식점입니다. 오제제는 우동과 소바 그리고 돈가츠를 판매하고 우동같은 경우에는 날씨가 따뜻한 여름에는 냉 우동 , 날씨가 추운 가을 겨울에는 온 우동을 만들어 손님들께 제공합니다. 요리뿐 아니라 인테리어, 매장 내 자리한 오브제, 음악 그리고 컨셉에 맞춰 직접 제작한 그릇들까지 자연에서 모티브를 얻어 단순히 음식을 먹는 것이 아닌 오감 전체를 만족하는 경험을 제공하고자 합니다. 오제제의 모든 식자재는 당일 소비를 원칙으로 하고 있으며 주문 즉시 음식을 조리하므로 약 15분 ~ 25분 정도 소요됩니다.' where rseq='26';
update restaurant set r_content='안녕하세요. 오코노미야끼 와 야끼소바 각종 테판야끼를 전문으로 하고 있는 雨蛙 ‘우와’ 홍대본점 입니다. oknomiyaki & teppan yaki 雨蛙 [ 우 ː 와 ] 입니다. 우와의 오코노미야끼는 밀가루를 전혀 사용하지 않고 안동산 “마” 를 100% 사용하여 건강하고 부드러운 맛을 지향하고 있습니다. 기존 오코노미야끼의 틀에서 오리지널리티는 지키되 다양한 소스와 표현방식으로 음식을 제공해드리고자 노력 하고 있습니다. 그외에도 생면만을 사용하는 야끼소바 다양한 테판요리 사이드 요리가 준비되어있습니다. 홍대본점을 시작해 가로수길점 대학로점 부평점까지 다양한 분위기와 서비스 많은 이용 부탁드리겠습니다. 감사합니다!' where rseq='27';
update restaurant set r_content='오복수산 여의도점, 단체룸(최대 12인)이 있어 모임 및 회식 장소로 추천드립니다.' where rseq='28';
update restaurant set r_content='마제소바&돈카츠 전문점, [부타이]는 도심 속 한 그릇의 위로를 드리는 재패니즈 캐주얼 키친입니다. 마제소바를 재해석한 부타이 마제소바와 오사카 방식으로 숙성한 돈카츠를 시그니처 메뉴로 선보인 이후, 많은 고객님들의 사랑을 받아왔습니다. 부타이는 일본 전통 요리들을 팀 부타이의 방식으로 새롭게 재해석한 요리들을 선보이는 미식의 장이자 하나의 무대(ぶたい)입니다. 저희에게 요리는 온 힘을 다해 준비하고 끊임없는 연습과 열정으로 빚어낸 완벽한 작품을 무대에 올리는, 한 편의 뮤지컬과 닮아있습니다. 언제나 치열하게 준비한 우리의 요리들을 계속해 [부타이]라는 무대 위에 올리겠습니다.' where rseq='29';
update restaurant set r_content='치즈돈까스가 유명한 백종원3대천왕 돈까스' where rseq='30';
update restaurant set r_content='대한민국에서 유일하게 전통 중국 운남성훠궈를 드실 수 있는 인량훠궈전문점에 오신걸 환영합니다! 얇게 회를 뜬 가물치에서부터 망태버섯, 아가리쿠스버섯 등 귀한 버섯들과 총 예순가지가 넘는 메뉴가 준비되어있으며 모든 연령대분들께서 즐길 수 있는 보양식입니다. 차별화된 맛과 서비스로 만나뵙겠습니다. 인량은 중국 운남성 전통음식인 가물치훠궈(斑鱼火锅)를 오랜 시간 연구하고 개발해내어 대한민국 최초로 고객분들께 제공하기 시작한 훠궈전문점입니다. 셰프의 고난도 기술을 요구하는 얇게 뜬 가물치회부터 가물치로 만든 완자, 가물치육수 그리고 다른 곳에서는 찾아 볼 수 없는 아가리쿠스버섯, 망태버섯, 노루궁뎅이버섯과 여러가지 신선한 재료를 완벽하게 구성해내기 위해 많은 노력과 시간을 투자하였습니다. 하지만 식사를 하는 사람을 위한 정성과 마음이 없다면 맛도 소용없다는 것을 알기에 항상 마음에 담아두고자 저희 음식점 이름을 人良으로 지었습니다. 食 밥이 지어지려면 人(인) 사람의 良(량) 정성이 필요합니다. 그래서 인량입니다. 맛과 보양을 둘 다 놓치지 않고 정성을 다하는 서비스로 색다른 다이닝 경험을 하실 수 있도록 최선을 다하겠습니다.' where rseq='31';
update restaurant set r_content='동파육과 멘보샤가 유명한 이연복쉐프 중식당' where rseq='32';
update restaurant set r_content='정통 광동식 딤섬과 홍콩식 면류를 한국에서 캐쥬얼하게 만나실 수 있는 레스토랑 입니다.' where rseq='33';
update restaurant set r_content='중국 산서지방 대표 음식인 도삭면을 명동에서 맛보실 수 있습니다. 중국 정통 도삭면과 중국식 샤부샤부(훠궈)를 한국인의 입맛에 맞게 개발하여 판매하고 있습니다. 친절하고 푸짐하며 고객님의 입맛에 맞는 좋은 음식을 만들고자 온 힘을 다하고 있습니다.내용 더보기' where rseq='34';
update restaurant set r_content='홍콩식 딤섬이 홍콩을 넘어 다양한 나라의 고객들이 즐기는 메뉴로 성장하는 데 크게 기여한 팀호완. 홍콩의 전통 딤섬 스타일을 지키면서 맛있고 합리적인 가격의 딤섬을 제공하고자 한 팀호완의 정책이 그러한 성장의 가장 큰 원동력이었다. 서울에 진출한 팀호완 역시 그 정책을 반영하듯 본연의 모습에 충실하다. 팀호완의 서울 본점인 삼성점은 110명의 고객을 모실 수 있는 넓은 규모와 넉넉한 주차 공간을 제공한다. 다양한 스타일의 홍콩식 딤섬을 즐기기에 더없이 좋은 레스토랑이다.' where rseq='35';
update restaurant set r_content='모든 만두류를 직접 만듭니다' where rseq='36';
update restaurant set r_content='효뜨 사장님이 운영하는 중국집' where rseq='37';
update restaurant set r_content='진지아(軫的家)는 형진이네 집이란 뜻입니다. 수레가 뒤로 밀리지 않도록 바퀴 밑에 괴어놓는 버팀목을 뜻하는 軫(진)은 항상 남에게 도움을 주는 사람이 되라는 뜻으로 부모님께서 지어주신 이름입니다. 진지아에 찾아오시는 분들에게 건강한 재료로 마음을 담아 정성스럽게 요리를 만들어 작은 즐거움을 선사해 드리고자 노력하겠습니다.' where rseq='38';
update restaurant set r_content='북경 유학생이 들려주는 쟈니덤플링 중국식 만둣집' where rseq='39';
update restaurant set r_content='탕수육이 맛있는곳' where rseq='40';
update restaurant set r_content='후후라운지는 2014년 서울 종로 경복궁 서촌에서 시작된 현대적인감성과 클래식한 디자인컨셉을 추구하는 shop & cafe입니다. 100년전통 독일 바커스원두의 커피와 직접 매장에서 만든 홈메이드 케이크와 달콤한 디저트 그리고 상큼하고 맛있는 음료가 준비되었습니다. 또한 후후라운지에서 디자인한 다양한 일상생활 소품들을 제작, 전시하고 있는 작고 아기자기한 서촌 맨끝에 위치한 샵 앤 카페입니다.' where rseq='41';
update restaurant set r_content='안녕하세요 사람과 사람, 사람과 디저트를 잇는 프리미엄디저트카페 카페노티드입니다.' where rseq='42';
update restaurant set r_content='매일 아침, 전기화덕에 구운 베이글 나오고 있습니다.' where rseq='43';
update restaurant set r_content='Cafe The Barn Berlin or Blended Coffee Bean Seasonal Bakery Exhibition with Artists' where rseq='44';
update restaurant set r_content='그릇에 그림 그리는 성수동 신상 카페' where rseq='45';
update restaurant set r_content='영감을 위한, 아키비스트' where rseq='46';
update restaurant set r_content='아이언맨2에서 스타크가 먹은 랜디스도넛 연남동점' where rseq='47';
update restaurant set r_content='강남역에서 흔히 볼 수 없는 정원이 있는 카페~! 엔틱한 분위기의 1층과 빈티지 풍의 2층을 갖고 있는 카페~~!! 강남역 힐링공간~~!!! 2층 공방에서 직접 수제 초콜릿을 만들어요. 신선하고 맛있는 초콜릿을 맛 볼 수 있는 카페 ! 정성 가득한 수제 초콜릿과 더치커피를 편안하게 즐길수 있는 곳 ! 더달달 입니다 !' where rseq='48';
update restaurant set r_content='홍대 딸기생크림 케이크 하면 생각나는 곳' where rseq='49';
update restaurant set r_content='도심 속 정원에서 휴식과 디저트를 즐기는 오더메이드 수플레 전문점 청수당<淸水堂> 청수당(淸水堂, Cheongsudang)은 도심 속 바쁘고 지친 현대인에게 각자의 마음속 작은 여유와 위로를 선물하고자 한다. 시간이 느리게 흐르는 청수당에서나마 그 ‘느림의 미학’(Aesthetics of Slowness)을 천천히 즐겨 볼 수 있기를 기대해 본다.' where rseq='50';
update restaurant set r_content='올드페리도넛은 한국의 도넛샵입니다. 커피와 도넛을 판매하는 카페를 넘어 새로운 경험을 공유하며 소통하는 브랜드로 거듭나고자 합니다. 도넛은 미국음식이라는 이미지에 한국적인 브랜딩을 입히고, 위트를 더하는 동시에 도넛이라는 매개체를 통해 변화와 유행에 민감한 한국의 젋은 문화를 대변하고자 합니다.' where rseq='51';

select*from restaurant;

insert into checked_rest (cseq, c_checkdate, c_checkdatetime, c_people, rseq, id) 
            values(cseq_seq.nextVal, '2022-07-21','오전 11:00','4','51','one');
insert into checked_rest (cseq, c_checkdate, c_checkdatetime, c_people, rseq, id) 
            values(cseq_seq.nextVal, '2022-08-01','오전 11:00','4','51','one');
            
insert into checked_rest (cseq, c_checkdate, c_checkdatetime, c_people, rseq, id, cyn) 
            values(cseq_seq.nextVal, '2022-07-21','오전 11:00','4','51','one','y');
insert into checked_rest (cseq, c_checkdate, c_checkdatetime, c_people, rseq, id, cyn) 
            values(cseq_seq.nextVal, '2022-08-01','오전 11:00','4','51','one','y');
            
insert into checked_rest (cseq, c_checkdate, c_checkdatetime, c_people, rseq, id) 
            values(cseq_seq.nextVal, '2022-09-10','오전 11:00','4','1','one');
insert into checked_rest (cseq, c_checkdate, c_checkdatetime, c_people, rseq, id, cyn) 
            values(cseq_seq.nextVal, '2022-09-22','오전 11:00','4','1','one','y');

select * from checked_rest;
select*from check_view;
select*from restaurant;
select*from images;

----------banner 테이블 생성 -----------
DROP TABLE banner CASCADE CONSTRAINTS;
create table banner(
    bseq       number(5)     primary key,
    name       varchar2(100),
    order_seq     number(1),   
    image varchar2(50),
    useyn      char(1)       default 'y',    
    indate     date          default sysdate  
);

/*배너 시퀀스*/
drop sequence banner_seq;
create sequence banner_seq start with 1;

select * from banner;

insert into banner (bseq, name, order_seq, image) values(banner_seq.nextVal, '배너1', '1', 'banner1.png');
insert into banner (bseq, name, order_seq, image) values(banner_seq.nextVal, '배너2', '2', 'banner2.png');
insert into banner (bseq, name, order_seq, image) values(banner_seq.nextVal, '배너3', '3', 'banner3.png');
