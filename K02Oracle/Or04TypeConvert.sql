/*********************************
���ϸ� : Or04TypeConvert.sql
����ȯ�Լ� / ��Ÿ�Լ�
���� : ������Ÿ���� �ٸ� Ÿ������ ��ȯ�ؾ��� �� ����ϴ� �Լ��� ��Ÿ�Լ�
*********************************/

/*
sysdate : ���糯¥�� �ð��� �ʴ����� ��ȯ���ش�. �ַ� �Խ��ǿ���
    ���ο� �������� ������ �Է��� ��¥�� ǥ���ϱ� ���� ���ȴ�.
*/

select sysdate from dual;

/* ��¥����(��ҹ��ڸ� �������� �ʴ´�) */
--���糯¥�� 0000/00/00 ���·� ����Ͻÿ�
select to_char(sysdate, 'yyyy/mm/dd ') "���ó�¥" from dual;
--���糯¥�� 0000-00-00 ���·� ����Ͻÿ�
select to_char(sysdate, 'YYYY-MM-DD ') "���ó�¥" from dual;
--���糯¥�� "������ 0000�� 00�� 00�� 00�����Դϴ�" ���·� ����Ͻÿ�
select 
    to_char(sysdate, '������YYYY�� MM�� DD�� DY�����Դϴ�"') "���ó�¥" 
from dual;--�����߻� : ��¥������ �������մϴ�.

select 
    to_char(sysdate, '"������ "YYYY"�� " MM"�� " DD"�� " DY" �����Դϴ�"') "���ó�¥" 
from dual;--���Ĺ��ڸ� ������ ������ ���ڿ��� "(���������̼�)"���� �����ش�.

SELECT
    to_char(sysdate, 'day') "����(������)",
    to_char(sysdate, 'dy') "����(��)",
    to_char(sysdate, 'mon') "��(3��)",
    to_char(sysdate, 'mm') "��(03��)",
    to_char(sysdate, 'month') "��(3��)",
    to_char(sysdate, 'yy') "��(21��)",
    to_char(sysdate, 'dd') "���� ���ڷ� ǥ��",
    to_char(sysdate, 'ddd') "1���� ���° ��" 
from dual;

/* �ð� ���� */
--����ð��� 00:00:00 ���·� ǥ���ϱ�

SELECT
    to_char(sysdate, 'HH:MI:SS') "�빮�ڼ���",
    to_char(sysdate, 'hh:mi:ss') "�ҹ��ڼ���"
FROM dual;

--���糯¥�� �ð��� �Ѳ����� ǥ���ϱ�

SELECT
    to_char(sysdate, 'yyyy-mm-dd hh:mi:ss') "����ð�"
FROM dual;
--����ð��� ����/���� Ȥ�� 24�ð����� ǥ���ϱ�
SELECT
    to_char(sysdate, 'hh am') "AM���",
    to_char(sysdate, 'hh pm') "PM���",
    to_char(sysdate, 'hh24') "24�ð���"
FROM dual;

/* �������� */
/*
    0 : ������ �ڸ����� ��Ÿ���� �ڸ����� ���� �ʴ� ���
        0���� �ڸ��� ä���.
    9 : 0�� ����������, �ڸ����� �����ʴ� ��� �������� ä���.    
*/
SELECT
    to_char(123, '0000') "���Ĺ���0���",
    to_char(123, '9999') "���Ĺ���9���",
    trim(to_char(123, '9999')) "trim()���"
FROM dual;--����Ŭ�� ��� �Լ��� 2�� �̻� ��ø�ؼ� ��밡��

SELECT
    to_char(123456789, '00,000,000,000') "���Ĺ���0���",
    to_char(123456789, '99,999,999,999') "���Ĺ���9���",
    ltrim(to_char(123456, '99,999,999,000')) as "������������1",
    ltrim(to_char(123456789, '99,999,999,000')) as "������������2"
FROM dual;--����Ŭ�� ��� �Լ��� 2�� �̻� ��ø�ؼ� ��밡��

--��ȭǥ�� : L-> �� ���� �´� ��ȭǥ�ð� �ȴ�. �ѱ��� ��� �ܿ�
SELECT to_char(12345, 'L999,999') from dual;

/*
to_number() : ������ �����͸� ���������� ��ȯ�Ѵ�.
*/
SELECT to_number('123') + to_number('456') from dual;
--�� ���ڰ� ���ڷ� ��ȯ�Ǿ� ������ ��� �����.

/*
to_date()
    : ���ڿ� �����͸� ��¥�������� ��ȯ�ؼ� ������ش�. �⺻������
    ��/��/�� ������ �����ȴ�.
*/
SELECT
    to_date('2021-03-31')"��¥�⺻����1",
    to_date('20210331')"��¥�⺻����2",
    to_date('2021/03/31')"��¥�⺻����3"
FROM dual


/*
��¥������ ��-��-�� ���� �ƴѰ��� ����Ŭ�� �ν����� ���Ͼ� �����߻���.
�̷���� ��¥������ �̿��ؼ� ����Ŭ�� �ν��� �� �ֵ��� ó���ؾ���.
*/
select to_date('31-03-2021') from dual;
--'��'�̳� '��'�� ��ġ�� �ٲ�� �ش� ���ĵ� �����ؼ� �����ָ� �ȴ�.
select to_date('31-03-2021','dd-mm-yyyy') from dual;
select to_date('03-31-2021','mm-dd-yyyy') from dual;

--�ð������� ���ԵǹǷ� �����߻���
select to_date('2021-03-31 12:48:33') from dual;
--���1
select to_date(substr('2021-03-31 12:48:33',1,10)) "��¥�� ©���" from dual;
--���2
select to_date('2021-03-31 12:48:33','yyyy-mm-dd hh:mi:ss') "�ð����� ����"from dual;
--���� ���� �ð��� ����ؾ� �Ѵٸ� ���2�� �̿��ؾ� �Ѵ�.

/*
�ó�����1] ���ڿ� '2021/04/03'�� � �������� ��ȯ�Լ��� ���� ����Ͻÿ�
*/

SELECT
    to_date('1992/06/02')"1�ܰ�",
    to_char(to_date('1992/06/02'),'day') "���ϼ���1",
    to_char(to_date('1992/06/02'),'dy') "���ϼ���2"
FROM dual;

/*
[����] ���ڿ�'2013�� 10�� 24����' � �������� ��ȯ�Լ��� ����
    ����� �� �ִ� �������� �ۼ��Ͻÿ�. �� ���ڿ��� ���Ƿ� ������ �� �����ϴ�.
*/

SELECT
    to_date('2013�� 10�� 24��','yyyy"��" mm"��" dd"��"')"1�ܰ�",
    to_char(to_date('2013�� 10�� 24��','yyyy"��" mm"��" dd"��"'),'day') "���ϼ���1"
FROM dual;

/*
[����] : hr ������ employees ���̺��� �����ȣ 206�� ����� � ���Ͽ� �Ի��޴���
����ϴ� �������� �ۼ��Ͻÿ�
*/

SELECT
    hire_date "�Ի���",
    to_char(hire_date,'day') "�Ի����"
FROM employees where employee_id=206;
--hire_date Į���� �̹� dateŸ���̹Ƿ� ������ ������ �ʿ����.

/*
�ó�����2 : '2015-10-24 12:34:56' ���·� �־��� �����͸� ���ڷ��Ͽ�
    '0000�� 00�� 00�� 0����' �������� ��ȯ�Լ��� �̿��Ͽ� ����Ͻÿ�
*/
SELECT
    TO_DATE('2015-10-24 12:34:56', 'YYYY-mm-dd hh:mi:ss') "�⺻����",
    TO_CHAR(TO_DATE('2015-10-24 12:34:56', 'YYYY-mm-dd hh:mi:ss'),
        'yyyy"��"mm"�� "dd"�� "dy"����"') "��ȯ���"
FROM dual;

/*
nvl() : null���� �ٸ� �����ͷ� �����ϴ� �Լ�
    ����] nvl(�÷���, ��ü�� ��)
    
    �ط��ڵ带 select�ؼ� ���������� ����� �ϴ°�� �ش� �÷��� null�̸�
    NullPointerException�� �߻��ϰ� �ȴ�. �׷��Ƿ� �ƿ� �����͸� �����ö� 
    null���� ���� �� �ִ� �÷��� ���� �̸� ó���ϸ� ���ܹ߻��� �̸� ������ �� 
    �����Ƿ� ���ϴ�.
    
*/
--������̺��� ���ʽ����� null�� ��ũ�带 0���� ��ü�ؼ� ����ϴ� ������ �ۼ��Ͻÿ�

SELECT
    first_name,commission_pct, nvl(commission_pct,0) as "���ʽ���"
FROM employees;

/*
decode() : javadml switch���� ����ϰ� Ư������ �ش��ϴ� ��¹��� �ִ� ��� ����Ѵ�.
    ����] decode(�÷���,
                        ��1, ���1,
                        ��2, ���2,
                        ..............,
                        �⺻��)
    �� �������� �ڵ尪�� ���ڿ��� ��ȯ�Ͽ� ����� �� ���� ����Ѵ�.
    
*/
/*
�ó�����] ������̺��� �� �μ��� �ش��ϴ� �μ����� ����ϴ� ��������
    decode�� �̿��ؼ� �ۼ��Ͻÿ�.
*/




SELECT
    first_name, last_name, department_id,
    decode(department_id,
        10,	'Administration',
        20,	'Marketing',
        30,	'Purchasing',
        40,	'Human Resources',
        50,	'Shipping',
        60,	'IT',
        '�׿ܺμ�') AS TeamName
FROM employees;

/*
    case() : java�� if~else���� ����� ������ �ϴ� �Լ�
        ����] case
                    when ����1 then ��1
                    when ����2 then ��2
                    ......................
                    else �⺻��
                    end
*/
SELECT
    first_name, last_name, department_id, salary,
    CASE 
       WHEN department_id=10 THEN 'Administration'
       WHEN department_id=20 THEN 'Marketing'
       WHEN department_id=30 THEN 'Purchasing'
       WHEN department_id=40 THEN 'Human Resources'
       WHEN department_id=50 THEN 'Shipping'
       WHEN department_id=60 THEN 'IT'
       ELSE '�׿ܺμ�'
    END as TeamName
FROM employees;

 






