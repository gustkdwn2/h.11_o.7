DROP TABLE mem_list;
CREATE TABLE sale_item (
   state NUMBER DEFAULT 0,
    item_name VARCHAR2(50) NOT NULL, /* 제품명 */
    item_price NUMBER NOT NULL, /* 제품번호 */
    item_recipe VARCHAR2(4000) NOT NULL,
    chain_id VARCHAR2(50)
);
insert into giftcard values('sdf',50000);
select * from MEM_LIST;
update SALE_LIST set mem_num='3-3-3-3';
alter table SALE_LIST modify(mem_num varchar2(50));
select * from MEM_LIST where mem_name = '김예현';
update MEM_LIST set mem_email='akaeuka@naver.com' where mem_name='김예현';

insert into sale_item values(0,'아메리',3000,'레시피','gangnam/pangyo/songpa');
select chain_name, chain_list.chain_id from chain_list,BASIC_INFO where BASIC_INFO.chain_id=CHAIN_LIST.chain_id;
CREATE TABLE mem_list (
   mem_num varchar2(100) NOT NULL, /* 회원번호 */
   mem_name VARCHAR2(50), /* 회원명 */
   mem_email VARCHAR2(100), /* 회원 email */
   mem_phone VARCHAR2(100), /* 회원연락처 */
   mem_rank VARCHAR2(50), /* 회원등급 */
   mem_pwd VARCHAR2(100)
);
drop table idea_board;
insert into mem_list (mem_num) values('3-3-3-3');
update MEM_LIST set mem_rank='WelcomLevel' where mem_name='김예현';
update MEM_LIST set mem_email='a@a.a' where mem_name='kim';
select * from BASIC_INFO;
select img,address,chain_phone from BASIC_INFO where chain_id=(select chain_id from CHAIN_LIST where chain_name='강남점');
update idea_board set idea_readcount=idea_readcount+1 where idea_num=1;
CREATE TABLE idea_board (
   idea_title varchar2(200),
   idea_num NUMBER, 
   mem_name VARCHAR2(50), 
   idea_date date,
   idea_readcount NUMBER, 
   idea_content VARCHAR2(4000),
   idea_state VARCHAR2(100)
);
insert into IDEA_BOARD values('관리자의 공지입니다',0,'관리자',sysdate,0,'ㅇㅇ','공지');
create sequence idea_board_seq start with 1 increment by 1;