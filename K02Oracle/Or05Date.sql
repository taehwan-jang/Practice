/************************************
파일명 : Or05Date.sql
날짜함수
설명 : 년, 월, 일, 시, 분, 초의 포맷으로 날짜형식을 지정하거나
    날짜를 계산할 때 활용하는 함수들
************************************/

/*
month_between()
    : 현재날짜와 기준날짜 사이의 개월수를 반환한다.
    형식] month_between(현재날짜, 기준날짜[과거날짜])
*/
--1992년 06월 02일부터 지금까지 지난 개월수는 얼마인가?

SELECT
    MONTHS_BETWEEN(SYSDATE,'1992-06-02') "결과1",
    MONTHS_BETWEEN(SYSDATE,to_date('1992년 06월 02일','yyyy"년 "mm"월 "dd"일"')) "결과2",
    ROUND(MONTHS_BETWEEN(SYSDATE,'1992-06-02')) "결과3"
FROM dual;
--만약 날짜 서식이 아니라면 to_date()로 날짜형식으로 변경해준다.

/*
시나리오1] employees 테이블에 입력한 직원들의 근속개월수를 계산하여
               출력하시오. 근속개월수를 기준으로 오름차순으로 정력하시오.
*/
SELECT
    first_name, last_name, hire_date, salary,
    round(MONTHS_BETWEEN(SYSDATE,hire_date)) "근속개월",
    trunc(MONTHS_BETWEEN(SYSDATE,hire_date)) "근속개월2"
FROM employees
order by "근속개월" asc;

/*
활용시나리오2] [퀴즈] 위 문제를 현재날짜 기준이 아닌 '2017년12월31일'을 
기준으로 변경하시오
*/

SELECT
    first_name, last_name, hire_date, salary,
    round(MONTHS_BETWEEN(to_date('2017년12월31일','yyyy"년"mm"월"dd"일"'),hire_date)) "17년12월31일기준",
    trunc(MONTHS_BETWEEN(SYSDATE,hire_date)) "근속개월2"
FROM employees
order by "17년12월31일기준" asc;

/* 
    months_between() 함수의 인자로 날짜가 주어질때 오라클은 기본서식인
    년-월-일 인 경우에는 to_date()로 변환 없이 그대로 사용할 수 있다.
    단, 기본서식이 아닌 경우에만 날자형식으로 변환 후 사용하면 된다.
*/


/*
add_months() : 날짜에 개월수를 더한 결과를 반환한다.
    형식] add_months(현재날짜, 더할 개월수)
*/
--현재를 기준으로 7개월 이후의 날짜를 구하시오.

SELECT
    to_char(sysdate,'yyyy-mm-dd') "현재날짜",
    to_char(add_months(sysdate, 7),'yyyy-mm-dd') "7개월이후"
FROM dual;


/*
next_day() : 현재날짜를 기준으로 인자로 주어진 요일에 해당하는 미래날짜를 반환하는 함수.
    형식] next_day(현재날짜, '월요일')
                            ->다음주 월요일은 며칠임?    
*/
SELECT
    sysdate "오늘날짜",
    NEXT_DAY(SYSDATE, '금요일') "다음 금요일은?",
    NEXT_DAY(SYSDATE, '월요일') "다음 월요일은?",
    NEXT_DAY(SYSDATE, '수요일') "다음 수요일은?"
FROM dual;
--기준날짜 7주일 이내만 조회 가능하다!

/*
last_day() : 해당월의 마지막 날짜를 반환한다.
    형식] last_day(날짜)
*/

SELECT LAST_DAY(SYSDATE) from dual;
SELECT LAST_DAY('20/02/01') from dual;
SELECT LAST_DAY('21/02/01') from dual;
SELECT
    last_day(hire_date), hire_date
FROM employees where employee_id=106;
--2020년은 윤년이므로 2월이 29일까지 있다.

SELECT
    SYSDATE "현재날짜",
    SYSDATE - 1 "어제날짜",
    SYSDATE + 1 "내일날짜",
    SYSDATE + 30 "한달후"
FROM dual;








