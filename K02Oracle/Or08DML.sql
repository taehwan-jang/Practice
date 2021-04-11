/****************************************
���ϸ� : Or08DML.sql
DML : Data Manipulation Language(������ ���۾�)
���� : ���ڵ带 ������ �� ����ϴ� ������. �տ��� �н��ߴ�
        select���� ����Ͽ� update(���ڵ����), delete(���ڵ����),
        insert(���ڵ��Է�)�� �ִ�.

****************************************/

--study�������� �ǽ��Ѵ�.

/*
���ڵ� �Է��ϱ� : insert��
    ���ڵ� �Է��� ���� ������ �������� �ݵ�� '�̱������̼�'���� ���ξ� �Ѵ�.
    �������� '���� �׳� ����. ���� �������� '���� �����θ� �ڵ����� 
    ����ȯ�Ǿ� �Էµȴ�.
*/
--�ǽ��� ���� ���̺� ����

create table tb_sample (
    deptNo number(10),          --�μ���ȣ
    deptName varchar2(20),   --�μ���
    deptLoc varchar2(15),      --����
    deptManager varchar2(30)--�Ŵ��� �̸�
);
desc tb_sample;

--���1�� ���� ���ڵ� �Է�
insert into tb_sample (deptno,deptname,deptloc,deptmanager)
    values (10, '��ȹ��', '����', '����');
insert into tb_sample (deptno,deptname,deptloc,deptmanager)
    values (20, '������', '����', '����');

--���2�� ���� ���ڵ� �Է�
insert into tb_sample  values (30, '������', '�뱸', '���');
insert into tb_sample  values (40, '�λ���', '�λ�', '��ȿ');

SELECT
    *
FROM tb_sample;

commit;

/*
    ���ݱ����� �۾�(Ʈ�����)�� �״�� �����ϰڴٴ� �������
    Ŀ���� �������� ������ �ܺο����� ����� ���ڵ带 Ȯ���� �� ����.
    ���⼭ ���ϴ� �ܺζ� Java/JSP�� ���� Oracle�̿��� ���α׷���
    ���Ѵ�. 
    
    ��Ʈ������̶� �۱ݰ� ���� �ϳ��� �����۾��� ���Ѵ�.       
*/
--Ŀ�� ���� ���ο� ���ڵ带 �����ϸ� �ӽ����̺� ����ȴ�.
insert into tb_sample values (50, '������', '����', '���̸�');
--����Ŭ���� Ȯ���ϸ� ���� ���ԵȰ�ó�� ���δ�. ������ �ܺο����� Ȯ�ε��� �ʴ´�.
select * from tb_sample;
--�ѹ� ������� ������ Ŀ�Ի��·� �ǵ�����.
rollback;
--�������� �Է��ߴ� 50�� ���ڵ�� �������.
select * from tb_sample;

/*
    �ѹ� ����� ������ Ŀ�� ���·� �ǵ����ش�.
    ��, commit�� ������ ���·δ� rollback�� �� ����.
*/

/*
���ڵ� �����ϱ� : update��
    ����] 
        update ���̺��
        set �÷�1=��1, �÷�2=��2,....
        where ����;
        
    �������� ���� ��� ��� ���ڵ尡 �Ѳ����� �����ȴ�.
    �����̺�� �տ� from�� ���� �ʴ´�.
*/

--�μ���ȣ 40�� ���ڵ��� ������ �̱����� �����Ͻÿ�.
UPDATE tb_sample set deptloc='�̱�'
where deptno=40;
select * from tb_sample;

--������ ������ ���ڵ��� �Ŵ������� '������'���� �����Ͻÿ�.
UPDATE tb_sample set deptmanager='������'
where deptloc='����';
select * from tb_sample;

--where�� ���� ��� ���ڵ带 ������� ������ '���������'�� �����Ͻÿ�.
UPDATE tb_sample set deptloc='���������';
select * from tb_sample;

/*
������ �����ϱ� : delete�� 
    ����] 
        delete from ���̺�� where ����;
    �ط��ڵ带 �����ϹǷ� delete �ڿ� �÷��� ������� �ʴ´�.
        
*/
--�μ���ȣ�� 10���� ���ڵ带 �����Ͻÿ�
delete from tb_sample where deptno=10;
select * from tb_sample;

--where�� ���� �����ϸ� ��� ���ڵ尡 ������(�����Ұ�)
delete from tb_sample;
select * from tb_sample;

rollback;
select * from tb_sample;


update tb_sample set deptname='�ڽ���' where deptno>=30;
select * from tb_sample;
update tb_sample set deptno=deptno+1;

commit;

/*********************************************************************************************/
/******************************SCOTT�������� �������� ����*************************************/
/*********************************************************************************************/

/***********************
1. DDL�� �������� 2������ ���� ��pr_emp�� ���̺� ������ ���� ���ڵ带 
�����Ͻÿ�.��, ��¥�� sysdate�� �̿��ؼ� ���� ��¥�� �Է��Ͻÿ�.
***********************/
select * from pr_emp;
insert into pr_emp (eno,ename,job,regist_date) 
values (1,'���¿�','� �¹�',sysdate);
insert into pr_emp (eno,ename,job,regist_date) 
values (2,'������','���л� �¹�',sysdate);
insert into pr_emp (eno,ename,job,regist_date) 
values (3,'�Ѱ���','� ����',sysdate);
insert into pr_emp (eno,ename,job,regist_date) 
values (4,'����','���л� ����',sysdate);

/**************************
2. pr_emp ���̺� ���� ���ǿ� �´� ���ڵ带 �����Ͻÿ�.
�̸� : ������
��å : ������
��ϳ�¥ : to_date�Լ��� �̿��ؼ� 7���� ��¥�� �Է��Ͻÿ�.
(���糯¥�� �������� 7������)
**************************/
insert into pr_emp (eno,ename,job,regist_date) 
values (5,'������','������',sysdate-7);

insert into pr_emp 
values (5,'������','������', to_date(sysdate-7,'yy/mm/dd');

/****************************
3. pr_emp ���̺��� eno�� ¦���� ���ڵ带 ã�Ƽ� job 
�÷��� ������ ������ ���� �����Ͻÿ�.
����¦�����ڵ塱 �� ���� ��ȣ�� ���ڿ��� �߰��Ѵ�.
*****************************/
update pr_emp modifiy
set job='��¦�����ڵ�'
where mod(eno,2)='0';

update pr_emp
    set job=job||'(��¦�����ڵ�)'
        where mod(eno,2=0; 
    

/****************************

*****************************/
create table pr_employees
as 
select * from emp where 1=1;
--where���� ���� ������ �ָ� ���ڵ���� ����

desc pr_employees;

/*****************************
4. pr_employees ���̺��� 
�����ȣ 7900���� ������ �޴����� ���� ����� 
�μ���ȣ��  �̸��� FORD �� ����� �μ���ȣ�� ������Ʈ �Ͻÿ�.
*****************************/
select mgr from pr_employees where empno=7900;

select deptno from pr_employees where upper(ename)='FORD';

update pr_employees
set deptno = (
select deptno from pr_employees where upper(ename)='FORD')
where mgr=(
select mgr from pr_employees where empno=7900
);

--�����ȣ 7900�� Ȯ��
select * from pr_employees where empno=7900;--mgr = 7698;
--mgr 7698�� ����� Ȯ��
select * from pr_employees where mgr=7698;
--FORD�� �μ���ȣ Ȯ��
select * from pr_employees where ename='FORD';

update pr_employees set deptno=20 where mgr=7698;

/******************************
5.  pr_employees ���̺��� �Ի����� 12���� ��� ������ �����Ͻÿ�.
******************************/
delete from pr_employees where substr(hiredate,4) like '12%';
select hiredate from pr_employees;

--1����� : ��¥���� ���
delete from pr_employees where to_char(hiredate,'mm')=12;
--2����� : �������� ���
delete from pr_employees where substr(hiredate,4,2)=12;
--3����� : like ���
delete from pr_employees where hiredate like '___12%';
/*******************************
6. pr_employees ���̺��� �Ի����ڰ� ���� ���� ������ ã�Ƽ� 
ename �÷��� ���������̸�(���Ի��)�� �� �ɼ� �ֵ��� ������Ʈ �Ͻÿ�. 
��) KING(���Ի��)
********************************/
select * from pr_employees order by hiredate desc;
alter table pr_employees modify ename varchar2(100);
desc pr_employees;

select max(hiredate) from pr_employees;

update pr_employees
set ename = ename||'(���Ի��)'
/*set ename = concat(ename,'(���Ի��)')*/
where hiredate=(select max(hiredate) from pr_employees);

/*
���ڵ��Է� : insert into ���̺�� (�÷�) values (��)
���ڵ���� : update ���̺�� set �÷�=�� where ����
���ڵ���� : delete from ���̺�� where ����
���ڵ���ȸ : select �÷� from ���̺�� where ����
*/












