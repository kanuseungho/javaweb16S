CREATE TABLE returns (
  idx INT NOT NULL AUTO_INCREMENT,
  mid VARCHAR(30) NOT NULL,
  productCode VARCHAR(30) NOT NULL,
  email VARCHAR(30) NOT NULL,
  fName VARCHAR(100) NOT NULL,
  category VARCHAR(100) NOT NULL,
  message VARCHAR(100) NOT NULL,
  returnStus VARCHAR(30) NOT NULL DEFAULT '미답장',
  reMessage VARCHAR(300) NOT NULL DEFAULT '대기중',
  memberReCheck VARCHAR(20) DEFAULT 'OK',
  PRIMARY KEY (idx)
);

drop table returns;
