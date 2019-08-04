------------------------------------------ member sql
select * from team3_member;
drop table team3_member;

CREATE TABLE team3_member(
memberID VARCHAR2(20) PRIMARY KEY,
memberPWD VARCHAR2(20),
memberName VARCHAR2(20),
memberEmail VARCHAR2(20),
memberPhone VARCHAR2(20)
);

commit;
------------------------------------------ board sql
select * from team3_board;
drop table team3_board;

create table team3_board (
boardNum number primary key,
boardTitle VARCHAR2(20),
boardContent VARCHAR2(2024),
boardPresent number,
boardDate DATE
);
------------------------------------------