/* 게시판 */
CREATE TABLE board (
	idx NUMBER NOT NULL, /* 글번호 */
	id VARCHAR2(16) NOT NULL, /* 아이디 */
	bcode NUMBER NOT NULL, /* 게시판코드 */
	tcode NUMBER NOT NULL, /* 거래코드 */
	title VARCHAR2(100) NOT NULL, /* 글제목 */
	content VARCHAR2(4000) NOT NULL, /* 글내용 */
	readnum NUMBER NOT NULL, /* 조회수 */
	writedate TIMESTAMP NOT NULL, /* 작성일 */
	ref NUMBER NOT NULL, /* 그룹번호 */
	dept NUMBER NOT NULL, /* 들여쓰기 */
	step NUMBER NOT NULL, /* 답변정렬 */
	cocode NUMBER NOT NULL /* 글상태 */
);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			idx
		);

/* 게시판 종류 */
CREATE TABLE b_list (
	bcode NUMBER NOT NULL, /* 게시판코드 */
	bname VARCHAR2(100) NOT NULL, /* 게시판이름 */
	typeno NUMBER NOT NULL, /* 게시판형식번호 */
	ccode NUMBER NOT NULL /* 카테고리코드 */
);

ALTER TABLE b_list
	ADD
		CONSTRAINT PK_b_list
		PRIMARY KEY (
			bcode
		);

/* 댓글 */
CREATE TABLE reply (
	replyidx NUMBER NOT NULL, /* 댓글식별번호 */
	idx NUMBER NOT NULL, /* 글번호 */
	replycontent VARCHAR2(500) NOT NULL, /* 댓글내용 */
	replyid VARCHAR2(16) NOT NULL, /* 댓글아이디 */
	replydate TIMESTAMP NOT NULL, /* 댓글작성일 */
	cocode NUMBER /* 글상태 */
);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			replyidx
		);

/* 파일게시판 */
CREATE TABLE fileupload (
	fidx NUMBER NOT NULL, /* 자료실식별번호 */
	idx NUMBER NOT NULL, /* 글번호 */
	oriname VARCHAR2(100), /* 원본파일이름 */
	savename VARCHAR2(110), /* 저장파일이름 */
	fsize NUMBER NOT NULL, /* 파일크기 */
	cocode NUMBER /* 글상태 */
);

ALTER TABLE fileupload
	ADD
		CONSTRAINT PK_fileupload
		PRIMARY KEY (
			fidx
		);

/* 회원 */
CREATE TABLE member (
	id VARCHAR2(16) NOT NULL, /* 아이디 */
	pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	name VARCHAR2(10) NOT NULL, /* 이름 */
	hp VARCHAR2(13) NOT NULL, /* 핸드폰번호 */
	grade NUMBER NOT NULL /* 등급코드 */
);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			id
		);

/* 찜 목록 */
CREATE TABLE zzim_list (
	id VARCHAR2(16) NOT NULL, /* 아이디 */
	campidx NUMBER /* 캠핑장식별번호 */
);

ALTER TABLE zzim_list
	ADD
		CONSTRAINT PK_zzim_list
		PRIMARY KEY (
			id
		);

/* 캠핑장 */
CREATE TABLE camp (
	contentid NUMBER NOT NULL, /* 캠핑장식별번호 */
	title VARCHAR2(50), /* 캠핑장명 */
	addr1 VARCHAR2(200), /* 캠핑장주소 */
	tel VARCHAR(20), /* 캠핑장전화번호 */
	firstimage VARCHAR2(100) /* 캠핑장이미지 */
);

ALTER TABLE camp
	ADD
		CONSTRAINT PK_camp
		PRIMARY KEY (
			contentid
		);

/* 게시판 타입 */
CREATE TABLE b_type (
	btype_num NUMBER NOT NULL, /* 게시판형식번호 */
	btype_name VARCHAR2(100) NOT NULL /* 게시판타입 */
);

ALTER TABLE b_type
	ADD
		CONSTRAINT PK_b_type
		PRIMARY KEY (
			btype_num
		);

/* 게시판 카테고리 */
CREATE TABLE b_cat (
	ccode NUMBER NOT NULL, /* 카테고리코드 */
	cname VARCHAR2(100) NOT NULL /* 카테고리이름 */
);

ALTER TABLE b_cat
	ADD
		CONSTRAINT PK_b_cat
		PRIMARY KEY (
			ccode
		);

/* 답글게시판 */
CREATE TABLE reboard (
	reboardidx NUMBER NOT NULL, /* 답글식별번호 */
	idx NUMBER NOT NULL, /* 글번호 */
	ref NUMBER NOT NULL, /* 그룹번호 */
	dept NUMBER NOT NULL, /* 들여쓰기 */
	step NUMBER NOT NULL, /* 답변정렬 */
	reboardcount NUMBER NOT NULL /* 답글갯수 */
);

ALTER TABLE reboard
	ADD
		CONSTRAINT PK_reboard
		PRIMARY KEY (
			reboardidx
		);

/* 관리자 */
CREATE TABLE adminmember (
	adminid VARCHAR2(16) NOT NULL, /* 관리자아이디 */
	adminpwd VARCHAR2(20) NOT NULL, /* 관리자비밀번호 */
	admingrade NUMBER NOT NULL /* 관리자등급 */
);

ALTER TABLE adminmember
	ADD
		CONSTRAINT PK_adminmember
		PRIMARY KEY (
			adminid
		);

/* 회원등급 */
CREATE TABLE membergrade (
	grade NUMBER NOT NULL, /* 등급코드 */
	gname VARCHAR2(50) NOT NULL /* 등급명 */
);

ALTER TABLE membergrade
	ADD
		CONSTRAINT PK_membergrade
		PRIMARY KEY (
			grade
		);

/* 거래게시판 */
CREATE TABLE trade (
	tcode NUMBER NOT NULL, /* 거래코드 */
	tstatus VARCHAR2(50) NOT NULL /* 거래상태 */
);

ALTER TABLE trade
	ADD
		CONSTRAINT PK_trade
		PRIMARY KEY (
			tcode
		);

/* 글상태 */
CREATE TABLE c_status (
	cocode NUMBER NOT NULL, /* 글상태 */
	coname VARCHAR2(40) NOT NULL /* 상태명 */
);

ALTER TABLE c_status
	ADD
		CONSTRAINT PK_c_status
		PRIMARY KEY (
			cocode
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_b_list_TO_board
		FOREIGN KEY (
			bcode
		)
		REFERENCES b_list (
			bcode
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_member_TO_board
		FOREIGN KEY (
			id
		)
		REFERENCES member (
			id
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_trade_TO_board
		FOREIGN KEY (
			tcode
		)
		REFERENCES trade (
			tcode
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_c_status_TO_board
		FOREIGN KEY (
			cocode
		)
		REFERENCES c_status (
			cocode
		);

ALTER TABLE b_list
	ADD
		CONSTRAINT FK_b_type_TO_b_list
		FOREIGN KEY (
			typeno
		)
		REFERENCES b_type (
			btype_num
		);

ALTER TABLE b_list
	ADD
		CONSTRAINT FK_b_cat_TO_b_list
		FOREIGN KEY (
			ccode
		)
		REFERENCES b_cat (
			ccode
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_board_TO_reply
		FOREIGN KEY (
			idx
		)
		REFERENCES board (
			idx
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_c_status_TO_reply
		FOREIGN KEY (
			cocode
		)
		REFERENCES c_status (
			cocode
		);

ALTER TABLE fileupload
	ADD
		CONSTRAINT FK_board_TO_fileupload
		FOREIGN KEY (
			idx
		)
		REFERENCES board (
			idx
		);

ALTER TABLE fileupload
	ADD
		CONSTRAINT FK_c_status_TO_fileupload
		FOREIGN KEY (
			cocode
		)
		REFERENCES c_status (
			cocode
		);

ALTER TABLE member
	ADD
		CONSTRAINT FK_membergrade_TO_member
		FOREIGN KEY (
			grade
		)
		REFERENCES membergrade (
			grade
		);

ALTER TABLE zzim_list
	ADD
		CONSTRAINT FK_member_TO_zzim_list
		FOREIGN KEY (
			id
		)
		REFERENCES member (
			id
		);

ALTER TABLE reboard
	ADD
		CONSTRAINT FK_board_TO_reboard
		FOREIGN KEY (
			idx
		)
		REFERENCES board (
			idx
		);

create sequence test1 ;/* 글번호 시퀀스 */
create sequence test2; /* 자료실식별번호 시퀀스 */
create sequence replyseq; /* 댓글 시퀀스 */