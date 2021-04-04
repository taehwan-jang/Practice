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



