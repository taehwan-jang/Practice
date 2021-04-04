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