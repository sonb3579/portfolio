create or replace procedure getKindList(
    p_kind in restaurant.r_kind%type,
    p_startNum in number,
    p_endNum in number,
    p_cur out sys_refcursor
)
is
begin
    open p_cur for 
    select*from(
    select*from(
    select rownum as rn, k.* from ((select * from restaurant where r_kind=p_kind) k)
    ) where rn >= p_startNum
    ) where rn <= p_endNum;   
end;

create or replace procedure getKindCount(
   p_kind in restaurant.r_kind%type,
    p_cnt out number
)
is
    v_cnt number;
begin
    select count(*) into v_cnt from restaurant where r_kind=p_kind;
    p_cnt := v_cnt;
end;

create or replace procedure getDetail(
    p_rseq in number,
    p_cur out sys_refcursor
)
is
begin
    open p_cur for 
    select * from restaurant where rseq=p_rseq;  
end;


create or replace procedure getReviews(
    p_rseq in number,
    p_cur out sys_refcursor
)
is
begin
    open p_cur for 
    select * from review where rseq=p_rseq order by rwseq desc;  
end;


create or replace procedure getImages(
    p_rseq in number,
    p_cur out sys_refcursor
)
is
begin
    open p_cur for 
    select * from images where rseq=p_rseq;  
end;

create or replace procedure getKindListInDetail(
    p_kind in restaurant.r_kind%type,
    p_cur out sys_refcursor
)
is
begin
    open p_cur for 
    select * from restaurant where r_kind=p_kind;
end;

create or replace procedure getMenu(
    p_rseq in number,
    p_cur out sys_refcursor
)
is
begin
    open p_cur for 
    select * from menu where rseq=p_rseq;  
end;

--08.18 JH------------------------------------------------------------------------------
create or replace procedure getReviewOne(
    p_rwseq in number,
    p_cur out sys_refcursor
)
is
begin
    open p_cur for 
    select * from review where rwseq=p_rwseq;  
end;



create or replace procedure getBestList(
    p_kind in restaurant.r_kind%type,
    p_cur out sys_refcursor
)
is
begin
    open p_cur for 
    select * from restaurant where r_kind=p_kind order by rating desc;  
end;


---08.18  YJ

create or replace procedure deleteRest(
    p_rseq IN restaurant.rseq%TYPE
)
IS
BEGIN
    delete from images where rseq = p_rseq;
    delete from Menu where rseq = p_rseq;
    delete from checked_rest where rseq = p_rseq;
    delete from review where rseq = p_rseq;
    delete from wishlist where rseq = p_rseq;
    delete from restaurant where rseq = p_rseq;
    commit;
END;




create or replace procedure insertBanner(
    p_name IN banner.name%TYPE,
    p_useyn IN banner.useyn%TYPE,
    p_order_seq IN banner.order_seq%TYPE,
    p_image IN banner.image%TYPE
)
IS
BEGIN
    insert into banner (bseq, name, useyn, order_seq, image) values(banner_seq.nextVal, p_name, p_useyn, p_order_seq, p_image);
    commit;
END;




create or replace procedure getBannerList(
    p_cursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_cursor FOR select * from banner order by order_seq asc;
END;

-------------0819 JH------------------------------------------------------------

create or replace procedure getReviewsPage(
    p_rseq in review.rseq%type,
    p_startNum in number,
    p_endNum in number,
    p_cur out sys_refcursor
)
is
begin
    open p_cur for 
    select*from(
    select*from(
    select rownum as rn, k.* from ((select * from review where rseq=p_rseq) k)
    ) where rn >= p_startNum
    ) where rn <= p_endNum;   
end;

create or replace procedure getReviewCount(
    p_rseq in review.rseq%type,
    p_cnt out number
)
is
    v_cnt number;
begin
    select count(*) into v_cnt from review where rseq=p_rseq;
    p_cnt := v_cnt;
end;


-------0819 YJ----------------------------------------






create or replace procedure getBannerDetail(
    p_bseq IN banner.bseq%TYPE,
    p_cur OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_cur FOR select * from banner where bseq = p_bseq;
END;


create or replace procedure updateBanner(
    p_bseq IN banner.bseq%TYPE,
    p_name IN banner.name%TYPE,
    p_useyn IN banner.useyn%TYPE,
    p_order_seq IN banner.order_seq%TYPE,
    p_image IN banner.image%TYPE
)
IS
BEGIN
    update banner set name = p_name, useyn = p_useyn, order_seq= p_order_seq, image=p_image where bseq = p_bseq;
    commit;
END;



create or replace procedure deleteMember(
    p_id IN Members.id%TYPE
)
IS
BEGIN
    delete from qna where id = p_id;
    delete from checked_rest where id = p_id;
    delete from wishlist where id = p_id;
    delete from review where id = p_id;
    delete from Members where id = p_id;
    commit;
END;




create or replace procedure insertMember(
    p_id IN Members.id%TYPE,
    p_pwd IN Members.pwd%TYPE,
    p_name IN Members.name%TYPE,
    p_gender IN Members.gender%TYPE,
    p_email IN Members.email%TYPE,
    p_phone IN Members.phone%TYPE
)
IS
BEGIN
    insert into Members (id, pwd, name, gender, email, phone) values(p_id, p_pwd, p_name, p_gender, p_email, p_phone);
    commit;
END;

--08.22 ����
create or replace procedure deleteRest(
    p_rseq IN restaurant.rseq%TYPE
)
IS
BEGIN
    delete from images where rseq = p_rseq;
    delete from Menu where rseq = p_rseq;
    delete from checked_rest where rseq = p_rseq;
    delete from qna where rseq = p_rseq;
    delete from review where rseq = p_rseq;
    delete from wishlist where rseq = p_rseq;
    delete from restaurant where rseq = p_rseq;
    commit;
END;


create or replace procedure getNewRestList(
    p_cursor2 OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_cursor2 FOR select * from (select * from (select rownum as rn, r.* from ((select * from restaurant order by indate desc) r)) where rn>=1) where rn<=3;
END;



----------------0825
create or replace procedure myDeleteRest(
    p_rseq IN restaurant.rseq%TYPE
)
IS
BEGIN
    delete from images where rseq = p_rseq;
    delete from Menu where rseq = p_rseq;
    delete from checked_rest where rseq = p_rseq;
    delete from review where rseq = p_rseq;
    delete from wishlist where rseq = p_rseq;
    delete from restaurant where rseq = p_rseq;
    commit;
END;


create or replace procedure getNewRestList(
    p_cursor2 OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_cursor2 FOR select * from (select * from (select rownum as rn, r.* from ((select * from restaurant where ryn='y' order by indate desc) r)) where rn>=1) where rn<=3;
END;


create or replace procedure getKindCount(
   p_kind in restaurant.r_kind%type,
    p_cnt out number
)
is
    v_cnt number;
begin
    select count(*) into v_cnt from restaurant where r_kind=p_kind and ryn='y';
    p_cnt := v_cnt;
end;



create or replace procedure getKindList(
    p_kind in restaurant.r_kind%type,
    p_startNum in number,
    p_endNum in number,
    p_cur out sys_refcursor
)
is
begin
    open p_cur for 
    select*from(
    select*from(
    select rownum as rn, k.* from ((select * from restaurant where ryn='y' and r_kind=p_kind) k)
    ) where rn >= p_startNum
    ) where rn <= p_endNum;   
end;











































