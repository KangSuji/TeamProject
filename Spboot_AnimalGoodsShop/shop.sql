drop table worker purge;
select*from WORKER;
select*from member;

create table worker(
   id             varchar2(20) primary key,
   pwd         varchar2(20),
   name      varchar2(40),
   phone       varchar2(200)
);

alter table member drop primary key cascade;
-- 기본키를 삭제하며 참조되는 항목들도 같이 삭제하세요
drop table member purge;
-- table 삭제
create table member(
   id varchar2(20) primary key,
   pwd varchar2(20),
   name varchar2(40),
   email varchar2(40),
   gender char(1),
   zip_num varchar2(7), --우편번호
   address varchar2(100),
   birth varchar2(50),
   phone varchar2(40),
   point number(10) default 1000,
   useyn char(1) default 'y',   --현재id 사용여부(활동중/비활동중)
   indate date default sysdate   --가입일

);

select * from product_color

select*from member;

 select*from member where email='abc@naver.com'

alter table product drop primary key cascade;
drop table product purge;
create table product(
   pseq number(5) primary key,
   pname varchar2(100),
   kind char(1),
   subkind char(1),
   price1 number(7) default '0',
   price2 number(7) default '0',
   price3 number(7) default '0',
   content varchar2(1000) default 'default.PNG',
   image1 varchar2(50) default 'default.PNG',
   image2 varchar2(50) default 'default.PNG',
   useyn char(1) default 'y',
   bestyn char(1) default 'n',
   indate date default sysdate
);

drop sequence product_seq;
create sequence product_seq start with 1;



drop table product_qna purge;
select*from product_qna;
create table product_qna(
	pq_seq number(5) primary key,
	pseq number(5) references product(pseq),
	id varchar2(16) references member(id),
	kind varchar2(50),
	subject varchar2(300),
	content varchar2(3000),
	reply varchar2(3000),
	rep char(1) default '1', -- 1:답변 무 2: 답변 유
    indate date default sysdate   --작성일
);
 

create sequence product_qna_seq start with 1;

drop sequence product_qna_seq;
create sequence product_seq start with 1;

 

alter table cart drop primary key cascade;
select * from cart;
drop table cart purge;
select * from member;
alter table cupon drop primary key cascade;
-- 기본키를 삭제하며 참조되는 항목들도 같이 삭제하세요
drop table cupon purge;
create table cupon(
	cupon_num number(10) primary key,
	name varchar2(100),
	id varchar2(16) references member(id),
	point number(10),
	useyn char(1) default 'y',
	indate date default sysdate
);
drop sequence cupon_seq;
create sequence cupon_seq start with 1;
select* from cupon
insert into cupon(cupon_num,name,point) values(cupon_seq.nextval,'aaaaaa1',5000)

create table cart(
   cseq number(10) primary key, -- 장바구니 번호
   mid varchar2(16) references member(id), -- 주문자 아이디 (FK:member.id
   pseq number(5) references product(pseq),
   -- 주문상품 번호(FK : product.pseq)
	pcolor varchar2(50),
	psize varchar2(30),
   quantity number(5) default 1,
   result char(1) default '1', -- 1:미처리 2:처리
   indate date default sysdate
);

drop sequence cart_seq;
create sequence cart_seq start with 1;

drop view cart_view;

create or replace view cart_view
as
select o.cseq, o.mid, o.pseq, m.name as mname,p.image1 image, p.pname pname, o.quantity, o.pcolor, o.psize, o.indate, p.price2, o.result
from cart o, member m, product p
where o.mid = m.id and o.pseq = p.pseq 
and result='1';
--성공

select*from cart_view;

alter table orders drop primary key cascade;

drop table orders purge;

 

create table orders(
   oseq number(10) primary key, -- 주문번호
   id varchar2(16) references member(id), -- 주문자 아이디
   indate date default sysdate -- 주문일
);
--성공

 

drop sequence orders_seq;

create sequence orders_seq start with 1;

 select * from ORDERS

alter table order_detail drop primary key cascade;

drop table order_detail purge;

create table order_detail(
   odseq number(10) primary key, --주문상세번호
   oseq number(10) references orders(oseq), -- 주문번호
   pseq number(10) references product(pseq), -- 상품번호
   quantity number(5) default 1, -- 주문수량
   zip_num varchar2(7), --우편번호
   address varchar2(100),
   pcolor varchar2(10),
   psize varchar2(10),
   result char(1) default '1' -- 1:미처리 2:처리
);
--실패





select * from order_detail;

drop sequence order_detail_seq;
create sequence order_detail_seq start with 1;

drop view order_view;
 
create or replace view order_view
as
select d.odseq, o.oseq, o.id, o.indate, d.pseq, d.quantity, m.name as mname, m.zip_num, m.address,
m.phone, p.pname as pname, p.price2, d.result , d.pcolor , d.psize 
from orders o, order_detail d, member m, product p
where o.oseq=d.oseq and o.id = m.id and d.pseq = p.pseq;

 

select*from order_view;
alter table qna drop primary key cascade;

drop table qna purge;

create table qna(
   qseq number(5) primary key, --글번호
   qsubject varchar2(300), -- 문의제목
   qtype varchar2(30), -- 문의유형
   qcontent varchar2(1000), -- 문의내용
   qreply varchar2(1000), -- 답변내용
   mid references member(id),   -- 작성자 (FK: member.mid)
   qrep char(1) default '1', -- 1:답변 무 2: 답변 유
   qindate date default sysdate   --작성일
   
);
delete from qna;
drop sequence qna_seq;

create sequence qna_seq start with 1;

-- https://www.juso.go.kr

 

alter table address drop primary key cascade;

drop table address purge;

create table address(
   zip_num varchar2(7) not null,
   sido varchar2(30) not null,
   gugun varchar2(30) not null,
   dong varchar2(100) not null,
   zip_code varchar2(30),
   bunji varchar2(30)
);
select * from address;

 

insert into worker values('admin', 'admin', '관리자', '010-7777-7777');
insert into worker values('scott', '1234', '관리자', '010-6400-6068');

 delete from member;
select*from member;
insert into member(id, pwd, name, email, gender, birth,phone) values
('one', '1111', '김나리', 'abc@naver.com', 'F','2000-7-15', '010-7777-7777');
insert into member(id, pwd, name, email, gender, birth, phone) values
('two', '2222', '이백합', 'bcd@naver.com', 'F', '1997-8-24', '010-1237-4567');

 

select * from product_color where pseq=77;
select * from product_size where pseq=77;

 

insert into cart(cseq, mid, pseq, quantity) values(cart_seq.nextval, 'one', 1, 1);

 select *from cart;

insert into orders(oseq, id) values (orders_seq.nextval, 'two');
insert into orders(oseq, id) values (orders_seq.nextval, 'one');
insert into orders(oseq, id) values (orders_seq.nextval, 'one');
insert into orders(oseq, id) values (orders_seq.nextval, 'two');

 

select * from orders;
select * from order_detail;
select * from PRODUCT_COLOR;\
select * from product;

insert into order_detail(odseq, oseq, pseq, quantity) values (order_detail_seq.nextval, 1, 1, 1);
insert into order_detail(odseq, oseq, pseq, quantity) values (order_detail_seq.nextval, 1, 2, 5);
insert into order_detail(odseq, oseq, pseq, quantity) values (order_detail_seq.nextval, 2, 4, 3);
insert into order_detail(odseq, oseq, pseq, quantity) values (order_detail_seq.nextval, 2, 5, 2);
insert into order_detail(odseq, oseq, pseq, quantity) values (order_detail_seq.nextval, 3, 3, 1);
insert into order_detail(odseq, oseq, pseq, quantity) values (order_detail_seq.nextval, 3, 2, 1);
insert into order_detail(odseq, oseq, pseq, quantity) values (order_detail_seq.nextval, 4, 6, 2);
insert into order_detail(odseq, oseq, pseq, quantity) values (order_detail_seq.nextval, 4, 1, 2);
insert into order_detail(odseq, oseq, pseq, quantity, product_color, product_size) values (order_detail_seq.nextval, 4, 1, 2,'블랙', 'M');

 

insert into qna (qseq, qsubject, qcontent, mid) values(qna_seq.nextval, '테스트', '질문내용1', 'one');

insert into qna (qseq, qsubject, qcontent, mid) values(qna_seq.nextval, '테스트2', '질문내용2', 'one');


select * from qna

 



 


select * from product;
select * from product_review_view;
drop view product_review_view;

create or replace view product_review_view
as
select p.pseq as pseq ,p.pname as pname ,p.kind as kind , p.subkind as subkind,
p.price2 as price2, p.image1 as image1, c.color, 
s.size,pr.pr_seq as pr_seq, pr.subject as subject, 
pr.content as content,pr.image as pr_image, pr.indate as indate
from product p, product_color c, product_size s,product_review pr
where  c.pseq = p.pseq and s.pseq = p.pseq and pr.pseq=p.pseq 

select*from product_review_view

create or replace view best_pro_view
as
select pseq, pname, price2, image1
from (select rownum, pseq, pname, price2, image1 from product where bestyn='y' order by indate desc)
where rownum<=4;

 select * from PRODUCT_SIZE;
 delete from PRODUCT_SIZE where PRODUCT_SIZE like 'S, M, L';

create or replace view new_pro_view
as
select pseq, pname, price2, image1
from(select rownum, pseq, pname, price2, image1 from product where useyn='y' order by indate desc)
where rownum <=4;


select * from product_view;
drop table best_pro_view purge;
drop table new_pro_view purge;
select*from best_pro_view;
select*from new_pro_view;

 

select * from address;
-- product_color 생성

alter table product_color drop primary key cascade;
drop table product_color purge;

create table product_color(
pseq number(10) references product(pseq),
product_color varchar2(50) 
);
delete from product where pseq=380;
select * from product_color;
select * from product;
insert into product_color(pseq, product_color) 
values( 1, '핑크');
insert into product_color(pseq, product_color) 
values( 1, '블랙');
insert into product_color(pseq, product_color) 
values( 1, '실버');
insert into product_color(pseq, product_color) 
values( 2, '네이비');
insert into product_color(pseq, product_color) 
values( 2, '레드');
insert into product_color(pseq, product_color) 
values( 3, '네이비');
insert into product_color(pseq, product_color) 
values( 3, '레드');
insert into product_color(pseq, product_color) 
values( 3, '베이비핑크');
insert into product_color(pseq, product_color) 
values( 4, '보듬 네이비');
insert into product_color(pseq, product_color) 
values( 4, '보듬 레드');
insert into product_color(pseq, product_color) 
values( 5, 'Seafoam 시폼');
insert into product_color(pseq, product_color) 
values( 6, '슈퍼그립 폴딩 네이비');
insert into product_color(pseq, product_color) 
values( 6, '슈퍼그립 폴딩 레드');
insert into product_color(pseq, product_color) 
values( 7, '폴딩 네이비');
insert into product_color(pseq, product_color) 
values( 7, '폴딩 레드');
insert into product_color(pseq, product_color) 
values( 7, '베이비 핑크');
insert into product_color(pseq, product_color) 
values( 8, '폴딩 네이비');
insert into product_color(pseq, product_color) 
values( 8, '폴딩 레드');
insert into product_color(pseq, product_color) 
values( 8, '베이비 머스터드');
insert into product_color(pseq, product_color) 
values( 9, '벤처 칼라 트라우트');
insert into product_color(pseq, product_color) 
values( 9, '벤처 칼라 듀');
insert into product_color(pseq, product_color) 
values( 9, '벤처 칼라 코랄');

insert into product_color(pseq, product_color) 
values( 10, 'Seafoam 시폼');

insert into product_color(pseq, product_color) 
values( 10, 'Sunset 선셋');

insert into product_color(pseq, product_color) 
values( 11, '목줄 네이비');

insert into product_color(pseq, product_color) 
values( 11, '목줄 레드');

insert into product_color(pseq, product_color) 
values( 11, '목줄 올리브그린');

insert into product_color(pseq, product_color) 
values( 12, 'Red currant');

insert into product_color(pseq, product_color) 
values( 12, 'Orange Sunset');

insert into product_color(pseq, product_color) 
values( 12, 'Red Butte');

insert into product_color(pseq, product_color) 
values( 13, '안전줄 네이비');

insert into product_color(pseq, product_color) 
values( 13, '안전줄 레드');

insert into product_color(pseq, product_color) 
values( 14, '매너핸들 네이비');

insert into product_color(pseq, product_color) 
values( 14, '매너핸들 레드');

insert into product_color(pseq, product_color)  
values( 15, '퍼플');

insert into product_color(pseq, product_color)
values( 15, '옐로우');

insert into product_color(pseq, product_color)
values( 15, '레드');

insert into product_color(pseq, product_color)
values( 18, '그레이');

insert into product_color(pseq, product_color)
values( 18, '그린');

insert into product_color(pseq, product_color)
values( 18, '브라운');

insert into product_color(pseq, product_color)
values( 19, '옐로우');

insert into product_color(pseq, product_color)
values( 19, '민트');

insert into product_color(pseq, product_color)
values( 19, '퍼플');

insert into product_color(pseq, product_color)
values( 27, '피스타치오');

insert into product_color(pseq, product_color) 
values( 27, '믹스베리');

insert into product_color(pseq, product_color)
values( 27, '바닐라');

insert into product_color(pseq, product_color)
values( 25, '민트');

insert into product_color(pseq, product_color)
values( 25, '레몬');

insert into product_color(pseq, product_color)
values( 25, '핑크');

insert into product_color(pseq, product_color)
values( 28, '핑크 네온');

insert into product_color(pseq, product_color)
values( 28, '오렌지 네온');

insert into product_color(pseq, product_color)
values( 29, '다크 로즈');

insert into product_color(pseq, product_color)
values( 29, '네이비');

insert into product_color(pseq, product_color)
values( 30, '베이지');

insert into product_color(pseq, product_color)
values( 30, '블루');

insert into product_color(pseq, product_color)
values( 31, '오렌지');

insert into product_color(pseq, product_color)
values( 31, '옐로우');

insert into product_color(pseq, product_color) 
values( 32, '블랙');

insert into product_color(pseq, product_color)
values( 32, '카키');

insert into product_color(pseq, product_color)
values( 33, '옐로우');

insert into product_color(pseq, product_color)
values( 33, '오렌지');

insert into product_color(pseq, product_color)
values( 35, '핑크');

insert into product_color(pseq, product_color)
values( 35, '민트');

insert into product_color(pseq, product_color)
values( 35, '그린');
-- product_size 생성

alter table product_size drop primary key cascade;
drop table product_size purge;
select * from product_color;


create table product_size(
pseq references product(pseq),
product_size varchar2(20)
);

select * from product_size;

insert into product_size(pseq, product_size) 
values( 1, 'S');

insert into product_size(pseq, product_size) 
values( 1, 'M');

insert into product_size(pseq, product_size) 
values( 1, 'L');

insert into product_size(pseq, product_size) 
values( 2, 'S');

insert into product_size(pseq, product_size) 
values( 2, 'M');

insert into product_size(pseq, product_size) 
values( 2, 'L');

insert into product_size(pseq, product_size) 
values( 3, 'S');

insert into product_size(pseq, product_size) 
values( 3, 'M');

insert into product_size(pseq, product_size) 
values( 3, 'L');

insert into product_size(pseq, product_size) 
values( 4, 'S');

insert into product_size(pseq, product_size) 
values( 4, 'M');

insert into product_size(pseq, product_size) 
values( 4, 'L');

insert into product_size(pseq, product_size) 
values( 6, '3미터 20mm');

insert into product_size(pseq, product_size) 
values( 7, '3미터 15mm');

insert into product_size(pseq, product_size) 
values( 7, '3미터 20mm');

insert into product_size(pseq, product_size) 
values( 8, '3미터 10mm');

insert into product_size(pseq, product_size) 
values( 9, '35cm');

insert into product_size(pseq, product_size) 
values( 9, '45cm');

insert into product_size(pseq, product_size) 
values( 9, '55cm');

insert into product_size(pseq, product_size) 
values( 10, 'S');

insert into product_size(pseq, product_size) 
values( 10, 'M');

insert into product_size(pseq, product_size) 
values( 10, 'L');

insert into product_size(pseq, product_size) 
values( 11, 'S');

insert into product_size(pseq, product_size) 
values( 11, 'M');

insert into product_size(pseq, product_size) 
values( 11, 'L');

insert into product_size(pseq, product_size) 
values( 12, 'S');

insert into product_size(pseq, product_size) 
values( 12, 'M');

insert into product_size(pseq, product_size) 
values( 12, 'L');

insert into product_size(pseq, product_size) 
values( 13, 'S');

insert into product_size(pseq, product_size) 
values( 13, 'L');

insert into product_size(pseq, product_size) 
values( 14, '15mm');

insert into product_size(pseq, product_size) 
values( 14, '20mm');

insert into product_size(pseq, product_size) 
values( 16, '1호');

insert into product_size(pseq, product_size) 
values( 16, '2호');

insert into product_size(pseq, product_size) 
values( 16, '3호');

insert into product_size(pseq, product_size) 
values( 27, 'S');

insert into product_size(pseq, product_size) 
values( 27, 'M');

insert into product_size(pseq, product_size) 
values( 27, 'L');

insert into product_size(pseq, product_size) 
values( 25, 'S');

insert into product_size(pseq, product_size) 
values( 25, 'M');

insert into product_size(pseq, product_size) 
values( 25, 'L');

insert into product_size(pseq, product_size) 
values( 26, 'S');

insert into product_size(pseq, product_size) 
values( 26, 'M');

insert into product_size(pseq, product_size) 
values( 26, 'L');

insert into product_size(pseq, product_size) 
values( 28, 'S');

insert into product_size(pseq, product_size) 
values( 28, 'M');

insert into product_size(pseq, product_size) 
values( 28, 'L');

insert into product_size(pseq, product_size) 
values( 29, 'S');

insert into product_size(pseq, product_size) 
values( 29, 'M');

insert into product_size(pseq, product_size) 
values( 29, 'L');

insert into product_size(pseq, product_size) 
values( 30, 'S');

insert into product_size(pseq, product_size) 
values( 30, 'M');

insert into product_size(pseq, product_size) 
values( 30, 'L');

insert into product_size(pseq, product_size) 
values( 31, 'S');

insert into product_size(pseq, product_size) 
values( 31, 'M');

insert into product_size(pseq, product_size) 
values( 31, 'L');

insert into product_size(pseq, product_size) 
values( 32, 'S');

insert into product_size(pseq, product_size) 
values( 32, 'M');

insert into product_size(pseq, product_size) 
values( 32, 'L');

insert into product_size(pseq, product_size) 
values( 33, 'S');

insert into product_size(pseq, product_size) 
values( 33, 'M');

insert into product_size(pseq, product_size) 
values( 33, 'L');

insert into product_size(pseq, product_size) 
values( 34, 'S');

insert into product_size(pseq, product_size) 
values( 34, 'M');

insert into product_size(pseq, product_size) 
values( 34, 'L');

insert into product_size(pseq, product_size) 
values( 35, 'S');

insert into product_size(pseq, product_size) 
values( 35, 'M');

insert into product_size(pseq, product_size) 
values( 35, 'L');

insert into product_size(pseq, product_size) 
values( 39, 'S');

insert into product_size(pseq, product_size) 
values( 39, 'M');

insert into product_size(pseq, product_size) 
values( 39, 'L');

insert into product_size(pseq, product_size) 
values( 41, '1호');

insert into product_size(pseq, product_size) 
values( 41, '2호');

insert into product_size(pseq, product_size) 
values( 43, '4호');

insert into product_size(pseq, product_size) 
values( 43, '5호');

insert into product_size(pseq, product_size) 
values( 43, '6호');

insert into product_size(pseq, product_size) 
values( 44, '52');

insert into product_size(pseq, product_size) 
values( 44, '62');

insert into product_size(pseq, product_size) 
values( 44, '72');

insert into product_size(pseq, product_size) 
values( 50, 'S');

insert into product_size(pseq, product_size) 
values( 50, 'M');

insert into product_size(pseq, product_size) 
values( 50, 'L');

insert into product_size(pseq, product_size) 
values( 51, 'M');

insert into product_size(pseq, product_size) 
values( 51, 'L');

insert into product_size(pseq, product_size) 
values( 96, 'S');

insert into product_size(pseq, product_size) 
values( 96, 'M');

insert into product_size(pseq, product_size) 
values( 96, 'L');

insert into product_size(pseq, product_size) 
values( 97, 'S');

insert into product_size(pseq, product_size) 
values( 97, 'M');

insert into product_size(pseq, product_size) 
values( 97, 'L');

insert into product_size(pseq, product_size) 
values( 98, 'S');

insert into product_size(pseq, product_size) 
values( 98, 'M');

insert into product_size(pseq, product_size) 
values( 98, 'L');

insert into product_size(pseq, product_size) 
values( 99, 'S');

insert into product_size(pseq, product_size) 
values( 99, 'M');

insert into product_size(pseq, product_size) 
values( 99, 'L');

insert into product_size(pseq, product_size) 
values( 102, 'S');

insert into product_size(pseq, product_size) 
values( 102, 'M');

insert into product_size(pseq, product_size) 
values( 103, 'S');

insert into product_size(pseq, product_size) 
values( 103, 'M');

insert into product_size(pseq, product_size) 
values( 103, 'L');

insert into product_size(pseq, product_size) 
values( 120, 'S');

insert into product_size(pseq, product_size) 
values( 120, 'M');

insert into product_size(pseq, product_size) 
values( 120, 'L');

insert into product_size(pseq, product_size) 
values( 121, 'S');

insert into product_size(pseq, product_size) 
values( 121, 'M');

insert into product_size(pseq, product_size) 
values( 121, 'L');

insert into product_size(pseq, product_size) 
values( 122, 'S');

insert into product_size(pseq, product_size) 
values( 122, 'M');

insert into product_size(pseq, product_size) 
values( 122, 'L');

insert into product_size(pseq, product_size) 
values( 123, 'S');

insert into product_size(pseq, product_size) 
values( 123, 'M');

insert into product_size(pseq, product_size) 
values( 123, 'L');

insert into product_size(pseq, product_size) 
values( 124, 'S');

insert into product_size(pseq, product_size) 
values( 124, 'M');

insert into product_size(pseq, product_size) 
values( 124, 'L');

insert into product_size(pseq, product_size) 
values( 125, 'S');

insert into product_size(pseq, product_size) 
values( 125, 'M');

insert into product_size(pseq, product_size) 
values( 125, 'L');

insert into product_size(pseq, product_size) 
values( 126, 'S');

insert into product_size(pseq, product_size) 
values( 126, 'M');

insert into product_size(pseq, product_size) 
values( 126, 'L');

insert into product_size(pseq, product_size) 
values( 137, 'S');

insert into product_size(pseq, product_size) 
values( 137, 'M');

insert into product_size(pseq, product_size) 
values( 137, 'L');

insert into product_size(pseq, product_size) 
values( 138, 'S');

insert into product_size(pseq, product_size) 
values( 138, 'M');

insert into product_size(pseq, product_size) 
values( 138, 'L');

insert into product_size(pseq, product_size) 
values( 138, 'L');
/* product insert 추가 */
delete from product;
select * from product;
select*from product_size;
select * from product where kind=1;
/*야외용품 -> 가슴줄*/
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '하이테크 멀티 하네스', '1', '1', 99000, 109000, 10000,'1_1_harness1_content.jpg', '1_1_harness1_image1.jpg', '1_1_harness1_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '보듬 투피스 가슴줄', '1', '1', 31000, 41000, 10000,'1_1_harness2_content.jpg', '1_1_harness2_image1.jpg', '1_1_harness2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '보듬 가슴줄', '1', '1', 20400, 30400, 10000,'1_1_harness3_content.jpg', '1_1_harness3_image1.jpg', '1_1_harness3_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '보듬 후크형 가슴줄', '1', '1', 22800, 32800, 10000,'1_1_harness4_content.jpg', '1_1_harness4_image1.jpg', '1_1_harness4_image2.jpg', 'y');

/*리드줄*/
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '크래그 리쉬 Crag Leash 강아지 리드줄', '1', '2', 45000, 55000, 10000,'1_2_lead1_content.png', '1_2_lead1_image1.jpg', '1_2_lead1_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '보듬 슈퍼그립 폴딩 리드줄', '1', '2', 15000, 20000, 5000,'1_2_lead2_content.jpg', '1_2_lead2_image1.jpg', '1_2_lead2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '보듬 폴딩 리드줄', '1', '2', 15000, 20000, 5000,'1_2_lead3_content.jpg', '1_2_lead3_image1.jpg', '1_2_lead3_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '보듬 10mm 폴딩 리드줄', '1', '2', 15000, 20000, 5000,'1_2_lead4_content.jpg', '1_2_lead4_image1.jpg', '1_2_lead4_image2.jpg', 'y');

/*목줄*/
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '벤처 칼라', '1', '3', 26000, 36000, 10000,'1_3_Leash1_content.jpg', '1_3_Leash1_image1.png', '1_3_Leash1_image2.png', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '탑로프 칼라', '1', '3', 37000, 47000, 10000,'1_3_Leash2_content.png', '1_3_Leash2_image1.jpg', '1_3_Leash2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '보듬 목줄', '1', '3', 5000, 8000, 3000,'1_3_Leash3_content.jpg', '1_3_Leash3_image1.jpg', '1_3_Leash3_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, 'Hoopie Collar 강아지 목줄', '1', '3', 20000, 30000, 10000,'1_3_Leash4_content.jpg', '1_3_Leash4_image1.jpg', '1_3_Leash4_image2.jpg', 'y');

/*안전용품*/
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '보듬 안전줄', '1', '4', 3000, 7000, 4000,'1_4_safe1_content.jpg', '1_4_safe1_image1.jpg', '1_4_safe1_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '보듬 매너핸들', '1', '4', 3000, 7000, 4000,'1_4_safe2_content.jpg', '1_4_safe2_image1.jpg', '1_4_safe2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '오빌락 독듀얼 안전등 Safety Light', '1', '4', 23000, 53000, 30000,'1_4_safe3_content.jpg', '1_4_safe3_image1.jpg', '1_4_safe3_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '울트라 입마개', '1', '4', 13000, 23000, 10000,'1_4_safe4_content.jpg', '1_4_safe4_image1.png', '1_4_safe4_image2.png', 'y');

/* 산책용품 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '리필형 생분해 강아지 배변봉투', '1', '5', 4000, 8900, 4900,'1_5_walk1_content.jpg', '1_5_walk1_image1.jpg', '1_5_walk1_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '피단 강아지 급수기', '1', '5', 4000, 9500, 5500,'1_5_walk2_content.jpg', '1_5_walk2_image1.jpg', '1_5_walk2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '푸스푼', '1', '5', 6000, 13000, 7000,'1_5_walk3_content.jpg', '1_5_walk3_image1.jpg', '1_5_walk3_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '틱 트위스터 진드기 제거제', '1', '5', 3000, 6900, 3900,'1_5_walk4_content.jpg', '1_5_walk4_image1.jpg', '1_5_walk4_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '스팟온 바르는 해충방지 오일', '1', '5', 3000, 6900, 3900,'1_5_walk5_content.jpg', '1_5_walk5_image1.jpg', '1_5_walk5_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '트래블 보틀', '1', '5', 3000, 6900, 3900,'1_5_walk6_content.jpg', '1_5_walk6_image1.jpg', '1_5_walk6_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '펫아미고 산책용 에티켓 배변봉투 100매', '1', '5', 3000, 6900, 3900,'1_5_walk7_content.jpg', '1_5_walk7_image1.jpg', '1_5_walk7_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '펫아미고 산책용 에티켓 배변봉투 30매', '1', '5', 3000, 6900, 3900,'1_5_walk8_content.jpg', '1_5_walk8_image1.jpg', '1_5_walk8_image2.jpg', 'y');

/* 패션 -> SUMMER */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '쿨링베스트', '2', '1', 24000, 34000, 10000,'2_1_wear1_content.png', '2_1_wear1_image1.jpg', '2_1_wear1_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '쿨링베스트 쿨조끼', '2', '1', 59000, 79000, 20000,'2_1_wear2_content.jpg', '2_1_wear2_image1.jpg', '2_1_wear2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '아이스크림 쿨스카프', '2', '1', 6000, 16000, 10000,'2_1_wear3_content.jpg', '2_1_wear3_image1.jpg', '2_1_wear3_image2.jpg', 'y');

/* 아우터 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '멜팅 치즈 패딩', '2', '2', 73000, 93000, 20000,'2_2_outer1_content.jpg', '2_2_outer1_image1.jpg', '2_2_outer1_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '퀄팅 자켓', '2', '2', 73000, 93000, 20000,'2_2_outer2_content.jpg', '2_2_outer2_image1.jpg', '2_2_outer2_image2.jpg', 'n');

/* 티셔츠 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '클라우드 원홀 라츄티', '2', '3', 21000, 31000, 10000,'2_3_Tshirt1_content.jpg', '2_3_Tshirt1_image1.jpg', '2_3_Tshirt1_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '원홀 크롭', '2', '3', 18000, 28000, 10000,'2_3_Tshirt2_content.jpg', '2_3_Tshirt2_image1.jpg', '2_3_Tshirt2_image2.jpg', 'n');

/* 액세서리 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '프리마로프트 패딩 머플러', '2', '4', 30000, 40000, 10000,'2_4_accessory1_content.jpg', '2_4_accessory1_image1.jpg', '2_4_accessory1_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '치즈 넥워머', '2', '4', 18000, 28000, 10000,'2_4_accessory2_content.jpg', '2_4_accessory2_image1.jpg', '2_4_accessory2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '셔벗 넥워머', '2', '4', 20000, 28000, 8000,'2_4_accessory3_content.jpg', '2_4_accessory3_image1.jpg', '2_4_accessory3_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '오로라 리플렉터 반사 스카프', '2', '4', 10000, 20000, 10000,'2_4_accessory4_content.jpg', '2_4_accessory4_image1.jpg', '2_4_accessory4_image2.jpg', 'n');

/* 리빙 -> 이동장*/
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '그레이스 강아지 유모차 반려차', '3', '1', 500000, 590000, 90000,'3_1_cage1_content.jpg', '3_1_cage1_image1.jpg', '3_1_cage1_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '앨리스 강아지 유모차 반려차', '3', '1', 350000, 450000, 100000,'3_1_cage2_content.jpg', '3_1_cage2_image1.jpg', '3_1_cage2_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '루이스 트래블러 프레임', '3', '1', 39000, 79000, 40000,'3_1_cage3_content.jpg', '3_1_cage3_image1.jpg', '3_1_cage3_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '스쿠도카 켄넬 바퀴달린 차량용 강아지 이동장', '3', '1', 100000, 142000, 42000,'3_1_cage4_content.jpg', '3_1_cage4_image1.jpg', '3_1_cage4_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '루이스 강아지 이동 가방, 트래블러 프레임, 컵홀더', '3', '1', 110000, 159000, 49000,'3_1_cage5_content.jpg', '3_1_cage5_image1.jpg', '3_1_cage5_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '스쿠도 켄넬 소형견 이동장', '3', '1', 27500, 37500, 10000,'3_1_cage6_content.jpg', '3_1_cage6_image1.jpg', '3_1_cage6_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '스쿠도 켄넬 소중형견 이동장', '3', '1', 50000, 64000, 14000, '3_1_cage7_content.jpg', '3_1_cage7_image1.jpg', '3_1_cage7_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '스쿠도 켄넬 바퀴달린 중대형견 이동장', '3', '1', 110000, 150000, 40000, '3_1_cage8_content.jpg', '3_1_cage8_image1.jpg', '3_1_cage8_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '소프트 켄넬', '3', '1', 200000, 275000, 75000, '3_1_cage9_content.jpg', '3_1_cage9_image1.jpg', '3_1_cage9_image2.jpg', 'y');

/* 안전문 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '프리미어 강아지 안전문', '3', '2', 72000, 82000, 10000,'3_2_door1_content.jpg', '3_2_door1_image1.jpg', '3_2_door1_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '투웨이 오토 강아지 자동 안전문', '3', '2', 89000, 99000, 10000,'3_2_door2_content.jpg', '3_2_door2_image1.jpg', '3_2_door2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '슬림핏 강아지 안전문', '3', '2', 59000, 69000, 10000,'3_2_door3_content.jpg', '3_2_door3_image1.jpg', '3_2_door3_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '엑스트라 톨 중대형견 강아지 안전문', '3', '2', 109000, 119000, 10000,'3_2_door4_content.jpg', '3_2_door4_image1.jpg', '3_2_door4_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '가드미 자동 접이식 강아지 안전문', '3', '2', 110000, 125000, 15000,'3_2_door5_content.jpg', '3_2_door5_image1.jpg', '3_2_door5_image2.jpg', 'y');

/* 방석, 매트*/
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '보듬 프리미엄 쿨매트', '3', '3', 34000, 44000, 10000,'3_3_mat1_content.jpg', '3_3_mat1_image1.jpg', '3_3_mat1_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '아이스크림 쿨매트', '3', '3', 34000, 59000, 10000,'3_3_mat2_content.jpg', '3_3_mat2_image1.jpg', '3_3_mat2_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '도그자리 롤매트 강아지 매트', '3', '3', 16900, 26900, 10000,'3_3_mat3_content.jpg', '3_3_mat3_image1.jpg', '3_3_mat3_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '도그자리 플랫 강아지 매트', '3', '3', 41000, 52000, 10000,'3_3_mat4_content.jpg', '3_3_mat4_image1.jpg', '3_3_mat4_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '보듬 코방석', '3', '3', 41000, 52000, 10000,'3_3_mat5_content.jpg', '3_3_mat5_image1.jpg', '3_3_mat5_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '소프트베드 접이식침대', '3', '3', 41000, 52000, 10000,'3_3_mat6_content.jpg', '3_3_mat6_image1.jpg', '3_3_mat6_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '비스트덴 범퍼 베드', '3', '3', 41000, 52000, 10000,'3_3_mat7_content.jpg', '3_3_mat7_image1.jpg', '3_3_mat7_image2.jpg', 'n');

/* 식기, 보관*/
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '피단 저울 식기', '3', '4', 18000, 28000, 10000,'3_4_bin1_content.png', '3_4_bin1_image1.jpg', '3_4_bin1_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '블랜더보틀 익스팬션팩 사료통 간식통', '3', '4', 4000, 9900, 5900,'3_4_bin2_content.jpg', '3_4_bin2_image1.jpg', '3_4_bin2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '블랜더보틀 프로스택 간식통 물통', '3', '4', 10000, 14900, 4900,'3_4_bin3_content.jpg', '3_4_bin3_image1.jpg', '3_4_bin3_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '모데르나 펫위즈덤 트렌드스토리 사료통', '3', '4', 14500, 24500, 10000,'3_4_bin4_content.jpg', '3_4_bin4_image1.jpg', '3_4_bin4_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '트래블 보울 휴대용 반려동물 식기', '3', '4', 5900, 10900, 5000,'3_4_bin5_content.jpg', '3_4_bin5_image1.jpg', '3_4_bin5_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '감마 비틀볼트 주니어 사료통', '3', '4', 14000, 24000, 10000,'3_4_bin6_content.jpg', '3_4_bin6_image1.jpg', '3_4_bin6_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '감마 비틀볼트 아웃백15 사료통', '3', '4', 23000, 43000, 20000,'3_4_bin7_content.jpg', '3_4_bin7_image1.jpg', '3_4_bin7_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '감마 비틀볼트 아웃백25 사료통', '3', '4', 25700, 55700, 20000,'3_4_bin8_content.jpg', '3_4_bin8_image1.jpg', '3_4_bin8_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '감마 비틀볼트 아웃백30 사료통', '3', '4', 30500, 60500, 30000,'3_4_bin9_content.jpg', '3_4_bin9_image1.jpg', '3_4_bin9_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '감마 비틀볼트 홈스태커블65 사료통', '3', '4', 50900, 80900, 30000,'3_4_bin10_content.jpg', '3_4_bin10_image1.jpg', '3_4_bin10_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '바이오드볼', '3', '4', 18000, 28000, 10000,'3_4_bin11_content.jpg', '3_4_bin11_image1.jpg', '3_4_bin11_image2.jpg', 'n');


/* 목욕, 위생*/
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '브러싱 스틱 반려견 칫솔', '3', '5', 10000, 19600, 9600, '3_5_hygiene1_content.jpg', '3_5_hygiene1_image1.jpg', '3_5_hygiene1_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '반려동물 목욕비누', '3', '5', 10000, 20000, 10000, '3_5_hygiene2_content.jpg', '3_5_hygiene2_image1.jpg', '3_5_hygiene2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '샤워 가운', '3', '5', 10000, 54000, 44000, '3_5_hygiene3_content.jpg', '3_5_hygiene3_image1.jpg', '3_5_hygiene3_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '글러브 타올', '3', '5', 10000, 29000, 19000, '3_5_hygiene4_content.jpg', '3_5_hygiene4_image1.jpg', '3_5_hygiene4_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '미셸마르시에 펫 디탱글 브러쉬', '3', '5', 10000, 20000, 10000, '3_5_hygiene5_content.jpg', '3_5_hygiene5_image1.jpg', '3_5_hygiene5_image2.jpg', 'y');

/* 탈취, 소독 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '반려동물 가정 전용 살균 탈취제 4L 리필용', '3', '6', 32500, 42500, 10000, '3_6_antiseptic1_content.jpg', '3_6_antiseptic1_image1.jpg', '3_6_antiseptic1_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '반려동물 가정 전용 살균 탈취제 500ml', '3', '6', 32500, 42500, 10000, '3_6_antiseptic2_content.jpg', '3_6_antiseptic2_image1.jpg', '3_6_antiseptic2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '반려동물 가정 전용 살균 탈취제 250ml', '3', '6', 32500, 42500, 10000, '3_6_antiseptic3_content.jpg', '3_6_antiseptic3_image1.jpg', '3_6_antiseptic3_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '반려동물 가정 전용 살균 탈취제 50ml', '3', '6', 32500, 42500, 10000, '3_6_antiseptic4_content.jpg', '3_6_antiseptic4_image1.jpg', '3_6_antiseptic4_image2.jpg', 'y');

/* 디지털, 가전 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '슬림 스팀 청소기', '3', '7', 129000, 229000, 100000, '3_7_electronic1_content.jpg', '3_7_electronic1_image1.jpg', '3_7_electronic1_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '전해수기 듀오 패키지', '3', '7', 150000, 290000, 140000, '3_7_electronic2_content.jpg', '3_7_electronic2_image1.jpg', '3_7_electronic2_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '전해수기', '3', '7', 140000, 240000, 100000, '3_7_electronic3_content.jpg', '3_7_electronic3_image1.jpg', '3_7_electronic3_image2.jpg', 'n');

/* 장난감 -> 노즈워크*/
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '피단 캡슐 노즈워크', '4', '1', 8000, 13000, 5000, '4_1_nosework1_content.jpg', '4_1_nosework1_image1.jpg', '4_1_nosework1_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '피단 노즈워크 볼', '4', '1', 5000, 10000, 5000, '4_1_nosework2_content.jpg', '4_1_nosework2_image1.jpg', '4_1_nosework2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '도그 트위스터 플라스틱', '4', '1', 20000, 35000, 15000, '4_1_nosework3_content.jpg', '4_1_nosework3_image1.jpg', '4_1_nosework3_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '도그 토네이도 플라스틱', '4', '1', 20000, 32000, 12000, '4_1_nosework4_content.jpg', '4_1_nosework4_image1.jpg', '4_1_nosework4_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '도그 스마트 플라스틱', '4', '1', 10000, 20000, 10000, '4_1_nosework5_content.png', '4_1_nosework5_image1.jpg', '4_1_nosework5_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '도그 브릭 플라스틱', '4', '1', 20000, 32000, 12000, '4_1_nosework6_content.jpg', '4_1_nosework6_image1.jpg', '4_1_nosework6_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '밥어랏 L', '4', '1', 10000, 22000, 12000, '4_1_nosework7_content.jpg', '4_1_nosework7_image1.jpg', '4_1_nosework7_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '밥어랏 S', '4', '1', 6000, 16000, 10000, '4_1_nosework8_content.jpg', '4_1_nosework8_image1.jpg', '4_1_nosework8_image2.jpg', 'y');

/* 터그 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '보듬 애착 터그 강아지 훈련 장난감', '4', '2', 2000, 4500, 2500, '4_2_tug1_content.jpg', '4_2_tug1_image1.jpg', '4_2_tug1_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '강아지 우드 스틱', '4', '2', 4000, 6500, 2500, '4_2_tug2_content.jpg', '4_2_tug2_image1.jpg', '4_2_tug2_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '케이티스범퍼 스쿼기 터그', '4', '2', 8000, 14000, 6000, '4_2_tug3_content.jpg', '4_2_tug3_image1.jpg', '4_2_tug3_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '케이티스범퍼 더블 터그', '4', '2', 8000, 15000, 7000, '4_2_tug4_content.jpg', '4_2_tug4_image1.jpg', '4_2_tug4_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '케이티스범퍼 세모원반', '4', '2', 9000, 19000, 10000, '4_2_tug5_content.jpg', '4_2_tug5_image1.jpg', '4_2_tug5_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '케이티스범퍼 네모원반', '4', '2', 9000, 19000, 10000, '4_2_tug6_content.jpg', '4_2_tug6_image1.jpg', '4_2_tug6_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '가파이 터그', '4', '2', 10000, 20000, 10000, '4_2_tug7_content.jpg', '4_2_tug7_image1.jpg', '4_2_tug7_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '가파이 라운드 터그', '4', '2', 8000, 18000, 10000, '4_2_tug8_content.jpg', '4_2_tug8_image1.jpg', '4_2_tug8_image2.jpg', 'y');

/* 공 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '포버 바운스 원형 볼', '4', '3', 2900, 4900, 2000, '4_3_ball1_content.jpg', '4_3_ball1_image1.jpg', '4_3_ball1_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '포버 바운스 소라콘', '4', '3', 6900, 8900, 2000, '4_3_ball2_content.jpg', '4_3_ball2_image1.jpg', '4_3_ball2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '포버 노즈워크 볼', '4', '3', 10000, 13900, 3900, '4_3_ball3_content.jpg', '4_3_ball3_image1.jpg', '4_3_ball3_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '포버 바운스 분리형 볼', '4', '3', 4000, 7900, 3900, '4_3_ball4_content.jpg', '4_3_ball4_image1.jpg', '4_3_ball4_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '가파이 손잡이형 찰 고무공', '4', '3', 10000, 18000, 8000, '4_3_ball5_content.jpg', '4_3_ball5_image1.jpg', '4_3_ball5_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '가파이 일자형 찰 고무공', '4', '3', 8000, 15000, 7000, '4_3_ball6_content.jpg', '4_3_ball6_image1.jpg', '4_3_ball6_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '홀리 롤러', '4', '3', 1500, 4500, 3000, '4_3_ball7_content.jpg', '4_3_ball7_image1.jpg', '4_3_ball7_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '홀리 풋볼', '4', '3', 3000, 7000, 4000, '4_3_ball8_content.jpg', '4_3_ball8_image1.jpg', '4_3_ball8_image2.jpg', 'y');

/* 삑삑이 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '피단 복어 장난감', '4', '4', 4000, 8000, 4000, '4_4_soundball1_content.jpg', '4_4_soundball1_image1.jpg', '4_4_soundball1_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '칼리 바나나독 강아지 라텍스 장난감', '4', '4', 4000, 8000, 4000, '4_4_soundball2_content.jpg', '4_4_soundball2_image1.jpg', '4_4_soundball2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '칼리 캐롯피쉬 강아지 라텍스 장난감', '4', '4', 4000, 8000, 4000, '4_4_soundball3_content.jpg', '4_4_soundball3_image1.jpg', '4_4_soundball3_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '칼리 오리 베어 강아지 라텍스 장난감', '4', '4', 4000, 8000, 4000, '4_4_soundball4_content.jpg', '4_4_soundball4_image1.jpg', '4_4_soundball4_image2.jpg', 'y');

/* 소프트토이 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '스펑키펍 오리오리', '4', '5', 12000, 17000, 5000, '4_5_softtoy1_content.jpg', '4_5_softtoy1_image1.jpg', '4_5_softtoy1_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '스펑키펍 이글이글', '4', '5', 12000, 17000, 5000, '4_5_softtoy2_content.jpg', '4_5_softtoy2_image1.jpg', '4_5_softtoy2_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '심플리 파이도 미니 턱 시리즈 강아지 유기농 장난감', '4', '5', 11000, 16000, 5000, '4_5_softtoy3_content.jpg', '4_5_softtoy3_image1.jpg', '4_5_softtoy3_image2.jpg', 'n');

/* 훈련용품 -> 트릿백, 가방 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '훈련용 트릿 파우치 간식 주머니', '5', '1', 18000, 28000, 10000, '5_1_bag1_content.png', '5_1_bag1_image1.jpg', '5_1_bag1_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '레인져 트릿백 프로 훈련용 간식 주머니', '5', '1', 22000, 32000, 10000, '5_1_bag2_content.jpg', '5_1_bag2_image1.jpg', '5_1_bag2_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '레인져 풉백 배변봉투 디스펜서', '5', '1', 10000, 14000, 4000, '5_1_bag3_content.png', '5_1_bag3_image1.jpg', '5_1_bag3_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, 'Treat Trader 훈련용 간식 주머니', '5', '1', 27000, 47000, 20000, '5_1_bag4_content.png', '5_1_bag4_image1.jpg', '5_1_bag4_image2.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, 'Stash Bag 배변봉투 디스펜서 파우치', '5', '1', 30000, 28000, 10000, '5_1_bag5_content.png', '5_1_bag5_image1.jpg', '5_1_bag5_image2.jpg', 'y');

/* 클리커 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '비스트 클리커', '5', '2', 3800, 6800, 3000, '5_2_clicker1_content.jpg', '5_2_clicker1_image1.jpg', '5_2_clicker1_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '프로 트레이닝 디럭스 클리커', '5', '2', 2000, 4000, 2000, '5_2_clicker2_content.jpg', '5_2_clicker2_image1.jpg', '5_2_clicker2_image2.jpg', 'y');

/* 어질리티, 피트니스 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '튼튼짐볼 도그 피트니스', '5', '3', 26000, 46000, 20000, '5_3_fitness1_content.jpg', '5_3_fitness1_image1.jpg', '5_3_fitness1_image2.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '튼튼홀더 단품', '5', '3', 14900, 24900, 10000, '5_3_fitness2_content.jpg', '5_3_fitness2_image1.jpg', '5_3_fitness2_image2.jpg', 'n');

/* 트레이너 의류 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '트레이너 조끼', '5', '4', 110000, 152000, 42000, '5_4_trainerclothing1_content.jpg', '5_4_trainerclothing1_image1.jpg', '5_4_trainerclothing1_image2.jpg', 'n');

/* 푸드 -> 습식 필요시 추가 (image2 값이 없음 처리시 주의!)*/
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '라지포션 닭 중대형견용', '6', '1', 140000, 170000, 30000, '6_1_wetfood1_content.jpg', '6_1_wetfood1_image1.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '치킨 스탠다드 닭', '6', '1', 13000, 23000, 10000, '6_1_wetfood2_content.jpg', '6_1_wetfood2_image1.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '하이퍼 알러제닉 덕 프리미엄', '6', '1', 20000, 33000, 13000, '6_1_wetfood3_content.jpg', '6_1_wetfood3_image1.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '치킨 프리미엄 닭', '6', '1', 18000, 28000, 10000, '6_1_wetfood4_content.jpg', '6_1_wetfood4_image1.jpg', 'n');
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '비프 프리미엄 소고기', '6', '1', 25000, 35000, 10000, '6_1_wetfood5_content.jpg', '6_1_wetfood5_image1.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '램 프리미엄 양고기', '6', '1', 25000, 35000, 10000, '6_1_wetfood6_content.jpg', '6_1_wetfood6_image1.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '프리미엄 패키지 A형 닭, 오리, 양', '6', '1', 49600, 79600, 30000, '6_1_wetfood7_content.jpg', '6_1_wetfood7_image1.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '프리미엄 패키지 B형, 닭, 오리', '6', '1', 51500, 91500, 40000, '6_1_wetfood8_content.jpg', '6_1_wetfood8_image1.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '프리미엄 패키지 C형 닭, 오리, 소', '6', '1', 49600, 79600, 30000, '6_1_wetfood9_content.jpg', '6_1_wetfood9_image1.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '프리미엄 패키지 D형 소, 양', '6', '1', 75000, 105000, 30000, '6_1_wetfood10_content.jpg', '6_1_wetfood10_image1.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '프리미엄 패키지 E형 오리, 양', '6', '1', 72000, 102000, 30000, '6_1_wetfood11_content.jpg', '6_1_wetfood11_image1.jpg', 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '샘플 A형 닭, 오리, 양', '6', '1', 13000, 23000, 10000, '6_1_wetfood12_content.jpg', '6_1_wetfood12_image1.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '샘플 B형 닭, 오리, 소고기', '6', '1', 13000, 23000, 10000, '6_1_wetfood13_content.jpg', '6_1_wetfood13_image1.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '샘플 C형 소고기, 양고기', '6', '1', 14000, 24000, 10000, '6_1_wetfood14_content.jpg', '6_1_wetfood14_image1.jpg', 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, bestyn) 
values( product_seq.nextval, '샘플 D형 닭, 오리', '6', '1', 13000, 23000, 10000, '6_1_wetfood15_content.jpg', '6_1_wetfood15_image1.jpg', 'y');


/* 건식 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '그랑퀴리 사료 저온건조 생식', '6', '2', 49000, 69000, 20000, '6_2_drtfood1_content.jpg', '6_2_dryfood1_image1.jpg', '6_2_dryfood1_image2.jpg' , 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '피쉬 사료', '6', '2', 22000, 37000, 15000, '6_2_drtfood2_content.jpg', '6_2_dryfood2_image1.png', '6_2_dryfood2_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '미트앤피쉬 사료', '6', '2', 19000, 34000, 15000, '6_2_drtfood3_content.jpg', '6_2_dryfood3_image1.png', '6_2_dryfood3_image2.jpg' , 'n');

/* 간식  필요시 추가 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 연어, 명태 믹스 트릿', '6', '3', 15000, 25000, 10000, '6_3_snack1_content.jpg', '6_3_snack1_image1.jpg', '6_3_snack1_image2.jpg' , 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 열빙어 트릿', '6', '3', 11000, 21000, 10000, '6_3_snack2_content.jpg', '6_3_snack2_image1.jpg', '6_3_snack2_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 명란 트릿', '6', '3', 4000, 8000, 4000, '6_3_snack3_content.jpg', '6_3_snack3_image1.jpg', '6_3_snack3_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 그린 홍합 트릿', '6', '3', 15000, 15000, 10000, '6_3_snack4_content.jpg', '6_3_snack4_image1.jpg', '6_3_snack4_image2.jpg' , 'n');
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 랍스터 트릿', '6', '3', 1400, 4400, 3000, '6_3_snack5_content.jpg', '6_3_snack5_image1.jpg', '6_3_snack5_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 명태 트릿', '6', '3', 1800, 3800, 3000, '6_3_snack6_content.jpg', '6_3_snack6_image1.jpg', '6_3_snack6_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 연어 트릿', '6', '3', 1400, 4400, 3000, '6_3_snack7_content.jpg', '6_3_snack7_image1.jpg', '6_3_snack7_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 참치 트릿', '6', '3', 900, 3900, 3000, '6_3_snack8_content.jpg', '6_3_snack8_image1.jpg', '6_3_snack8_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 치킨 트릿', '6', '3', 600, 3600, 3000, '6_3_snack9_content.jpg', '6_3_snack9_image1.jpg', '6_3_snack9_image2.jpg' , 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 오리 트릿', '6', '3', 1400, 4400, 3000, '6_3_snack10_content.jpg', '6_3_snack10_image1.jpg', '6_3_snack10_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 소간 트릿', '6', '3', 500, 3300, 2800, '6_3_snack11_content.jpg', '6_3_snack11_image1.jpg', '6_3_snack11_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 비프 트릿', '6', '3', 1400, 4400, 3000, '6_3_snack12_content.jpg', '6_3_snack12_image1.jpg', '6_3_snack12_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 피그 트릿', '6', '3', 4900, 8900, 4000, '6_3_snack13_content.jpg', '6_3_snack13_image1.jpg', '6_3_snack13_image2.jpg' , 'n');

/* 파우더 필요시 추가 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '베지믹스', '6', '4', 2000, 5000, 3000, '6_4_powder1_content.jpg', '6_4_powder1_image1.jpg', '6_4_powder1_image2.jpg' , 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '베지믹스 테라피', '6', '4', 20000, 50000, 30000, '6_4_powder2_content.jpg', '6_4_powder2_image1.jpg', '6_4_powder2_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 오리 파우더', '6', '4', 10000, 16000, 6000, '6_4_powder3_content.jpg', '6_4_powder3_image1.jpg', '6_4_powder3_image2.jpg' , 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 참치 파우더', '6', '4', 10000, 18000, 8000, '6_4_powder4_content.jpg', '6_4_powder4_image1.jpg', '6_4_powder4_image2.jpg' , 'y');
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 비프 파우더', '6', '4', 10000, 18000, 8000, '6_4_powder5_content.jpg', '6_4_powder5_image1.jpg', '6_4_powder5_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 랍스터 파우더', '6', '4', 15000, 25000, 10000, '6_4_powder6_content.jpg', '6_4_powder6_image1.jpg', '6_4_powder6_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 명태 파우더', '6', '4', 5000, 12000, 7000, '6_4_powder7_content.jpg', '6_4_powder7_image1.jpg', '6_4_powder7_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 소간 파우더', '6', '4', 5000, 12000, 7000, '6_4_powder8_content.jpg', '6_4_powder8_image1.jpg', '6_4_powder8_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 연어 파우더', '6', '4', 5000, 12000, 7000, '6_4_powder9_content.jpg', '6_4_powder9_image1.jpg', '6_4_powder9_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '동결건조 치킨 파우더', '6', '4', 5000, 12000, 7000, '6_4_powder10_content.jpg', '6_4_powder10_image1.jpg', '6_4_powder10_image2.jpg' , 'n');
/* 영양제 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '프로덴 덴탈케어본 오리지널', '6', '5', 25000, 35000, 10000, '6_5_nutritionalsupplement1_content.jpg', '6_5_nutritionalsupplement1_image1.jpg', '6_5_nutritionalsupplement1_image2.jpg' , 'n');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '프로덴 덴탈케어본 미니 소형견용', '6', '5', 25000, 35000, 10000, '6_5_nutritionalsupplement2_content.jpg', '6_5_nutritionalsupplement2_image1.jpg', '6_5_nutritionalsupplement2_image2.jpg' , 'y');

/* 문구,도서 -> 도서 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '나 개 있음에 감사하오', '7', '1', 7420, 12420, 5000, '7_1_book1_content.jpg', '7_1_book1_image1.png', '7_1_book1_image2.jpg' , 'y');

insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '하키하나 올리버 라익스', '7', '1', 19000, 29000, 10000, '7_1_book2_content.jpg', '7_1_book2_image1.jpg', '7_1_book2_image2.jpg' , 'n');

/* 문구 */
insert into product(pseq, pname, kind, subkind, price1, price2, price3, content, image1, image2, bestyn) 
values( product_seq.nextval, '셀프 탁상형 달력', '7', '2', 4000, 8500, 4500, '7_2_stationery1_content.jpg', '7_2_stationery1_image1.jpg', '7_2_stationery1_image2.jpg' , 'n');

select * from product
/* 현재까지 수정 한 부분*/
alter table product_review drop primary key cascade;
drop table product_review purge;
create table product_review(
   pr_seq number(5) primary key,      -- 리뷰 번호
   pseq number(5) ,      -- 상품 번호
   mid varchar2(20),         -- id
   subject varchar2(300),                  -- 리뷰 제목
   content varchar2(4000),               -- 리뷰 내용
   image varchar2(50),      -- 리뷰 이미지
   indate date default sysdate            -- 시간
);

select*from product_review;

drop sequence product_review_seq;
create sequence product_review_seq start with 1;

/* product_review insert 추가 */
/* 주의 member에 mid 또는 회원가입 페이지를 통하여 three, four, five를 추가하여야 정상 insert가 됨 */

/*야외용품 -> 가슴줄*/
insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 1, 'three', '하이테크 멀티 하네스 몸에 잘 맞아 편안해 보입니다.'
, '똘이가 활동량이 많아 기존 H형 하네스사이로 발이 들어가 돌아가는 경우가 있어서 하이테크 멀티 하네스를 구매해 봤습니다.
전에부터 사고 싶었지만 너무 비싸 망설이고 있었는데 이번에 보듬숍에서 사전주문제작 으로 싸게 판매하셔서 얼른 구매했습니다.
 착용했을때 편안해 보이고, 고급스러워 보여서 기분이 좋습니다.  무엇보다 똘이 몸에 착 붙어 안정감이 있어서 매우 만족합니다.
감사합니다. ');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 2, 'four', '안정감 있어 좋아요~~', '4킬로 저희집 시고르자브종에게는 에스사이즈가 딱이에요ㅎㅎ 
이전에 쓰던 하네스가 엄마가 산책할 때 자꾸 빠진다고 무서워하셔서 새로 하나 구매해야겠다 
하던 차에 줄까지 자동줄에서 보듬줄로 바꾸게 되었어요. 
저희 집 강아지는 소심하고 겁이 많아 자주 사람에게 달려들려고 하거나 자전거를 보면 튀어나가려고 해 산책시 초집중이 필요한데, 
어차피 자동줄도 짧게 밖에 못쓰게 때문에 바꾸니 훨씬 안정감 있고 좋아요. 
산책하자 하면 자꾸 탁자 밑에 숨는 녀석 하네스 때문일까 보듬줄로 바꾸면 안 그럴까 기대했는데 그런 드라마틱한 변화는 없었지만, 
제가 리드하기에 훨씬 편안하고 줄을 채울 때 조금이라도 더 편해하는 것 같아서 그것만으로도 만족합니다!'
, '1_1_harness2_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 2, 'five', '좋다', '집근처 애견샵에서 얇은 목줄을 받아왔었는데 포메라니안은 목이 약하다고 하고 줄을 당길때 마음도 많이 
불편해서 가슴줄을 받아왔는데, 강아지가 1.5kg 정도이다 보니 가장 작은걸 구했는데도 
다리가 다 빠져나와서 여기서 샀다. 딱이다. 너무 좋다. 안정적이다.');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 2, 'three', '안정감 있어 좋아요~~'
, '착용했을 때 몸을 안정감있게 잡아주는 모습이 딱 보여서 좋아요! 
투피스라서 채워야할 버클이 4개나 되지만 머리, 귀가 끼일 염려가 없어서 좋구요, 
아직은 3개월 어린 강아지이다 보니 가슴줄 착용하는 과정을 불편해하지만 다리를 잡고 
구멍에 넣어야하는 타 제품들을 이용할 때 보다 덜 강제적인 느낌이라서 더 만족스럽습니다:)'
, '1_1_harness2_image_2_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 2, 'five', '너무맘에들어요'
, '비숑아가 3개월인데 2.5kg 기준 가장 짧게줄여도 약간 커요 
금방클테니까 s샀구요 xs레드에서 s네이비로 변경부탁드렸고 바로 변경해주셔서 
번거로움없이 잘받았습니다 비숑이 머리가 좀 큰편이라 다른가슴줄은 목둘레도크고 
가슴둘레도큰데 머리넣을때 타이트해서 바꿔줬어요 가슴줄할때 귀를 스치지않아서 불편함없이 
잘쓰고있어요 튼튼하구 보듬로고도 심플해서 맘에들어요 더크면 이제품으로 큰사이즈로 사줄거에요ㅎㅎ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 3, 'five', '가슴줄 좋습니다'
, '우리 아이가 6키로 그램인데 좀더클것으로 생각하여 라지사이즈 주문 했더니 너므 크네요~~ㅋㅋㅋ 
튼튼하고 좋습니다... 잘사용 하겠습니다');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 3, 'three', '생각보다는 별로에요'
, '보듬 리드줄 5년이상 쓰다가 기존에 쓰던 제품이 너무 낡아서 이번에 새로 구매했습니다. 
기존 제품이랑 비교를 안 할 수 가 없더군요. 컬러는 예쁘게 잘 나왔습니다^^. 
사실 구매하고 싶은 제품컬러는 따로 있었는데 가슴줄이 있으면 리드줄이 품절이고 
리드줄이 있으면 가슴줄이 품절이더라구요~. 그래도 구매한 색상 제품이 모니터로 
본 색상이랑 일치해서 괜찮았어요. 후기는 줄이 무거워요~ 저희 아이들이 소형견이기는 한데 
좀 큰 친구들인데도 불구하고 산책하는데 좀 불편해하는 기색이 있더군요. 버클도 상당히 두껍답니다. 
이부분은 어떻게 보면 튼튼하니까 좋기는 하네요. 제일 불편한 부분은 손잡이 부분입니다. 
사진으로 보시다시피 고리부분이 있어서 무겁기도 하고 똥추를 저기에 달아서는 잘 안 쓸 거 같네요. 
기존에 쓰던 제품이랑 너무 달라져서 구매하기를 상당히 망설이다가 이왕이면 튼튼하고 기존에 쓰던 
브랜드꺼를 쓰는 게 좋겠다고 생각해서 구매했는데 조금 실망했어요ㅠㅠ 마지막 사진은 기존에 쓰던 
제품 버클크기에요. 이번에 나온 제품이 상당히 두껍죠? 나중에 구매할 때는 더 괜찮고 좋은 상품이였으면 합니다.'
, '1_1_harness3_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 3, 'four', '사이즈 찰떡이네요 너무 좋아요'
, '작은 강아지라 사이즈가 좀 걱정됬는데 XS 사이즈 잘 맞아요!! 
워낙 산책 좋아하는 친구라 목줄 거부반응 없이 첫 보듬하네스 적응 잘 했어요:) 
이전 하네스보다 리드할때 강아지가 불편함 없이 따라오는것 같아서 산책이 너무 즐거웠어요!!! 
예쁘게 잘 착용하고 1일1산책 할께요????????'
, '1_1_harness3_image_2_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 3, 'three', '가슴줄 후기'
, '올리브그린색 제가 생각했던 색이여서 너무 예쁘구요! 처음엔 어색해해서 간식을 이용했더니 
머리를 쏙 집어넣는게 귀여워요ㅋㅋ 구매했을 때 보다 자랐는데도 조절하니까 괜찮더라구요 믿고사는 보듬입니다ㅎㅎ'
, '1_1_harness3_image_3_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 3, 'five', '진작 갈아줄걸 그랬어요.'
, '2013년생 시츄 보호자입니다. 2개월령부터 같이 지내면서 소통과 이 친구에 대해 알고 싶어서 
검색이랑 책도 많이 찾아보며 지내던 중에 2015년에 세나개 방영이 시작된게 콩이와 저에게는 
너무 큰 선물이었던것 같습니다. 이 친구와, 또 한친구인 반려묘와 셋이서 정말 잘 지내는데 
유독 산책 시에만 뭔가 이 친구랑 합이 안 맞는것 같아 오래 고민하던 중에 보듬 유튜브 채널을 보며 
자동줄은 항상 아이에게 당기는 느낌을 준다는 설명을 듣고 충격을 받고 바로 주문했습니다. 
자동줄이 안좋다고 얘기하시는건 계속 봐 왔지만 그저 제가 컨트롤 잘 하면 되는 문제라고 생각했거든요. 
가슴줄도 천으로 된 소재라 그 부분은 콩이에게 편했지만 리드줄을 거는 위치가 더 앞쪽에 있어서 
제가 앞서 갈때 늘 거슬려 하던걸 정말 오랜 시간 버티다가 드디어 바꿨어요. 
주문해 놓고 며칠간 자동줄 길이를 늘려서 고정해 놓고 고때고때 줄 길이 조절하는 법과 핸들링 
연습 좀 한 후 오늘 두번째 산책때 개시했습니다. 줄로된 가슴줄이 재질상 단단한 느낌이라 쓸리거나 
불편해 할까봐 걱정했는데 전혀 불편해 하는 기색이 없었고, 리드줄 거는 위치가 더 뒷쪽에 있다보니 
제가 앞서가도 불편해 핮 않더라구요. 리드줄도 차나 오토바이가 많이 지나다니는 주택가 산책에 
너무 최적화 되어 있고, 고때고때 고리에 걸어서 길이 줄였다가 고리에서 풀기도 쉽고, 긴 상태에서 
줄 길이 유통성있게 컨트롤하기도 쉬웠어요. 특히 어깨에 매는 방법은 응가 치울때와 차와 사람이 많은 
퇴근시간대 산책에 너무 좋더라구요. 리드줄이 너비가 있어서 핸들링하기도 편하고 당기는 신호를 줘야 
할때도 위에서가 아닌, 손을 아래로 내린 상태로 수평으로 부드럽게 당기니까 콩이가 안 불편해 하고 알아듣더라구요. 잘 쓸게요~'
, '1_1_harness3_image_4_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 3, 'three', '믿고사는보듬'
, '우리 하뭉이가 흰백구라 노랑색이 잘 보일까 걱정했는데 그래도 잘보이고 잘어울리네요~^^ 
튼튼해서 오래오래 사용했으면 좋겠어요 주황색가슴줄도 잘 쓰는중입니다 ㅎ'
, '1_1_harness3_image_5_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 3, 'five', '편안한 상품'
, '기관지가 좁아 다른 가슴줄 사용할땐 헥헥 거리는며 목이 불편해하여 주문했어요 
이 상품은 줄과 연결되는 부분이 등쪽에 있어서 요건 괜찮을꺼같네요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 3, 'four', 'H형가슴줄'
, '보듬가슴줄편하고좋아요^^');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 3, 'three', '너무편안하네요'
, '저희가을이가 산책을 편하게 할수있어서 너무 좋네요 
상품을 너무 만족해서 짧은 후기라도 쓰고싶어 작성합니다. 모델같은 뒷모습올립니다????'
, '1_1_harness3_image_6_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 3, 'four', 'H형 보듬 가슴즐이 멋지고 자긍심이 생겨요!~'
, '대형견 4마리를 극진하다사피 정성을 쏟아서 보호하고 있습니다. 타사에서 두 차례 구매한 상품은 
아이가 뜯고 거부를 해서 구매 후 사용을 못하는데 보듬싸이트에서 강형욱대표님의 조언에 따라 
H 자 형 보듬 가슴줄을 구매해서 착용을 시켰더니 몰랍게도 아이가 뜯지도 않고 전혀 거부하지도 않은체 
산책길에서 매우 자유롭게 지내는 모습을 보고 매우 놀라웠습니다. 
역시 전문가의 조언이 매우 중요하는 사실과 타사 제품 보다 질적으로나 외적으로도 멋져 보이고 특히 보듬이라는 
단어가 로고로 상품에 붙어 있어서 외출시나 동물병원에 진료시때도 우리아이가 더더욱 멋져 보입니다.');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 4, 'four', '후크형 하네스s'
, '머리 통과않구 끼울수있으니 아이가 편안해 합니다. 지인 선물 재구매 합니다.');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 4, 'three', '오배송'
, '아이가 시바이누라 후크형을 주문했는데 일반형이 배송되었네요. 
멀리 미국에서 EMS배송대행으로 받아본거라 교환도 불가능하고... 
아이가 순해서 머리넣을때 알아서 들어가긴 하지만 넣을때마다 귀를보면 은근한 스트레스가 
있는것 같아서 늘 걱정이였는데... 마침 후크형 나온거보고 너무 잘됐다 싶어 주문해본건데 아쉽네요. 
꼭 써보고 싶었는데...어짜피 머리를 넣어야 한다면 그냥 지금까지 쓰던 K9을 계속 써야할것 같네요. 
EMS배송비까지 들여가며 주문한건데 ㅜㅜ 속상해요...');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 4, 'five', '역시 보듬'
, '착용하는것도 너무 편하고 이뻐요'
, '1_1_harness4_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 4, 'four', '비숑프리제견종에 딱 좋아요~'
, '좋아요!');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 4, 'five', '산책준비 1분컷'
, '긴 말 하지않을게요... 동영상이 말 다 했네 산책준비가 행복한 요즘'
, '1_1_harness4_image_2_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 4, 'three', '편하게 착용해요..'
, '반려견도 보호자도 편하게 사용할수 있어요..강추합니다..가격이 쪼끔..ㅋ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 4, 'three', '신통방통'
, '아이가 스트릿 출신이라 그런지.. 산책한번하려면 옷입히고 하네스 채우기만 
30분정도 실갱이를 해야했는데요 이제품으로 바꾸고 동영상 나온데로 했더니 
세상에ㅜㅜ 세상 간편해졌네요 반려견도 저도 스트레스 안받고 넘넘 강추입니다!!');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 4, 'five', 'H목줄'
, '포메라니안을 키우는되요 목줄을싫어해서 강형욱씨가 개발하셧다는 H목줄을 구매햇어요 
아이가 불편해하지 않고 잘착용해줘서 넘좋았어요 근데 앞질러가는 저희포메에게는 H목줄도 아닌가봐요ㅠ 
보행목줄이잇다고 들엇는데 앞에고리가 잇다고 들엇어요 그런걸해야하나요'
, '1_1_harness4_image_3_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 4, 'three', '아이가 편하게 착용하네요'
, '구조적으로 편해하네요..');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 4, 'five', '가슴줄이 생명줄이라고 해서 구매했습니다.'
, '가슴줄이 생명줄이라고 해서 구매했어요 좀더 편안하게 산책시켜주고 싶어서요'
, '1_1_harness4_image_4_review.jpg');

/* 리드줄 */
insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 6, 'three', '리드줄...'
, '세상튼튼하고 안전한 줄입니다..처음부터 살껄...후회중이네요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 6, 'five', '보듬줄 튼튼하고 좋어요'
, '대형견에 맞는 리드줄을 찾고 있었는데 마침 보듬에서 튼튼한 리드줄을 판매해서 바로 구매했어요 
미끄러지지도 않고 안정감 있어요 잘 쓰겠습니다');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 6, 'four', '넘 좋아요~'
, '가슴줄을 구매하고나서 리드줄이불편했는데 보듬에서 구매후 산책해보니까 전보다 훨씬 편하네요~ 
10k 웰시인데 당기는게 장난아니거든요 요즘날씨에는 사우나하는것보다 더하죠 
근데 이젠 당겨도 제가 리드가 가능하니까 참좋아요 구매하길잘했네요~');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 6, 'five', '리드줄'
, '정말튼튼해보이네요 미끄럽지도 않구요 아직어린반려견인데 힘이 워낙쌔져서 잘구매한듯!!!'
, '1_2_lead2_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 6, 'four', '대형견용인 듯..'
, '사용 안하고있어요. 잘 안알아보고 구입해서 제 실수죠. 
소형견에게는 크고 무거운 리드 줄 입니다. 쓸릴 때 장갑 안끼면 손 아파요. 
잘 안미끄러지는 대신 미끄러지면 그 만큼 마찰이 심해요.');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 6, 'five', '리드줄 너무 잘 샀어요! 단단하고 든든하네요.'
, '3개월 대형견 아가라 줄을 다 끊어먹는데 ㅎㅎ 보듬 리드줄 너무 단단하고 좋아요. 
안정감이 생기니까 산책에도 자신감이 붙네요. 보듬숍이 저렴한 편은 아니지만 리드줄이나 
아이들을 위한 주요 물품은 믿음이 가서 살려고 합니다.');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 6, 'three', '너무 좋네요'
, '자동 리드줄을 사용했는데 애기가 자동리드줄 버튼소리에 놀라더라구요 
그래서 3미터 리드줄로 바꿨더니 놀라지도 않고 길이 조절이 가능해서 넘 좋은거 같아요'
, '1_2_lead2_image_2_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 6, 'five', '좋아요'
, '고무처리가 되어있어서 잘 잡고만 있으면 아이가 세게 당겨도 미끌리지 않아서 너무 좋아요~ 
필요할때는 반으로 폴딩해서 쓸 수 있어서 활용도도 매우 좋습니다'
, '1_2_lead2_image_3_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 6, 'four', '두번째 구매'
, '붉은색으로 첫번째사고 두번째로 남색 주문했어요 
고무라인덕에 손안아프고 손쓸임없고 좋아요 개가 너무 당기는 애라면, 
돌발상황에 잘 잡을수 있는 그립감을 원하신다면 추천추천!!!.');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 6, 'three', '좋아요'
, '흥분해서 짖을때 펄쩍뛰기도하고 돌기도 해서 힘든데 
줄에 박힌 고무덕분에 손에 꼭 쥐어져서 제어하기가 좋습니다  ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 7, 'three', '굳'
, '리드줄 받았는데 상태도 괜찮고 생각보다 튼튼하네요. 
원래 사용하던 밧줄 리드줄 3m 사용했는데 나름대로 보듬 리드줄이 손목도 안 아프고 좋네요 ');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 7, 'five', '그립감 너무 좋아요'
, '3m 줄이라 어깨에 매고도 넉넉한 길이라 산책시 너무 편해요 
무엇보다 약간의 무게감과, 적당히 도톰한 두께감으로 그립감이 좋네요!! 
일단 두 손이 자유로워 지니까 행복해요!! 까망이와의 산책이 더더 즐거워 지네요:)'
, '1_2_lead3_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 7, 'four', '튼튼'
, '튼튼하고 좋은데 줄이 자꾸 꼬여요');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 7, 'five', '드디어 자동줄 졸업!'
, '2013년생 시츄 보호자입니다. 2개월령부터 같이 지내면서 소통과 이 친구에 대해 알고 싶어서 
검색이랑 책도 많이 찾아보며 지내던 중에 2015년에 세나개 방영이 시작된게 콩이와 저에게는 
너무 큰 선물이었던것 같습니다. 이 친구와, 또 한친구인 반려묘와 셋이서 정말 잘 지내는데 
유독 산책 시에만 뭔가 이 친구랑 합이 안 맞는것 같아 오래 고민하던 중에 보듬 
유튜브 채널을 보며 자동줄은 항상 아이에게 당기는 느낌을 준다는 설명을 듣고 충격을 
받고 바로 주문했습니다. 자동줄이 안좋다고 얘기하시는건 계속 봐 왔지만 그저 제가 
컨트롤 잘 하면 되는 문제라고 생각했거든요. 가슴줄도 천으로 된 소재라 그 부분은 
콩이에게 편했지만 리드줄을 거는 위치가 더 앞쪽에 있어서 제가 앞서 갈때 늘 거슬려 
하던걸 알았으면서도ㅠ 정말 오랜 시간 버티다가 드디어 바꿨어요. 
주문해 놓고 며칠간 자동줄 길이를 늘려서 고정해 놓고 고때고때 줄 길이 조절하는 
법과 핸들링 연습 좀 한 후 오늘 두번째 산책때 개시했습니다. 
줄로된 가슴줄이 재질상 단단한 느낌이라 쓸리거나 불편해 할까봐 걱정했는데 전혀 불편해 하는 기색이 없었고, 
리드줄 거는 위치가 더 뒷쪽에 있다보니 제가 앞서가도 불편해하지 않더라구요. 
리드줄도 차나 오토바이가 많이 지나다니는 주택가 산책에 너무 최적화 되어 있고, 
고때고때 고리에 걸어서 길이 줄였다가 고리에서 풀기도 쉽고, 긴 상태에서 줄 길이 유통성있게 컨트롤하기도 쉬웠어요. 
특히 어깨에 매는 방법은 응가 치울때와 차와 사람이 많은 퇴근시간대 산책에 너무 좋더라구요. 
리드줄이 너비가 있어서 핸들링하기도 편하고 당기는 신호를 줘야 할때도 위에서가 아닌, 손을 아래로 내린 상태로 수평으로 
부드럽게 당기니까 콩이가 안 불편해 하고 알아듣더라구요. 잘 쓸게요~'
, '1_2_lead3_image_2_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 7, 'three', '좋아요'
, '더 두꺼운 리드줄이 필요했지만 ㅠㅠ 아쉬운데로 샀습니다. 그래도 만족합니다~~'
, '1_2_lead3_image_3_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 7, 'four', '길어요'
, '가방 매듯이 어깨에 둘러도 길어요 ㅋㅋ 깔끔해서 좋네요');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 7, 'three', '리드줄'
, '색상도 이쁘고 튼튼해보이네요... 아직은 아이가 곁을 주지않아 착용은 못해봤지만... 그날을 기디리며 먼저 구입한거예요~^^'
, '1_2_lead3_image_4_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 7, 'five', '리드줄'
, '안전하고좋아요^^');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 7, 'four', '좋긴한데'
, '길이 조절하는 부분이 자꾸 발에 치여서 불편해 하더라고요, 잘 안쓰게 되요');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 7, 'three', '건의합니다~'
, '하뭉이가 고양이나 청솔모를 보면 훅 끌어당기는데 그 힘이 세서 얼마전에 쓰던 
p후크 5m짜리 리드줄의 후크가 빠져나가서 공원에서 식은땀을 흘렸어요... 
그 뒤로는 후크 2개짜리로 해야겠다 생각해서 주문전에는 첫번째사진처럼 2개의 리드줄로 하고다녔는데 
그것보다 폴딩리드줄처럼 하나로 된게 더 좋은 것 같아요. 근데 폴딩리드줄은 목줄과 가슴줄에 
고정시키면 제가 잡을 손잡이가 딱히 없어서 그게 또 불안하더라고요. 줄 하나에 후크 2개가 연결되어있는 
제품이 있음 좋겠다 생각해보았습니다.'
, '1_2_lead3_image_5_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 8, 'four', '리드줄'
, '비슷한 다른 리드줄 써봤는데 보듬 리즈줄이 훨씬 좋네요. 확실히 가벼우니 강아지가 더 편해해요.');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 8, 'three', '길어서좋아요'
, '길어서좋아요 디자인도 씸플하니좋아요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 8, 'five', '튼튼해보이긴한데..'
, '제일 첨에 나온 네이비 쓰다가 어쩌다 보니 잃어 버리게 되었는데 그만큼 두꺼운게 아니었네요 
짱짱하게는 보이는데 박스 두르는 넙적한 노끈? 그정도 앏기라 약간 서운해요^^ 
다른것도 하나 더 사서 병행해야 겠어요 여기거 쓴뒤로 헤드 있는건 무거워서 못쓰겠더라구요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 8, 'three', '맘에쏙드는 리드줄'
, '재구매하러 들어왔다가 리뷰남김 울강쥐에게 딱 좋은 리드줄');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 8, 'four', '좋아요'
, '하키하나 가슴줄과 함께 사용하고 있어요. 올리브 색상이 비슷하게 잘 맞네요.');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 8, 'three', '폴딩10미리 리드줄'
, '지난번에 우리 개똥이 어깨끈과 폴딩20미리 구입해서 잘사용하고 있었지만 
8키로 똥강아지에겐 아무래도 리드줄이 두껍고 산책시 핸들링에 불편한 감이 있어서 오염도 
덜대고 가벼운10 미리로 재구입 햇어요^^ 정말 가벼워요~ 우리 개똥이도 발걸음이 가볍게 보이네요 추천해요^^'
, '1_2_lead4_image_1_review.jpg');

/* 목줄 */
insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 10, 'three', '디자인 넘 맘에 들어 주문했는데 기능까지 괜춘해요. 역시 비싼값을 하네요...'
, '일단... 너무 예뻐요 ㅠㅠㅠ 엉엉 교육용으로 목줄이 필요해서 M 구매했는데 
12킬로 진도믹스 아이에게 잘 맞아요. 그리고 반사판(?) 기능이 있어 밤에도 보이는 부분이 있어서 
좋고 차고 뺄 때 딸깍 거리는 소리가 안나는 점도 좋네요. 생각보다 편해하기도 해서 대만족입니다.'
, '1_3_Leash2_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 11, 'three', '좋아요'
, '전에 라지샀는데 너무 커서 중간사이즈샀더니 딱맞아요 굿굿'
, '1_3_Leash3_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 11, 'four', '좋아요'
, '목줄에 강아지 등록증 달고 다니는데 정말 잘산거 같아요 ㅎ');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 11, 'three', '목줄'
, '이쁘고 재질도 좋고 맘에들어요~^-^'
, '1_3_Leash3_image_2_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 11, 'four', '아기가 어려서인지'
, '아기가 어려서인지 좀 많이 남아요 보더콜리인데 금방크겠죠 3달 다되어가는데 
집에서 너무힘들어해서 나가려고 샀는데 오늘도 비가오네요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 11, 'five', '좋아요'
, '평소 쓰던 것 보다 두껍고 내구성도 좋네요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 11, 'four', '너무 잘 쓰고 있어요.'
, '폴딩줄도 근래에 샀는데 같은 이거랑 같은 재질이네요. 
털이 잘 붙는 재질이긴 하지만 익숙하기도 하고 어차피 목털 안쪽에 파묻혀서 보이지도 않아요. 
ㅋㅋ 튼튼하고 사이즈도 잘 맞고 너무 좋습니다.');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 12, 'five', '예뻐요~'
, '내구성도 튼튼하고 무엇보다 예뻐요 배송도 빠르고 좋았습니다!');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 12, 'three', '가볍고 튼튼해요~'
, '정말 가볍고 내구성이 강한 것 같아요. 디자인도 예뻐요^^'
, '1_3_Leash4_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 12, 'four', '러프웨어 후피 컬러 목줄 사이즈 S'
, '여아라서 빨간색으로 골랐습니다. 사이즈 조절과 착용법이 편해서 좋고 부드럽지만 
튼튼하고 마감 퀄리티도 좋네요. 다른 컬러로 더 사주고싶어요!'
, '1_3_Leash4_image_2_review.jpeg');

/* 안전용품 */
insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 13, 'five', '좋아요!'
, '안전줄 생각보다 안전하고 좋아요');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 13, 'four', '좋아요'
, '가슴줄 하다가 고장나서 큰일날뻔. 공포를 느낀후 보듬에서 안전줄 보고 주문. 오늘 산책은 그래도 맘 편했습니다.'
, '1_4_safe1_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 13, 'three', '안심이되요'
, '말그대로 안전줄 ^^ 가끔 목줄과 안전줄이 분리되어 아이를 놓친적이 한번 있어서 
그뒤로 손수건이나 끈으로 한번 더 연결하여 다녔는데 보듬에서 안전줄을 발견하고 망설임없이 구매했어요^^ 
이래서 강형욱강형욱 하나봅니다 ^^'
, '1_4_safe1_image_2_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 13, 'five', '목줄 적응 기간에 도움이 되요'
, '하네스 착용만 하다가 목줄을 채우니 아이가 적응을 하는 동안 잘 썼습니다. 지금은 목줄만 잘해요 ^^ 
목줄이 처음이라 조절을 실패해서 아이가 뒤로 목줄을 빼거나 목줄 적응기간에 하네스와 연결해서 쓰면 좋습니다. ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 13, 'three', '안심되고 좋아요'
, '튼튼하고 너무 길지도않고 딱 좋네요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 13, 'four', '안전한 산책'
, '산책에 가장 중요한 요소는 안전이라고 생각합니다! 안전이 가장 중요한 요소라고 생각해서 보듬 안전줄을 꺽 추천합니다 ㅎ');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 14, 'three', '보듬줄. 짱'
, '이건 정말 너무 너무 강아지와 견주를 많이 생각하고 만든게 보이네요. 
어느 메이커보다 좋아요 다만 고리가 러프**처럼 가벼우면좋겠다라는생각은 했지만. 
그건 문제 될건 아니고. 정말 리드줄 짱입니다'
, '1_4_safe2_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 14, 'four', '사람이 혼잡한 곳에서 쓰기 좋아요'
, '사람이 혼잡하거나 갑자기 짧게 잡아야 할때 줄을 감았다가 놨다가 할때마다 불편한데 매너줄을 하나 더 매놓으니 더 편해요. ');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 14, 'three', '너무 유용해요'
, '덩치가 크다보니 사람들이 많을 때는 줄을 아주 짧게 잡고 다니는데, 딱 원하던 제품이에요! 정말 유용합니다.'
, '1_4_safe2_image_2_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 14, 'four', '매너핸들'
, '사람많은곳 지나갈때 유용해요~!');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 14, 'five', '배송도 빠르고 제품도 너무 마음에 듭니다.'
, '진도믹스견인데 가끔 자기보다 큰 개를 만나면 짖거나 펄쩍뛰어서 난감할때가 많았는데 
이걸 걸고 나갔을 때 갑작스런 행동에 빨리 대처할 수 있어서 좋더군요 
배송도 빠르고 포장도 깔끔하게 잘되어 있어서 처음 여기서 제품 구매했는데 앞으로도 많은 이용예정입니다^^ ');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 14, 'three', '좋아요^^'
, '짧은감은 있으나, 더 길면 고개돌려 물어뜯고 할 것 같내요 차가 오거나, 
작은 댕댕이들을 마주칠때 짧게잡고 멈추는 용도로 너무 좋아요^^* 대형견들이라면 필수 아이템!!'
, '1_4_safe2_image_3_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 14, 'five', '매너핸들 안전해요'
, '우리 아이 힘도 세고 덩치도 약간 있어서 도시 산책시에는 매너 핸들이 필수에요. 
잠시 서서 사람들이나 자전거가 지나갈 때 매너핸들를 이용하면 훨신 안전하고 마음이 놓이네요'
, '1_4_safe2_image_4_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 15, 'five', '오빌락 안전등받았어요'
, '금액에 고민하다가 안전을위해 준비. 교통사고도 예방하겠어요 작은크기에 놀랐지만.아주 좋습니다.'
, '1_4_safe3_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 15, 'four', '좋아요!'
, '아무래도 저녁산책때는 어두워서 강아지가 있는지 없는지 잘못보시는 분들이 많더라구요~ 
빨강색이 아무래도 눈에 잘 띄기도 하고 무엇보다 방수라서 비오는 날도 세척도 좋아요^^');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 15, 'five', '이뻐요 ㅎㅎ'
, '밝아요ㅎㅎ 핑크 품절이라 보라색으로 주문했어요ㅎㅎ'
, '1_4_safe3_image_2_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 15, 'four', '오빌락 독듀얼 안전등'
, '오빌락 독도듀얼 안전등 구매했어요 야간 산책할 때 좋아요 
눈이 부실정도로 빛이 강해서 아주 잘 보야요 고무줄? 이랑 벨크로 선택할 수 있는 것도 좋은 거 같아요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 15, 'three', '예뻐요'
, '밝아서 살짝 눈이 부시긴 하지만 탈부착도 쉽고 빛이 너무 예뻐요  ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 15, 'four', '밤에도 반짝반짝'
, '밤에 산책을 나갈 때 아이가 잘 안보이거나 다른 사람들이 저희 강아지를 보고 놀라실까 걱정되는 마음에 주문했습니다ㅎㅎ 
물론 차도 조심해야 하고요 처음에는 사용법이 익숙하지 않았지만 이제는 밤 산책 필수품입니다~~');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 16, 'four', '상품 잘 받았습니다'
, '상품 잘 받았습니다');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 16, 'five', '입마개 교육'
, '입마개는 튼튼하고 좋아요 다만 사이즈 조절이 약간 어렵네요 
입마개를 앞발로 자꾸 빼버리네요ㅠ 입마개 교육을 좀 시키면서 해야될것같아요 
입마개 하고 간식도 먹어지네요 계속 익숙해지게 훈련 해야될것같아요'
, '1_4_safe4_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 16, 'four', '튼튼해요'
, '틈튼해 보여서 너무 좋구 반려견도 싫어하지 않아서 좋아요 ㅎ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 16, 'three', '굿!'
, '입마개 논쟁시작될때 순둥이나 혹시나 해 동물병원가서 씌울라고 인터넷에서 비슷한 모양 구입했는데, 
핏이 안되고 잘벗겨져서 뭘 사야하나 고민이었거든요. 
어제 받고 착용시켜봤는데 딱 맞고 너무 좋아요. 
이 제품 카피해 싸게 판 제품이었나바요. 너무 만족합니다~');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 16, 'four', '사이즈 잘 맞아요'
, '1호 구매했고 저희 애가 7키로 폼피츠인데 사이즈 잘 맞습니다. 
만일을 대비해 사서 가지고 다니는데. 잘 쓸 일은 없는 것 같네요. 
다행이죠 뭐! 튼튼하고 디자인도 멋지고 잘 만들어진 제품같습니다.');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 16, 'five', '후기..'
, '사모예드인데 너무 커서 눈을다가려요.. 성견이라 이제 더 클것 같지도 않고 재주문해보겠습니다...');

/* 산책용품 */

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 17, 'five', '배변봉투 걱정이 없겠어요~'
, '항상 산책 나갈 때마다 배변봉투 챙기는게 일이었는데, 이제 신경안쓰고 나갈 수 있을 것 같아요~ 
생각보다 1장 사이즈가 크네요~ 아가 사이즈에 비해 봉투가 커서 뭔가 아까운 느낌?ㅋㅋㅋ '
, '1_5_walk1_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 18, 'five', '급수기...'
, '아직 사용 못해봤지만 시대가 큽니다 잘사용하겠습니다');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 20, 'five', '아직 2개월이라 산책을 못해서 진득이가 없지만, 
진득이 제거도구가 있으니 산책시에 진득이 걱정없이 할 수 있을거 같아요. 잘 쓸게요.'
, '1_5_walk4_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 20, 'four', '구입했어요 : )'
, '아직 사용해보지는 않았지만 진드기에 물렸을 때 직접 사용하려구 구입했어요 : )');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 20, 'five', '잘 떼어져요', 
'요즘 진드기가 피 흡입 후 커지는게 많네요 돌려서 빼니 피가 나지 않고 진드기 앞니까지 다 뽑힌거 같아요 
그냥 핀셋으로 뺄때는 피 나서 많이 미안했는데 잘 산거 같아요'
, '1_5_walk4_image_2_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 21, 'five', '냄새가 좋아요', 
'강아지들이 냄새 때문에 도망갈일도 없고 오히려 냄새 맡고 오일을 발라줬는데 
모기에게 효과가 있을련지 아직 잘 모르겠지만 강아지 지켜볼께요~~');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 21, 'four', '천연성분', 
'믿고 사용해봅니다. 기존의 외부약은 독해서 천연성분이라하니 조금 안심하고 발라주려구요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 21, 'three', '사용하기에 편리해요 : )', 
'일회용으로 뜯어서 사용하기에 편리해요 : )');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 22, 'five', '맘에 들어요', 
'튼튼하고 디자인도 깔끔하니 이쁘네요 물 세지도 않고 좋네요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 22, 'four', '멋지고 좋아요', 
'다행히 집에 있는 병 닦는 솔이 주둥이에 들어가네요. 상품설명에도 써 있듯 딱 시중에 파는 
물병 주둥이 크기라는 걸 간과했어서, 큰일날 뻔했어요. 반려동물용 이외엔 사용 금지라 써 있던데.. 
왜 사람은 쓰면 안 되는지 잘 모르겠지만.. 앞으로 유용하게 잘 쓸게요!');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 22, 'three', 'Hood Rubber', 
'안녕하세요, 보듬숍 제품을 사랑하는 일인입니다. 
다른 제품과는 달리 해당 제품은 후드 러버가 1회 사용 직후 빠져 물이 계속 세었습니다. 
다른 견주분들도 동일한 현상이 재현되어, 
해당 제품에 대한 재검토가 필요할 듯 보입니다. 
늘 감사합니다.  ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 22, 'five', '좋아요', 
'산책할 때 들고다니기 편해서 물 줄 때 용이합니다^^');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 22, 'three', '그릇을 따로 챙기지 않아도 되는 물병!', 
'산책시에 가방을 따로 들고 다니지 않을때는 이것저것 챙겨야할게 많아서 그릇까지 챙기기에는 
너무 많은 짐이 생겨버려 다시 가방에 챙겨야 하는 경우가 많았었습니다. 
그래서 물그릇이 없어도 되는 물병을 찾았는데 다른 제품들 보다도 그릇이 되는 부분이 
실리콘으로 되어 있어 부러지거나 하는 경우도 없어서 이 제품을 구매하게되었습니다.'
, '1_5_walk6_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 22, 'five', '좋아요', 
'강아지 산책시키면서 물먹이기 매우 편리하네요 ㅎ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 23, 'five', '받자마자 써봤는데', 
'오늘 배송오자 마자 써봤는데 세상 편하네요.. 앞으로 자주 쓸 것 같아요 잘 쓸게요');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 23, 'three', '간편하게 나온 아이디어상품!', 
'산책한번 하러갈때면 휴지 물티슈 봉지 바리바리 챙겨야하는데요 
너무나 간편하게 한두개 쓱 빼서 가면되요. 주머니에 주렁주렁 안넣어도되서 간편합니다! 다 쓰고 또 구매할려구요~'
, '1_5_walk7_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 23, 'five', '산책갈때도, 집에서도 굿!', 
'이 제품 진짜 아이디어 좋은 것 같아요! 장갑처럼 손에 끼면 비닐에 휴지까지 이중으로 싸여있어서 
대변 집을 때도 위생적이고 집은 후에 비닐에 쏙 싸서 묶어놓으면 나중에 비닐을 까서 속에 변만 변기에 버리고 
비닐은 휴지통에 버리면 되니까 진짜 편하고 좋아요! 집에서도 가끔 변이 너무 묽을때 사용했어요 굿굿');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 23, 'four', '좋아요', 
'쓰기 편하네요 들고 다니는 주머니를 따로 만들어야 하는 불편함이 있지만 휴지가 붙어 있어서 괜찮았어요 재구매 합니다');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 23, 'five', 'Best Recommendation', 
'안녕하세요. 해당 제품은 제가 보듬숍에서 꾸준히 애용하는 
최고의 제품입니다. 반려견에 대한 세심한 배려가 반려견에게까지 전이되는 진중한 제품입니다. 
향도 좋고, 아이디어도 돋보이고, 덕분에 타 견주분들께 선물도 드리고 적극 추천 드리고 있습니다. 늘 감사드립니다.');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 23, 'four', '진짜 편해요!', 
'산책시에 지퍼락에 담아 가방에 챙겨가는데 진짜 편해요!');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 24, 'four', '향이 좋아요', 
'일반 비닐에는 손으로 처리할때 무척 난감했는데 휴지가 포함 되어 있어서 
사용하기 참 좋아요 향이 좋아서 변 냄새도 참을 수 있답니다 
집에 가져와 휴지통에 버려도 변냄새가 잘 나지 않아요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 24, 'five', '산책 에티켓 준수', 
'산책가서 배변을 치우는 에티켓 준수하고 있습니다. 
기존에 비닐로 하다보니 좀 그랬는데 딱 좋은 상품이에요 ');

/*패션 -> SUMMER*/
-- 후기 없음

/* 아우터 */
insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 28, 'five', '만족스럽네요', 
'가격의 압박이 좀 있지만 꼼꼼한 마감, 입히고 벗기기 편한게 좋네요. 산책할때 따뜻해 만족스럽네요. 많이 파세요.');

/* 티셔츠 */
-- 후기 없음

/* 악세서리 */
-- 후기 없음

/* 리빙 -> 이동장 */

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 39, 'three', '딱 적당하고 좋아요!!!', 
'조립하기 편하고, 무엇보다도 7.6kg 베들링턴인 우리 강아지한테 적당히 여유롭고 
아늑한 공간을 제공해 주어 좋습니다!!! 천장이 높아 답답한 느낌이 없습니다~ 
하우스로 사용하여 철장을 떼어내고 쓰고 있는데 만족합니다!'
, '3_1_cage4_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 39, 'five', '너무 큰걸 주문했어요 ..ㅠㅠ', 
'시바견입니다 
사진 보고 제일큰거 주문해도 될 것 같아서 제일 큰거로 했는데 
너무너무 커요...ㅋㅋㅋㅋ 
리트리버같은 완전 대형견용인 것 같아요 
중형견은 이 사이즈보다 더 작은거 사도 될 것 같네용 
교환이 안되니 그냥 사용하려구요..ㅋㅋ'
, '3_1_cage4_image_2_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 40, 'three', '강아지가 켄넬보다 거부감이 덜하나봐요', 
'뜯자마자 바로 잠프해서 들어갔네요 ㅋㅋㅋㅋ 옆에서 셋팅하는데 너무 놀랐어여 ㅋㅋㅋㅋ 잘쓸게요!'
, '3_1_cage5_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 40, 'five', '유모차 사용 후기', 
'일단 물건은 훌륭 합니다 상단부 스크레치 방지망을 고정시키는 가죽 단추 고정장치는 
배송 온 당일에 울 강아지가 물어 뜯어 버렸습니다  ㅜ.ㅜ 
트래블러 프레임 정말 튼튼하고 운전이 정말 편하네요 
잘 사용 하고 있습니다 감사합니다 수고 하세요');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 41, 'three', '훈련 필요없이 넘 편안해 합니다', 
'쓰던 쿠션이 낡아서 켄넬 구입했는데 너무 좋아하는 거 같아요 조립해서 쿠션 깔아주자마자 
쏙 들오가서 딥슬립 한번 하고 나오네요 신기합니다 진즉 마련해 줄 걸 그랬어요 사이즈도 잘 맞는 거 같고 가볍고 좋네요.'
, '3_1_cage6_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 41, 'five', '사이즈 확인을 두번했는데..', 
'나중에 작을까봐 걱정이네요 뭐 작아서 못쓰게되면 추가 구입해야겠죠~'
, '3_1_cage6_image_2_review.png');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 41, 'four', '와와 치코에게 켄넬 2호 구매!!', 
'켄넬을 무엇으로 구매 해야 할까 하다가 금액대도 잘 맞고 , 
싸이즈랑 제가 들고 다니기 가벼운 제품으로 고르려고 고민하다!! 보듬 숍에서 구매하였어요~ 
처음에 안들어가면 어떻게 하나 했는데 .. 잘 들어가서 간식도 잘 먹고 밥도 잘먹고!! 
찰떡 선택 이었어요~~~ 이제 켄넬도 왔으니 더 교육 열심히 하는 치코 되야겠어요^^ '
, '3_1_cage6_image_2_review.png');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 41, 'five', '스쿠도 켄넬 2호 좋네요.', 
'별다른 훈련없이 바로 들어가서 만족하네요. 
저희집 애가 실버푸들이라 현재 아가여서 검정색이라 잘 안보이지만 안에서 무척 안정감을 갖습니다. 역시 명품 켄넬 스투도네요. 
2호 구매했는데 혹시 큰애가 더 크면 둘째에게 물려주면 좋을거 같아요. 잘 쓸게요. 감삿합니다.'
, '3_1_cage6_image_3_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 41, 'four', '켄넬 1호', 
'말티즈 3, 4kg 아이들이 사용중입니다. 처음엔 크기만 생각했는데 큰 게 좋은게 아니라는 
말씀 떠올리고 알맞은 크기로 골랐습니다. 켄넬이 처음이었지 이동장 사용에 두려움이 없었던 
아이들이라 잘 들어가고 자고 놀고? 하네요. 3, 4kg 아이들에겐 집 안에서 생활하기에도 
이동하기에도 안성맞춤이라고 생각됩니다. 기존에 사용하던 이동장보다 가로폭이 넓어 아이들이 편해보여 좋았습니다. 
집에서는 집 안에 집으로 밖에나가서는 카시트?로 이동장으로 집 밖에 집으로 쓸생각하니 벌써 뿌듯하고 기대됩니다~!!^^'
, '3_1_cage6_image_4_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 41, 'five', '스쿠도 켄넬 2호 이동장', 
'1호장을 먼저 구매했는데, 조금 작은듯 하여 하나 더 구매할때는 2호로 했더니 아이들이 2호에 더 잘 들어가네요~ 
훈련사님 말씀으로는 저희아이들 몸에는 1호도 충분하다고 하시니 
켄넬훈련 제대로 해서 켄넬에서 푹 쉬는공간으로 인지했으면 좋겠습니다. 
켄넬 가볍고 색상, 디자인 모두 예뻐요~~~ 
아이들 각자 켄넬 들어가있는 모습 찍고싶었지만 미카는 넥카라를 쓰고있고, 라파는 말을 잘 안듣는편이라... ㅜㅜ 
각자 찍어봤습니다~^^'
, '3_1_cage6_image_5_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 42, 'five', '잘받았습니다', 
'처음엔 색이 달라 반품할까 했는데 지금은 괜찮고 특볠히 냄새도 없고 가볍고 좋네요');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 43, 'five', '추천해용!!', 
'스쿠도 켄넬은 진짜 가벼워서 이동식으로 들고다니거나 차량용켄넬 따로 두지않으시는분등은 
이거 하나로도 집에서 차까지 옮기기 편할듯해요 가벼워서 너무 좋았어요 ㅎㅎ 
글고 위에 간식을 넣거나 반려용품을 따로 놔둘수잇는 칸도잇어서 너무 좋앗어요 
바퀴달면 손잡이가있어서 끌고다니면되서 공항갈때 가지고갈거예요 적극추천입니다'
, '3_1_cage8_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 43, 'four', '스크도 켄넬 7호 구입했습니다.', 
'크고 튼튼해서 아이들 켄넬 교육하기 좋을것 같습니다. 
디자인도 예쁘고 조립도 간편합니다. 보듬 포인트로 구입했습니다. 감사합니다. ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 43, 'three', '스쿠도켄넬 6호 사용기', 
'골든리트리버 여아 110일된 견주입니다. 이제 사용한지 1달이 조금 넘었는데... 
날이 따뜻해지니 잘 들어가지는 않지만 4월까지는 잘 사용했습니다. 만족하고 있습니다.');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 43, 'five', '진도 믹스 아가용 5호 켄넬 + 바퀴/에어키트 구매', 
'진도 아가를 데려오면서 집 겸 이동장으로 쓰기 위해 구매했어요. 
유기견 아가로 태어나 얼마나 클지 예상되지 않아 크기 선택에 고민이 많았는데 검색과 더불어 다행히 
보듬숍에 견종/무게별로 올려주신 사진의 도움을 받고 5호 구입했어요. 
아직은 3개월도 안된 6kg 조금 넘는 아가라 켄넬이 여유롭네요. 
중형견이라 켄넬 가격도 무섭게 뛰는데 아무거나 고를 수 없어 강형욱 훈련사님 믿고 구매했어요! 
일단 튼튼한 외관과 색도 마음에 들고 다른 켄넬을 직접 보고 비교하진 못해 무게는 모르겠지만 바퀴를 추가할 수 있고 
캐리어처럼 끌 수 있는 핸들이 있으니 엄청 편리할 것 같아요! '
, '3_1_cage8_image_2_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 43, 'four', '바퀴튼튼하네요', 
'켄넬에 끼울때 조금 뻑뻑하긴 한데 바퀴 튼튼하고 잘 굴러가네요.'
, '3_1_cage8_image_3_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 43, 'three', '조립도 쉽고 튼튼해요', 
'클립으로 하는거라 원터치로 금방 조립했어요~ 나사로하는것보다 금방끝난것 같아요 
위에 간식수납할수있는 공간도 있어서 좋습니다. 근데 문을 열어놔도 자꾸 저절로 닫혀서 끈으로 묶어 고정해놓았네요...'
, '3_1_cage8_image_4_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 44, 'three', '멜슨 소프트 켄넬 구매로 그동안의 걱정이 모두 날라갔어요!', 
'너무 만족스럽네요!!! 하드켄넬도 좋지만 차의 크기가 그렇게 크지 않아서 
뒷 좌석에 하드켄넬 넣기가 너무 빡빡했는데... 또 시트가 신경 안쓰인다면 그것도 거짓말이죠 ㅠㅠ 
이 모든 걱정을 멜슨 소프트켄넬 하나로 모두 해결하니까 너무 행복하네요!! 
그리고 높이가 낮으니 강아지가 스스로 켄넬에 들어갈수 있어 불필요한 터치가 줄어드니 더 좋은 것 같아요!! 강추드려요!'
, '3_1_cage9_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 44, 'four', '좋아요^^', 
'12키로 코카믹스 키우는데 차량안에 고정해놓고 사용하려고 구매했어요ㅎ 좀더 큰걸 살까 후회ㅠㅠ 
그래도 튼튼하고 차량 안전벨트로 고정이 딱 잘되고 좋아서 잘 사용하고 있습니다! 
아이도 켄넬안에 들어가면 엎드려 쉬다가 차가 멈추면 뚫린 천장ㅋㅋ 으로 바깥구경하기도 해요ㅎ 
무엇보다 세탁이 가능해서 너무 좋음ㅜㅋㅋ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 44, 'five', '괜찮아요 : )', 
' 아직 아기라 다 컸을 때를 대비해서 사놓았어요 : ) 
3개월인데 차에 태우면 차 시트를 긁어서 걱정했는데 가볍게 옮길 수 있는 소프트 켄넬이라 사용하기 수월하답니다 ^^ ');

/* 여기까지 db입력함 */

/* 안전문 */

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 45, 'three', '아주 튼튼합니다.', 
'아주 튼튼합니다. 프리미어 강아지 안전문... 안심하고 강아지를 두고 나갔다 올 수 있을거 같아요. 
무엇보다 기존 집, 벽 등에 흠집이 나지 않으면서도 튼튼하게 막아주니 너무 좋네요. 잘 쓸게요.'
, '3_2_door1_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 45, 'five', '안전문 튼튼해요.', 
'애가 커가면서 철장에 넣어놓기 미안해서 구매한 안전문... 
너무 좋아요. 어쩔수없이 출근할때 두고 가야하지만 좀 더 넓은 공간에서 있을거라고 생각하니 조금 덜 미안해지는거 같아요. 
튼튼하고 만족스런 품질입니다. 잘 쓸게요.'
, '3_2_door1_image_2_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 46, 'three', '깔끔해요~', 
'저희 강쥐들은 가족과 같이 자고싶어하지만, 이른새벽 출근에 자꾸 잠을 설치게되어 방문에 안전문을 설치하게 됐습니다. 
배송도 빠르고, 무엇보다 설치하고 나니 엄청 깔끔하고 예쁘더라구여~ 
저희 집 6살 아이도 여닫을수 있어서 더더욱 만족합니다. 보듬숍~ 베이비단 안전문 짱이에욧~!!!'
, '3_2_door2_image_1_review.jpg');

/* 방석, 매트 */
insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 52, 'three', '층간소음이랑 슬개골 때문에 구매했습니다', 
'층간소음이랑 슬개골 탈골이 오면 어쩌나 걱정이 되서 구매했어요 울애기들 너무 좋아하네요'
, '3_3_mat3_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 52, 'four', '저는 추천해요~', 
'강아지가 너무 좋아해요 놀때는 항상 매트 위에서 놀려고 하고 뛸때도 걸을때도 미끄러지지 않으니깐 
보는저도 마음 안졸여도 되고 탈구현상을 예방하는데 너무 좋은 제품이라고 생각이 듭니다 
처음엔 보듭숍에서 2개를 샀는데 훨씬 더 필요할것 같아서 에코폼에서 더 구매를 하여 사용하고 있습니다
완전히 안미끄러지는것은 아니지만 너무 빨리 뛰었다가 멈출때 빼고는 잘 다니니깐 
생마룻바닥보다는 훨씬 훨씬 강아지도 편안해하니 구매한 보람이 있네요 방수도 잘되어 걸레질도 편하게 할 수 있고요 
저는 매트가 망가져서 다시사야하는 날이오면 재구매 할 것 같아요!!'
, '3_3_mat3_image_2_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 52, 'three', '아기가 즐겨사용합니다', 
'저희 아이는 패드를 깔아줬더니 뒹굴고 편하게 쓰기보다는 잠깐잠깐 쉬고 밥먹고 그러네요 ~ 
소재가 미끄럽지않고 두께감이있어서 사용하기 편리합니다. 인형도 올려놓을 수 있고 여러모로 활용도면에서 괜찮네요!'
, '3_3_mat3_image_3_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 52, 'five', '좋지만....', 
'슬개골때문에 걱정되서 시켰는데 제품은 좋은데 너무 비싸네요.... 
집전체를 비싼걸로는 다 못깔아서 싼걸로 깔았어요ㅠㅠ 텅장은 웁니다ㅠㅠㅠ 근데 시간이 갈수록 모서리부분이 안으로 말려요'
, '3_3_mat3_image_4_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 52, 'four', '상추가 아주 좋아해요!:)', 
'관절이 좋지않아 오래걷는게힘든아이 이고, 집에서도 잘 뛰지않는데 이매트를 깔아주니 신나서 폴짝폴짝 장난도 치네요:) 
뿌듯 하구 보듬 믿고 구매한 보람있숩니다 월급나오면 추가구매할구에요'
, '3_3_mat3_image_5_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 52, 'five', '우리아이 쓸개골을 지켜주세요.', 
'현재 집이 4층이라 층간소음 방지 및 우리아이 쓸개골을 지켜주려고 매트를 구매했어요. 
우리 아이가 20kg 허스키라 13mm 두께로 구매했는데 정말 푹신푹신하고 좋네요. 
서열 1위 와이프님 요가 매트로도 손색이 없네요. 저녁에 퇴근하면 매트위에서 우리 아이와 
터그놀이도 맘놓고 할 수 있어서 너무 좋습니다. 사이즈로 방 사이즈에 맞추어 구매할 수 있어서 편리하네요.'
, '3_3_mat3_image_6_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 53, 'five', '미끄럼방지 매트~ 디자인도 이뻐요~', 
'강아지 슬개골 탈구 예방하려고 매트 찾아보다가 구매했어요. b타입으로 두개 구매했는데 거실에만 깔았어요. 
나중에 복도형이나 a타입도 구매해서 전체 깔아줄 생각입니다. 그런데 새로 깔자마자 뜯어버리네요 ㅠㅠ 
다 뜯어버리면 새로 또 구매해야겠죠? ㅎㅎ.....'
, '3_3_mat4_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 53, 'three', '좋아요~~', 
'좋아요~~');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 53, 'four', '도그자리 플랫 강아지 매트', 
'저희 아이들이 엄청 좋아라 합니다~');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 53, 'five', '도그자리 플랫 좋아요^^', 
'도그자리 상품중에서 고민하고 골랐는데 만족합니다 적당한 두께여서 푹신하고 두개를 붙였는데 자연스러워요 집앞도 환해졌네요~^^');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 53, 'four', '좋아요!', 
'첨애 냄새에 좀 그랫지만 지금은 완전 빠져서 좋고 미끄러워 하지않아 좋아요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 53, 'five', '에코폼 플랫 매트 좋네요.', 
'우선 하나를 구매해 보았어요. 거실엔 보통 카펫이 깔려있으니 주방쪽에 깔았는데 냄새도 별루 안나고 좋아요. 
그래서 다시 같은 걸루 하나 더 주문해요. 안깔린 부분에 더 깔려구요. 
우리집 녀석이 넘 발랄해서 후다닥 달릴 때 미끄러지지 않고 넘 좋네요.');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 54, 'five', '진짜 필수템인거같아요 짱짱', 
'가격이 부담되어서 며칠 주문을 미뤘는데 역시 그냥 지르길 잘했네요... 
8만원가까이 되는 금액이어서 너무 망설였는데 구매하길 정말 잘한거같아요 ㅠㅠ 
아이도 처음에는 위에 뿌려주기만했는데 정말 적응을 잘 하더라구요 퇴근하고나서 
확인하면 남아있는 사료는 하나도없고 ㅋㅋ 홈카메라로 확인했을때도 분리불안증세는 안보여서 정말 다행이었어요 ㅠㅠ 
출근전에 엄마갈께! 해도 뒤 절대 안돌아보더라구요...러플매트에 코 박고있구 ㅋㅋㅋ 
나중에 다 하고나면 그때서야 엄마찾기... 얼마안가서 방석에ㅜ다시 자구있구 ㅋㅋ 너무 만족스러워요'
, '3_3_mat5_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 54, 'four', '좀 좁다.', 
'아이가 작고(1.6kg) 세일상품이라 엄청 저렴해서 샀는데.... 
좀 작은것 같다. 아이가 자꾸 일자로 길게 뻗어서 바닥에서 잔다. 아쉽다.....');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 54, 'three', '깔끔하고 이쁘고 기능적이에요', 
'이쁘고 커버분리되고 노즈워크도 함께 할 수 있어서 좋고 S사이즈인데 2.4kg 말티즈 넉넉하게 맞아요');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 54, 'five', '적극 추천합니다', 
'사이즈땜시 고민이 많았는데 4.7키로 푸들인데 잘 맞고 배송오자마자 좋아합니다'
, '3_3_mat5_image_2_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 54, 'four', '역시 코방석 최고네요', 
'어떤 방석을 구매할지 한참 고민하고 고민해서 구매했는데 코방석이 가장 좋습니다 
노즈워크도 넘 좋아하고 쿠션도 가장 탄탄하면서 푹신해요 좋은 제품만들어주셔서 고맙습니다^^'
, '3_3_mat5_image_3_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 54, 'five', '마약방석이 따로 없네요', 
'예전에 아*토 마약방석을 구매했는데 올라가기는 커녕 오줌만 싸더라구요 보듬코방석은 편안한지 애기들이 잘자요'
, '3_3_mat5_image_4_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 55, 'five', '아이들이 엄청 좋아하네요~~~', 
'침대방에서 다 같이 자다보니 잠을 너무 설치게 되어 잠자리 분리를 위해 베이비단 
안전문을 먼저 구입하여 설치하고 나니 아이들이 거실 쇼파 쿠션 위에 웅크리고 자더라구요..... 
집에 보듬 코방서도 있긴하지만, 재질이 더울것 같아 세탁하여 보관하고 있는차라 침대를 
이것저것 엄청 검색하다가 멜슨 접이식으로 결정하였습니다. 
무엇보다 아이들 척추에 좋고, 접이식이라 여행 시 휴대도 가능한 점이 마음에 들어 사악한 가격에도 불구하고 냅다 질렀는데, 
어제 오자마자 설치해 주고 오늘 아침에 보니 두 놈이 한 침대에서 사이좋게 잘 자고 있더라구요~ 
저희 아이들이 새 물건을 좋아하긴 하지만 바로 올라가 적응해 주니 돈 아깝다는 생각이 전혀 들지 않았습니다. 
프레임도 엄청 튼튼한 장점에 반해 휴대하기에 좀 무거운 감은 있으나 대신 안정적이기에 만족하며 사용합니다~ 
멜슨 제품 왜이렇게 가격이 비쌀까.... 궁금했는데, 물건을 접하니 퀄러티가 좋긴하네요~~~^^ '
, '3_3_mat6_image_1_review.jpg');

/* 식기, 보관 */
insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 58, 'four', '굿굿', 
'많이 넣을 수 있고 아주 좋아요^^');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 59, 'four', '물통이랑 간식통 같이 있어서 좋아요', 
'따로따로 들고 나가기 힘들었는데 한번에 같이 있는거 구매했더니 편한것 같아요 
산책 하다 보면 물은 필수거든요 핵헥 거려서 근데 간식까지 줄 수 잇어서 너무 좋네요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 61, 'five', '딱 적당한 사이즈에요', 
'간편하게 들고 다닐 수 있는 딱 적당한 사이즈라 좋은거 같아요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 63, 'four', '좋아요', 
'생각보다 크네요 잘 쓰고 있어요 ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 63, 'three', '역시 사료통은 감마 비틀볼트', 
'확실히 밀폐되고 좋네요. 처음엔 불량품이 와서 갸우뚱했었는데 바로 1:1 교환 빠르게 해주셔서 감사합니다.');

/* 목욕, 위생 */
insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 68, 'three', '브러싱스틱', 
'처음엔 치약 묻혀줘도 핥아먹기만 했는데 제가 스틱을 들고 있으니 입을 벌리네요');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 70, 'five', '색상이 너무 예뻐요', 
'색상이 너무 이쁘게 나왔어요 ^^ 다행히 사이즈도 경자에게 딱 맞네요'
, '3_5_hygiene3_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 70, 'five', '목욕가운 최고입니다', 
'목욕 후 털말리기는 매우 힘든일이었습니다. 목욕마친 후 수건으로 닦아주고 목욕가운 입혀놓고 편하게 있다, 
한 시간쯤 후 벗겨주니 남은 물기는 저절로 마르게 되었습니다. 
선풍기 앞에서 터그놀이 해 주며 말리던 수고는 이제 끝~~~ 뮤니쿤트목욕가운 최고입니다'
, '3_5_hygiene3_image_2_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 72, 'five', '아이가 좋아해요', 
'마미수잔님 동영상 보다가 눈에 들어온 제품이에요. 얼른 주문했지요^^ 
새 물건이 들어오면 냄새부터 맡게 해줘요. 냄새 맡고 몸에 살짝 대니 움찔ㅎ 생각보다 단단하네요. 
피부에 자극적이지 않을 것 같아서 맘이 놓입니다. 이젠 편안해 합니다.'
, '3_5_hygiene5_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 72, 'three', '좋아요~', 
'반려견 분양받고 처음에 알아준다는 슬리커 비싼거 구매했는데 워낙 빗질을 싫어하기도 하고 
해서 미용실에 맡기는거 외엔 집에서는 엄두도 못냈는데 전만큼은 아니지만 얌전히 있어용~ 
저렴한데다가 가성비도 좋아요!');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 72, 'four', '좋아요', 
'빗질 힘들이지 않고 자연스럽게 하고 있어요 피부에 자극도 없고 수훨하게 잘하고 있어요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 72, 'three', '편안한 빗질', 
'사진 속 강아지와 같은 견종을 키우고 있습니다. 
아직 어려서 털은 많이 빠지지않지만 털갈이 기간에 유용하게 쓰겠습니다.
무엇보다 아이가 안 아파해서 좋아요 ㅎㅎ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 72, 'five', '빗질은 최고입니다.', 
'엉킨 털도 잘 빗겨주네요..');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 72, 'four', '정말 좋아요 *^^*', 
'비러쉬를 싫어했었는데 캄파룩 브러쉬는 편안해 한답니다! : ) 빚기고 있다 보면 어느새 누워있어요 ㅎㅎ  ');

/* 탈취, 소독 */
insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 73, 'four', '대용량으로 주문했어요 : )', 
'500ml를 쓰다가 리필이 필요해 주문하게 되었답니다^^ 아이들 용변 본 자리 말고도 주변 탈취제로 종종 사용해요 : )');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 73, 'five', '냄새제거 최고', 
'와 진짜 혁명입니다....애들 화장실 냄새는 물론이고 생활 악취까지 없어져요 최고입니다');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 74, 'five', '냄새와의 전쟁', 
'2월에 데려왔을 때와는 또 다르게 냄새와의 전쟁이네요. 
전용 휴지통을 써도 그 주변에 희미하게 냄새는 남고... 강아지들을 매일 목욕시킬 수도 없구요. 
그래서 샀습니다. 배변패드 휴지통 주변, 물고노는 장난감, 집과 방석 등 위주로 뿌려주고 있어요.'
, '3_6_antiseptic2_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 74, 'four', '좋아요 : )', 
'집에서 사용하기에 좋아요 : ) 대소변 실수한 곳이나 배변패트 바꿀때 매일 사용중이에요 ^^ 다음에는 대용량을 주문하려구요 ㅎㅎ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 76, 'four', '괜찮아요 : )', 
'들고다니면서 차에서나 다른 집에 놀러갔을때 사용하기 편할 것 같아 주문하였어요 : )');

/* 디지털, 가전 */

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 78, 'five', '2개 주문했는데 ..', 
'하나만 와서 문의할때 사진을 혹시몰라 올리고 싶었는데 문의하기에는 사진이 암올라가거 여기 올립니다. 빠른 처리 좀 부탁드릴게요 ~*'
, '3_7_electronic2_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 78, 'four', '사용이 간편하고 패키지라 저렴하게 잘샀어요 남편이 저보다 더 좋아합니다', 
'처음에는 시큰둥하던 남편이 상품받고 신나게 뿌리고 다니네요 
사용이 간편해서 너무나 편합니다 디자인도 작고 이뻐서 집에두기 좋아요 
락스냄새가 연하게 나긴나요 그래도 거부감이 들정도는 아니에요 정말 잘 사용할거같아요');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 78, 'three', '잘쓰고 있습니다', 
'산책후 애기들 발닦는 용도로 쓰고 있습니다'
, '3_7_electronic2_image_2_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 78, 'four', '엄청 좋네요', 
'살균제값 아낄 수 있어서 구매했습니다 생각보다 매우 좋네요 ㅎㅎ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 78, 'five', '멋지네요', 
'전해수기 작동하니 나오는 보라색 불빛이 무슨 장식품 같습니다. 락스를 뿌리기는 좀 걱정되서 잘 소독하지 않던 화장실 
바닥에 수시로 뿌려주니 냄새도 덜 나고, 세균도 줄어드리라 생각되어 걱정도 줄어듭니다. 
한가지 궁금한 것은, 분무기는 보통 사용하면 2-3년 쓰면 스프링 부분이 고장나서 새로 구매해야되는데 
전해수기, 분무기만도 판매할까요? 아직 판매한지 몇년되지 않아 그런지, 분무기만 별도 판매하는 곳을 볼수가 없네요.');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 79, 'three', '너무 간편하고 좋네요', 
'수돗물을 이용해서 살균수를 만들 수 있어 너무나 편리하네요. 
집안 곳곳 안쓰이는 곳이 없습니다. 반련견도 함께 살고 있어 반려견용품 살균에도 좋네요. 
패키지고 너무 이쁘고 전해수기도 디자인이 심플해서 정말 맘에 드네요'
, '3_7_electronic3_image_1_review.jpeg');

/* 장난감 -> 노즈워크 */
insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 81, 'five', '피단 노즈워크볼', 
'아직 퍼피라 사료가 작아 우수수 떨어지지만 간식 넣으면 좋을듯 해요. 일단 반응은 좋네요');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 82, 'three', '잘 가지고 노는데 2단계는 어려운지..', 
'아예 뚜껑을 분리해버리네요. 그리고 뒤집어엎고 긁고 마루바닥에서 가지고 놀기 너무 시끄러워서 못주겠어요. 
ㅜㅜ 층간소음걱정없는 장난감은없을까요?'
, '4_1_nosework3_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 82, 'five', '도그 트위스터 플라스틱 최고입니다.', 
'최고!');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 82, 'three', '10월 28일 생일인 똘똘이', 
'제가 키우는 아이는 생후 2개월정도된 진돗개 남자 입니다! 
주위에 우리똘똘이를 천재라고 떠들고다니는 주책바가지 견주이죠,,,,ㅋㅋㅋㅋㅋ;;; 
암튼, 첫사진과 두번째 놀때모습이예요~^^ 넘나 재밌게 가지고 놀아줘서 기뻐요 ㅠㅠ 동영상을 올리려고했는데,, 
안올라가는듯해서 인스타 남겨요 노는 모습 동영상 올려놨어요!!!'
, '4_1_nosework3_image_2_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 83, 'five', '좋아요 *^^*', 
'출근할 때 혼자 두고 나오기가 미안해 고민하다가 주문했어요 ㅎㅎ 
우선 좋아하는 간식을 안에 넣어두고 나오니 처음에는 얼굴로 막 하려다가 몇일 지나니 발로 몇번 하는 방법을 익혔더라구요 : ) 
이젠 방법을 익혀서 얼마 안걸려요 ㅋㅋㅋㅋ 다른 제품들도 찾아봐야겠어요 ㅎㅎ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 84, 'three', '밥 줄때 사용해요', 
'밥을 잘 안 먹어서 여기에다 넣어주면 잘 먹네요 간식도 여기에다 줘요');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 84, 'five', '처음이라', 
'낯설어서 아직은 제대로 사용을 못했지만 제품은 좋아보입니다'
, '4_1_nosework5_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 84, 'four', '좋아요', 
'생각보다 너무 좋아하고 잘 놀아요 진작에 사줄걸 하는 생각이 들었어요 ㅠ 지금은 쿠싱 질환 때문에 못 하지만 추천 합니다 ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 84, 'three', '와우', 
'너무 좋아해요 근데 미친듯이 파고 뒤집으면서 혹시 더 공격적인 모습을 보이게 되는 건 아닌지 궁금합니다. 
에너지 소비를 하기 좋은거 같긴 해요! 하고 곧 자네요 ㅋㅋ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 84, 'four', '댕댕이신났습니다', 
'일단계라도 계속할때마다 너무재미있는가 반복으로 해줘도 즐거워합니다');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 84, 'five', '품절이라 아쉬워요', 
'품절이라 아쉽네요 ㅠㅠ');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 85, 'five', '잘 사용하고 있어요.', 
'어려워서 사용하지 못할까봐 고민하며 구매했는데 너무 잘 사용하고 있어요^^');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 86, 'four', '하루만에 다 긁혔어요.............. 오늘 보듬숍에서 온 상품들 OTL...', 
'오자마자 다 긁히네요.... 7개월 비숑 이빨에 무참히 무너졌어요.... 이래선.. 정말.. 못 쓰겠어요.. 배송 하루만에... 딱 두끼 먹였는데.. 
불순물이 몸에 들어갈까 봐 너무 염려되고 안타깝습니다..... 오리랑 같이 망했씁니다...ㅠ...'
, '4_1_nosework7_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 86, 'five', '아이가 좋아해요!!', 
'쭌이가 좋아하긴 하는데... 너무 잘 빼먹어서... 간식이 금방 바닥나더라구요..');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 86, 'three', '재밌는 놀이기구', 
'재질이 튼튼하고 입구 조절이 되서 한주먹 정도 넣어주면 한참 놀면서 먹어요~~ 
물어도 금방 고장나지않아 좋어요 엄청 재밌어 해요~~ 강아지들에게 이보다 더 재밌는 숙제가 또 있을까요?');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 86, 'five', '밥어랏 잘가지고 노네요', 
'장남감이 필요했고 노즈워크도 필요했는데 사용해보니 잘가지고 놀고 재밌어 하는거 같아 많이 도움이 됩니다 
간식을 많이 안먹는데 간식이든 사료등 넣어두면 놀이하면서 잘 사용하네요 강추합니다');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 86, 'three', '밥어랏 L 구매 및 사용후기', 
'우리 반려견이 너무 신기해하고 좋아하네요. 
아직 3개월령 어린아이라 어리둥절한 표정을 짓다가 간식이 나오면 후다닥 ^^');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 86, 'four', '먹순이 오월이', 
'동영상을 찍었는데 어떻게 올리는지 몰라서 글만 남깁니다. 
오월이가 반응이 좋아요 우선 간식이 나오는 통인줄 알고 저걸 들면 집중합니다. 
다 먹고 나면 꼭 수거하구요. 어릴적에 플라스틱 물어뜯고 살았었는지 남아나는 플라스틱 제품이 없습니다.');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 87, 'four', '처음이라', 
'사료를 넣고서 스스로 꺼내먹진 못하지만 점점 나아질거라 생각합니다'
, '4_1_nosework8_image_1_review.jpeg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 87, 'three', '밥어랏 s', 
'강아지도 즐거워하고 다 좋은데 생각보다 장난감이 무거워서 바닥에 굴릴 때 소리가 많이 나네요ㅠㅠ');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 87, 'four', '간식 줄때 좋아요.', 
'오뚝이가 간식 줄 때 좋아요. 아직은 아이가 어려서 오뚝이를 힘으로 조종은 잘 못하지만,
기울려서 간식이 나오면 관심갖게하기엔 최고네요. ^^'
, '4_1_nosework8_image_2_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 87, 'three', '층간소음...', 
'구입한지 1년하고도 2개월만에 후기를 씁니다~ ^^ 이 제품을 저희집 송이가 좋아라 하며 굉장히 적극적으로 몰두하네요. 
그런데 미처 생각지 못한 부분이 오뚜기다 보니 하단부위가 무겁고 단단하여 
코나 다리로 이리저리 굴릴 때 마루바닥에 드르륵, 드르륵 끌리는 소리가 크게 발생합니다. 
매트 위에서 하다가도 이리저리 밀다보면 매트 바깥으로 나가니 한시도 눈을 뗄수가 없네요. 
신나게 노즈워크 하는데 자꾸 개입하게 되어서 리듬이 끊기는 것 같기도 하고 신경쓰여서... 
제품에 문제가 있는 건 아니니까 층간소음이 신경 쓰이지 않는 상황이면 정말 재밌고 좋은 제품입니다.');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 87, 'five', '좋아하는데 굴러다니는 소리가 너무 커요', 
'장난감 자체는 정말 좋아하고 잘 가지고 놀아요. 이미 콩에서 나온 오뚜기 장난감을 잘 가지고 놀아 
다른 제품을 사줬던건데 안타깝게도 굴러다니는 소리가 엄청나게 큽니다. 
바닦이 울려서 걱정을 했는데 아니나 다를까 아랫집에서 뭘자꾸 굴리시냐고 올라왔습니다 ㅜㅜ 안타깝네요. 
실외에서 가지고 놀던지 바닦에 매트를 깔던지 해야할듯합니다. 콩은 아무리 굴러다녀도 진동은 없었는데 이건 그러네요.');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 87, 'three', '좋아요 ~~~~!', 
'자체적으로나는 냄새도 없고생각보다 커요~! 
처음엔 크기도크고 사료굴러다니는 소리에 엄청 무서워하고 도망다녔는데 
다음날 바로 적응했어요 ㅋㅋㅋ 뭐라도 할게 생겨서 저도 좋네요 ~ 잘 쓸게요');

/* 터그 */
insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 88, 'three', '애착 터그 강추', 
'경자랑 훈련 갔을때 좋아하길래 구매했어요 역시나 오늘 아침 산책길에도 엄청 좋아하네요 
부드러워서 치아 걱정도 없을것 같고 사료 알맹이도 막 붙어 있네요 ㅎㅎ 
치석제거에도 약간의 도움이 될것 같아요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 88, 'five', '장군이가좋아하는장난감', 
'진돗개키우고있는데. 너무좋앙해요. 두번째 구입이에요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 88, 'four', '공이랑 같이 샀는데 좋아해요', 
'공에 터그 매달아서 놀아주면 완전 신나해요 그래서 사길 잘 한것 같아요 
공 없이 그냥 터그 놀이 하는것도 좋아하고 물고 뜯는거 좋아하는데 이거 가지고 놀면 딱이에요');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 88, 'five', '잘 가지고 놀아요^^', 
'냄새도 안나고 강쥐가 아주 잘 가지고 노네요^^');

insert into product_review(pr_seq, pseq, mid, subject, content, image) 
values( product_seq.nextval, 88, 'four', '터그 놀이가 가능한 진짜 터그장난감!!!!', 
'처음에 터그놀이 하려고 샀던 다른 장난감들은 너무 딱딱하고 커서 제대로 못가지고 놀았는데 
보듬 애착 터그는 포장 뜯자마자 엄청 잘 가지고 놀더라구요~ 
구입한지 한달반 지나는 동안 토리는 쑥쑥 자랐지만 여전히 잘 가지고 놉니다 :) '
, '4_2_tug1_image_1_review.jpg');

insert into product_review(pr_seq, pseq, mid, subject, content) 
values( product_seq.nextval, 88, 'five', '집에 있는다른 거보다', 
'다른 터그 장난감도 있는데 보듬께 최고내요 울아기 애착장난감이 되어버렸어요');
select distinct product_size from product_size where pseq=31;
select * from 


drop table animalfaq purge;
create table animalfaq(
   	aqseq number(5) primary key,
	faqtitle varchar2(1000),
   	faqcontent varchar2(3000),
   	faqtop10 char(1) default 'n',
   	productfaq char(1) default 'n',
   	logistics char(1) default 'n',
   	returns char(1) default 'n'
);
alter table animalfaq drop primary key cascade;
select*from animalfaq;

drop sequence afaq_seq;
create sequence afaq_seq start with 1 increment by 1;
alter table animalfaq rename column aqseq TO afseq;
alter table animalfaq rename column logistics TO logisticsfaq;
alter table animalfaq rename column returns TO returnsfaq;


insert into animalfaq values(afaq_seq.nextval, '품절상품 재입고 일정은 알 수 없나요 ?', '입고 일정은 상품마다 매우 상이하며, 입고 여부가 정해져 있지 않은 경우도 있습니다.

게시판에 문의 글 작성 또는 보듬숍 고객센터로 문의해주시면 안내해드리겠습니다.', 'y', 'y', 'n', 'n');

insert into animalfaq values(afaq_seq.nextval, 'A/S나 수선이 가능한가요 ?', '상세페이지에 기재되어 있듯 별도의 A/S나 수선은 불가합니다.

또한, 부속품만 별도로 판매하고 있지 않습니다.


보듬에서는 구매일 기준 90일 이내 제품이 파손된 보호자님을 위하여 가슴줄에 한하여 ‘가슴줄 보상판매’를 시행하고 있습니다.

구매 30일 이내 제품 파손 시 30% 할인, 구매 90일 이내 제품 파손 시 20% 할인된 금액으로 새 제품을 구매하실 수 있습니다.


* 보상판매를 원하실 시 게시판에 문의 글 작성 또는 보듬숍 고객센터로 문의하시기 바랍니다.', 'y', 'y', 'n','n');
insert into animalfaq values(afaq_seq.nextval, '배송은 언제 시작되나요 ?','평일(월~금) 오전 10시 이전 주문/결제 완료 건에 한하여 당일 출고되며, 이후 주문 건은 익일 발송됩니다.

배송의 경우는 평균적으로 1~2일 내 상품 수령이 가능합니다.

단, 택배사의 사정(연휴 기간, 기상 등)에 따라 배송기간은 차이가 있을 수 있으니 양해부탁드립니다.','y', 'n','y','n');
insert into animalfaq values(afaq_seq.nextval, '기기 변경 횟수가 초과되었다고 나와요.','디바이스 종류(데스크톱, 노트북, 태블릿, 모바일 등)와 무관하게 한 아이디 당 기기 3대까지 이용하실 수 있습니다.
수강 기기 변경 및 초기화를 원하시면 고객센터로 연락주시거나, 마이페이지 내 1:1 문의를 남겨주시기 바랍니다.','y', 'n','n','n');
insert into animalfaq values(afaq_seq.nextval, '방문해서 구매/수령 가능한 곳이 있나요?','보듬숍은 별도의 오프라인 매장을 운영하지 않아, 방문 수령 및 방문 구매는 불가합니다.

온라인(자사 홈페이지 쇼핑몰과 네이버 스토어팜)을 통해서만 구매 가능하신 점 양해 부탁드립니다.

* 남양주 캠퍼스는 ㈜보듬컴퍼니의 교육장으로 방문하셔도 제품 착용, 방문 수령 및 방문 구매는 불가합니다.','y', 'y', 'y','y');
insert into animalfaq values(afaq_seq.nextval, '교환/반품 접수는 어떻게 하나요 ?','자사 쇼핑몰에서 구매 >

마이페이지 - 1:1 문의에서 문의 글 작성 후, 교환/반품 접수


스토어팜(네이버)에서 구매 >

네이버페이 - 결제내역(PC버전)에서 교환/반품 접수


* 위탁판매 상품은 보듬숍 고객센터(1800-6358)를 통한 전화로 교환/반품 접수가 가능합니다.','y', 'y','n','y');

insert into animalfaq values(afaq_seq.nextval, '가슴줄과 리드줄은 세트 상품인가요?', '가슴줄과 리드줄은 별도 판매 상품입니다.

결제를 따로 하시면 각각의 배송비가 별도로 부과됩니다.

묶음 배송을 원하시는 경우 구매 원하시는 상품을 모두 장바구니에 담아 한 번에 결제해주기 바랍니다.', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, '스트라이프 라인과 보듬 가슴줄은 어떤 차이가 있나요?', '가슴줄의 경우 형태는 H형으로 동일하나, 원단이 다릅니다.

* 스트라이프 라인 : 겉면 100% 순면 / 북유럽 유아용품에 사용되는 원단

* 솔리드 라인 : 웨빙 원단 / 일반적으로, 책가방이나 벨트에 사용되는 원단


웨빙 원단의 경우 감촉이 부드럽고 탄탄한 특징이 있으며,

100% 순면 원단은 촉감이 웨빙 원단보다는 좀 더 뻣뻣한 감이 있지만, 웨빙 원단보다 가벼워 반려견에게 부담이 적습니다.', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, '후크형 가슴줄은 다른 가슴줄과 어떤 차이가 있나요 ?', '기존 가슴줄은 머리를 통과시켜 착용하는 반면 후크형 가슴줄은 목걸이를 하듯 뒤쪽에 후크를 걸어 착용합니다.

머리를 통과하는 가슴줄을 불편해하거나, 귀가 줄에 닿는 것을 싫어하는 예민한 반려견에게 추천해드립니다.', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, '가슴줄은 어떤 사이즈가 좋을까요 ?', '가슴줄 사이즈의 경우 같은 체중 또는 견종이어도 체형에 따라 가슴둘레 사이즈가 상이할 수 있습니다.

구매 전 반드시 정확한 가슴둘레를 측정하신 후 상세표 사이즈를 참고 해주시기 바랍니다.', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, '반려견의 몸 둘레 재는 위치를 모르겠습니다.', '* 모든 둘레 및 길이는 cm 단위입니다.

가슴둘레 : 반려견의 앞다리 겨드랑이에서 떨어진 흉곽(가장 두꺼운 부분)을 기준으로 한 바퀴

등 길이 : 반려견의 가슴둘레를 재는 곳(등 쪽)부터 얼굴로 올라가는 길이

목 둘레 : 반려견의 목이 시작되는 가장 두꺼운 지점 한 바퀴

배 둘레 : 사람을 예로 갈비뼈 가장 마지막 부분이 위치 한 곳 기준으로 한 바퀴', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, '가슴줄이 자꾸 돌아가는데, 몸에 딱 맞게 채워야 하나요 ?', '가슴줄 착용 시 딱 맞게 착용하는 것보다 리드줄 방향에 따라 자연스럽게 좌우로 움직이는 정도가 좋습니다.

가슴줄이 돌아가는 것은 상품 불량으로 인한 치우침이 아닌 이상적인 상태입니다.

* 보호자님의 손가락 2~3개 정도가 들어갈 수 있는 정도의 여유 공간을 남긴 후 채워주시기 바랍니다.', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, '가슴줄이 쓸리지는 않을까요 ?', '반려견의 신체 구조에 가장 적합한 H 형태의 가슴줄로 겨드랑이 쪽에 마찰이 가지 않도록 설계되어 있습니다.

반려견에게 가슴줄을 너무 딱 맞게 착용시켰을 시 피부가 쓸릴 수 있으며, 리드줄의 방향에 따라 좌우로 자연스럽게 움직일 수 있도록 길이 조절을 해 주시기 바랍니다.', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, '반려견이 당기면 가슴 부분에 압박이 가지 않을까요 ?', '보듬에서 판매 중인 모든 H형 가슴줄은 목, 가슴, 등, 배를 전체적으로 감싸주어 당겨질 때의 충격을 최대한 분산시켜주도록 제작되었습니다.', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, '리드줄 길이는 몇 미터가 좋을까요 ?', '리드줄의 길이는 보호자님의 핸들링 숙련도와 산책 장소에 따라 정해주시는 게 좋습니다.

보듬에서는 견종과 체중 등에 상관없이 길이 3미터 리드줄을 권장해 드리고 있으며, 5미터 이상은 넓은 공터나 운동장 등에서 반려견이 최대한 자유롭게 산책시키는 경우 추천해드립니다.', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, '리드줄 후크 종류가 많은데 어떻게 골라야하나요?', '상세 페이지에 기재되어 있는 권장 몸무게에 맞게 선택해주시되, 각 반려견의 특성을 고려하여 선택해주시기 바랍니다.

* P후크 : 일본 반려견 시장에서 사용 중인 제품으로 일반 국산후크보다 내구성이 좋으며, 가벼워 반려견에게 부담이 적습니다.

* HS후크 : 끄는 힘이 매우 강한 반려견 또는 대형견의 경우, 국산후크 리드줄 사용 시 파손의 위험이 있어, 독일 HS사에서 제작된 내구성이 매우 좋은 HS후크를 고려하여 주시기 바랍니다.', 'n', 'y', 'n', 'n');


insert into animalfaq values(afaq_seq.nextval, '주말에도 배송하나요 ?' , '보듬숍의 계약 택배사 로젠택배는 토요일에도 배송업무를 하고 있습니다.

* 교환/반품 택배 수거의 경우 평일만 적용.', 'n', 'n', 'y', 'n');
insert into animalfaq values(afaq_seq.nextval, '[묶음 배송] 주문을 따로 하면 배송비가 또 발생하나요?', '묶음 배송을 원하시는 경우 구매 원하시는 상품을 모두 장바구니에 담아 한 번에 결제해주셔야만 가능합니다.

단, 위탁판매 및 묶음 배송 불가 제품의 경우에는 별도의 배송비가 적용될 수 있습니다.', 'n', 'n', 'y', 'n');
insert into animalfaq values(afaq_seq.nextval, '배송 전 주소 변경 가능한가요 ?', '택배 발송 전까지 1:1 게시판에 남겨주시거나, 보듬숍 고객센터로 연락해주시면 주소 변경이 가능합니다.

단, 택배가 발송된 후에는 주소 변경이 불가합니다.', 'n', 'n', 'y', 'n');
insert into animalfaq values(afaq_seq.nextval, '배송완료라고 뜨는데 물건을 못 받았어요.' , '간혹 기사님께서 소화전이나 무인 택배함 또는 경비실에 맡기시는 경우가 있습니다.

위의 장소 확인 후에도 물건을 수령하지 못하셨다면 보듬숍 고객센터로 문의하시기 바랍니다.', 'n', 'n', 'y', 'n');
insert into animalfaq values(afaq_seq.nextval, '유선 주문 가능한가요 ?' , '온라인(자사 쇼핑몰과 네이버 스토어팜)을 통해서만 구매 가능하신 점 양해 부탁드립니다.

자사 쇼핑몰은 별도의 회원가입 없이 ‘비회원 구매’가 가능합니다.', 'n', 'n', 'y', 'n');
insert into animalfaq values(afaq_seq.nextval, '비회원 주문을 했는데 주문번호를 모르겠어요.' , '주문하실 때 입력하셨던 주문자명, 수취인명, 연락처, 주문하신 상품을 게시판이나 보듬숍 고객센터로 문의해주시면 주문번호를 안내해드리겠습니다.', 'n', 'n', 'y', 'n');
insert into animalfaq values(afaq_seq.nextval, '교환/반품처리 기간은 얼마나 걸리나요 ?', '교환/반품 완료까지 접수 후 약 4~5일 정도 소요됩니다.

교환/반품 처리 기간은 상품에 따라 다를 수 있으며, 재고 여부(교환 시) 및 택배사와 위탁판매 업체 사정에 의해 처리 및 배송이 지연될 수 있습니다.

접수일 기준으로 통상 3일 이내 택배 수거 지시가 이루어지며, 보듬 측으로 제품 회수 후 반품 및 교환 원하시는 상품으로 재배송해드리고 있습니다.', 'n', 'n', 'n', 'y');
insert into animalfaq values(afaq_seq.nextval, '[교환/반품 주소] 교환/반품은 어디로 보내면 되나요?', '교환/반품할 경우에는 수령한 제품의 택배 송장에 기재되어 있는 업체 주소지로 반품해야 합니다.

위탁 판매 제품의 경우, 위탁 업체에 따라 교환/반품 주소와 배송비 및 환불 규정이 다를 수 있습니다.

반드시 보듭숍 고객센터(1800-6358)를 통한 전화접수 후에 교환/반품이 가능합니다.', 'n', 'n', 'n', 'y');
insert into animalfaq values(afaq_seq.nextval, '[교환/반품 주소] 교환/반품은 어디로 보내면 되나요?', '교환/반품할 경우에는 수령한 제품의 택배 송장에 기재되어 있는 업체 주소지로 반품해야 합니다.

위탁 판매 제품의 경우, 위탁 업체에 따라 교환/반품 주소와 배송비 및 환불 규정이 다를 수 있습니다.

반드시 보듭숍 고객센터(1800-6358)를 통한 전화접수 후에 교환/반품이 가능합니다.



[교환/반품 주소 안내]

* 택배 수령 시, ‘㈜보듬컴퍼니’에서 보낸 제품일 경우

경기도 남양주시 와부읍 덕소리 283-21 ㈜보듬컴퍼니' , 'n', 'n', 'n', 'y');
insert into animalfaq values(afaq_seq.nextval, '새 제품 텍이 떨어졌는데 교환/반품이 가능한가요?', '상세페이지에도 기재되어 있듯이 텍이 훼손되면 상품 가치 하락으로 재판매가 어려우므로 교환/반품이 불가합니다.

특히, 수입상품(하키하나, 니나오토슨, 멜슨 등)은 텍 훼손, 제품 박스 개봉만으로 교환/반품이 절대 불가하니 이점 참고하여 주시기 바랍니다.', 'n', 'n', 'n', 'y');

insert into animalfaq values(afaq_seq.nextval, '리드줄이 끊어지진 않을까요 ?', '반려견이 입으로 물지 않는 이상 산책 중 리드줄이 끊어지는 경우는 발생하기 힘드나, 가슴줄과 리드줄은 소모품으로서 땅에 자주 끌리게 두시거나, 나무 등에 묶어 놓으시는 경우 파손 가능성이 높아질 수 있습니다.

* 산책이 끝난 후에는 가슴줄과 리드줄을 물지 않도록 안전한 곳에 보관해주세요.', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, '가슴줄과 리드줄 세탁은 어떻게 하나요 ?', '약 30˚가량의 미온수에서 중성 세제를 이용해 단독 손세탁 후 그늘건조를 권장 해 드리고 있습니다.

* 기계건조금지

* 염소표백금지', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, 'A/S나 수선이 가능한가요 ?', '상세페이지에 기재되어 있듯 별도의 A/S나 수선은 불가합니다.

또한, 부속품만 별도로 판매하고 있지 않습니다.


보듬에서는 구매일 기준 90일 이내 제품이 파손된 보호자님을 위하여 가슴줄에 한하여 ‘가슴줄 보상판매’를 시행하고 있습니다.

구매 30일 이내 제품 파손 시 30% 할인, 구매 90일 이내 제품 파손 시 20% 할인된 금액으로 새 제품을 구매하실 수 있습니다.


* 보상판매를 원하실 시 게시판에 문의 글 작성 또는 보듬숍 고객센터로 문의하시기 바랍니다.', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, '코담요의 먼지와 보풀이 반려견에게 해롭지 않을까요?', '코담요는 원단 특성상 어느 정도 먼지와 보풀이 일어날 수 있습니다.

사용 전 세탁(빨래망 사용, 단독세탁, 중성세제 사용, 자연건조)을 권장해드리고 있습니다.

2~3회 세탁 후에는 먼지가 현저히 줄어드는 것을 확인하실 수 있으나, 반려견이 코담요에 소변을 보지 않는 이상 너무 잦은 세탁보다는 먼지 제거기로 평소에 가볍게 관리해주시기 바랍니다.

코를 통해 세상을 인식하는 반려견들은 사람이 생각하는 것보다 훨씬 더 먼지와 자극적인 냄새 등을 걸러내는 데 익숙합니다.

후각 활동을 하다 보면 하얀색 물이 코에서 떨어지는 등 반려견의 코는 손상과 이물질을 막기 위한 장치가 되어 있어, 코담요에서 나오는 먼지가 반려견이 냄새를 맡거나 먹었을 때 큰 문제를 일으키지 않습니다.', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, '코방석 솜 꺼짐은 없나요 ?', '코방석 충전재인 솜의 경우 100% 폴리에스터로 복원력이 뛰어나다는 장점이 있습니다.

부드러운 솜을 압축하여 꽉 채웠기 때문에 일반적인 꺼짐 현상은 거의 없으나 1~2년 사용 후 꺼짐이 발생한다면 솜이 살아날 수 있게 올바른 세탁법으로 세탁해주시기 바랍니다.', 'n', 'y', 'n', 'n');
insert into animalfaq values(afaq_seq.nextval, '코방석/코담요를 다른 제품과 묶음 배송이 가능한가요 ?', '코방석/코담요는 크기가 커서 주문 전 이미 개별 포장이 되어 있습니다.

그러므로 다른 제품과 함께 주문하셔도 합포장이 불가하여 별도의 배송비가 발생하는 점 참고 부탁드립니다.', 'n', 'y', 'n', 'n');

select*from animalfaq;


select * from product order by indate desc;