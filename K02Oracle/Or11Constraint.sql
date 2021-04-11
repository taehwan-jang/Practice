/********************************************
���ϸ� : Or11Constraint.sql
��������
���� : ���̺� ������ �ʿ��� �������� �������ǿ� ���� �н��Ѵ�.
********************************************/

--study �������� �ǽ�

/*
Primary Key : �⺻Ű
-�������Ἲ�� �����ϱ� ���� ���������̴�.
-�ϳ��� ���̺��� �ϳ��� �⺻Ű�� ������ �� �ִ�.
-�⺻Ű�� �����Ǹ� �� �÷��� �ߺ��� ���̳� null���� �Է��� �� ����.
*/

/*
����1] �ζ��� ���
    create table ���̺��� (
        �÷��� �ڷ��� [constraint PK�����] primary key
    );    
*/

create table tb_primary1 (
    idx number(10) primary key,
    user_id varchar2(30),
    user_name varchar2(50)
);
desc tb_primary1;
/*
�������� Ȯ���ϱ�
    user_cons_columns : ���̺��� ������ �������Ǹ��� �÷�����
        ������ ������ Ȯ���� �� �ִ�.
    
    user_constraints : ���̺��� ������ ���������� ���� ������
        Ȯ���� �� �ִ�.

�� �̿Ͱ��� ���������̳� ��, ���ν��� ���� ������ �����ϰ� �ִ�
�ý��� ���̺��� "�����ͻ���"�̶�� �Ѵ�.
*/
select * from user_cons_columns;
select * from user_constraints;

insert into tb_primary1 (idx, user_id, user_name)
    values (1,'kosmo','�ڽ���');
--unique constraint ���� �߻� primary key(idx)�� �ߺ��Ǿ� �߻���
insert into tb_primary1 (idx, user_id, user_name)
    values (1,'gasmo','������');/*
        ���Ἲ�������� ����� �����߻���. PK�� ������ �÷� idx����
        �ߺ��� ���� �Է��� �� ����.
    */
insert into tb_primary1 values (2,'black','����');
insert into tb_primary1 values ('','white','ȭ��Ʈ');/*
            cannot insert NULL into ���� �߻�
            PK�� ������ �÷����� null(��)�� �Է��� �� ����.
        */
select * from tb_primary1;
update tb_primary1 set idx=2 where user_name='�ڽ���';/*
                unique constraint ���� �߻�
                update���� ���������� idx���� �̹� �����ϴ� 2��
                ���������Ƿ� �������� ����� ���� �߻���.
        */

/*
����2] �ƿ����� ���
    create table ���̺��� (
        �÷��� �ڷ���,
        [constraint �����] primary key (�÷���)
    );    
*/
create table tb_primary2 (
    idx number,
    user_id varchar2(30),
    user_name varchar(50),
    primary key (user_id)
);
desc tb_primary2;
select * from user_constraints;

/*
����3] ���̺� ������ alter������ �������� �߰�
    alter table ���̺��� add [constraint �����] primary key (�÷���);
*/

create table tb_primary3(
    idx number,
    user_id varchar2(30),
    user_name varchar2(50)
);    

alter table tb_primary3 add
    constraint tb_primary3_pk
        primary key (user_name);
        
desc tb_primary3;
select * from user_constraints;

--���̺��� �����ϸ� �ο��ߴ� PK �������ǵ� ���� �����ȴ�. 
drop table tb_primary3;
select * from user_constraints;


/*
Unique (����ũ)
-���� �ߺ��� ������� �ʴ� ��������
-����, ���ڿ��� �ߺ��� ������� ������, null���� ���ؼ���
�ߺ��� ����Ѵ�.
-unique�� �� ���̺��� 2���̻� ������ �� �ִ�.
*/
create table tb_unique1(
    idx number unique not null,
    name varchar2(30),
    telephone varchar2(20),
    nickname varchar2(30),
    unique(telephone, nickname)
);
select * from user_constraints;
select * from user_cons_columns;

insert into tb_unique1 (idx, name, telephone, nickname)
    values (1, '���̸�', '010-1234-1234', '���座��');
insert into tb_unique1 (idx, name, telephone, nickname)
    values (2, '����', '010-1222-1222', '');
insert into tb_unique1 (idx, name, telephone, nickname)
    values (3, '����', '', '');
insert into tb_unique1 (idx, name, telephone, nickname)
    values (4, '', '', '');
select * from tb_unique1;

insert into tb_unique1 (idx, name, telephone, nickname)
    values (1, '����', '010-3333-3333', '');/*
        unique constraint ���� �߻�
        idx�� unique+not null�̱� ����, ��� unique�̱� ������ ����
    */
    
insert into tb_unique1 values (5,'���켺','010-4444-4444','��ȭ���');
insert into tb_unique1 values (6,'������','010-5555-4444','��ȭ���');
insert into tb_unique1 values (7,'Ȳ����','010-5555-4444','��ȭ���');/*
                unique�� phonenumber�� nickname�� ���� �������Ƿ�
                �ΰ��� �����Ͱ� ���ÿ� ������ �ߺ����� �Ǵ��ϰ�
                �� �� �ϳ��� �ٸ���� �ߺ��� �ƴ϶�� �Ǵ���.
        */
/*
    telephone�� nickname �÷��� ������ ��������� �����Ǿ����Ƿ�
    �ΰ��� �÷��� ���ÿ� ������ ���� ������ ��찡 �ƴ϶�� �ߺ��� ����
    ���ȴ�.
    ��, 5���� 6���� ���� �ٸ� �����ͷ� �ν��ϹǷ� �Էµǰ�,
    6���� 7���� ������ �����ͷ� �νĵǾ� ������ �߻��Ѵ�.
*/

/*
Unique 2��° ����
*/
create table tb_unique2 (
    idx number primary key,
    name varchar2(30),
    mobile varchar2(20),

    unique (mobile)
);
select * from user_cons_columns;

/*
Foreign key : �ܷ�Ű, ����Ű
-�ܷ�Ű�� �������Ἲ�� �����ϱ� ���� ���������̴�.
-���� ���̺����� �ܷ�Ű�� �����Ǿ� �ִٸ� �ڽ����̺��� ��������
������ ��� �θ����̺��� ���ڵ�� �������� ���礤��.
*/

/*
����1] �ζ��� ���
    create table ���̺��� (
        �÷��� �ڷ��� [constraint �����]
            references �θ����̺��� (�θ����̺��� PK�÷���)
    );        
*/

create table tb_foreign1 (
    f_idx number(10) primary key,
    f_name varchar2(50),
    f_id varchar2(30) constraint tb_foreign1_fk
        references tb_primary2 (user_id)
);
--�θ����̺��� ���ڵ尡 ���� ���� ����
select * from tb_primary2;
--�θ����̺��� ������ ���ڵ尡 �����Ƿ� �ڽ����̺��� �Է� �Ұ�
insert into tb_foreign1 values (1, '���ʿ�', 'WannaOne');/*
                parent key not found ���� �߻�        
        */
--�θ����̺��� ���ڵ� ���� ����        
insert into tb_primary2 values (1, 'BTS', '��ź�ҳ��');
--�θ����̺��� ������ ���ڵ带 ������� �ڽ����̺��� ���ڵ� ���Ե�
insert into tb_foreign1 values (1, '��ź�ҳ��', 'BTS');
--�θ�Ű�� �����Ƿ� �ԷºҰ�
insert into tb_foreign1 values (2,'Ʈ���̽�', 'Twice');

select * from tb_primary2;
select * from tb_foreign1;

/*
    �ڽ����̺����� �����ϴ� ���ڵ尡 �����Ƿ�, �θ����̺��� ���ڵ带
    ������ �� ����. �� ��쿡�� �ݵ�� �ڽ����̺��� ���ڵ带 ���� ������ ��
    �θ����̺��� ���ڵ带 �����ؾ� �Ѵ�.
*/
delete from tb_primary2 where idx=1;--�����Ұ������߻�

delete from tb_foreign1 where f_idx=1;--�ڽ����̺��� ���ڵ带 ���� �����ϰ�
delete from tb_primary2 where idx=1;--�θ����̺��� ���ڵ带 �����Ѵ�.

--�� ���̺� ��ο��� �����Ǿ����� Ȯ��
select * from tb_primary2;
select * from tb_foreign1; 

/*
����2] �ƿ����ι��
    create table ���̺��� (
        �÷��� �ڷ���,
        
        [constraint �����] foreign key (�÷���)
            references �θ����̺� (�θ����̺��� ������ �÷�)
    );        
*/
create table tb_foreign2 (
    f_id number primary key,
    f_name varchar2(30),
    f_date date,
    
    foreign key (f_name) references tb_primary3(user_name)
);    
select * from user_constraints;
/*
������ �������� �������� Ȯ�ν� �÷���
P : Primary key
R : Reference integrity �� Foreign key�� ����
C : Check Ȥ�� Not null
U : Unique
*/

/*
�ܷ�Ű ������ �ɼ�
[on delete cascade]
    -> �θ��ڵ� ������ �ڽķ��ڵ���� ���� ������
    ����]
        �÷��� �ڷ��� references �θ����̺�(PK�÷�)
            on delete cascade;

[on delete set null]
    -> �θ��ڵ� ������ �ڽķ��ڵ尪�� null�� �����
    ����]
        �÷��� �ڷ��� references �θ����̺�(PK�÷�)
            on delete set null;

�ؽǹ����� ���԰Խù��� ���� ȸ���� �� ���� �ϰ������� �����ؾ� �� ��
����� �� �ִ� �ɼ��̴�. ��, �ڽ����̺��� ��� ���ڵ尡 �����ǹǷ� ��뿡
�����ؾ� �Ѵ�.
*/
create table tb_primary4 (
    user_id varchar2(20) primary key,
    user_name varchar2(100)
);
create table tb_foreign4 (
    f_idx number(10) primary key,
    f_name varchar2(20),
    user_id varchar2(20) constraint tb_foreign4_fk
        references tb_primary4 (user_id)
            on delete cascade
);
insert into tb_primary4 values ('kosmo','�ڽ���');--�θ����̺��� �Է��ϰ�
insert into tb_foreign4 values (1, '1���Դϴ�', 'kosmo');--�ڽ����̺��� �Է��ؾ� �Ѵ�.
insert into tb_foreign4 values (2, '2���Դϴ�', 'kosmo');
insert into tb_foreign4 values (3, '3���Դϴ�', 'kosmo');
insert into tb_foreign4 values (4, '4���Դϴ�', 'kosmo');
insert into tb_foreign4 values (5, '5���Դϴ�', 'kosmo');
insert into tb_foreign4 values (6, '6���Դϴ�', 'kosmo');
insert into tb_foreign4 values (7, '7���Դϴ�', 'hong');--�θ�Ű�� �����Ƿ� �����߻�
--�� ����� �ٽ��ѹ� �غ���

select * from tb_primary4;
select * from tb_foreign4;

delete from tb_primary4;/*
            �θ����̺����� ���ڵ� ������ on delete cascade �ɼǶ�����
            �θ��� �Ӹ��ƴ϶� �ڽ����̺����� ��� ���ڵ尡 �����ȴ�.
        */

select * from user_cons_columns
order by table_name;

--on delete set null �ɼ� �׽�Ʈ
create table tb_primary5 (
    user_id varchar2(20) primary key,
    user_name varchar2(100)
);

create table tb_foreign5 (
    f_idx number(10) primary key,
    f_name varchar2(20),
    user_id varchar2(20) constraint tb_foreign5_fk
        references tb_primary5 (user_id) on delete set null
);
insert into tb_primary5 values ('kosmo','�ڽ���');
insert into tb_foreign5 values (1,'1���Խù�','kosmo');
insert into tb_foreign5 values (2,'2���Խù�','kosmo');
insert into tb_foreign5 values (3,'3���Խù�','kosmo');
insert into tb_foreign5 values (4,'4���Խù�','kosmo');
insert into tb_foreign5 values (5,'5���Խù�','kosmo');
insert into tb_foreign5 values (6,'6���Խù�','kosmo');
insert into tb_foreign5 values (7,'7���Խù�','kosmo');

--�Էµ� ���ڵ� Ȯ��
select * from tb_primary5;
select * from tb_foreign5;

/*
on delete set null �ɼ����� �ڽ����̺��� ���ڵ�� �������� �ʰ�
����Ű �κи� null������ ����ȴ�.
*/
delete from tb_primary5;

select * from tb_primary5;
select * from tb_foreign5;

/*
not null : null���� ������� �ʴ� ��������
    ����]
        create table ���̺��� (
            �÷��� �ڷ��� not null,
            �÷��� �ڷ��� null <- null�� ����ϰڴٴ� �ǹ������� ���� 
                                         �ƿ� ������� �ʴ°��� ��������̴�.
        );                
*/

create table tb_not_null (
    m_idx number(10) primary key,--PK�� ���������� NN
    m_id varchar2(30) not null,      --NN
    m_pw varchar2(40) null,           --null��� (�Ϲ������� null�� ����)
    m_name varchar2(50)                --null��� (�̿Ͱ��� ������)
);
desc tb_not_null;
select * from user_cons_columns;

insert into tb_not_null values (10,'hong','1111','ȫ�浿');
insert into tb_not_null values (20,'hong2','2222','');
insert into tb_not_null values (30,'hong3','','');
insert into tb_not_null values (40,'','4444','��浿');--�Է½���. null�� �Է��� �� ����
insert into tb_not_null (m_id, m_pw, m_name) 
    values ('hong5','5555','���浿');/*�Է½���. cannot insert NULL into m_idx�÷���
                                                        ���� �ԷµǾ�� ��
    */
insert into tb_not_null values (60,' ','6666','���浿');--�Է¼���(space�� ������)

select * from tb_not_null;

/*
Default : insert�� �ƹ��� ���� �Է����� ������ �ڵ����� ���ԵǴ�
    �����͸� ���Ѵ�.
*/
create table tb_default(
    id varchar2(30) not null,
    pw varchar2(30) default 'qwer'
);
desc tb_default;
select * from tb_default;
insert into tb_default values ('aaaa','1234');--1234 �Էµ�
insert into tb_default values ('bbbb','');--null�� �Է�
insert into tb_default (id) values ('cccc');--default�� ���Ե�
insert into tb_default (id,pw) values ('dddd',default);--defualt�� �Է�
insert into tb_default values ('dddd',default);--defualt�� �Է�
/*
    ������ ������ default���� �Է��ϸ� insert�� �÷� ��ü�� �����ϰų�
    defualt Ű���带 ����ؾ� �Ѵ�.
*/

/*
check : Domain(�ڷ���) ���Ἲ�� �����ϱ� ���� ������������
    �ش� �÷��� �߸��� �����Ͱ� �Էµ��� �ʵ��� �����ϴ� ���������̴�.
*/
create table tb_check1 (
    gender varchar2(20) not null,
        constraint check_gender
            check (gender in ('M', 'F'))
);
insert into tb_check1 values ('M');
insert into tb_check1 values ('F');
insert into tb_check1 values ('A');--�Է½���
insert into tb_check values ('����');--�Է½���
insert into tb_check values ('����');--�Է½���

create table tb_check2 (
    ticket_cnt number not null
        check(ticket_cnt<=5)
);
insert into tb_check2 values ('4');
insert into tb_check2 values ('5');
insert into tb_check2 values ('6');--�Է½��� check �������� ����


/*********************************************************************************************/
/******************************SCOTT�������� �������� ����*************************************/
/*********************************************************************************************/

/************************************
1. emp ���̺��� ������ �����Ͽ� pr_emp_const ���̺��� ����ÿ�. 
����� ���̺��� �����ȣ Į���� pr_emp_pk ��� �̸����� 
primary key ���������� �����Ͻÿ�.
************************************/
create table pr_emp_const
as
select * from emp where 1=0;
desc pr_emp_const;

alter table pr_emp_const add
    constraint pr_emp_pk
        primary key (empno);
        
select * from user_constraints;

/***********************************
2. dept ���̺��� ������ �����ؼ� pr_dept_const ���̺��� ����ÿ�. 
�μ���ȣ�� pr_dept_pk ��� �������Ǹ����� primary_key�� �����Ͻÿ�.
************************************/
create table pr_dept_const
as
select * from dept where 1=0;

desc pr_dept_const;

alter table pr_dept_const add
    constraint pr_dept_pk
        primary key (deptno);
        
select * from user_constraints;

/*************************************
3. pr_dept_const ���̺��� �������� �ʴ� �μ��� ����� 
�������� �ʵ��� �ܷ�Ű ���������� �����ϵ� �������� �̸��� 
pr_emp_dept_fk �� �����Ͻÿ�.
*************************************/
alter table pr_dept_const add
    constraint pr_emp_dept_fk 
        foreign key (deptno)
            references pr_emp_const (deptno);
            -- ������ ���������~~~~Ʋ���ڳ�
alter table pr_emp_const add--�׻� 1:N�� ���� ������(1�� �θ�)
    constraint pr_emp_dept_fk  --�������Ǹ� �߰�
        foreign key (deptno) --�ڽ����̺��� �ܷ�Ű(����Ű)�÷�
            references pr_dept_const (deptno);--�θ����̺��� �⺻Ű(pk)�÷�
            
/*************************************
4. pr_emp_const ���̺��� comm Į���� 0���� ū ������ �Է��Ҽ� 
�ֵ��� ���������� �����Ͻÿ�. �������Ǹ��� �������� �ʾƵ� �ȴ�.
*************************************/
alter table pr_emp_const modify comm not null 
check (comm >0);
--                                       [constraint �������Ǹ�] ����
alter table pr_emp_const add check (comm>0);

--�������� Ȯ���� ���� ���ڵ� ����
insert into pr_emp_const (empno,comm) values (100,0);

--�θ����̺��� ���ڵ� �Է�
insert into pr_dept_const values (10,'���ǹ�','����');
insert into pr_dept_const values (20,'������','������');

--�տ��� ������ ���ڵ� �Է�
insert into pr_emp_const values 
    (100,'�ƹ���','����',null,sysdate,1000,0.3,10);
insert into pr_emp_const values 
    (200,'�ƹ���','����',null,sysdate,800,0.45,20);
select * from pr_emp_const;


/************************************
5. �� 3�������� �� ���̺����� �ܷ�Ű�� �����Ǿ 
pr_dept_const ���̺����� ���ڵ带 ������ �� ������. 
�� ��� �θ� ���ڵ带 ������ ��� �ڽı��� ���� �����ɼ� 
�ֵ��� �ܷ�Ű�� �����Ͻÿ�.
************************************/
--�θ����̺�
select * from pr_dept_const;
--�ڽ����̺�
select * from pr_emp_const;
--�θ����̺����� ���ڵ� �����ϱ�
delete from pr_dept_const where deptno=10;/*
                    �ڽķ��ڵ尡 �����Ƿ� �����Ұ���.
                    �ܷ�Ű �������� ����.
            */
            
--�ܷ�Ű �缳���� ���� ������ �ܷ�Ű�� �����Ѵ�.
alter table pr_emp_const drop constraint pr_emp_dept_fk;

--�ܷ�Ű �缳��
alter table pr_emp_const add
    constraint pr_emp_dept_fk 
        foreign key (deptno)
            references pr_dept_const (deptno)
                on delete cascade;--�θ� ������ �ڽĵ� ���� �����Ǵ� �ɼ�
--�ڽķ��ڵ尡 �ִ� ���׿��� �θ��ڵ� �����ϱ�
delete from pr_dept_const where deptno=10;
select * from pr_dept_const;
select * from pr_emp_const;

commit;
/*
�� ���ڵ� �Է��ϱ�
    ����1
        INSERT INTO ���̺��� (�÷�1, �÷�2....)
            VALUES (��1, ��2, .....);
    ����2
        INSERT INTO ���̺��� VALUES 
            (��1, ��2....�÷����� �����ϰ� �Է�);



�� ���ڵ� �����ϱ�
    ����
    UPDATE  ���̺���
        SET �÷�1=��1, �÷�2=��1......�÷�N=��N
            WHERE ����1 and ����2;

��, where���� ������ ��� ���ڵ尡 �����ȴ�. 

�� ���ڵ� �����ϱ�
    ����
        delete from ���̺��� where ����1 and ����2;

��, where���� ������ ��� ���ڵ尡 �����ȴ�. 

*/
















