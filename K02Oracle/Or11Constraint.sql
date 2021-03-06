/********************************************
파일명 : Or11Constraint.sql
제약조건
설명 : 테이블 생성시 필요한 여러가지 제약조건에 대해 학습한다.
********************************************/

--study 계정에서 실습

/*
Primary Key : 기본키
-참조무결성을 유지하기 위한 제약조건이다.
-하나의 테이블에 하나의 기본키만 설정할 수 있다.
-기본키로 설정되면 그 컬럼은 중복된 값이나 null값을 입력할 수 없다.
*/

/*
형식1] 인라인 방식
    create table 테이블명 (
        컬럼명 자료형 [constraint PK제약명] primary key
    );    
*/

create table tb_primary1 (
    idx number(10) primary key,
    user_id varchar2(30),
    user_name varchar2(50)
);
desc tb_primary1;
/*
제약조건 확인하기
    user_cons_columns : 테이블에 지정된 제약조건명과 컬럼명의
        간략한 정보를 확인할 수 있다.
    
    user_constraints : 테이블에 지정된 제약조건의 상세한 정보를
        확인할 수 있다.

※ 이와같이 제약조건이나 뷰, 프로시저 등의 정보를 저장하고 있는
시스템 테이블을 "데이터사전"이라고 한다.
*/
select * from user_cons_columns;
select * from user_constraints;

insert into tb_primary1 (idx, user_id, user_name)
    values (1,'kosmo','코스모');
--unique constraint 에러 발생 primary key(idx)가 중복되어 발생함
insert into tb_primary1 (idx, user_id, user_name)
    values (1,'gasmo','가스모');/*
        무결성제약조건 위배로 에러발생됨. PK로 지정된 컬럼 idx에는
        중복된 값을 입력할 수 없다.
    */
insert into tb_primary1 values (2,'black','블랙');
insert into tb_primary1 values ('','white','화이트');/*
            cannot insert NULL into 에러 발생
            PK로 지정된 컬럼에는 null(빈값)을 입력할 수 없다.
        */
select * from tb_primary1;
update tb_primary1 set idx=2 where user_name='코스모';/*
                unique constraint 에러 발생
                update문은 정상이지만 idx값이 이미 존재하는 2로
                변경했으므로 제약조건 위배로 오류 발생됨.
        */

/*
형식2] 아웃라인 방식
    create table 테이블명 (
        컬럼명 자료형,
        [constraint 제약명] primary key (컬럼명)
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
형식3] 테이블 생성후 alter문으로 제약조건 추가
    alter table 테이블명 add [constraint 제약명] primary key (컬럼명);
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

--테이블을 삭제하면 부여했던 PK 제약조건도 같이 삭제된다. 
drop table tb_primary3;
select * from user_constraints;


/*
Unique (유니크)
-값의 중복을 허용하지 않는 제약조건
-숫자, 문자열은 중복을 허용하지 않으나, null값에 대해서는
중복을 허용한다.
-unique는 한 테이블에 2개이상 적용할 수 있다.
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
    values (1, '아이린', '010-1234-1234', '레드벨벳');
insert into tb_unique1 (idx, name, telephone, nickname)
    values (2, '웬디', '010-1222-1222', '');
insert into tb_unique1 (idx, name, telephone, nickname)
    values (3, '슬기', '', '');
insert into tb_unique1 (idx, name, telephone, nickname)
    values (4, '', '', '');
select * from tb_unique1;

insert into tb_unique1 (idx, name, telephone, nickname)
    values (1, '예리', '010-3333-3333', '');/*
        unique constraint 에러 발생
        idx가 unique+not null이기 때문, 사실 unique이기 때문이 맞음
    */
    
insert into tb_unique1 values (5,'정우성','010-4444-4444','영화배우');
insert into tb_unique1 values (6,'이정재','010-5555-4444','영화배우');
insert into tb_unique1 values (7,'황정민','010-5555-4444','영화배우');/*
                unique를 phonenumber와 nickname을 같이 묶었으므로
                두개의 데이터가 동시에 같을때 중복으로 판단하고
                둘 중 하나가 다를경우 중복이 아니라고 판단함.
        */
/*
    telephone과 nickname 컬럼이 동일한 제약명으로 설정되었으므로
    두개의 컬럼이 동시에 동일한 값을 가지는 경우가 아니라면 중복된 값이
    허용된다.
    즉, 5번과 6번은 서로 다른 데이터로 인식하므로 입력되고,
    6번과 7번은 동일한 데이터로 인식되어 에러가 발생한다.
*/

/*
Unique 2번째 형식
*/
create table tb_unique2 (
    idx number primary key,
    name varchar2(30),
    mobile varchar2(20),

    unique (mobile)
);
select * from user_cons_columns;

/*
Foreign key : 외래키, 참조키
-외래키는 참조무결성을 유지하기 위한 제약조건이다.
-만약 테이블간에 외래키가 설정되어 있다면 자식테이블에 참조값이
존재할 경우 부모테이블의 레코드는 삭제되지 안흔ㄴ다.
*/

/*
형식1] 인라인 방식
    create table 테이블명 (
        컬럼명 자료형 [constraint 제약명]
            references 부모테이블명 (부모테이블의 PK컬럼명)
    );        
*/

create table tb_foreign1 (
    f_idx number(10) primary key,
    f_name varchar2(50),
    f_id varchar2(30) constraint tb_foreign1_fk
        references tb_primary2 (user_id)
);
--부모테이블에 레코드가 전혀 없는 상태
select * from tb_primary2;
--부모테이블에 참조할 레코드가 없으므로 자식테이블에 입력 불가
insert into tb_foreign1 values (1, '워너원', 'WannaOne');/*
                parent key not found 에러 발생        
        */
--부모테이블에 레코드 먼저 삽입        
insert into tb_primary2 values (1, 'BTS', '방탄소년단');
--부모테이블의 참조할 레코드를 기반으로 자식테이블에 레코드 삽입됨
insert into tb_foreign1 values (1, '방탄소년단', 'BTS');
--부모키가 없으므로 입력불가
insert into tb_foreign1 values (2,'트와이스', 'Twice');

select * from tb_primary2;
select * from tb_foreign1;

/*
    자식테이블에서 참조하는 레코드가 있으므로, 부모테이블의 레코드를
    삭제할 수 없다. 이 경우에는 반드시 자식테이블의 레코드를 먼저 삭제한 후
    부모테이블의 레코드를 삭제해야 한다.
*/
delete from tb_primary2 where idx=1;--삭제불가에러발생

delete from tb_foreign1 where f_idx=1;--자식테이블의 레코드를 먼저 삭제하고
delete from tb_primary2 where idx=1;--부모테이블의 레코드를 삭제한다.

--두 테이블 모두에서 삭제되었는지 확인
select * from tb_primary2;
select * from tb_foreign1; 

/*
형식2] 아웃라인방식
    create table 테이블명 (
        컬럼명 자료형,
        
        [constraint 제약명] foreign key (컬럼명)
            references 부모테이블 (부모테이블의 참조할 컬럼)
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
데이터 사전에서 제약조건 확인시 플레그
P : Primary key
R : Reference integrity 즉 Foreign key를 뜻함
C : Check 혹은 Not null
U : Unique
*/

/*
외래키 삭제시 옵션
[on delete cascade]
    -> 부모레코드 삭제시 자식레코드까지 같이 삭제됨
    형식]
        컬럼명 자료형 references 부모테이블(PK컬럼)
            on delete cascade;

[on delete set null]
    -> 부모레코드 삭제시 자식레코드값이 null로 변경됨
    형식]
        컬럼명 자료형 references 부모테이블(PK컬럼)
            on delete set null;

※실무에서 스팸게시물을 남긴 회원과 그 글을 일괄적으로 삭제해야 할 때
사용할 수 있는 옵션이다. 단, 자식테이블의 모든 레코드가 삭제되므로 사용에
주의해야 한다.
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
insert into tb_primary4 values ('kosmo','코스모');--부모테이블에 입력하고
insert into tb_foreign4 values (1, '1번입니다', 'kosmo');--자식테이블에 입력해야 한다.
insert into tb_foreign4 values (2, '2번입니다', 'kosmo');
insert into tb_foreign4 values (3, '3번입니다', 'kosmo');
insert into tb_foreign4 values (4, '4번입니다', 'kosmo');
insert into tb_foreign4 values (5, '5번입니다', 'kosmo');
insert into tb_foreign4 values (6, '6번입니다', 'kosmo');
insert into tb_foreign4 values (7, '7번입니다', 'hong');--부모키가 없으므로 에러발생
--싹 지우고 다시한번 해봐라

select * from tb_primary4;
select * from tb_foreign4;

delete from tb_primary4;/*
            부모테이블에서 레코드 삭제스 on delete cascade 옵션때문에
            부모쪽 뿐만아니라 자식테이블까지 모든 레코드가 삭제된다.
        */

select * from user_cons_columns
order by table_name;

--on delete set null 옵션 테스트
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
insert into tb_primary5 values ('kosmo','코스모');
insert into tb_foreign5 values (1,'1번게시물','kosmo');
insert into tb_foreign5 values (2,'2번게시물','kosmo');
insert into tb_foreign5 values (3,'3번게시물','kosmo');
insert into tb_foreign5 values (4,'4번게시물','kosmo');
insert into tb_foreign5 values (5,'5번게시물','kosmo');
insert into tb_foreign5 values (6,'6번게시물','kosmo');
insert into tb_foreign5 values (7,'7번게시물','kosmo');

--입력된 레코드 확인
select * from tb_primary5;
select * from tb_foreign5;

/*
on delete set null 옵션으로 자식테이블의 레코드는 삭제되지 않고
참조키 부분만 null값으로 변경된다.
*/
delete from tb_primary5;

select * from tb_primary5;
select * from tb_foreign5;

/*
not null : null값을 허용하지 않는 제약조건
    형식]
        create table 테이블명 (
            컬럼명 자료형 not null,
            컬럼명 자료형 null <- null을 허용하겠다는 의미이지만 보통 
                                         아예 기술하지 않는것이 권장사항이다.
        );                
*/

create table tb_not_null (
    m_idx number(10) primary key,--PK로 저장했으니 NN
    m_id varchar2(30) not null,      --NN
    m_pw varchar2(40) null,           --null허용 (일반적으로 null은 생략)
    m_name varchar2(50)                --null허용 (이와같이 선언함)
);
desc tb_not_null;
select * from user_cons_columns;

insert into tb_not_null values (10,'hong','1111','홍길동');
insert into tb_not_null values (20,'hong2','2222','');
insert into tb_not_null values (30,'hong3','','');
insert into tb_not_null values (40,'','4444','사길동');--입력실패. null을 입력할 수 없음
insert into tb_not_null (m_id, m_pw, m_name) 
    values ('hong5','5555','오길동');/*입력실패. cannot insert NULL into m_idx컬럼에
                                                        값이 입력되어야 함
    */
insert into tb_not_null values (60,' ','6666','육길동');--입력성공(space도 문자임)

select * from tb_not_null;

/*
Default : insert시 아무런 값도 입력하지 않을때 자동으로 삽입되는
    데이터를 말한다.
*/
create table tb_default(
    id varchar2(30) not null,
    pw varchar2(30) default 'qwer'
);
desc tb_default;
select * from tb_default;
insert into tb_default values ('aaaa','1234');--1234 입력됨
insert into tb_default values ('bbbb','');--null값 입력
insert into tb_default (id) values ('cccc');--default값 삽입됨
insert into tb_default (id,pw) values ('dddd',default);--defualt값 입력
insert into tb_default values ('dddd',default);--defualt값 입력
/*
    위에서 보듯이 default값을 입력하면 insert시 컬럼 자체를 제외하거나
    defualt 키워드를 사용해야 한다.
*/

/*
check : Domain(자료형) 무결성을 유지하기 위한 제약조건으로
    해당 컬럼에 잘못된 데이터가 입력되지 않도록 유지하는 제약조건이다.
*/
create table tb_check1 (
    gender varchar2(20) not null,
        constraint check_gender
            check (gender in ('M', 'F'))
);
insert into tb_check1 values ('M');
insert into tb_check1 values ('F');
insert into tb_check1 values ('A');--입력실패
insert into tb_check values ('남자');--입력실패
insert into tb_check values ('여자');--입력실패

create table tb_check2 (
    ticket_cnt number not null
        check(ticket_cnt<=5)
);
insert into tb_check2 values ('4');
insert into tb_check2 values ('5');
insert into tb_check2 values ('6');--입력실패 check 제약조건 위배


/*********************************************************************************************/
/******************************SCOTT계정으로 연습문제 진행*************************************/
/*********************************************************************************************/

/************************************
1. emp 테이블의 구조를 복사하여 pr_emp_const 테이블을 만드시오. 
복사된 테이블의 사원번호 칼럼에 pr_emp_pk 라는 이름으로 
primary key 제약조건을 지정하시오.
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
2. dept 테이블의 구조를 복사해서 pr_dept_const 테이블을 만드시오. 
부서번호에 pr_dept_pk 라는 제약조건명으로 primary_key를 생성하시오.
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
3. pr_dept_const 테이블에 존재하지 않는 부서의 사원이 
배정되지 않도록 외래키 제약조건을 지정하되 제약조건 이름은 
pr_emp_dept_fk 로 지정하시오.
*************************************/
alter table pr_dept_const add
    constraint pr_emp_dept_fk 
        foreign key (deptno)
            references pr_emp_const (deptno);
            -- 공부좀 제대로하자~~~~틀렷자나
alter table pr_emp_const add--항상 1:N의 관계 생각해(1이 부모)
    constraint pr_emp_dept_fk  --제약조건명 추가
        foreign key (deptno) --자식테이블의 외래키(참조키)컬럼
            references pr_dept_const (deptno);--부모테이블의 기본키(pk)컬럼
            
/*************************************
4. pr_emp_const 테이블의 comm 칼럼에 0보다 큰 값만을 입력할수 
있도록 제약조건을 지정하시오. 제약조건명은 지정하지 않아도 된다.
*************************************/
alter table pr_emp_const modify comm not null 
check (comm >0);
--                                       [constraint 제약조건명] 생략
alter table pr_emp_const add check (comm>0);

--제약조건 확인을 위한 레코드 삽입
insert into pr_emp_const (empno,comm) values (100,0);

--부모테이블에 레코드 입력
insert into pr_dept_const values (10,'꿈의방','가산');
insert into pr_dept_const values (20,'열정방','디지털');

--앞에서 실패한 레코드 입력
insert into pr_emp_const values 
    (100,'아무개','열정',null,sysdate,1000,0.3,10);
insert into pr_emp_const values 
    (200,'아무개','열정',null,sysdate,800,0.45,20);
select * from pr_emp_const;


/************************************
5. 위 3번에서는 두 테이블간에 외래키가 설정되어서 
pr_dept_const 테이블에서 레코드를 삭제할 수 없었다. 
이 경우 부모 레코드를 삭제할 경우 자식까지 같이 삭제될수 
있도록 외래키를 지정하시오.
************************************/
--부모테이블
select * from pr_dept_const;
--자식테이블
select * from pr_emp_const;
--부모테이블에서 레코드 삭제하기
delete from pr_dept_const where deptno=10;/*
                    자식레코드가 있으므로 삭제불가함.
                    외래키 제약조건 위배.
            */
            
--외래키 재설정을 위해 기존의 외래키를 삭제한다.
alter table pr_emp_const drop constraint pr_emp_dept_fk;

--외래키 재설정
alter table pr_emp_const add
    constraint pr_emp_dept_fk 
        foreign key (deptno)
            references pr_dept_const (deptno)
                on delete cascade;--부모 삭제시 자식도 같이 삭제되는 옵션
--자식레코드가 있는 상테에서 부모레코드 삭제하기
delete from pr_dept_const where deptno=10;
select * from pr_dept_const;
select * from pr_emp_const;

commit;
/*
▣ 레코드 입력하기
    형식1
        INSERT INTO 테이블명 (컬럼1, 컬럼2....)
            VALUES (값1, 값2, .....);
    형식2
        INSERT INTO 테이블명 VALUES 
            (값1, 값2....컬럼수와 동일하게 입력);



▣ 레코드 수정하기
    형식
    UPDATE  테이블명
        SET 컬럼1=값1, 컬럼2=값1......컬럼N=값N
            WHERE 조건1 and 조건2;

단, where절이 없으면 모든 레코드가 수정된다. 

▣ 레코드 삭제하기
    형식
        delete from 테이블명 where 조건1 and 조건2;

단, where절이 없으면 모든 레코드가 삭제된다. 

*/

















