/******************************************
파일명 : Or10SubQuery.sql
서브쿼리
설명 : 쿼리문안에 또다른 쿼리문이 들어가는 형태의 select문
******************************************/

/*
단일행 서브쿼리
    형식] 
        select * from 테이블명 where 컬럼=(
            select 컬럼 from 테이블명 where 조건
        );
        
    ※ 괄호안의 서브쿼리는 반드시 하나의 결과를 인출해야 한다.    
*/
/*
시나리오] 사원테이블에서 전체사원의 평균급여보다 낮은 급여를 받는 사원들을
추출하여 출력하시오.
*/

SELECT
    first_name, last_name, email, salary
FROM employees 
where salary < round(avg(salary));/*
    해당 쿼리문은 문맥상 맞는듯하나 그룹함수를 단일행에
    적용한 잘못된 쿼리문으로 오류가 발생한다.
*/

--1단계 : 평균급여가 얼마인지를 구한다.
SELECT
    round(avg(salary))
FROM employees;
--2단계 : 6462보다 적은 급여를 받는 직원을 인출한다.
SELECT
    first_name, last_name, email, salary
FROM employees 
where salary<6462;
--3단계 : 2개의 쿼리를 하나의 서브쿼리문으로 합친다.
SELECT
    first_name, last_name, email, salary
FROM employees 
where salary<
(SELECT round(avg(salary)) FROM employees);


/*
시나리오] 전체 사원중 급여가 가장 적은 사원의 이름과 급여를 출력하는
서브쿼리문을 작성하시오.
출력항목 : 이름1, 이름2, 이메일, 급여
*/
--1단계 : 최소급여를 찾는다.
SELECT
    min(salary)
FROM employees;

--2단계 : 2100을 받는 사원을 찾는다
SELECT
    first_name,last_name, email, salary
FROM employees where salary=2100;

--3단계 : 2개의 쿼리를 하나의 서브쿼리문으로 합친다.
SELECT
    first_name,last_name, email, salary
FROM employees where salary=
(
SELECT
    min(salary)
FROM employees
);

/*
시나리오] 평균급여보다 많은 급여를 받는 사원들의 명단을 조회할 수 있는 
서브쿼리문을 작성하시오.
출력내용 : 이름1, 이름2, 담당업무명, 급여
※담당업무명은 jobs테이블에 있으므로 join해야 한다.
*/
--1단계 : 평균급여 구하기
SELECT
   trunc(avg(salary),2)
FROM employees;

--2단계 : 6461.83보다 많은 급여를 받는 직원 구하기 블라블라~
SELECT
    first_name, last_name, job_title, salary
FROM employees
inner join jobs using(job_id)
where salary>
(
SELECT
   trunc(avg(salary),2)
FROM employees
)
order by salary desc;

/*
복수행 서브쿼리
    형식]
        select * from 테이블명 where 컬럼 in (
            select 컬럼 from 테이블명 where 조건
        );
    ※ 괄호안의 서브쿼리는 2개 이상의 결과를 인출해야 한다.    
*/

/*
시나리오] 담당업무별로 가장 높은 급여를 받는 사원의 명단을 조회하시오.
    출력목록 : 사원아이디, 이름, 담당업무아이디, 급여
*/


--1.사원테이블에서 단순 정렬을 통해 업무별 고액연봉자 확인
SELECT
    job_id, salary
FROM employees
order by job_id, salary desc;


--2.1번에서 확인한 레코드를 group by 절로 그룹화하여 각 직종별
--   최대급여를 확인한다.
SELECT
    job_id,max(salary)
FROM employees GROUP BY job_id;


--3.2번의 결과를 대상으로 단순 쿼리문 작성
SELECT
    employee_id, first_name, job_id, salary
FROM employees
where
    (job_id='AC_MGR'and salary=12008)or
    (job_id='AC_ACCOUNT'and salary=8300)or
    (job_id='ST_MAN'and salary=8200)or
    (job_id='PU_MAN'and salary=11000)or
    (job_id='AD_ASST'and salary=4400);/*
            2번에서 인출된 19개의 결과를 단순쿼리로 작성하면
            위와같이 or 연산자를 통해 연결할 수 있다. 하지만
            결과가 많다면 작성이 불가능할 것이다.
    */
    
--4. 3의 쿼리문을 서브쿼리로 변경한다. 복수행이므로 in을 사용한다.
SELECT
    employee_id, first_name, last_name, job_id, salary 
FROM employees where (job_id,salary) in
(
    SELECT
        job_id,max(salary)
    FROM employees GROUP BY job_id
)order by employee_id;

/*
복수행연산자2 : any
    메인쿼리의 비교조건이 서브쿼리의 검색결과와 하나이상 일치하면 
    참이되는 연산자. 즉 둘 중 하나만 만족하면 해당 레코드를 가져온다.
*/
/*
시나리오] 전체사원중에서 부서번호가 20인 사원들의 급여보다 높은 급여를
받는 직원들을 추출하는 서브쿼리문을 작성하시오.
*/

SELECT
    min(salary), max(salary)
FROM employees where department_id=20;
--최소 6000 최대 13000

SELECT
    first_name, last_name, department_id, salary
FROM employees where salary >=any
(
SELECT
    salary
FROM employees where department_id=20
);/*
복수행 연산자 any를 사용하면 2번과 같이  or 조건으로
결과들을 연결하게 된다. 6000또는 13000이상인 레코드만 추출된다.
*/

/*
복수행 연산자3 : all
    : 메인쿼리의 비교조건이 서브쿼리의 검색결과와 모두 일치해야
    참이 된다.
*/

SELECT
    first_name, last_name, department_id, salary
FROM employees where salary >=all
(
SELECT
    salary
FROM employees where department_id=20
);/*
6000보다도 크고, 13000보다도 커야하므로 결과적으로 13000 이상인
레코드만 추출하게 된다.
*/

/*
Top쿼리 : 조회된 결과에서 구간을 정해 레코드를 가져올때 사용한다.
    주로 게시판의 페이징에 사용된다.
    
    rownum: 테이블에서 레코드를 조회한 순서대로 순번이 부여되는
        가상의 컬럼을 말한다. 해당 컬럼은 모든 테이블에 존재한다.
*/
SELECT
    *
FROM employees;

SELECT
    employee_id, first_name, 
rownum
FROM employees;

SELECT
    employee_id, first_name, 
rownum
FROM employees
order by first_name;

SELECT
    employee_id, first_name, 
rownum
FROM (
    SELECT
        *
    FROM employees order by first_name
);

/*
사원테이블을 정해진 구간을 통해 가져오기 위한 서브쿼리문
*/
SELECT
    *    
FROM
    (SELECT Tb.*, rownum rNum FROM
    (SELECT * FROM employees order by employee_id desc) Tb)
--where rNum between 1 and 10;
where rNum between 11 and 20;

/*
    between의 구간을 위와같이 변경해주면 해당 페이지의 레코드만
    가져오게 된다. 위의 구간은 차후 JSP에서 여러가지 변수를 조합하여
    계산해서 구현하게 된다.
    
3.2번의 결과 전체를 가져와서
    (2.1번의 결과에 rownum을 순차적으로 부여함
    (1.사원테이블의 모든 레코드를 내림차순 정렬해서 인출) Tb)
필요한 부분을 rownum으로 구간을 정해 인출한다.
*/

--------------------------------------------------------------------------------
/*
01.사원번호가 7782인 사원과 담당 업무가 같은 사원을 
표시(사원이름과 담당 업무)하시오.
*/
select job from emp where empno = 7782;

select ename,job from emp where job=
(select job from emp where empno = 7782);

/*
02.사원번호가 7499인 사원보다 급여가 많은 사원을 
표시(사원이름과 담당 업무)하시오.
*/

select ename,job from emp 
    where sal>(select sal from emp where empno = 7499);

/*
03.최소 급여를 받는 사원의 이름, 담당 업무 및 급여를 
표시하시오(그룹함수 사용).
*/

select ename,job,sal from emp 
    where sal=(select min(sal) from emp);

/*
04.평균 급여가 가장 적은 직급(job)과 평균 급여를 표시하시오.
*/
select * from emp group by job;/*
    오류발생 : group by로 그룹화한 데이터에서 그룹함수를
    통한 결과 이외의 값은 출력이 애매하므로
    오류가 발생하게 된다.
*/
--오류발생됨(ORA-00937: not a single-group group function)
select job,min(round(avg(sal))) from emp group by job;
--select절에서 job을 제외하고 출력
select min(round(avg(sal))) from emp group by job;
/*
    평균급여는 물리적으로 존재하는 컬럼이 아니므로
    where 절이 아닌 having절에 조건을 걸 수 있다.
*/
select round(avg(sal)) as "평균급여",job from emp group by job
    having round(avg(sal))=
        (select min(round(avg(sal))) from emp group by job);

/*
05.각부서의 최소 급여를 받는 사원의 이름, 급여, 
부서번호를 표시하시오.
*/


select ename,sal,deptno from emp where (job,sal)in
(select job,min(sal) from emp group by job)
order by sal;
--in을 잊고있었음~~




/*
06.담당 업무가 분석가(ANALYST)인 사원보다 급여가 적으면서 
업무가 분석가(ANALYST)가 아닌 사원들을 
표시(사원번호, 이름, 담당업무, 급여)하시오.
*/

select deptno, ename, job, sal from emp where sal<(
select sal from emp where job='ANALYST')
order by sal;



/*
07.부하직원이 없는 사람의 이름을 표시하시오.
*/
select ename from emp where empno not in( 
    select mgr from emp group by mgr 
        having mgr is not null);

/*
08.부하직원이 있는 사람의 이름을 표시하시오
*/
select ename from emp where empno in ( 
select mgr from emp);
/*
09.BLAKE와 동일한 부서에 속한 사원의 이름과 
입사일을 표시하는 질의를 작성하시오(단. BLAKE는 제외). 질의를 작성하라는게 뭐야
*/ 
select hiredate from 
(select * from emp where deptno=(
select deptno from emp where ename = 'BLAKE'))
where hiredate != (select hiredate from emp where ename = 'BLAKE');



/*
10.급여가 평균 급여 보다 많은 사원들의 사원번호와 
이름을 표시하되 결과를 급여에 대해서 오름차순으로 정렬 하시오.
*/
select empno, ename from emp where sal>(
select round(avg(sal)) from emp)
order by sal;

/*
11.이름에 K가 포함된 사원과 같은 부서에서 일하는 
사원의 사원번호와 이름을 표시하는 질의를 작성하시오
*/
select empno, ename, deptno from emp where deptno in
(select deptno from emp where ename like '%K%');
/*
    or 조건을 in으로 변경할 수 있으므로, 서브쿼리에서 복수행
    연산에 in을 사용한다. 2개 이상의 결과를 or로 연결하여
    출력하는 효과를 가진다.
*/


/*
12.부서 위치가 DALLAS인 사원의 이름과 부서번호 및 담당 업무를 표시하시오.
*/

select ename,deptno,job from emp 
    inner join dept using(deptno) 
        where loc='DALLAS';
        
select ename,deptno,job from emp 
    where deptno=(select DISTINCT(deptno) from emp 
    inner join dept using(deptno) 
        where loc='DALLAS');

/*
13.KING에게 보고하는 사원의 이름과 급여를 표시하시오.
*/
select ename, sal from emp where mgr=
(select empno from emp where ename = 'KING');


/*
14.RESEARCH 부서의 사원에 대한 부서번호 
사원이름 및 담당 업무를 표시하시오.
*/
select deptno, ename, job from emp  
    inner join dept using(deptno)
        where dname = 'RESEARCH';



/*
15.평균 급여 보다 많은 급여를 받고 이름에 k가 포함된 
사원과 같은 부서에서 근무하는 사원의 사원번호, 이름, 급여를 표시하시오.
*/
select * from (
    select * from emp where sal>(
        select round(avg(sal)) from emp)) 
    where lower(ename) like '%k%';


/*
16.평균 급여가 가장 적은 업무를 찾으시오.
*/
select job from emp group by job 
    having avg(sal)=(
        select min(avg(sal)) from emp group by job);


/*
17.담당 업무가 MANAGER인 사원이 소속된 부서와 
동일한 부서의 사원을 표시하시오.
*/

select * from emp where deptno in(
select deptno from emp where job ='MANAGER');




















