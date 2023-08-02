create table banner(
	idx INT NOT NULL AUTO_INCREMENT,
	imageFile varchar(100) not null,
	photoPosition varchar(100) not null,
	photoRoute INT NOT NULL,
	PRIMARY KEY (idx)
);

CREATE TABLE notice(
	idx INT NOT NULL AUTO_INCREMENT,
	topBanner VARCHAR(50) NOT NULL,
	PRIMARY KEY (idx)
);

