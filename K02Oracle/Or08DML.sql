/****************************************
파일명 : Or08DML.sql
DML : Data Manipulation Language(데이터 조작어)
설명 : 레코드를 조작할 때 사용하는 쿼리문. 앞에서 학습했던
        select문을 비롯하여 update(레코드수정), delete(레코드삭제),
        insert(레코드입력)가 있다.

****************************************/

--study계정으로 실습한다.

/*
레코드 입력하기 : insert문
    레코드 입력을 위한 쿼리로 문자형은 반드시 '싱글쿼테이션'으로 갑싸야 한다.
    숫자형은 '없이 그냥 쓴다. 만약 숫자형을 '으로 감ㅅ싸면 자동으로 
    형변환되어 입력된다.
*/
--실습을 위한 테이블 생성

create table tb_sample (
    deptNo number(10),          --부서번호
    deptName varchar2(20),   --부서명
    deptLoc varchar2(15),      --지역
    deptManager varchar2(30)--매니저 이름
);
desc tb_sample;

--방식1을 통한 레코드 입력
insert into tb_sample (deptno,deptname,deptloc,deptmanager)
    values (10, '기획실', '서울', '나연');
insert into tb_sample (deptno,deptname,deptloc,deptmanager)
    values (20, '전산팀', '수원', '쯔위');

--방식2를 통한 레코드 입력
insert into tb_sample  values (30, '영업팀', '대구', '모모');
insert into tb_sample  values (40, '인사팀', '부산', '지효');

SELECT
    *
FROM tb_sample;

commit;

/*
    지금까지의 작업(트랜잭션)을 그대로 유지하겠다는 명령으로
    커밋을 수행하지 않으면 외부에서는 변경된 레코드를 확인할 수 없다.
    여기서 말하는 외부란 Java/JSP와 같은 Oracle이외의 프로그램을
    말한다. 
    
    ※트랜잭션이란 송금과 같은 하나의 단위작업을 말한다.       
*/
--커밋 이후 새로운 레코드를 삽입하면 임시테이블에 저장된다.
insert into tb_sample values (50, '금융팀', '제주', '아이린');
--오라클에서 확인하면 실제 삽입된것처럼 보인다. 하지만 외부에서는 확인되지 않는다.
select * from tb_sample;
--롤백 명령으로 마지막 커밋상태로 되돌린다.
rollback;
--마지막에 입력했던 50번 레코드는 사라진다.
select * from tb_sample;

/*
    롤백 명령은 마지막 커밋 상태로 되돌려준다.
    즉, commit한 이전의 상태로는 rollback할 수 없다.
*/

/*
레코드 수정하기 : update문
    형식] 
        update 테이블명
        set 컬럼1=값1, 컬럼2=값2,....
        where 조건;
        
    ※조건이 없는 경우 모든 레코드가 한꺼번에 수정된다.
    ※테이블명 앞에 from이 들어가지 않는다.
*/

--부서번호 40인 레코드의 지역을 미국으로 수정하시오.
UPDATE tb_sample set deptloc='미국'
where deptno=40;
select * from tb_sample;

--지역이 서울인 레코드의 매니저명을 '박진영'으로 수정하시오.
UPDATE tb_sample set deptmanager='박진영'
where deptloc='서울';
select * from tb_sample;

--where절 없이 모든 레코드를 대상으로 지역을 '가산디지털'로 변경하시오.
UPDATE tb_sample set deptloc='가산디지털';
select * from tb_sample;

/*
데이터 삭제하기 : delete문 
    형식] 
        delete from 테이블명 where 조건;
    ※레코드를 삭제하므로 delete 뒤에 컬럼을 명시하지 않는다.
        
*/
--부서번호가 10번인 레코드를 삭제하시오
delete from tb_sample where deptno=10;
select * from tb_sample;

--where절 없이 실행하면 모든 레코드가 삭제됨(주의할것)
delete from tb_sample;
select * from tb_sample;

rollback;
select * from tb_sample;


update tb_sample set deptname='코스모' where deptno>=30;
select * from tb_sample;
update tb_sample set deptno=deptno+1;

commit;

/*********************************************************************************************/
/******************************SCOTT계정으로 연습문제 진행*************************************/
/*********************************************************************************************/

/***********************
1. DDL문 연습문제 2번에서 만든 “pr_emp” 테이블에 다음과 같이 레코드를 
삽입하시오.단, 날짜는 sysdate를 이용해서 오늘 날짜를 입력하시오.
***********************/
select * from pr_emp;
insert into pr_emp (eno,ename,job,regist_date) 
values (1,'엄태웅','어른 승민',sysdate);
insert into pr_emp (eno,ename,job,regist_date) 
values (2,'이제훈','대학생 승민',sysdate);
insert into pr_emp (eno,ename,job,regist_date) 
values (3,'한가인','어른 서연',sysdate);
insert into pr_emp (eno,ename,job,regist_date) 
values (4,'수지','대학생 서연',sysdate);

/**************************
2. pr_emp 테이블에 다음 조건에 맞는 레코드를 삽입하시오.
이름 : 조정석
직책 : 납뜩이
등록날짜 : to_date함수를 이용해서 7일전 날짜를 입력하시오.
(현재날짜를 기준으로 7일전임)
**************************/
insert into pr_emp (eno,ename,job,regist_date) 
values (5,'조정석','납뜩이',sysdate-7);

insert into pr_emp 
values (5,'조정석','납뜩이', to_date(sysdate-7,'yy/mm/dd');

/****************************
3. pr_emp 테이블의 eno가 짝수인 레코드를 찾아서 job 
컬럼의 내용을 다음과 같이 변경하시오.
“난짝수레코드” 과 같이 괄호의 문자열을 추가한다.
*****************************/
update pr_emp modifiy
set job='난짝수레코드'
where mod(eno,2)='0';

update pr_emp
    set job=job||'(난짝수레코드)'
        where mod(eno,2=0; 
    

/****************************

*****************************/
create table pr_employees
as 
select * from emp where 1=1;
--where절에 참의 조건을 주면 레코드까지 복사

desc pr_employees;

/*****************************
4. pr_employees 테이블에서 
사원번호 7900번과 동일한 메니져를 가진 사원의 
부서번호를  이름이 FORD 인 사원의 부서번호로 업데이트 하시오.
*****************************/
select mgr from pr_employees where empno=7900;

select deptno from pr_employees where upper(ename)='FORD';

update pr_employees
set deptno = (
select deptno from pr_employees where upper(ename)='FORD')
where mgr=(
select mgr from pr_employees where empno=7900
);

--사원번호 7900번 확인
select * from pr_employees where empno=7900;--mgr = 7698;
--mgr 7698인 사원을 확인
select * from pr_employees where mgr=7698;
--FORD의 부서번호 확인
select * from pr_employees where ename='FORD';

update pr_employees set deptno=20 where mgr=7698;

/******************************
5.  pr_employees 테이블에서 입사일이 12월인 모든 직원을 삭제하시오.
******************************/
delete from pr_employees where substr(hiredate,4) like '12%';
select hiredate from pr_employees;

--1번방법 : 날짜포맷 사용
delete from pr_employees where to_char(hiredate,'mm')=12;
--2번방법 : 문자포맷 사용
delete from pr_employees where substr(hiredate,4,2)=12;
--3번방법 : like 사용
delete from pr_employees where hiredate like '___12%';
/*******************************
6. pr_employees 테이블에서 입사일자가 가장 늦은 직원을 찾아서 
ename 컬럼을 “기존의이름(신입사원)” 이 될수 있도록 업데이트 하시오. 
예) KING(신입사원)
********************************/
select * from pr_employees order by hiredate desc;
alter table pr_employees modify ename varchar2(100);
desc pr_employees;

select max(hiredate) from pr_employees;

update pr_employees
set ename = ename||'(신입사원)'
/*set ename = concat(ename,'(신입사원)')*/
where hiredate=(select max(hiredate) from pr_employees);

/*
레코드입력 : insert into 테이블명 (컬럼) values (값)
레코드수정 : update 테이블명 set 컬럼=값 where 조건
레코드삭제 : delete from 테이블명 where 조건
레코드조회 : select 컬럼 from 테이블명 where 조건
*/












