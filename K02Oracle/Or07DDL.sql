/***************************************
파일명 : Or07DDL.sql
DDL : Data Definition Laguage (데이터정의어)
설명 : 테이블, 뷰와 같은 객체를 생성 및 변경하는 쿼리문을 말한다.
***************************************/
/*
system계정으로 연결한 후 아래 명령어를 순차적으로 실행한다.
새로운 계정에 대한 생성은 system계정 즉 관리자 계정만 가능하다.
*/
create user study identified by 1234;--계정생성
grant connect, resource to study;--권한부여

------------------------------------------------
--study계정을 등록한 후 접속한다. 실습은 study에서 진행!

select * from dual;--오라클에서 생성되는 모든 계정에 있는 더미테이블
select * from tab;--해당 계정에 생성된 테이블 목록을 보는거임

/*
테이블생성
형식]
    create table 테이블명 (
        컬럼1 자료형 [not null ...],
        컬럼2 자료형 [제약조건....],
        ....
        primary key (컬럼명) 등 제약조건...
    );
*/
create table tb_member (
    member_idx number(10),--10자리 정수표현
    user_id varchar2(30),
    pass_word varchar2(50),
    user_name varchar2(30),
    mileage number(7,2)--실수표현. 전체 7자리, 소수 2자리
);

select * from tab;
/*
desc 테이블명 : 생성된 테이블의 속성(구조, 컬럼타입)을 확인하기 위한
    명령어.
*/
desc tb_member;

/*
기존 생성된 테이블에 새로운 컬럼 추가하기
    -> tb_member 테이블에 email 컬럼을 추가하시오.
    
    형식] alter table 테이블명 add 추가할 컬럼 자료형(크기) 제약조건;
*/
alter table tb_member add email varchar2(100); 
desc tb_member;

/*
기존 생성된 테이블의 컬럼 수정하기
    -> tb_member테이블의 email 컬럼의 사이즈를 200으로 확장하시오.
        또한 이름이 저장되는 user_name컬럼도 60으로 확장하시오.
        
    형식] alter table 테이블명 modify 수정할컬럼명 자료형(크기);    
*/
alter table tb_member modify email varchar2(200);
alter table tb_member modify user_name varchar2(60);
desc tb_member;

/*
테이블에서 컬럼 삭제하기
    -> tb_member 테이블의 mileage컬럼을 삭제하시오
    
    형식] alter table 테이블명 drop column 삭제할 컬럼명;
*/
alter table tb_member drop column mileage;
desc tb_member;

/*
테이블 삭제하기
    -> tb_member 테이블은 더이상 사용하지 않으므로 학제하시오.
    
    형식] drop table 삭제할 테이블명;
*/
drop table tb_member;
select * from tab;

--위에서 create문을 다시 한번 실행해서 테이블을 생성한 후 실습!

--새로운 레코드 삽입 및 확인
insert into tb_member values (1, 'hong', '1234', '홍길동', 10000);
insert into tb_member (member_idx, user_id, pass_word, user_name, mileage)
    values (2, 'gasan', '9876', '가디', 20000);
select * from tb_member;

--테이블을 레코드까지 복사하기
create table tb_member_copy
as
select * from tb_member where 1=1;
--복사되었는지 확인하기
desc tb_member_copy;
select * from tb_member_copy;

--테이블을 속성 복사하기
create table tb_member_empty
as
select * from tb_member where 1=0;
--복사되었는지 확인하기
desc tb_member_empty;
select * from tb_member_empty;




                                
                                

