/**********************************
���ϸ� : OrSelcetBasic.sql
ó������ �����غ��� ������(SQL�� Ȥ�� Query��)
���� : select, where �� ���� �⺻���� DQL�� ����غ���
**********************************/

select * from employees where employee_id=100;

SELECT * FROM employees WHERE employee_id=200;

/*
SQL Deveoloper���� �ּ� ����ϱ�
    �������ּ�: �ڹٿ� ������
    ���δ����ּ� : --���๮��. ������ 2���� �������� ���
*/

--select�� : ���̺� ����� ���ڵ带 ��ȸ�ϴ� SQL������ DQL���� �ش��Ѵ�

/*
����]
    select �÷�1, �÷�2, ...[�Ǵ� *]
    from ���̺��
    where ����1 and ����2 or ����3 ...
    order by �������÷� asc(��������), dese(��������);
*/

--������̺� ����� ��� ���ڵ� ��ȸ�ϱ�
select * from employees;

--�÷����� �����ؼ� �����ڰ� ������� �÷���
--�����ȣ, �̸�, �̸���, �μ����̵� ��ȸ

select employee_id, first_name, last_name, email, department_id
from employees;

--���̺��� �Ӽ��� �ڷ����� Ȯ���ϴ� ���
desc employees;

--�ش� �÷��� number(����) Ÿ���̸� ��������� �����ϴ�.
select employee_id, first_name, salary, salary+100 from employees;
--���� Ÿ���� Į�������� ���굵 �����ϴ�.
select employee_id, first_name, salary, commission_pct, salary+commission_pct
from employees;
SELECT employee_id, first_name, salary, salary+100 from employees;

/*
AS(�˸��ƽ�) : ���̺� Ȥ�� �÷��� ��Ī(����)�� �ο��Ҷ� ����Ѵ�.
    ���� ���ϴ� �̸�(����, �ѱ� ��)���� ������ �Ŀ� ����� �� �ִ�.
    Ȱ���] ���� 2�� �̻��� ���̺��� join(����)�ؾ� �� ��� �÷�����
    �ߺ��� �� �����ϴ� �뵵�� ���� �� �ִ�.
*/
select first_name, salary, salary+100 as "�޿�100����" from employees;
select first_name, salary, salary+100 as salaryUp100 from employees;

--as�� ������ �� �ִ�.
select employee_id "������̵�", first_name, last_name "��"
from employees where first_name='William';

--����Ŭ�� �⺻������ ��ҹ��ڸ� �������� �ʴ´�. ������ �� �� ��� �����ϴ�
select employee_id "������̵�", first_name, last_name "��"
from EMPLOYEES where first_name='William';

--�� ���ڵ��� ���� ��ҹ��ڸ� �����Ѵ�. �Ʒ� SQL���� �����ϸ� ����� ������ �ʴ´�.
select employee_id "������̵�", first_name, last_name "��"
from EMPLOYEES where first_name='WILLIAM';--�̸� ��ü�� �빮�ڷ� �ۼ���.

/*
where���� �̿��ؼ� ���ǿ� �´� ���ڵ� �����ϱ�
    : last_name�� smith�� ���ڵ带 �����´�.
    ����] where���� ������ �Է��Ҷ� �÷��� �������̸�
    �̱������̼��� ����ؾ��Ѵ�. �������� ��� ���������ϴ�.
*/
select * from employees where last_name='Smith';--2�� ����
select * from employees where last_name='Smith' and salary=8000;--1�� ����
select * from employees where last_name='Smith' or salary=8000;--4�� ����

--�޿��� 5000�̸� Ȥ�� 5000�̻��� ����� ������ ��������
select * from employees where salary<5000;
select * from employees where salary>=5000;

/*
�Ի����� 04�� 01�� 01�� ������ ��������� �����Ͻÿ�
    : ��¥�� ����ó�� <,>= ��� ���� �񱳿����ڸ� ���� ������
    ������ �� �ִ�.
*/
select * from employees where hire_date>'04/01/01';

/*
and ������ : �� �̻��� ������ ���ÿ� �����Ҷ� ���ڵ带 �����´�.
    �μ����̵� 50�̸鼭 �Ŵ������̵� 100�� ��������� �����Ͻÿ�
*/
SELECT--select �ڵ��ϼ��ϸ� �̷� ������ ����
    *
FROM employees where department_id=50 and manager_id=100;


/*
 in ������ : or �����ڿ� ����� ������� �ϳ��� Į���� ����������
    ������ �ɰ� ������ ����ϴ� ������
    �޿��� 4200, 6400, 8000�� ������ ������ ��ȸ�Ͻÿ�.
*/
--���1 : or�� ����Ѵ�. �÷����� �ݺ������� ����Ǿ�� �Ѵ�
SELECT
    *
FROM employees where salary=4200 or salary=6400 or salary=8000;

--���2 : in �����ڸ� ����Ѵ�. �÷����� �ѹ��� ����ϸ� �ȴ�
SELECT
    *
FROM employees where salary in(4200, 6400, 8000);

/*
not ������ : �ش� ������ �ƴ� ���ڵ带 �����´�.
    �μ���ȣ�� 50�� �ƴ� ��������� ��ȸ�Ͻÿ�.
    -> <> Ȥ�� not���� ǥ���Ѵ�.
*/
--���1 
SELECT
    *
FROM employees where department_id<>50;

--���2 
SELECT
    *
FROM employees where not (department_id=50);

/*
 between and ������ : Į���� ������ ���� �˻��� �� ����Ѵ�.
    �޿��� 4000~8000 ������ ����庸�� ��ȸ�Ͻÿ�.
*/
--���1
SELECT
    *
FROM employees where salary>=4000 and salary<=8000;
--���2
SELECT
    *
FROM employees where salary between 4000 and 8000;

/*
 distinct ������ : �÷����� �ߺ��Ǵ� ���ڵ带 �����Ҷ� ����Ѵ�.
    Ư�� �������� select������ �ϳ��� Į������ �ߺ��Ǵ� ����
    �ִ� ��� �ߺ����� ������ �� ����� ����� �� �ִ�.
*/
select job_id from employees;
select distinct job_id from employees;

/*
 like ������ : Ư�� Ű���带 ���� ���ڿ� �˻��ϱ�
    ����] �÷��� like '%Ű����%' ///// �÷��� like '_Ű����_'
    ���ϵ�ī�� ����
        % : ��� ���� Ȥ�� ���ڿ��� ��ü�Ѵ�. 
        ex) D�� �����ϴ� �ܾ� : D% -> Da, Dream, Drama...
              Z�� ������ �ܾ� : %Z -> aZ, abcZ ...
              C�� ���ԵǴ� �ܾ� : %C% -> aCb, abCd, Vitamin-C
              
         _ : ����ٴ� �ϳ��� ���ڸ� ��ü�Ѵ�.
         ex) D�� �����ϴ� 3������ �ܾ� : D__ -> Dab, Dad, Dxy
               A�� �߰��� ���� 3������ �ܾ� : _A_ ->aAa, zAd...
*/
--first_name�� 'D'�� �����ϴ� ������ �˻��Ͻÿ�
SELECT
    *
FROM employees where first_name like 'D%';

--first_name�� ����° ���ڰ� 'a'�� ��� ������ �����Ͻÿ�
SELECT
    *
FROM employees where first_name like '__a%';

--first_name�� 'd'�� ������ ��� ������ �˻��Ͻÿ�
SELECT
    *
FROM employees where first_name like '%d';

--phone_number�� 1344�� ���ԵǴ� ��� ������ �˻��Ͻÿ�
SELECT
    *
FROM employees where phone_number like '%1344%';

/* 
 ���ڵ� �����㰡(Sorting)
    ������������ : order by �÷��� asc(�������� [����Ʈ])
    ������������ : order by �÷��� desc
    
    2�� �̻��� �÷����� �����ؾ� �Ҷ��� ,(�޸�)�� �����ؼ� �����Ѵ�.
    ��, �̶� ���� �Է��� �÷����� ���ĵ� ���¿��� �ι�° �÷��� ���ĵȴ�.
*/

/*
������� ���̺��� �޿��� ������������ ���������� �������� �����Ͽ� �����Ͻÿ�.
����� �÷� : first_name, salary, email, phone_number
*/
select first_name, salary, email, phone_number 
from employees 
order by salary asc;

/*
�μ���ȣ�� ������������ ������ �� �ش� �μ����� ���� �޿��� �޴� ������
���� ��µǵ��� �ϴ� SQL���� �ۼ��Ͻÿ�.
����׸� : �����ȣ, �̸�, ��, �޿�, �μ���ȣ
*/

select employee_id, last_name, first_name, salary, department_id 
from employees
order by department_id desc, salary desc;

/*
 is null Ȥ�� in not null
    : ���� null�̰ų� null�� �ƴ� ���ڵ� ��������
    �÷��� null���� ����ϴ� ��� ���� �Է����� ������ null����
    �Ǵµ� �̸� ������� select �Ҷ� ����Ѵ�.
*/
--���ʽ����� ���� ����� ��ȸ�Ͻÿ�
SELECT
    *
FROM employees where commission_pct is null;

--���ʽ����� �ִ� ����� ��ȸ�Ͻÿ�
SELECT
    *
FROM employees where commission_pct is not null;

--���ʽ����� ���� ����� �޿��� 5000�̻��� ����� ��ȸ�ϴ� �������� �ۼ��Ͻÿ�.
SELECT
    *
FROM employees where commission_pct is null and salary>=5000;








