/* 테이블 생성 후 admin생성 */
INSERT INTO CHAIN_LIST VALUES('admin', 'admin', '관리자');

/* 체인점 리스트 */
CREATE TABLE chain_list (
   chain_id VARCHAR2(50) NOT NULL, /* 체인점ID */
   chain_pwd VARCHAR2(50), /* 비밀번호 */
   chain_name VARCHAR2(50) NOT NULL /* 체인점명 */
);

/* 기본정보  */
CREATE TABLE basic_info (
   chain_id VARCHAR2(50) NOT NULL, /* 체인점ID */
   address VARCHAR2(255), /* 주소 */
   open_date DATE, /* 오픈일 */
   chain_phone VARCHAR2(50), /* 연락처 */
   license_num VARCHAR2(50), /* 사업자등록번호 */
   capital NUMBER, /* 자본금 */
   bank VARCHAR2(30), /* 은행명 */
   bank_num VARCHAR2(50), /* 계좌번호 */
   img VARCHAR2(200) /* 이미지 */
);

DROP TABLE empl_list;
/* 사원 리스트 */
CREATE TABLE empl_list (
   chain_id VARCHAR2(50) NOT NULL, /* 체인점ID */
   empl_num NUMBER NOT NULL, /* 사원번호 */
   empl_name VARCHAR2(30) NOT NULL, /* 사원명 */
   empl_rank VARCHAR2(50) NOT NULL, /* 사원등급 */
   empl_phone VARCHAR2(100), /* 사원 연락처 */
   img VARCHAR2(200), /* 이미지 */
   hour_pay NUMBER, /* 시급 */
   month_pay NUMBER, /* 월급 */
   pay_date VARCHAR2(30) NOT NULL, /* 급여일 */
   join_date DATE NOT NULL, /* 입사일 */
   resign_date DATE DEFAULT '0001-01-01' /* 퇴사일 */
);

DROP TABLE empl_attend;
/* 사원 출결부 */
CREATE TABLE empl_attend (
   yyyy NUMBER NOT NULL, /* 년도 */
   mm NUMBER NOT NULL, /* 월 */
   dd NUMBER NOT NULL, /* 일 */
   chain_id VARCHAR2(50) NOT NULL, /* 체인점ID */
   empl_num NUMBER NOT NULL, /* 사원번호 */
   empl_name VARCHAR2(30) NOT NULL, /* 사원명 */
   empl_rank VARCHAR2(50) NOT NULL, /* 사원등급 */
   start_time VARCHAR2(50), /* 출근시간 */
   end_time VARCHAR2(50),   /* 퇴근시간 */
   basic_time NUMBER, /* 근무시간(정상) */
   extra_time NUMBER, /* 근무시간(연장) */
   note VARCHAR2(300) /* 비고 */
);

DROP TABLE empl_salary_month;
/* 사원급여(정규직) */
CREATE TABLE empl_salary_month (
   yyyy NUMBER NOT NULL, /* 년도 */
   mm NUMBER NOT NULL, /* 월 */
   chain_id VARCHAR2(50) NOT NULL, /* 체인점ID */
   empl_num NUMBER NOT NULL, /* 사원번호 */
   empl_name VARCHAR2(30) NOT NULL, /* 사원명 */
   basic_pay NUMBER NOT NULL, /* 기본급 */
   extra_pay NUMBER, /* 추가수당 */
   deduct1 NUMBER, /* 국민연금 */
   deduct2 NUMBER, /* 고용보험 */
   deduct3 NUMBER, /* 건강보험 */
   deduct4 NUMBER, /* 소득세 */
   deduct5 NUMBER, /* 주민세 */
   total_pay NUMBER, /* 수당 합 */
   deduct_pay NUMBER, /* 공제금 */
   total_deduct NUMBER, /* 공제 합 */
   total_salary NUMBER NOT NULL, /* 총 급여 */
   mon_pay_day DATE /* 급여 지급일 */
);

DROP TABLE empl_salary_day;
/* 사원급여 (비정규직) */
CREATE TABLE empl_salary_day (
   yyyy NUMBER NOT NULL, /* 년도  */
   mm NUMBER NOT NULL, /* 월 */
   chain_id VARCHAR2(50) NOT NULL, /* 체인점ID */
   empl_num NUMBER NOT NULL, /* 사원번호 */
   empl_name VARCHAR2(30) NOT NULL, /* 사원명 */
   sum_basic_time NUMBER NOT NULL, /* 정상근무시간 합 */
   sum_extra_time NUMBER, /* 연장근무시간 합 */
   total_basic_pay NUMBER, /* 정상기본급 합 */
   total_extra_pay NUMBER, /* 연장기본급 합 */
   total_pay NUMBER, /* 급여 합 */
   dedect NUMBER,  /* 4대보험공제 */
   total_salary NUMBER, /* 실제 수령 급여 */
   day_pay_date DATE NOT NULL /* 급여 지급일 */
);

/* 본사 재고목록 */
CREATE TABLE company_stock_list (
   stock_name VARCHAR2(50) NOT NULL, /* 제품명  */
   stock_price NUMBER NOT NULL /* 제품가격 */
);

/* 체인점 재고목록  */
CREATE TABLE stock_manage (
   stock_name VARCHAR2(50) NOT NULL, /* 제품명 */
   stock_price NUMBER NOT NULL, /* 제품가격 */
   chain_id VARCHAR2(50), /* 체인점ID */
   stock_quantity NUMBER /* 제품수량 */
);

/* 입출고 목록 */
CREATE TABLE stock_list (
   stock_list_num NUMBER NOT NULL, /* 입출고 번호 */
   stock_name VARCHAR2(50), /* 제품명 */
   stock_price NUMBER, /* 제품가격 */
   chain_id VARCHAR2(50), /* 체인점ID */
   order_quantity NUMBER, /* 주문 수량 */
   order_date DATE, /* 주문일 */
   in_date DATE, /* 입고일 */
   out_date DATE, /* 출고일 */
   in_state VARCHAR2(10), /* 입고현황 */
   out_state VARCHAR2(10) /* 출고현황 */
);
DROP TABLE  sale_item;
/* 판매 제품 */
CREATE TABLE sale_item (
   state NUMBER DEFAULT 0,
    item_name VARCHAR2(50) NOT NULL, /* 제품명 */
    item_price NUMBER NOT NULL, /* 제품번호 */
    item_recipe VARCHAR2(4000) NOT NULL,
    chain_id VARCHAR2(50)
);

DROP TABLE sale_list;
/* 판매 목록 */
CREATE TABLE sale_list (
   chain_name VARCHAR2(50), /* 체인점NAME */
   sale_number NUMBER NOT NULL, /* 판매 번호 */
   item_name VARCHAR2(50) NOT NULL, /* 제품명 */
   item_price NUMBER NOT NULL, /* 제품가격 */
   mem_num varchar2(100), /* 회원번호 */
   sale_date DATE, /* 판매일 */
   pay_state VARCHAR2(30), /* 결제수단 */
   totalpay NUMBER, /* 합계가격 */
   margin NUMBER, /* 마진 */
   count NUMBER /* 카운트 */
);

/* 회원목록 */
CREATE TABLE mem_list (
   mem_num varchar2(100) NOT NULL, /* 회원번호 */
   mem_name VARCHAR2(50), /* 회원명 */
   mem_email VARCHAR2(100), /* 회원 email */
   mem_phone VARCHAR2(100), /* 회원연락처 */
   mem_rank VARCHAR2(50) /* 회원등급 */
);

/* 상품카드  */
create table giftcard(
   giftcardnumber varchar2(20) primary key,
   giftcardprice number not null
);

/* 일일 정산 */
CREATE TABLE day_adjust (
   chain_id VARCHAR2(50) NOT NULL, /* 체인점ID */
   day_date DATE, /* 정산 날짜 */
   total_sales NUMBER, /* 총 판매액 */
   net_gain NUMBER, /* 순수익 */
   cur_capital NUMBER /* 현재 자본금 */
);

create table day_adjust_exp (
   chain_id varchar2(50) not null,
   day_date date,
   exp_name varchar2(50),
   exp_price number
);

/* 일정 */
CREATE TABLE events (
   event_id NUMBER NOT NULL, /* 이벤트ID */
   event_name VARCHAR2(127) NOT NULL, /* 이벤트명  */
   start_date VARCHAR2(100) NOT NULL, /* 시간시간  */
   end_date VARCHAR2(100) NOT NULL, /* 종료시간  */
   chain_id VARCHAR2(50) /* 체인점ID */
);

/* 메세지  */
CREATE TABLE message (
   messageNumber NUMBER NOT NULL, /* 메세지 번호 */
   sendId VARCHAR2(50), /* 보내는 체인점ID */
   receiveId VARCHAR2(50), /* 받는 체인점ID */
   contents VARCHAR2(1000), /* 내용 */
   writedate DATE, /* 발신시간*/
   readstate NUMBER, /* 읽음상태 */
   deleterequestid VARCHAR2(50) /* 삭제상태 */
);

/* 공지사항 게시판 */
CREATE TABLE noti_board (
   noti_num NUMBER NOT NULL, /* 글번호 */
   noti_title VARCHAR2(70), /* 제목 */
   noti_content VARCHAR2(2000), /* 내용 */
   noti_date DATE /* 작성일 */
);

/* Q&A 게시판 */
CREATE TABLE qna_board (
   chain_name VARCHAR2(50), /* 체인점ID */
   qna_num NUMBER NOT NULL, /* 글번호 */
   qna_title VARCHAR2(70), /* 제목 */
   qna_qcontent VARCHAR2(2000), /* Q내용  */
   qna_acontent VARCHAR2(2000), /* A내용 */
   qna_date DATE /* Q작성일 */
);

/* 공과금 table */
create table dues(
   chain_id varchar2(50) not null, -- chain Id
   water_price number, -- 수도세
   electronic_price number, -- 전기세
   gas_price number, -- 가스비
   rentPay number, -- 임대료
   companyPay number, -- 본사에 줘야할 금액(지난달 판매액의 1/10)
   issuedDate date, -- 납부 요청일
   payDate date -- 납부한 날짜
);

create table giftcard(
giftcardnumber varchar2(20) primary key,
giftcardprice number not null
);

-- 알람 테이블
create table alarm(
chain_id varchar2(50) not null,
readState number not null,
reason varchar2(200) not null
);


/* 아이디어 게시판 테이블 */
CREATE TABLE idea_board (
   idea_title varchar2(200),
   idea_num NUMBER NOT NULL, 
   mem_name VARCHAR2(50), 
   idea_date date,
   idea_readcount NUMBER, 
   idea_content VARCHAR2(4000),
   idea_state VARCHAR2(100)
);
