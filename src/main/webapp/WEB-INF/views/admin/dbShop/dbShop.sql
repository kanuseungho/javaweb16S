show tables;

/* 대분류 */
create table categoryMain (
  categoryMainCode  char(1) not null,			/* 대분류코드(A,B,C,.... => 영문 대문자 1자 */
  categoryMainName  varchar(20) not null, /* 대분류명(회사명 => 현대/삼성/LG... */
  primary key(categoryMainCode),
  unique key(categoryMainName)
);

/* 중분류 */
create table categoryMiddle (
  categoryMainCode  char(1) not null,				/* 대분류코드를 외래키로 지정 */
  categoryMiddleCode  char(2) not null,			/* 중분류코드(01,02,03,.... => 숫자(문자형식) 2자리 */
  categoryMiddleName  varchar(20) not null, /* 중분류명(제품분류명 => 전자제품/의류/신발류/차종.. */
  primary key(categoryMiddleCode),
  foreign key(categoryMainCode) references categoryMain(categoryMainCode)
);

/* 소분류 */
create table categorySub (
  categoryMainCode  char(1) not null,			/* 대분류코드를 외래키로 지정 */
  categoryMiddleCode  char(2) not null,		/* 중분류코드를 외래키로 지정  */
  categorySubCode  char(3) not null,			/* 소분류코드(001,002,003,... =>숫자(문자형식의) 3자리)  */
  categorySubName  varchar(20) not null, 	/* 소분류명(상품구분 => 중분류가 '전자제품'이라면? 냉장고/에어컨/오디오/TV...  */
  primary key(categorySubCode),
  foreign key(categoryMainCode) references categoryMain(categoryMainCode),
  foreign key(categoryMiddleCode) references categoryMiddle(categoryMiddleCode)
);

/* 세분류(상품 테이블) */
create table dbProduct (
  idx   int not null,		/* 상품 고유번호 */
  categoryMainCode  char(1) not null,		/* 대분류코드를 외래키로 지정 */
  categoryMiddleCode  char(2) not null,	/* 중분류코드를 외래키로 지정  */
  categorySubCode  char(3) not null,		/* 소분류코드를 외래키로 지정  */
	productCode  varchar(20) not null,		/* 상품고유코드(대분류코드+중분류코드+소분류코드+상품고유번호) 예: A 05 002 5) */
	productName  varchar(50) not null,		/* 상품명(상품모델명) - 세분류 */
	detail			varchar(500) not null,		/* 상품의 간달설명(초기화면출력에 필요) */
	mainPrice		int not null,							/* 상품의 기본가격 */
	fSName			varchar(200) not null,		/* 상품의 기본사진(1장이상 처리시에는 '/'로 구분 저장한다. */
	content			text not null,						/* 상품의 상세설명 - ckeditor를 이용한 이미지 1장으로 처리한다. */
	productDel CHAR(10) default 'NO', /*제품의 상태, 삭제나 기타등등*/
	sale VARCHAR(50) default 'NO', /*세일*/
	salePrice INT,
	salePercent INT,
	WDate DATETIME DEFAULT CURRENT_TIMESTAMP, /*제품 등록날짜*/
	primary key(idx),
	unique  key(productCode,productName),
  FOREIGN KEY (categoryMainCode) REFERENCES categoryMain(categoryMainCode) ON DELETE CASCADE,
  FOREIGN KEY (categoryMiddleCode) REFERENCES categoryMiddle(categoryMiddleCode) ON DELETE CASCADE,
  FOREIGN KEY (categorySubCode) REFERENCES categorySub(categorySubCode) ON DELETE CASCADE
);
ALTER TABLE dbProduct MODIFY COLUMN detail VARCHAR(500);

CREATE TABLE dbProductContent (
	idx INT NOT NULL AUTO_INCREMENT,
	pro_idx INT NOT NULL,
	brend VARCHAR(50),
	disingenuous VARCHAR(50),
	recipe VARCHAR(50),
	size VARCHAR(50),
	PRIMARY KEY (idx),
	FOREIGN KEY (pro_idx) REFERENCES dbProduct(idx) ON DELETE CASCADE,
	INDEX (pro_idx)
);
/* 상품 옵션 */
CREATE TABLE dbOption (
  idx         int not null auto_increment, /* 옵션 고유번호 */
  productIdx  int not null,               /* product테이블(상품)의 고유번호 - 외래키 지정 */
  optionName  varchar(50) not null,       /* 옵션 이름 */
  optionPrice int not null default 0,     /* 옵션 가격 */
  primary key(idx),
  foreign key(productIdx) references dbProduct(idx) ON DELETE CASCADE
);


create table dbCart (
  idx   int not null auto_increment,			/* 장바구니 고유번호 */
  cartDate datetime default now(),				/* 장바구니에 상품을 담은 날짜 */
  mid   varchar(20) not null,							/* 장바구니를 사용한 사용자의 아이디 - 로그인한 회원 아이디이다. */
  productIdx  int not null,								/* 장바구니에 구입한 상품의 고유번호 */
  productName varchar(50) not null,				/* 장바구니에 담은 구입한 상품명 */
  mainPrice   int not null,								/* 메인상품의 기본 가격 */
  thumbImg		varchar(100) not null,			/* 서버에 저장된 상품의 메인 이미지 */
  optionIdx	  varchar(50)	 not null,			/* 옵션의 고유번호리스트(여러개가 될수 있기에 문자열 배열로 처리한다.) */
  optionName  varchar(100) not null,			/* 옵션명 리스트(배열처리) */
  optionPrice varchar(100) not null,			/* 옵션가격 리스트(배열처리) */
  optionNum		varchar(50)  not null,			/* 옵션수량 리스트(배열처리) */
  totalPrice  int not null,								/* 구매한 모든 항목(상품과 옵션포함)에 따른 총 가격 */
  primary key(idx,mid),
  /* unique key(mid), */
  foreign key(productIdx) references dbProduct(idx) on update cascade on delete restrict
  /* foreign key(mid) references member2(mid) on update cascade on delete cascade */
);

create table dbOrder (
  idx         int not null auto_increment, /* 고유번호 */
  orderIdx    varchar(15) not null,   /* 주문 고유번호(새롭게 만들어 주어야 한다.) */
  mid         varchar(20) not null,   /* 주문자 ID */
  productIdx  int not null,           /* 상품 고유번호 */
  orderDate   datetime default now(), /* 실제 주문을 한 날짜 */
  productName varchar(50) not null,   /* 상품명 */
  mainPrice   int not null,				    /* 메인 상품 가격 */
  thumbImg    varchar(100) not null,   /* 썸네일(서버에 저장된 메인상품 이미지) */
  optionName  varchar(100) not null,  /* 옵션명    리스트 -배열로 넘어온다- */
  optionPrice varchar(100) not null,  /* 옵션가격  리스트 -배열로 넘어온다- */
  optionNum   varchar(50)  not null,  /* 옵션수량  리스트 -배열로 넘어온다- */
  totalPrice  int not null,					  /* 구매한 상품 항목(상품과 옵션포함)에 따른 총 가격 */
  /* cartIdx     int not null,	*/		/* 카트(장바구니)의 고유번호 */ 
  primary key(idx, orderIdx),
  foreign key(mid) references spmember(mid),
  foreign key(productIdx) references dbProduct(idx)  on update cascade on delete cascade
);
create table dbBaesong (
  idx     int not null auto_increment,
  oIdx    int not null,								/* 주문테이블의 고유번호를 외래키로 지정함 */
  orderIdx    varchar(15) not null,   /* 주문 고유번호 */
  orderTotalPrice int     not null,   /* 주문한 모든 상품의 총 가격 */
  mid         varchar(20) not null,   /* 회원 아이디 */
  name				varchar(20) not null,   /* 배송지 받는사람 이름 */
  address     varchar(100) not null,  /* 배송지 (우편번호)주소 */
  tel					varchar(15),						/* 받는사람 전화번호 */
  message     varchar(100),						/* 배송시 요청사항 */  
  payment			varchar(10)  not null,	/* 결재도구 */
  payMethod   varchar(50)  not null,  /* 결재도구에 따른 방법(카드번호) */
  orderStatus varchar(10)  not null default '결제완료', /* 주문순서(결제완료->배송중->배송완료->구매완료) */
  baesongImg  varchar(500) not null,
  membership  varchar(50),
  membershipPrice  int,
  primary key(idx),
  foreign key(oIdx) references dbOrder(idx) on update cascade on delete cascade
);
create table subTitle(
 idx int auto_increment,
 homeSubTitle varchar(30) not null,
 homeSubTitleText varchar(30) not null,
 primary key (idx) 
);

CREATE TABLE likeGood (
  idx          INT NOT NULL AUTO_INCREMENT, /* 찜하기 고유번호 */
  productIdx INT NOT NULL,                         /* 찜한 레시피 연결 외래키 */
  memberMid VARCHAR(20) NOT NULL,             /* 찜한 사용자 연결 외래키 */
  PRIMARY KEY (idx),
  FOREIGN KEY (productIdx) REFERENCES dbProduct (idx) on update cascade on delete cascade,
  FOREIGN KEY (memberMid) REFERENCES spmember (mid) on update cascade on delete cascade
);   
drop table dbProduct;
drop table dbBaesong;
drop table dbOrder;
drop table dbCart;
drop table dbOption;
drop table dbProductContent;
drop table categorySub;
drop table categoryMiddle;
drop table categoryMain;

select * from categoryMiddle where categoryMainCode = 'A';
