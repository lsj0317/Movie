--계정 생성--
create user movies identified by movies;
grant connect, dba to movies;
-----------------------------------------------------------------------
create table tbl_member(
	membno number(10),
	id nvarchar2(20) not null,
	pw nvarchar2(20) not null,
	name nvarchar2(20) not null,
	nickname nvarchar2(20),
	adress nvarchar2(100) not null,
	phone nvarchar2(13) not null,
	regdate date default sysdate,
	mem_imgno number(10),
	constraint mem_pk primary key(membno),
	CONSTRAINT id_uq UNIQUE(id) 
);

drop table tbl_member;

create sequence seq_member ;

create table tbl_member_auth (
     id nvarchar2(20) not null,
     auth nvarchar2(20) not null,
     constraint fk_member_auth foreign key(id) references tbl_member(id)
);

create table persistent_logins (
	username varchar(64) not null,
	series varchar(64) primary key,
	token varchar(64) not null,
	last_used timestamp not null
);

create table tbl_member_img(
	UUID varchar2(100)constraint mem_img_pk primary key,
	uploadpath nvarchar2(200) not null,
	filename nvarchar2(50) not null,
	FILETYPE char(1) default '1',
	bno number(10)
);

create table tbl_movies(
	movbno number(10) constraint mov_pk primary key,
	title nvarchar2(100) not null,
	content nvarchar2(1000) not null,
	director nvarchar2(20) not null,
	actor nvarchar2(500) not null,
	stars_avg number(1) default 0,
	recommend number(5) default 0,
	created_date date default sysdate,
	regdate date default sysdate,
	up_date date default sysdate,
	mov_imgno number(10)
);

create table tbl_movies_img(
	UUID varchar2(100)constraint mov_img_pk primary key,
	uploadpath nvarchar2(200) not null,
	filename nvarchar2(50) not null,
	FILETYPE char(1) default '1',
	bno number(10)
);

create table tbl_title_img(
	UUID varchar2(100)constraint mov_title_img_pk primary key,
	uploadpath nvarchar2(200) not null,
	filename nvarchar2(50) not null,
	FILETYPE char(1) default '1',
	bno number(10)
);

create table tbl_content_img(
	UUID varchar2(100)constraint mov_content_img_pk primary key,
	uploadpath nvarchar2(200) not null,
	filename nvarchar2(50) not null,
	FILETYPE char(1) default '1',
	bno number(10)
);


create table tbl_actor(
	actbno number constraint act_pk primary key,
	name nvarchar2(20) not null,
	age number(3) not null,
	b_date date,
	d_date date,
	regdate date default sysdate,
	up_date date default sysdate
);

create table tbl_actor_img(
	UUID varchar2(100)constraint act_img_pk primary key,
	uploadpath nvarchar2(200) not null,
	filename nvarchar2(50) not null,
	FILETYPE char(1) default '1',
	bno number(10)
);

-- actor bno 자동생성 시퀀스 생성
create sequence seq_actor;


create table tbl_director(
	actbno number constraint act_pk primary key,
	name nvarchar2(20) not null,
	age number(3) not null,
	b_date date default sysdate,
	d_date date,
	recommend number(5) default 0,
	regdate date default sysdate,
	up_date date default sysdate,
	dir_imgno number(10)
);

create table tbl_director_img(
	UUID varchar2(100)constraint dir_img_pk primary key,
	uploadpath nvarchar2(200) not null,
	filename nvarchar2(50) not null,
	FILETYPE char(1) default '1',
	bno number(10)
);

create table tbl_movies_comment(
	combno number(10) constraint com_pk primary key,
	content nvarchar2(200) not null,
	membno number(10),
	movbno number(10),
	stars number(1) default 0,
	recommend number(5) default 0,
	regdate date default sysdate,
	up_date date default sysdate
);



create table tbl_movies(
   movbno number(10) constraint mov_pk primary key,
   title nvarchar2(100) not null,
   content nvarchar2(1000) not null,
   director nvarchar2(20) not null,
   actor nvarchar2(500) not null,
   stars_avg number(1) default 0,
   recommend number(5) default 0,
   created_date date default sysdate,
   regdate date default sysdate,
   up_date date default sysdate,
   mov_imgno number(10)
);

drop table tbl_movies;

create sequence seq_movies;

---------------------------------------------------------

create table tbl_movies_comment(
   combno number(10) constraint com_pk primary key,
   content nvarchar2(200) not null,
   membno number(10),
   movbno number(10),
   stars number(1) default 0,
   recommend number(5) default 0,
   regdate date default sysdate,
   up_date date default sysdate
);

-- 멤버테이블과 연결
alter table tbl_movies_comment add constraint comment_mem_fk foreign key(membno) references tbl_member(membno); 
-- 영화 테이블과 연결
alter table tbl_movies_comment add constraint comment_mem_fk foreign key(membno) references tbl_member(membno); 
-------------------------------------------------------------
drop table tbl_member;

create table tbl_member(
   membno 	number(10) constraint mem_pk primary key,
   id 		nvarchar2(20) not null unique,
   pw 		nvarchar2(20) not null,
   name 	nvarchar2(20) not null,
   nickname nvarchar2(20),
   adress 	nvarchar2(100) not null,
   phone 	nvarchar2(13) not null,
   regdate 	date default sysdate,
   mem_imgno number(10)
);

insert into tbl_member(membno, id, pw, name, nickname, adress, phone) values(1, 'ozo', '111', '양지웅', '양지', '용인', '010-1234-5678');
insert into tbl_member(membno, id, pw, name, nickname, adress, phone) values(2, 'lee', '111', '서준리', '서즁찌', '오산', '010-2222-5678');


drop table TBL_MEMBER_AUTH;
drop table mov_member;
drop table tbl_attach;
drop table TBL_REPLY;
drop table TBL_board;
drop table TBL_MEMBER;


