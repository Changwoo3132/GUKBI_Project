-- member 회원 테이블 생성
create table member(
    mid varchar2(50) primary key, -- 회원 아이디
    mpwd varchar2(500) not null, -- 회원 비밀번호
    mpwdC varchar2(500) not null, -- 비밀번호 확인
    memail varchar2(500) not null, -- 회원 이메일
    mname varchar2(50) not null, -- 회원 이름
    mday varchar2(50) not null, -- 회원 생년월일
    mphone varchar2(100) not null, -- 회원 전화번호
    myaddr varchar2(200) not null, -- 집 주소
    myaddr2 varchar2(100) not null, -- 나머지 주소
    addrcode varchar2(20) not null, -- 우편번호 
    mstate number(38), -- 1 회원가입, 2 회원 탈퇴 
    mdate date -- 가입날짜
);

select * from member;

-- admin 관리자 테이블 생성
create table admin(
    adminid varchar2(50) primary key, -- 관리자 아이디
    adminpwd varchar2(200) not null, -- 관리자 비밀번호
    adminname varchar2(200) not null, -- 관리자 이름
    admindate date -- 가입날짜
);

select * from admin;

delete from admin where adminid='admin';

-- notice 관리자 공지사항 테이블 생성
create table notice(
    notice_no number(38) primary key, -- 공지사항 번호
    notice_name varchar2(100) not null, -- 공지사항 작성자
    notice_title varchar2(200) not null, -- 공지사항 제목
    notice_cont varchar2(4000) not null, -- 공지사항 내용
    notice_date date -- 등록 날짜 
);

-- notice_no_seq 시퀀스 생성 
create sequence notice_no_seq
start with 1
increment by 1
nocache
nocycle;

select * from notice;

drop table notice;

-- bbs 회원문의 테이블 생성
create table bbs(
    bbs_no number(38) primary key, -- 게시물번호 
    bbs_title varchar2(200) not null, -- 제목
    bbs_cont varchar2(4000) not null, -- 내용
    bbs_file varchar2(200), -- 이진 파일명
    bbs_ref number(38), -- 글 그룹번호
    bbs_step number(38), -- 첫번째 답변글 1, 두번째 답변글 2 즉 원본글과 답변글을 구분하는 번호값, 몇번째 답변글인가를 알려줌
    bbs_level number(38), -- 답변글 정렬순서
    bbs_date date -- 등록날짜
);

select * from bbs;


-- bbs_no_seq 시퀀스 생성 
create sequence bbs_no_seq
start with 1
increment by 1
nocache
nocycle;

-- product 상품 테이블 생성
CREATE TABLE PRODUCT( -- 상품 테이블
    procode NUMBER(20) PRIMARY KEY -- 상품번호
    , proname VARCHAR2(30) -- 상품 이름
    , PROPRICE number(10) -- 상품 가격
    , PROINFO VARCHAR2(4000) -- 상품 정보
    , prostate number(10) -- 판매여부 O/X
    , proqty NUMBER(10) -- 재고
    , profile VARCHAR2(500) --상품 썸네일 파일(파일 저장명)
    , prodate date -- 상품 등록 날짜
    , CATECODE NUMBER(20) -- 카테고리 코드
);
delete from product;

select * from product;
drop table product;

-- 상품 코드 시퀀스 생성
create sequence product_code_seq
    start with 1
    increment by 1
    nocache
    nocycle;

CREATE TABLE CART( -- 장바구니 테이블
    CARTCODE NUMBER(20) PRIMARY KEY -- 장바구니 번호
    , AMOUNT NUMBER(10) DEFAULT 0 -- 수량
    , ISCHECKED NUMBER(10)
    , MID VARCHAR2(30) NOT NULL, CONSTRAINT FK_CART_MID FOREIGN KEY (MID) REFERENCES MEMBER(MID) -- 사용자 ID
    , PROCODE NUMBER(20) NOT NULL, CONSTRAINT FK_CART_PROCODE FOREIGN KEY (PROCODE) REFERENCES PRODUCT(PROCODE) -- 상품번호
);
drop table cart;
select * from CART;
delete from cart;

create sequence cart_cartcode_seq
start with 1
increment by 1
nocache
nocycle;

commit;