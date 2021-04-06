/***************************************************
파일명 : JDBC실습.sql
Java에서 처음으로 JDBC프로그래밍 해보기
***************************************************/
--우선 system계정을 연결한 후 새로운 계정을 생성한다.
create user kosmo identified by 1234;
grant connect, resource to kosmo;

--계정을 생성한 후 접속창에 등록하고 해당 문서에 연결한다.

--회원관리 테이블 : member 생성
create table member(
    id varchar2(10) not null,--not null은 null값을 허용하지 않음
    pass varchar2(10) not null,
    name varchar2(10) not null,--한글인 경우 nvarchar2 근데 많이 안씀
    regidate date default sysdate,--입력이 안된경우 시스템시간 입력됨
    primary key(id)
);      
select *from member;
--더미데이터 입력하기

insert into member (id,pass,name) values ('test','1234','테스트');
select * from member;
select to_char(regidate,'yy/mm/dd hh24:mi:ss')"회원가입일" from member;
commit;
/*
1. 외래키명 : bbs_mem_fk
tb_bbs테이블의 id 컬럼이 member 테이블의 id 컬럼을 참조하도록 외래키를 생성
2. 시퀀스명 : seq_bbs_num
tb_bbs테이블에 데이터를 입력시 num 컬럼이 자동증가 할수있도록 시퀀스를 생성
*/
create Table tb_bbs (
    num number not null,
    title varchar2(100) not null,
    content varchar2(2000) not null,
    postdate date default sysdate,
    id varchar2(10) not null,
    primary key (num)
);
/*
create table tb_bbs (
    num number primary key,
    title varchar2(100) not null,
    content varchar2(2000) not null,
    postdate date default sysdate,
    id varchar2(10) not null constraint bbs_mem_fk
        references member (id)
);
*/
--primary key 설정과 동일한 방식!
alter table tb_bbs add
    constraint bbs_mem_fk
        foreign key (id) references member (id);
--1-1.데이터사전에서 확인
select * from user_constraints;
--2.시퀀스 생성
create sequence seq_bbs_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle
    nocache;
--2-1.데이터사전에서 시퀀스 확인
select * from user_sequences;

insert into tb_bbs values (seq_bbs_num.nextval,'','','','');

--레코드 삭제하기 : delete
delete from member where id ='test3';
commit;

--레코드 수정하기 : update
update member set pass='9999', name='홍길동', regidate=sysdate
    where id='test';
    
select * from member;

select id, pass, name, to_char(regidate,'yyyy-mm-dd hh24:mi:ss') from member;

--레코드 입력하기 : insert
insert into member (id,pass,name) values ('test99','9999','구길동');
select id, pass, name, to_char(regidate,'yyyy-mm-dd hh24:mi:ss') from member;
commit;
/*
    오라클에서 직접 insert를 한 후 commit 하지 않으면 외부에서는
    변경된 레코드를 확인할 수 없으므로 실행에 오류가 발생하거나
    전혀 적용되지 않게 된다. 처음 insert를 했을때는 임시테이블에
    저장되고, commit 후에 실제 테이블에 저장된다.!!!!!!!!!
*/
--like를 이용한 이름검색
select *from member name like '%길동%';
select *from member name like '%태%';
select *from member name like '%?%';--java에서 에러발생됨 



    
    