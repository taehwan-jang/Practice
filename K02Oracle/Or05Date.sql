/************************************
���ϸ� : Or05Date.sql
��¥�Լ�
���� : ��, ��, ��, ��, ��, ���� �������� ��¥������ �����ϰų�
    ��¥�� ����� �� Ȱ���ϴ� �Լ���
************************************/

/*
month_between()
    : ���糯¥�� ���س�¥ ������ �������� ��ȯ�Ѵ�.
    ����] month_between(���糯¥, ���س�¥[���ų�¥])
*/
--1992�� 06�� 02�Ϻ��� ���ݱ��� ���� �������� ���ΰ�?

SELECT
    MONTHS_BETWEEN(SYSDATE,'1992-06-02') "���1",
    MONTHS_BETWEEN(SYSDATE,to_date('1992�� 06�� 02��','yyyy"�� "mm"�� "dd"��"')) "���2",
    ROUND(MONTHS_BETWEEN(SYSDATE,'1992-06-02')) "���3"
FROM dual;
--���� ��¥ ������ �ƴ϶�� to_date()�� ��¥�������� �������ش�.

/*
�ó�����1] employees ���̺� �Է��� �������� �ټӰ������� ����Ͽ�
               ����Ͻÿ�. �ټӰ������� �������� ������������ �����Ͻÿ�.
*/
SELECT
    first_name, last_name, hire_date, salary,
    round(MONTHS_BETWEEN(SYSDATE,hire_date)) "�ټӰ���",
    trunc(MONTHS_BETWEEN(SYSDATE,hire_date)) "�ټӰ���2"
FROM employees
order by "�ټӰ���" asc;

/*
Ȱ��ó�����2] [����] �� ������ ���糯¥ ������ �ƴ� '2017��12��31��'�� 
�������� �����Ͻÿ�
*/

SELECT
    first_name, last_name, hire_date, salary,
    round(MONTHS_BETWEEN(to_date('2017��12��31��','yyyy"��"mm"��"dd"��"'),hire_date)) "17��12��31�ϱ���",
    trunc(MONTHS_BETWEEN(SYSDATE,hire_date)) "�ټӰ���2"
FROM employees
order by "17��12��31�ϱ���" asc;

/* 
    months_between() �Լ��� ���ڷ� ��¥�� �־����� ����Ŭ�� �⺻������
    ��-��-�� �� ��쿡�� to_date()�� ��ȯ ���� �״�� ����� �� �ִ�.
    ��, �⺻������ �ƴ� ��쿡�� ������������ ��ȯ �� ����ϸ� �ȴ�.
*/


/*
add_months() : ��¥�� �������� ���� ����� ��ȯ�Ѵ�.
    ����] add_months(���糯¥, ���� ������)
*/
--���縦 �������� 7���� ������ ��¥�� ���Ͻÿ�.

SELECT
    to_char(sysdate,'yyyy-mm-dd') "���糯¥",
    to_char(add_months(sysdate, 7),'yyyy-mm-dd') "7��������"
FROM dual;


/*
next_day() : ���糯¥�� �������� ���ڷ� �־��� ���Ͽ� �ش��ϴ� �̷���¥�� ��ȯ�ϴ� �Լ�.
    ����] next_day(���糯¥, '������')
                            ->������ �������� ��ĥ��?    
*/
SELECT
    sysdate "���ó�¥",
    NEXT_DAY(SYSDATE, '�ݿ���') "���� �ݿ�����?",
    NEXT_DAY(SYSDATE, '������') "���� ��������?",
    NEXT_DAY(SYSDATE, '������') "���� ��������?"
FROM dual;
--���س�¥ 7���� �̳��� ��ȸ �����ϴ�!

/*
last_day() : �ش���� ������ ��¥�� ��ȯ�Ѵ�.
    ����] last_day(��¥)
*/

SELECT LAST_DAY(SYSDATE) from dual;
SELECT LAST_DAY('20/02/01') from dual;
SELECT LAST_DAY('21/02/01') from dual;
SELECT
    last_day(hire_date), hire_date
FROM employees where employee_id=106;
--2020���� �����̹Ƿ� 2���� 29�ϱ��� �ִ�.

SELECT
    SYSDATE "���糯¥",
    SYSDATE - 1 "������¥",
    SYSDATE + 1 "���ϳ�¥",
    SYSDATE + 30 "�Ѵ���"
FROM dual;








