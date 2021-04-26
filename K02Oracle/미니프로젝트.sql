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
--------------------���̺� ����---------------------
desc sh_product_code;
desc sh_goods;
desc sh_goods_log;
--------------------���̺� ���� Ȯ��----------------
create sequence product_code_seq 
    increment by 1
    start with 2
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

create sequence goods_seq 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

create sequence goods_log_seq 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
---------------------------������ ����-----------------------------------
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

select * from sh_goods;
----------------------------���̵����� �Է�------------------------------
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
----------------------------insert ���ν��� ���� -------------------------
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

------------------------------delete ���ν��� ����--------------------------
create or replace trigger shop_log_trigger 
    after
    insert or delete
    on sh_goods
    for each row
begin
    if inserting then
        insert into sh_goods_log values(
            goods_log_seq.nextval,
            :new.goods_name,
            :new.g_idx,'Insert');
    elsif deleting then
        insert into sh_goods_log values(
            goods_log_seq.nextval,
            :old.goods_name,
            :old.g_idx,'Delete');
    end if;
end;
/
select * from user_triggers where trigger_name like upper('%shop_log_trigger%');
select * from sh_goods_log;
------------------------------�߰�/���� Ʈ���� ����-----------------------------
select * from sh_goods;

