/***************************************
���ϸ� : Or06GroupBy.sql
�׷��Լ� (select�� 2��°)
���� : ��ü ���ڵ�(�ο�)���� ������� ����� ���ϱ� ���� �ϳ� �̻���
    ���ڵ带 �׷����� ��� ���� �� ����� ��ȯ�ϴ� �Լ� Ȥ�� ������
***************************************/

/*
distinct
    - �ߺ��Ǵ� ���ڵ带 ������ �� �ϳ��� ���ڵ常 �����ͼ� �����ش�.
    - ���� ������� �����͸� ����� �� ����.
*/
SELECT
    DISTINCT job_id
FROM employees;


/*
group by
    - ������ ���� �ִ� ���ڵ带 �ϳ��� �׷����� ��� �����´�.
    - �������� ����� �ϳ��� ���ڵ� ������, �������� ���ڵ尡 ������
    ����̹Ƿ� ������� �����͸� ����� �� �ִ�.
    - �ִ�, �ּ�, ���, �ջ� ���� �����ϴ�.
*/

SELECT
    job_id, sum(salary), avg(salary)
FROM employees GROUP BY job_id;

/*
�׷��Լ��� �⺻����
    : [] ���ȣ �κ��� ���� ����
    
    select 
        �÷�1, �÷�2, ....Ȥ�� ��ü*(��ü)
    from
        ���̺��
    [where 
        ����1 or ����2 and ����3...]
    [group by
        ������ �׷�ȭ�� ���� �÷���]
    [having
        �׷쿡�� ã�� ����]
    [order by
        ���ڵ� ������ ���� �÷��� ���Ĺ��(asc/desc)]
        
    �������� �������
        from->where->group by->having->select->order by
        
*/

/*
 sum() : �հ踦 ���Ҷ� ����ϴ� �Լ�
    ����] sum(�÷�)
    -numberŸ���� �÷������� ��밡��
    -�ʵ���� �ʿ��� ��� AS�� �̿��ؼ� ��Ī �ο� ����
    
*/
--��ü ������ �޿��� �հ踦 ����Ͻÿ�.
SELECT
    to_char(sum(salary),'$999,999,999') "�޿��� �հ�"
FROM employees;

--10�� �μ����� �ٹ��ϴ� ������� �޿� �հ�� ������ ����Ͻÿ�

SELECT
    to_char(sum(salary),'$999,999,999') "10���μ��޿��Ѱ�)"
FROM employees where department_id=10;

--sum()�� ���� �׷��Լ��� numberŸ���� �÷������� ��밡���ϴ�.
SELECT
    sum(first_name)
FROM employees; 


/*
count() : ���ڵ��� ������ ī��Ʈ�Ҷ� ����ϴ� �Լ�
*/
--������̺� ����� ��ü ������� ����ΰ���?

SELECT
    count(*)
FROM employees;--���1 �������

SELECT
    COUNT(employee_id)
FROM employees;--���2 ������� �ƴ�

/*
    count() �Լ��� ����Ҷ��� �� �ΰ��� ��� ��� �����ϳ�,
    *�� ����� ���� �����Ѵ�. �÷��� Ư���� Ÿ�� �ʾ�
    �˻��ӵ��� ������.
*/

/*
    count()�Լ��� ����
        ����1 : count(all �÷���)
        -> ����Ʈ�� �÷� ��ü�� ���ڵ带 ������ ī��Ʈ�Ѵ�.
        ����2 : count(distinct �÷���)
        -> �ߺ��� ������ ���¿��� ī��Ʈ�Ѵ�.
*/
SELECT
    COUNT(all job_id)"��������ü����",
    COUNT(distinct job_id) "����������"
FROM employees;

/*
avg() : ��հ��� ���Ҷ� ����ϴ� �Լ�
*/
--��ü����� ��ձ޿��� �������� ����ϴ� �������� �ۼ��Ͻÿ�.

SELECT
    count(*),
    sum(salary),
    sum(salary)/count(*),
    avg(salary),
    to_char(avg(salary),'$999,999')
FROM employees
where 1=1;

--�������� ��ձ޿��� ���ΰ�?
--1.�μ����̺��� �������� �μ���ȣ�� Ȯ���Ѵ�.
SELECT
    *
FROM departments where department_name = 'Sales';

SELECT
    *
FROM departments where lower(department_name) = 'sales';

SELECT
    *
FROM departments where upper(department_name) = 'SALSE';

/*
    �����˻��� ��ҹ��� Ȥ�� ������ ���Ե� ��� ��� ���ڵ忡 ����
    ���ڿ��� Ȯ���ϴ°� �Ұ����ϹǷ� �ϰ����� ��Ģ�� �����ϱ�����
    upper()�� ���� ��ȯ�Լ��� ����Ͽ� �˻��ϸ� ���ϴ�.
*/

--2. ������ ã�� 80�� �μ����� �ٹ��ϴ� ������ ��ձ޿��� ���Ѵ�.

SELECT
    to_char(avg(salary),'$999,999.99') "��������ձ޿�"
FROM employees where department_id=80;/*
    to_char()�� ���� ���ڸ����� , �� ��ȭǥ��
    �׸��� �Ҽ��� ���� 2�ڸ����� �������� ǥ���Ѵ�.
*/

/*
    min() / max() : �ּ�/�ִ밪�� ã���� ����ϴ� �Լ�
*/
--����� ���� ���� �޿��� �޴� ����� �����ΰ�
SELECT
    min(salary)
FROM employees;--1.������̺��� ���� ���� �޿��� ã��

SELECT
    first_name,last_name,department_id
FROM employees where salary=2100;
--2.�տ��� ���� 2100�� �޴� ����� select�ؼ� ���

/*
    ����� ���� ���� �޿��� min()���� ���� �� ������
    ���� ���� �޿��� �޴� ����� ���Ͱ��� 2���� ������ ����ϰų�
    ���������� ����Ͽ� ���� �� �ִ�.
    
*/
SELECT
    first_name,last_name,department_id
FROM employees where salary=(SELECT
    min(salary)
FROM employees);

/*
    group by�� : �������� ���ڵ带 �ϳ��� �׷�ȭ�Ͽ� ������
        ����� ��ȯ�ϴ� ������
        
    �� distinct�� �ܼ��� �ߺ����� �����Ѵ�    
        
*/
--������̺��� ���ڵ带 �μ����� �׷�ȭ�Ͽ� Ȯ���ϱ�

SELECT
    department_id
FROM employees GROUP BY department_id;

--�� �μ��� �޿��� �հ�� ���ΰ�?

SELECT
    department_id, 
    sum(salary),
    to_char(sum(salary),'$999,999') "sum"
FROM employees GROUP BY department_id;

/*
�ó�����] [����] �μ��� ������� ��ձ޿��� ���ΰ���?
    ��°��] �μ���ȣ, �޿�����, �������, ��ձ޿�
        �μ���ȣ ������� �������� �����ϼ���
*/

SELECT
    department_id"�μ���ȣ",
    COUNT(*) "�������",
    to_char(sum(salary),'$999,999') "�޿�����",
    to_char(avg(salary),'$999,999') "��ձ޿�"
FROM employees GROUP BY department_id
ORDER BY department_id asc;
------------------------------------------
SELECT
    department_id"�μ���ȣ",
    first_name
FROM employees GROUP BY department_id;--�����߻�
/*
    ������ ����ߴ� group by���� first_name�� �߰��Ͽ�����
    ������ �߻��Ѵ�. select���� group by ���� ����� �÷���
    from������ ����� �� �ִ�. �׷�ȭ�� ���¿��� Ư�� ���ڵ�
    �ϳ��� �����Ѱ��� �ָ��ϹǷ� ������ �߻��Ѵ�.
*/

/*
�μ��� �޿��� �հ�� distinct�� ����ؼ� SQL���� �ۼ��� �� ����.
*/
SELECT
        DISTINCT department_id,
        sum(salary)
FROM employees;
/*
�ó�����] �μ����̵� 50�� ������� ��������, ��ձ޿�, �޿�������
������ ǥ���ϴ� �������� �ۼ��Ͻÿ�.
*/
SELECT
    count(*),
    trim(to_char(avg(salary),'$999,999')) "��� �޿�",
    trim(to_char(sum(salary),'$999,999')) "�޿�����"
FROM employees
where department_id=50
GROUP BY department_id;

/*
having�� : ���������� �����ϴ� �÷��� �ƴ� �׷��Լ��� ���� ��������
    ������ �÷��� ������ �߰��� �� ����Ѵ�.
    �ش� ������ where���� �߰��ϸ� ������ �߻��Ѵ�.
*/
/*
�ó�����] ������̺��� �� �μ����� �ٹ��ϰ� �ִ� ������ �����κ� �������
    ��ձ޿��� ������ ����ϴ� �������� �ۼ��Ͻÿ�.
    ��, ����� ������ 10���� �ʰ��ϴ� ���ڵ常 �����Ͻÿ�.
*/
SELECT
    department_id "�μ���ȣ", job_id "������ID",
    count(*) "�����",trim(to_char(avg(salary),'$999,999')) "��ձ޿�"
FROM employees 
GROUP BY department_id, job_id--�ΰ��� �������� GROUP BY �԰���
HAVING count(*)>10
ORDER BY "�μ���ȣ"; 

/*
count(*)�� ���� �׷�� ���õ� ������ where���� ����� �� ����.
*/
SELECT
    department_id "�μ���ȣ", job_id "������ID",
    count(*) "�����",trim(to_char(avg(salary),'$999,999')) "��ձ޿�"
FROM employees 
WHERE count(*)>10--group function is not allowed here ���� �߻�
GROUP BY department_id, job_id--�ΰ��� �������� GROUP BY �԰���
ORDER BY "�μ���ȣ"; 


/****************************************************
��������
****************************************************/
/*
1. ��ü ����� �޿��ְ��, ������, ��ձ޿��� ����Ͻÿ�.
�÷��� ��Ī�� �Ʒ��� ���� �ϰ�, ��տ� ���ؼ���
�������·� �ݿø� �Ͻÿ�.

��Ī) �޿��ְ�� -> MaxPay
�޿������� -> MinPay
�޿���� -> AvgPay
*/
SELECT
    max(salary) "MaxPay",
    min(salary) "MinPay",
    round(avg(salary)) "AvgPay"
FROM employees;

/*
2. �� ������ �������� �޿��ְ��, ������, �Ѿ� �� ��վ��� ����Ͻÿ�.
�÷��� ��Ī�� �Ʒ��� �����ϰ� ��� ���ڴ� to_char�� �̿��Ͽ�
���ڸ����� �ĸ��� ��� �������·� ����Ͻÿ�.
��Ī) �޿��ְ�� -> MaxPay
�޿������� -> MinPay
�޿���� -> AvgPay
�޿��Ѿ� -> SumPay
����) employees ���̺��� job_id�÷��� �������� �Ѵ�.
*/
SELECT
    job_id,
    to_char(max(salary),'999,000')"MaxPay",
    to_char(min(salary),'999,000')"MinPay",
    to_char(avg(salary),'999,000')"AvgPay",
    to_char(sum(salary),'999,000')"SumPay"
FROM employees GROUP BY job_id
order by job_id;
/*
3. count() �Լ��� �̿��Ͽ� �������� ������ ������� ����Ͻÿ�.
����) employees ���̺��� job_id�÷��� �������� �Ѵ�.
*/
SELECT
    job_id, count(*) "�����հ�"
FROM employees GROUP BY job_id
order by count(*);
/*
4. �޿��� 10000�޷� �̻��� �������� �������� �հ��ο����� ����Ͻÿ�.
*/
SELECT
    job_id,count(*) "�����հ�"
FROM employees
where salary>=10000
GROUP BY job_id;
--�޿��� ���������� �����ϴ� �÷��̹Ƿ� whrere���� ������ �ɾ�� �Ѵ�.

/*
5. �޿��ְ�װ� �������� ������ ����Ͻÿ�.
*/
SELECT
    MAX(salary)-min(salary)"�ְ��ּұ޿���"
FROM employees;


/*
6. ���޺� ����� �����޿��� ����Ͻÿ�. �����ڸ� �˼����� ��� �� �����޿���
3000�̸��� �׷��� ���ܽ�Ű�� ����� �޿��� ������������ �����Ͽ� ����Ͻÿ�.
*/
SELECT
    job_id, min(salary)"���޺��ּұ޿�"
FROM employees
where manager_id is not null
group by job_id
Having
    min(salary)>=3000
/* not min(salary)<3000 */
--���� ����� ������ ��
order by "���޺��ּұ޿�" desc;
/*
    �����ڸ� �� �� ���� -> ���������� �����ϴ� �÷��̹Ƿ� where���� ���
    �����޿��� 3000�̸��� �׷� -> ���������� �������� �ʴ� �׷��Լ���
                                             ���� �߰��� �÷��̹Ƿ� having���� ���
*/

/*
7. �� �μ��� ���� �μ���ȣ, �����, �μ� ���� ��� ����� ��ձ޿��� ����Ͻÿ�.
��ձ޿��� �Ҽ��� ��°�ڸ��� �ݿø��Ͻÿ�.
*/
SELECT
    department_id "�μ���ȣ",
    count(*)"�μ��������",
    round(avg(salary),2)"��ձ޿�"
FROM employees group by department_id
order by department_id;

/*
8. �� �μ��� ���� �μ���ȣ, �μ��̸�, ������, �����, �μ����� ��� ����� ��ձ޿��� ����Ͻÿ�.
��ձ޿��� ������ �ݿø��ϰ� ���ڸ����� �ĸ��� ����Ͻÿ�.
decode�Լ��� ����Ͽ� �� �μ���ȣ�� �´� �μ����� ������ �Ͻÿ�.
*/

SELECT
    department_id "�μ���ȣ",
    decode(department_id,
        10,    'Administration',
        20,    'Marketing',
        30,    'Purchasing',
        40,    'Human Resources',
        50,    'Shipping',
        60,    'IT',
        70,      'Public Relations',
        80,      'Sales',
        90,    'Executive',
        100,    'Finance',
        110,    'Accounting',
        '�׿ܺμ�') "�μ��̸�",
    decode(department_id,
        10,'Seattle',
        20    ,'Toronto',
        30    ,'Seattle',
        40    ,'London',
        50    ,'South San Francisco',
        60    ,'Southlake',
        70    ,'Munich',
        80    ,'Oxford',
        90    ,'Seattle',
        100,'Seattle',
        110,'Seattle',
        '�׿�����')"������",
    count(*)"�μ��������",
    rtrim(to_char(round(avg(salary)),'999,999'))"��ձ޿�"
FROM employees group by department_id
order by department_id;



    