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
--------------------테이블 생성---------------------
desc sh_product_code;
desc sh_goods;
desc sh_goods_log;
--------------------테이블 생성 확인----------------
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
---------------------------시퀀스 생성-----------------------------------
insert into sh_product_code values (1, '가전제품');
insert into sh_product_code values (product_code_seq.nextval, '도서');
insert into sh_product_code values (product_code_seq.nextval, '컴퓨터');
select * from sh_product_code;

insert into sh_goods 
    values (goods_seq.nextval, 'Sens노트북', 1200000, sysdate, 3);
insert into sh_goods 
    values (goods_seq.nextval, 'Gram노트북', 1300000, sysdate, 3);
insert into sh_goods 
    values (goods_seq.nextval, '냉장고', 1000000, sysdate, 1);
insert into sh_goods 
    values (goods_seq.nextval, '로봇청소기', 500000, sysdate, 1);
insert into sh_goods 
    values (goods_seq.nextval, '자바프로그래밍', 30000, sysdate, 2);    
select * from sh_goods;

insert into sh_goods 
    values (goods_seq.nextval, 'DSLR카메라', 900000, sysdate, 4); /*
        부모키가 없으므로 참조 제약조건 위배*/
commit;

select * from sh_goods;
----------------------------더미데이터 입력------------------------------
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
----------------------------insert 프로시저 생성 -------------------------
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

------------------------------delete 프로시저 생성--------------------------
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
------------------------------추가/삭제 트리거 생성-----------------------------
select * from sh_goods;

