/***************************************
���ϸ� : Or07DDL.sql
DDL : Data Definition Laguage (���������Ǿ�)
���� : ���̺�, ��� ���� ��ü�� ���� �� �����ϴ� �������� ���Ѵ�.
***************************************/
/*
system�������� ������ �� �Ʒ� ��ɾ ���������� �����Ѵ�.
���ο� ������ ���� ������ system���� �� ������ ������ �����ϴ�.
*/
create user study identified by 1234;--��������
grant connect, resource to study;--���Ѻο�

------------------------------------------------
--study������ ����� �� �����Ѵ�. �ǽ��� study���� ����!

select * from dual;--����Ŭ���� �����Ǵ� ��� ������ �ִ� �������̺�
select * from tab;--�ش� ������ ������ ���̺� ����� ���°���

/*
���̺����
����]
    create table ���̺�� (
        �÷�1 �ڷ��� [not null ...],
        �÷�2 �ڷ��� [��������....],
        ....
        primary key (�÷���) �� ��������...
    );
*/
create table tb_member (
    member_idx number(10),--10�ڸ� ����ǥ��
    user_id varchar2(30),
    pass_word varchar2(50),
    user_name varchar2(30),
    mileage number(7,2)--�Ǽ�ǥ��. ��ü 7�ڸ�, �Ҽ� 2�ڸ�
);

select * from tab;
/*
desc ���̺�� : ������ ���̺��� �Ӽ�(����, �÷�Ÿ��)�� Ȯ���ϱ� ����
    ��ɾ�.
*/
desc tb_member;

/*
���� ������ ���̺� ���ο� �÷� �߰��ϱ�
    -> tb_member ���̺� email �÷��� �߰��Ͻÿ�.
    
    ����] alter table ���̺�� add �߰��� �÷� �ڷ���(ũ��) ��������;
*/
alter table tb_member add email varchar2(100); 
desc tb_member;

/*
���� ������ ���̺��� �÷� �����ϱ�
    -> tb_member���̺��� email �÷��� ����� 200���� Ȯ���Ͻÿ�.
        ���� �̸��� ����Ǵ� user_name�÷��� 60���� Ȯ���Ͻÿ�.
        
    ����] alter table ���̺�� modify �������÷��� �ڷ���(ũ��);    
*/
alter table tb_member modify email varchar2(200);
alter table tb_member modify user_name varchar2(60);
desc tb_member;

/*
���̺��� �÷� �����ϱ�
    -> tb_member ���̺��� mileage�÷��� �����Ͻÿ�
    
    ����] alter table ���̺�� drop column ������ �÷���;
*/
alter table tb_member drop column mileage;
desc tb_member;

/*
���̺� �����ϱ�
    -> tb_member ���̺��� ���̻� ������� �����Ƿ� �����Ͻÿ�.
    
    ����] drop table ������ ���̺��;
*/
drop table tb_member;
select * from tab;

--������ create���� �ٽ� �ѹ� �����ؼ� ���̺��� ������ �� �ǽ�!

--���ο� ���ڵ� ���� �� Ȯ��
insert into tb_member values (1, 'hong', '1234', 'ȫ�浿', 10000);
insert into tb_member (member_idx, user_id, pass_word, user_name, mileage)
    values (2, 'gasan', '9876', '����', 20000);
select * from tb_member;

--���̺��� ���ڵ���� �����ϱ�
create table tb_member_copy
as
select * from tb_member where 1=1;
--����Ǿ����� Ȯ���ϱ�
desc tb_member_copy;
select * from tb_member_copy;

--���̺��� �Ӽ� �����ϱ�
create table tb_member_empty
as
select * from tb_member where 1=0;
--����Ǿ����� Ȯ���ϱ�
desc tb_member_empty;
select * from tb_member_empty;


/*********************************************************************************************/
/******************************SCOTT�������� �������� ����*************************************/
/*********************************************************************************************/

/***********
1. ���� ���ǿ� �´� ��pr_dept�� ���̺��� �����Ͻÿ�.
***********/
create table pr_dept (
    dno number(2),
    dname varchar2(20),
    loc varchar2(35)
);
desc pr_dept;

/***********
2. ���� ���ǿ� �´� ��pr_emp�� ���̺��� �����Ͻÿ�.
***********/
create table pr_emp (
    eno number(4),
    ename varchar2(10),
    job varchar2(30),
    regist_date date
);
desc pr_emp;

/***********
3. pr_emp ���̺��� ename �÷��� varchar2(50) �� �����Ͻÿ�.
***********/
alter table pr_emp modify ename varchar(50);
desc pr_emp;

/*********************
4. pr_emp ���̺��� �����ؼ� pr_emp_clone ���̺��� �����ϵ� 
eno, ename, job�� �����ϰ� ���� ������ Į������ 
e_no, e_name, job_id �� �����Ͻÿ�.
**********************/
create table pr_emp_clone 
as
select eno 'e_no', ename 'e_name', job 'job_id' 
from pr_emp where 1=0;

create table pr_emp_clone (
    e_no, e_name, job_id
)
as
select  eno, ename, job from pr_emp where 1=1;
--�߰�] ������ ���̺��� �״�� �����ϴ� ���
create table pr_emp_clone2
as
select * from pr_emp;
desc pr_emp_clone2;
desc pr_emp_clone;

/**********************
5. ������ ������ pr_emp_clone ���̺��� �̸��� 
pr_emp_clone_rename ���� �����Ͻÿ�.
**********************/
alter table pr_emp_clone rename to pr_emp_clone_rename; 
desc pr_emp_clone -- ���� ���̺� ������

rename pr_emp_clone to pr_emp_clone_rename;
desc pr_emp_clone_rename;
/*********************
6. 1������ ������ pr_dept ���̺��� dname Į���� �����Ͻÿ�.
*********************/
alter table pr_dept drop column dname;
desc pr_dept;

/*********************
7. ��pr_emp�� ���̺��� job �÷��� varchar2(50) ���� �����Ͻÿ�.
*********************/
desc pr_emp;
alter table pr_emp modify job varchar2(50);

/**********************
8. 5���� pr_emp_clone_rename ���̺��� �����Ͻÿ�
***********************/
drop table pr_emp_clone_rename;
drop table pr_emp_clone2;

/*
�� ���̺� �÷� �߰��ϱ�
    ����
        alter table ���̺�� 
            add �߰����÷� �ڷ���(ũ��) ��������;

�� ���̺��� �÷� �����ϱ�
    ����
        alter table ���̺�� modify �������÷��� �ڷ���(ũ��);

�� ���̺��� �÷� �����ϱ�
    ����
        alter table ���̺�� drop column �÷���;
*/






                                
                                

