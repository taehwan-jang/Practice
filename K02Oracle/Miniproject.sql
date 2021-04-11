/*
Oracle SubProgram �̴�������Ʈ
[���� ���θ� �����]
kosmo�������� �����մϴ�. 
���̺� ����
��ǰ�ڵ���� : sh_product_code
    ----------------------------
    ��ǰ�ڵ�(PK)    p_code
    ī�װ���      category_name
    ----------------------------        
��ǰ���� :  
    ----------------------------
    �Ϸù�ȣ(PK)    g_idx
    ��ǰ��              goods_name
    ��ǰ����        goods_price
    �����              regidate
    ��ǰ�ڵ�(FK)    p_code
    ----------------------------        
��ǰ������ �α� : sh_goods_log
    ----------------------------
    �Ϸù�ȣ(PK)    log_idx
    ��ǰ��              goods_name
    ��ǰ�Ϸù�ȣ    goods_idx
    �α׾׼�        p_action  
        -> �Է½� : ��Insert�� , ������ : ��Delete�� �Է�(check�������� ����)
    ----------------------------  

����������
�� ���̺��� ����� �������� : 
    product_code_seq
    goods_seq
    goods_log_seq

���̵����� �Է�
insert into sh_product_code values (1, '������ǰ');
insert into sh_product_code values (product_code_seq.nextval, '����');
insert into sh_product_code values (product_code_seq.nextval, '��ǻ��');
select * from sh_product_code;

insert into sh_goods 
    values (goods_seq.nextval, 'Sens��Ʈ��', 1200000, sysdate, 3);
insert into sh_goods 
    values (goods_seq.nextval, 'Gram��Ʈ��', 1300000, sysdate, 3);
insert into sh_goods 
    values (goods_seq.nextval, '�����', 1000000, sysdate, 1);
insert into sh_goods 
    values (goods_seq.nextval, '�κ�û�ұ�', 500000, sysdate, 1);
insert into sh_goods 
    values (goods_seq.nextval, '�ڹ����α׷���', 30000, sysdate, 2);    
select * from sh_goods;

insert into sh_goods 
    values (goods_seq.nextval, 'DSLRī�޶�', 900000, sysdate, 4); /*
        �θ�Ű�� �����Ƿ� ���� �������� ����
commit;
-------------------------------------------------------------------------
JDBC���α׷���
1.��ǰ�Է�
PreparedStatement��ü�� ����Ͽ� �ۼ��Ѵ�.
Ŭ������ : ex21jdbc.shopping.InsertShop
��ǰ��, ��ǰ����, ��ǰ�ڵ带 scanValue() �޼ҵ�� �Է¹޾� ����Ѵ�. 
�Է��� �Ϸ�Ǹ� �Էµ� ���� ������ ��ȯ�Ͽ� ����Ѵ�. 
2.��ǰ��ȸ
Statement��ü�� ����Ͽ� �ۼ��Ѵ�.
Ŭ������ : ex21jdbc.shopping.SelectShop
�˻��� ��ǰ���� �Է��Ͽ� �ش����ǿ� �´� ���ڵ常 ����Ѵ�. 
like �� ����ؾ� �Ѵ�.
����׸� : �Ϸù�ȣ, ��ǰ��, ����, �����, ��ǰ�ڵ�
��, ������� 0000-00-00 00:00 ���·� ����ؾ� �Ѵ�. 
to_char(regidate,'yyyy-mm-dd hh24:mi:ss')
��ǰ������ ���ڸ����� �ĸ��� ����ش�.
3.��ǰ����,����
���ν��� �ۼ��� CallableStatement��ü�� ����Ͽ� ȣ���ϵ��� �Ѵ�. 
��ǰ����
���ν����� : ShopUpdateGoods
In�Ķ���� : ��ǰ��, ����, ��ǰ�ڵ�, ������ ��ǰ�� �Ϸù�ȣ
Out�Ķ���� : ���ڵ� ���� ���(1 Ȥ�� 0)
ȣ���� JavaŬ���� : UpdateShop
��ǰ����
���ν����� : ShopDeleteGoods
In�Ķ���� : ������ ��ǰ�� �Ϸù�ȣ
Out�Ķ���� : ���ڵ� ���� ���(1 Ȥ�� 0)
ȣ���� JavaŬ���� : DeleteShop

4.Ʈ���Ż���
��ǰ���� ���̺� �����Ͱ� �Է�/���� �Ǿ����� �α����̺�[goods_log]�� ������ ������ �ϴ� Ʈ���Ÿ� �ۼ��Ͻÿ�. 
Ʈ���Ÿ� : shop_log_trigger
��ǰ�Է½� : Insert
��ǰ������ : Delete
������Ʈ�� �����ϰ�, Ʈ���Ŵ� 1���� �ۼ��Ѵ�. 2���� �ۼ����� �ʴ´�.
*/
create table sh_product_code (
    p_code number primary key,
    category_name varchar2(100)
);

create table sh_goods (
    g_idx number primary key,
    goods_name varchar2(100), 
    goods_price number(10),
    regidate date default sysdate,
    p_code number constraint p_code_fk
        references sh_product_code (p_code)
        on delete cascade
);
drop table sh_goods;

create table sh_goods_log (
    log_idx number primary key,
    goods_name varchar2(100),
    goods_idx number(10),
    p_action char(6)
    check (p_action in ('Insert', 'Delete'))
);
--------------------���̺� ����
desc sh_product_code;
desc sh_goods;
desc sh_goods_log;
--------------------���̺� ���� Ȯ��
create sequence product_code_seq 
    increment by 1
    start with 2
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

drop sequence product_code_seq;

create sequence goods_seq 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

drop sequence goods_seq;    
drop sequence product_code_seq;

create sequence goods_log_seq 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
---------------------------������ ����
insert into sh_product_code values (1, '������ǰ');
insert into sh_product_code values (product_code_seq.nextval, '����');
insert into sh_product_code values (product_code_seq.nextval, '��ǻ��');
select * from sh_product_code;

insert into sh_goods 
    values (goods_seq.nextval, 'Sens��Ʈ��', 1200000, sysdate, 3);
insert into sh_goods 
    values (goods_seq.nextval, 'Gram��Ʈ��', 1300000, sysdate, 3);
insert into sh_goods 
    values (goods_seq.nextval, '�����', 1000000, sysdate, 1);
insert into sh_goods 
    values (goods_seq.nextval, '�κ�û�ұ�', 500000, sysdate, 1);
insert into sh_goods 
    values (goods_seq.nextval, '�ڹ����α׷���', 30000, sysdate, 2);    
select * from sh_goods;

insert into sh_goods 
    values (goods_seq.nextval, 'DSLRī�޶�', 900000, sysdate, 4); /*
        �θ�Ű�� �����Ƿ� ���� �������� ����*/
commit;
rollback;
select * from sh_goods;


------------------------------------------���ν��� 
/*
3.��ǰ����,����
���ν��� �ۼ��� CallableStatement��ü�� ����Ͽ� ȣ���ϵ��� �Ѵ�. 
��ǰ����
���ν����� : ShopUpdateGoods
In�Ķ���� : ��ǰ��, ����, ��ǰ�ڵ�, ������ ��ǰ�� �Ϸù�ȣ
Out�Ķ���� : ���ڵ� ���� ���(1 Ȥ�� 0)
ȣ���� JavaŬ���� : UpdateShop
��ǰ����
���ν����� : ShopDeleteGoods
In�Ķ���� : ������ ��ǰ�� �Ϸù�ȣ
Out�Ķ���� : ���ڵ� ���� ���(1 Ȥ�� 0)
ȣ���� JavaŬ���� : DeleteShop

4.Ʈ���Ż���
��ǰ���� ���̺� �����Ͱ� �Է�/���� �Ǿ����� �α����̺�[goods_log]�� ������ ������ �ϴ� Ʈ���Ÿ� �ۼ��Ͻÿ�. 
Ʈ���Ÿ� : shop_log_trigger
��ǰ�Է½� : Insert
��ǰ������ : Delete
������Ʈ�� �����ϰ�, Ʈ���Ŵ� 1���� �ۼ��Ѵ�. 2���� �ۼ����� �ʴ´�.
*/
--
create or replace procedure ShopUpdateGoods (
        i_g_idx in sh_goods.g_idx%type,
        i_g_name in sh_goods.goods_name%type,
        i_g_price in sh_goods.goods_price%type,
        i_p_code in sh_goods.p_code%type,
        result1 out number
    )
is
begin
    update sh_goods set
        goods_name = i_g_name,
        goods_price = i_g_price,
        p_code = i_p_code
        where g_idx = i_g_idx;
    result1 := sql%rowcount;
    
    commit;
end;
/

select * from user_source where name like upper('%ShopUpdateGoods%');
select * from sh_goods;
update sh_goods set
    goods_name = '�Ѽ���Ʈ��',
    goods_price = 1200000,
    p_code = 3
    where g_idx = 2;

--���ڵ���� : delete from ���̺�� where ����
-------------------------------------------------------------�������ν��� ����
create or replace procedure ShopDeleteGoods (
    i_g_idx in sh_goods.g_idx%type,
    result1 out number
)
is
begin
    delete from sh_goods 
        where g_idx = i_g_idx;
    result1 := sql%rowcount;
    
    commit;
end;
/
select * from sh_goods;

delete from sh_goods where g_idx=?;
----------------------------------------------------------------Ʈ���� ����
/*
4.Ʈ���Ż���
��ǰ���� ���̺� �����Ͱ� �Է�/���� �Ǿ����� �α����̺�[goods_log]�� ������ ������ �ϴ� Ʈ���Ÿ� �ۼ��Ͻÿ�. 
Ʈ���Ÿ� : shop_log_trigger
��ǰ�Է½� : Insert
��ǰ������ : Delete
������Ʈ�� �����ϰ�, Ʈ���Ŵ� 1���� �ۼ��Ѵ�. 2���� �ۼ����� �ʴ´�.
*/
create table sh_goods_log (
    log_idx number primary key,
    goods_name varchar2(100),
    goods_idx number(10),
    p_action char(6)
    check (p_action in ('Insert', 'Delete'))
);
create table sh_goods (
    g_idx number primary key,
    goods_name varchar2(100), 
    goods_price number(10),
    regidate date default sysdate,
    p_code number constraint p_code_fk
        references sh_product_code (p_code)
        on delete cascade
);
create or replace trigger shop_log_trigger 
    after
    insert
    delete
    on sh_goods
    for each row
declare
begin
    if inserting then
        insert into sh_goods_log values(
            log_idx = goods_log_seq.nextval,
            :new.goods_name = goods_name,
            :new.g_idx = goods_idx,
            p_action = 'Insert');
    end if;
    if deleting then
        insert into sh_goods_log values(
            log_idx = goods_log_seq.nextval,
            :old.goods_name = goods_name,
            :old.g_idx = goods_idx,
            p_action = 'Delete');
    end if;
end;
/
