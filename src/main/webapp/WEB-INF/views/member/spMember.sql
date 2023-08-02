show tables;

create table spmember (
  idx      int not null auto_increment, 	/* 회원 고유번호 */
  mid      varchar(20) not null,					/* 회원 아이디(중복불허) */
  pwd      varchar(100) not null,					/* 회원 비밀번호(SHA256 암호화 처리) */
  nickName varchar(20) not null,					/* 회원 별명(중복불허/수정가능) */
  name     varchar(20) not null,					/* 회원 성명 */
  gender   varchar(4) default '남자',    	/* 회원 성별 */
  birthday datetime default now(),				/* 회원 생일 */
  tel			 varchar(15) not null,										/* 전화번호(010-1234-5678) */
  email    varchar(50) not null,					/* 이메일(아이디/비밀번호 분실시에 사용)-형식체크필수 */    
  photo		 varchar(100) default 'noimage.jpg',	/* 회원 사진 */  
  userDel   char(2) default 'NO',					/* 회원 탈퇴신청여부(NO:현재 활동중, OK:탈퇴신청중) */
  point			int default 100,							/* 회원 누적포인트(가입포인트100증정, 1회방문시 10포인트증가, 1일 최대 50점까지 증가 */
  level     int default 4, 							/* 회원등급(0:관리자, 1:우수회원, 2:정회원, 3:준회원) */
  visitCnt  int default 0,							/* 총 방문횟수 */
  startDate datetime default now(),			/* 최초 가입일 */  
  todayCnt  int default 0,							/* 오늘 방문한 횟수 */
  primary key (idx),										/* 주키 : idx(고유번호) */
  unique key (mid)											/* 중복방지키 : mid */
);

desc spMember;
show tables;
drop table spMember;

select * from spMember;
insert into spmember values (default,'admin','1234','관리자','관리자','de','2023-05-06','de','de','de',default,default,default,default,default,default);
/* 회원 실시간 대화를 위한 테이블 */
create table spMemberChat (
  idx   int  not null auto_increment primary key,
  nickName varchar(20) not null,
  chat  varchar(100) not null
);
desc spMemberChat;