-----------------------TBL MEMBER-----------------------
ALTER TABLE tbl_member RENAME COLUMN id TO username;
alter table tbl_member rename column pw to password;
ALTER TABLE tbl_member RENAME COLUMN username TO id;
alter table tbl_member rename column password to pw;
alter table tbl_member rename column zonecone to zonecode;
ALTER TABLE tbl_member MODIFY enabled char(1);
ALTER TABLE tbl_member ADD zonecone nVARCHAR2(10);
ALTER TABLE tbl_member ADD roadAddress nVARCHAR2(50);
ALTER TABLE tbl_member ADD buildingName nVARCHAR2(20);
ALTER TABLE tbl_member ADD enabled VARCHAR(1) DEFAULT '1' NOT NULL;
ALTER TABLE tbl_member modify pw nvarchar2(100);
ALTER TABLE tbl_movies ADD video nVARCHAR2(50);
update tbl_member set enabled='1';

delete TBL_MEMBER where rownum=1;

delete TBL_MEMBER_AUTH where rownum=1;

select * from tbl_member;

select id , pw from tbl_member where id = 'kkk';

alter table tbl_member_auth rename column id to username;
alter table tbl_member_auth rename column username to id;

select * from tbl_member_auth;

insert into tbl_member_auth values('manager1','ROLE_ADMIN');

update TBL_MEMBER_AUTH set auth = 'ROLE_ADMIN' where id = 'admin';

insert into tbl_member_auth values('바보','ROLE_MEMBER');

insert into tbl_member_auth values('sss','ROLE_ADMIN');

SELECT mem.id,pw, name,nickname,adress,phone,regdate, auth FROM tbl_member mem LEFT OUTER JOIN tbl_member_auth auth on mem.id = auth.id WHERE mem.id = ('바보'); 
	
insert into tbl_member (membno, id , pw , name,nickname,adress,phone) values (seq_member.nextval ,'kkk' , 'kkk' , 'ksk','월','수원시','01011111111');

insert into tbl_member (membno, id , pw , name,nickname,adress,phone) values (seq_member.nextval ,'sss' , 'sss' , 'sss','월','수원시','01011111112');
insert into tbl_member (membno, id , pw , name,nickname,adress,phone) values (seq_member.nextval ,'lll' , 'lll' , 'lll','월','수원시','01011111113');

insert into tbl_member (membno, id , pw , name,nickname,adress,phone) values (seq_member.nextval ,'aaa' , 'aaa' , 'aaa','월','수원시','01011111114');

select * from TBL_MEMBER;

-------------------TBL MOVIES-------------------------------

select * from TBL_MOVIES;

select * from TBL_MOVIES_IMG;
-------------------TBL MOVIES COMMENTS----------------------


-- membno를 조건으로 comment및 회원 정보 불러오기
select * from tbl_movies_comment, tbl_member where tbl_movies_comment.membno = tbl_member.membno and tbl_movies_comment.membno = 1;

select * from tbl_movies_comment;
  

insert into tbl_movies_comment(combno, content, membno, movbno, stars, recommend) values(8, '휴지가 어딨더라....?', 2, 21, 5, 1);
insert into tbl_movies_comment(combno, content, membno, movbno, stars, recommend) values(9, '아주 재미지구나!!!', 2, 21, 5, 1);


select * from tbl_movies_comment;


-- actor 테이블 조회
select * from tbl_actor;

select * from TBL_ACTOR_IMG;


select * from TBL_DIRECTOR;

update tbl_movies set director = '46' where movbno = 99;