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