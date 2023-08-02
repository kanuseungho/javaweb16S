create table visit (
  visitDate datetime not null default now(),
  visitCount			int  not null default 1
);
CREATE TABLE coupons (
  idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  couponCode VARCHAR(100) NOT NULL,
  couponName VARCHAR(100) NOT NULL,
  couponAmount VARCHAR(100) NOT NULL,
  expirationDate DATE NOT NULL,
  couponMid VARCHAR(50) default "mid",
  couponStu VARCHAR(10) default "NO"  
);

CREATE TABLE review (
  idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  star VARCHAR(50) NOT NULL,
  agreement1 VARCHAR(30) NOT NULL,
  agreement2 VARCHAR(30) DEFAULT 'NO',
  reviewText VARCHAR(500) NOT NULL,
  freviewSAName VARCHAR(500) NOT NULL,
  baesongIdx INT,
  baesongoIdx INT,
  choiceAgreement VARCHAR(10),
  reviewStu VARCHAR(10)  
);



drop table review;
delete from visit;

select now();
select date(now());

insert into visit values (date(now()),default);
insert into visit values ('2023-06-30',8);
insert into visit values ('2023-06-28',5);
insert into visit values ('2023-06-25',10);
insert into visit values ('2023-06-26',12);
insert into visit values ('2023-06-24',5);
insert into visit values ('2023-06-23',3);
insert into visit values ('2023-06-21',15);

select * from visit;
select substring(visitDate,1,10) as visitDate, visitCount from visit order by visitDate desc limit 7;

select mid as visitDate,visitCnt as visitCount from member2 order by visitCnt desc limit 7;