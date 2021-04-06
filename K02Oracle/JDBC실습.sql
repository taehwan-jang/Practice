/***************************************************
���ϸ� : JDBC�ǽ�.sql
Java���� ó������ JDBC���α׷��� �غ���
***************************************************/
--�켱 system������ ������ �� ���ο� ������ �����Ѵ�.
create user kosmo identified by 1234;
grant connect, resource to kosmo;

--������ ������ �� ����â�� ����ϰ� �ش� ������ �����Ѵ�.

--ȸ������ ���̺� : member ����
create table member(
    id varchar2(10) not null,--not null�� null���� ������� ����
    pass varchar2(10) not null,
    name varchar2(10) not null,--�ѱ��� ��� nvarchar2 �ٵ� ���� �Ⱦ�
    regidate date default sysdate,--�Է��� �ȵȰ�� �ý��۽ð� �Էµ�
    primary key(id)
);      
select *from member;
--���̵����� �Է��ϱ�

insert into member (id,pass,name) values ('test','1234','�׽�Ʈ');
select * from member;
select to_char(regidate,'yy/mm/dd hh24:mi:ss')"ȸ��������" from member;
commit;
/*
1. �ܷ�Ű�� : bbs_mem_fk
tb_bbs���̺��� id �÷��� member ���̺��� id �÷��� �����ϵ��� �ܷ�Ű�� ����
2. �������� : seq_bbs_num
tb_bbs���̺� �����͸� �Է½� num �÷��� �ڵ����� �Ҽ��ֵ��� �������� ����
*/
create Table tb_bbs (
    num number not null,
    title varchar2(100) not null,
    content varchar2(2000) not null,
    postdate date default sysdate,
    id varchar2(10) not null,
    primary key (num)
);
/*
create table tb_bbs (
    num number primary key,
    title varchar2(100) not null,
    content varchar2(2000) not null,
    postdate date default sysdate,
    id varchar2(10) not null constraint bbs_mem_fk
        references member (id)
);
*/
--primary key ������ ������ ���!
alter table tb_bbs add
    constraint bbs_mem_fk
        foreign key (id) references member (id);
--1-1.�����ͻ������� Ȯ��
select * from user_constraints;
--2.������ ����
create sequence seq_bbs_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle
    nocache;
--2-1.�����ͻ������� ������ Ȯ��
select * from user_sequences;

insert into tb_bbs values (seq_bbs_num.nextval,'','','','');

--���ڵ� �����ϱ� : delete
delete from member where id ='test3';
commit;

--���ڵ� �����ϱ� : update
update member set pass='9999', name='ȫ�浿', regidate=sysdate
    where id='test';
    
select * from member;

select id, pass, name, to_char(regidate,'yyyy-mm-dd hh24:mi:ss') from member;

--���ڵ� �Է��ϱ� : insert
insert into member (id,pass,name) values ('test99','9999','���浿');
select id, pass, name, to_char(regidate,'yyyy-mm-dd hh24:mi:ss') from member;
commit;
/*
    ����Ŭ���� ���� insert�� �� �� commit ���� ������ �ܺο�����
    ����� ���ڵ带 Ȯ���� �� �����Ƿ� ���࿡ ������ �߻��ϰų�
    ���� ������� �ʰ� �ȴ�. ó�� insert�� �������� �ӽ����̺�
    ����ǰ�, commit �Ŀ� ���� ���̺� ����ȴ�.!!!!!!!!!
*/
--like�� �̿��� �̸��˻�
select *from member name like '%�浿%';
select *from member name like '%��%';
select *from member name like '%?%';--java���� �����߻��� 



    
    