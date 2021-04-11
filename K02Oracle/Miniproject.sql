/*
Oracle SubProgram 미니프로젝트
[심플 쇼핑몰 만들기]
kosmo계정에서 제작합니다. 
테이블 생성
상품코드관리 : sh_product_code
    ----------------------------
    상품코드(PK)    p_code
    카테고리명      category_name
    ----------------------------        
상품관리 :  
    ----------------------------
    일련번호(PK)    g_idx
    상품명              goods_name
    상품가격        goods_price
    등록일              regidate
    상품코드(FK)    p_code
    ----------------------------        
상품데이터 로그 : sh_goods_log
    ----------------------------
    일련번호(PK)    log_idx
    상품명              goods_name
    상품일련번호    goods_idx
    로그액션        p_action  
        -> 입력시 : ‘Insert’ , 삭제시 : ‘Delete’ 입력(check제약조건 적용)
    ----------------------------  

시퀀스생성
각 테이블에서 사용할 시퀀스명 : 
    product_code_seq
    goods_seq
    goods_log_seq

더미데이터 입력
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
        부모키가 없으므로 참조 제약조건 위배
commit;
-------------------------------------------------------------------------
JDBC프로그래밍
1.상품입력
PreparedStatement객체를 사용하여 작성한다.
클래스명 : ex21jdbc.shopping.InsertShop
상품명, 상품가격, 상품코드를 scanValue() 메소드로 입력받아 사용한다. 
입력이 완료되면 입력된 행의 갯수를 반환하여 출력한다. 
2.상품조회
Statement객체를 사용하여 작성한다.
클래스명 : ex21jdbc.shopping.SelectShop
검색할 상품명을 입력하여 해당조건에 맞는 레코드만 출력한다. 
like 를 사용해야 한다.
출력항목 : 일련번호, 상품명, 가격, 등록일, 제품코드
단, 등록일은 0000-00-00 00:00 형태로 출력해야 한다. 
to_char(regidate,'yyyy-mm-dd hh24:mi:ss')
상품가격은 세자리마다 컴마를 찍어준다.
3.상품수정,삭제
프로시저 작성후 CallableStatement객체를 사용하여 호출하도록 한다. 
상품수정
프로시저명 : ShopUpdateGoods
In파라미터 : 상품명, 가격, 제품코드, 수정할 상품의 일련번호
Out파라미터 : 레코드 수정 결과(1 혹은 0)
호출할 Java클래스 : UpdateShop
상품삭제
프로시저명 : ShopDeleteGoods
In파라미터 : 삭제할 상품의 일련번호
Out파라미터 : 레코드 삭제 결과(1 혹은 0)
호출할 Java클래스 : DeleteShop

4.트리거생성
상품관리 테이블에 데이터가 입력/삭제 되었을때 로그테이블[goods_log]에 내역이 남도록 하는 트리거를 작성하시오. 
트리거명 : shop_log_trigger
상품입력시 : Insert
상품삭제시 : Delete
업데이트는 제외하고, 트리거는 1개로 작성한다. 2개로 작성하지 않는다.
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
--------------------테이블 생성
desc sh_product_code;
desc sh_goods;
desc sh_goods_log;
--------------------테이블 생성 확인
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
---------------------------시퀀스 생성
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
rollback;
select * from sh_goods;


------------------------------------------프로시저 
/*
3.상품수정,삭제
프로시저 작성후 CallableStatement객체를 사용하여 호출하도록 한다. 
상품수정
프로시저명 : ShopUpdateGoods
In파라미터 : 상품명, 가격, 제품코드, 수정할 상품의 일련번호
Out파라미터 : 레코드 수정 결과(1 혹은 0)
호출할 Java클래스 : UpdateShop
상품삭제
프로시저명 : ShopDeleteGoods
In파라미터 : 삭제할 상품의 일련번호
Out파라미터 : 레코드 삭제 결과(1 혹은 0)
호출할 Java클래스 : DeleteShop

4.트리거생성
상품관리 테이블에 데이터가 입력/삭제 되었을때 로그테이블[goods_log]에 내역이 남도록 하는 트리거를 작성하시오. 
트리거명 : shop_log_trigger
상품입력시 : Insert
상품삭제시 : Delete
업데이트는 제외하고, 트리거는 1개로 작성한다. 2개로 작성하지 않는다.
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
    goods_name = '한성노트북',
    goods_price = 1200000,
    p_code = 3
    where g_idx = 2;

--레코드삭제 : delete from 테이블명 where 조건
-------------------------------------------------------------삭제프로시저 생성
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
----------------------------------------------------------------트리거 생성
/*
4.트리거생성
상품관리 테이블에 데이터가 입력/삭제 되었을때 로그테이블[goods_log]에 내역이 남도록 하는 트리거를 작성하시오. 
트리거명 : shop_log_trigger
상품입력시 : Insert
상품삭제시 : Delete
업데이트는 제외하고, 트리거는 1개로 작성한다. 2개로 작성하지 않는다.
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
