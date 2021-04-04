/******************************************
���ϸ� : Or10SubQuery.sql
��������
���� : �������ȿ� �Ǵٸ� �������� ���� ������ select��
******************************************/

/*
������ ��������
    ����] 
        select * from ���̺�� where �÷�=(
            select �÷� from ���̺�� where ����
        );
        
    �� ��ȣ���� ���������� �ݵ�� �ϳ��� ����� �����ؾ� �Ѵ�.    
*/
/*
�ó�����] ������̺��� ��ü����� ��ձ޿����� ���� �޿��� �޴� �������
�����Ͽ� ����Ͻÿ�.
*/

SELECT
    first_name, last_name, email, salary
FROM employees 
where salary < round(avg(salary));/*
    �ش� �������� ���ƻ� �´µ��ϳ� �׷��Լ��� �����࿡
    ������ �߸��� ���������� ������ �߻��Ѵ�.
*/

--1�ܰ� : ��ձ޿��� �������� ���Ѵ�.
SELECT
    round(avg(salary))
FROM employees;
--2�ܰ� : 6462���� ���� �޿��� �޴� ������ �����Ѵ�.
SELECT
    first_name, last_name, email, salary
FROM employees 
where salary<6462;
--3�ܰ� : 2���� ������ �ϳ��� �������������� ��ģ��.
SELECT
    first_name, last_name, email, salary
FROM employees 
where salary<
(SELECT round(avg(salary)) FROM employees);


/*
�ó�����] ��ü ����� �޿��� ���� ���� ����� �̸��� �޿��� ����ϴ�
������������ �ۼ��Ͻÿ�.
����׸� : �̸�1, �̸�2, �̸���, �޿�
*/
--1�ܰ� : �ּұ޿��� ã�´�.
SELECT
    min(salary)
FROM employees;

--2�ܰ� : 2100�� �޴� ����� ã�´�
SELECT
    first_name,last_name, email, salary
FROM employees where salary=2100;

--3�ܰ� : 2���� ������ �ϳ��� �������������� ��ģ��.
SELECT
    first_name,last_name, email, salary
FROM employees where salary=
(
SELECT
    min(salary)
FROM employees
);

/*
�ó�����] ��ձ޿����� ���� �޿��� �޴� ������� ����� ��ȸ�� �� �ִ� 
������������ �ۼ��Ͻÿ�.
��³��� : �̸�1, �̸�2, ��������, �޿�
�ش��������� jobs���̺� �����Ƿ� join�ؾ� �Ѵ�.
*/
--1�ܰ� : ��ձ޿� ���ϱ�
SELECT
   trunc(avg(salary),2)
FROM employees;

--2�ܰ� : 6461.83���� ���� �޿��� �޴� ���� ���ϱ� �����~
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
������ ��������
    ����]
        select * from ���̺�� where �÷� in (
            select �÷� from ���̺�� where ����
        );
    �� ��ȣ���� ���������� 2�� �̻��� ����� �����ؾ� �Ѵ�.    
*/

/*
�ó�����] ���������� ���� ���� �޿��� �޴� ����� ����� ��ȸ�Ͻÿ�.
    ��¸�� : ������̵�, �̸�, ���������̵�, �޿�
*/


--1.������̺��� �ܼ� ������ ���� ������ ��׿����� Ȯ��
SELECT
    job_id, salary
FROM employees
order by job_id, salary desc;


--2.1������ Ȯ���� ���ڵ带 group by ���� �׷�ȭ�Ͽ� �� ������
--   �ִ�޿��� Ȯ���Ѵ�.
SELECT
    job_id,max(salary)
FROM employees GROUP BY job_id;


--3.2���� ����� ������� �ܼ� ������ �ۼ�
SELECT
    employee_id, first_name, job_id, salary
FROM employees
where
    (job_id='AC_MGR'and salary=12008)or
    (job_id='AC_ACCOUNT'and salary=8300)or
    (job_id='ST_MAN'and salary=8200)or
    (job_id='PU_MAN'and salary=11000)or
    (job_id='AD_ASST'and salary=4400);/*
            2������ ����� 19���� ����� �ܼ������� �ۼ��ϸ�
            ���Ͱ��� or �����ڸ� ���� ������ �� �ִ�. ������
            ����� ���ٸ� �ۼ��� �Ұ����� ���̴�.
    */
    
--4. 3�� �������� ���������� �����Ѵ�. �������̹Ƿ� in�� ����Ѵ�.
SELECT
    employee_id, first_name, last_name, job_id, salary 
FROM employees where (job_id,salary) in
(
    SELECT
        job_id,max(salary)
    FROM employees GROUP BY job_id
)order by employee_id;

/*
�����࿬����2 : any
    ���������� �������� ���������� �˻������ �ϳ��̻� ��ġ�ϸ� 
    ���̵Ǵ� ������. �� �� �� �ϳ��� �����ϸ� �ش� ���ڵ带 �����´�.
*/
/*
�ó�����] ��ü����߿��� �μ���ȣ�� 20�� ������� �޿����� ���� �޿���
�޴� �������� �����ϴ� ������������ �ۼ��Ͻÿ�.
*/

SELECT
    min(salary), max(salary)
FROM employees where department_id=20;
--�ּ� 6000 �ִ� 13000

SELECT
    first_name, last_name, department_id, salary
FROM employees where salary >=any
(
SELECT
    salary
FROM employees where department_id=20
);/*
������ ������ any�� ����ϸ� 2���� ����  or ��������
������� �����ϰ� �ȴ�. 6000�Ǵ� 13000�̻��� ���ڵ常 ����ȴ�.
*/

/*
������ ������3 : all
    : ���������� �������� ���������� �˻������ ��� ��ġ�ؾ�
    ���� �ȴ�.
*/

SELECT
    first_name, last_name, department_id, salary
FROM employees where salary >=all
(
SELECT
    salary
FROM employees where department_id=20
);/*
6000���ٵ� ũ��, 13000���ٵ� Ŀ���ϹǷ� ��������� 13000 �̻���
���ڵ常 �����ϰ� �ȴ�.
*/

/*
Top���� : ��ȸ�� ������� ������ ���� ���ڵ带 �����ö� ����Ѵ�.
    �ַ� �Խ����� ����¡�� ���ȴ�.
    
    rownum: ���̺��� ���ڵ带 ��ȸ�� ������� ������ �ο��Ǵ�
        ������ �÷��� ���Ѵ�. �ش� �÷��� ��� ���̺� �����Ѵ�.
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
������̺��� ������ ������ ���� �������� ���� ����������
*/
SELECT
    *    
FROM
    (SELECT Tb.*, rownum rNum FROM
    (SELECT * FROM employees order by employee_id desc) Tb)
--where rNum between 1 and 10;
where rNum between 11 and 20;

/*
    between�� ������ ���Ͱ��� �������ָ� �ش� �������� ���ڵ常
    �������� �ȴ�. ���� ������ ���� JSP���� �������� ������ �����Ͽ�
    ����ؼ� �����ϰ� �ȴ�.
    
3.2���� ��� ��ü�� �����ͼ�
    (2.1���� ����� rownum�� ���������� �ο���
    (1.������̺��� ��� ���ڵ带 �������� �����ؼ� ����) Tb)
�ʿ��� �κ��� rownum���� ������ ���� �����Ѵ�.
*/



