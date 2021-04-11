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


/*********************************************************************************************/
/******************************SCOTT계정으로 연습문제 진행*************************************/
/*********************************************************************************************/

/***********
1. 다음 조건에 맞는 “pr_dept” 테이블을 생성하시오.
***********/
create table pr_dept (
    dno number(2),
    dname varchar2(20),
    loc varchar2(35)
);
desc pr_dept;

/***********
2. 다음 조건에 맞는 “pr_emp” 테이블을 생성하시오.
***********/
create table pr_emp (
    eno number(4),
    ename varchar2(10),
    job varchar2(30),
    regist_date date
);
desc pr_emp;

/***********
3. pr_emp 테이블의 ename 컬럼을 varchar2(50) 로 수정하시오.
***********/
alter table pr_emp modify ename varchar(50);
desc pr_emp;

/*********************
4. pr_emp 테이블을 복사해서 pr_emp_clone 테이블을 생성하되 
eno, ename, job만 복사하고 새로 생성된 칼럼명은 
e_no, e_name, job_id 로 지정하시오.
**********************/
create table pr_emp_clone 
as
select eno 'e_no', ename 'e_name', job 'job_id' 
from pr_emp where 1=0;

create table pr_emp_clone (
    e_no, e_name, job_id
)
as
select  eno, ename, job from pr_emp where 1=1;
--추가] 기존의 테이블을 그대로 복사하는 방법
create table pr_emp_clone2
as
select * from pr_emp;
desc pr_emp_clone2;
desc pr_emp_clone;

/**********************
5. 위에서 복사한 pr_emp_clone 테이블의 이름을 
pr_emp_clone_rename 으로 변경하시오.
**********************/
alter table pr_emp_clone rename to pr_emp_clone_rename; 
desc pr_emp_clone -- 기존 테이블 없어짐

rename pr_emp_clone to pr_emp_clone_rename;
desc pr_emp_clone_rename;
/*********************
6. 1번에서 생성한 pr_dept 테이블에서 dname 칼럼을 삭제하시오.
*********************/
alter table pr_dept drop column dname;
desc pr_dept;

/*********************
7. “pr_emp” 테이블의 job 컬럼을 varchar2(50) 으로 수정하시오.
*********************/
desc pr_emp;
alter table pr_emp modify job varchar2(50);

/**********************
8. 5번의 pr_emp_clone_rename 테이블을 삭제하시오
***********************/
drop table pr_emp_clone_rename;
drop table pr_emp_clone2;

/*
▣ 테이블에 컬럼 추가하기
    형식
        alter table 테이블명 
            add 추가할컬럼 자료형(크기) 제약조건;

▣ 테이블의 컬럼 수정하기
    형식
        alter table 테이블명 modify 수정할컬럼명 자료형(크기);

▣ 테이블의 컬럼 삭제하기
    형식
        alter table 테이블명 drop column 컬럼명;
*/






                                
                                

