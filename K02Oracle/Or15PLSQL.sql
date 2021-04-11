/***************************************
���ϸ� : Or15PLSQL.sql
PL/SQL
�ȸ� : ����Ŭ���� �����ϴ� ���α׷��� ���
***************************************/

/*
PL/SQL(Procedural Language)
    : �Ϲ� ���α׷��� ���� ������ �ִ� ��Ҹ� ��� ������ ������
    DB������ ó���ϱ� ���� ����ȭ�� ����̴�.
*/

--hr�������� �ǽ�

--ȭ��� ������ ����ϰ������ on���� �����Ѵ�.
--off�϶��� ��µ��� �ʴ´�.(default�� off����)
set serveroutput on;
declare --����� : ������ �ַ� �����Ѵ�.
    cnt number; --����Ÿ���� ������ ������.
begin --����� : begin~end�� ���̿� ������ ���� ������ ����Ѵ�(Java���� {�� �ش���)
    cnt := 10;--���� cnt�� 10�� �Ҵ��Ѵ�. �̶� ���Կ����ڴ� := �� ����Ѵ�
    cnt := cnt +1;
    dbms_output.put_line(cnt);--Java���� println���� ������
end;--����� : Java���� }�� �ش���
/
/*
    PL/SQL ������ ������ �ݵ�� / �� �ٿ��� �ϴµ�, ����
    ������ ȣ��Ʈȯ������ ���������� ���Ѵ�. �� PL/SQL������
    Ż���ϱ� ���� �ݵ�� �ʿ��� �����̴�.
*/

/*
�ó�����] ������̺��� �����ȣ�� 120�� ����� �̸��� ����ó�� ����ϴ�
    PL/SQL���� �ۼ��Ͻÿ�
*/
select first_name||' '||last_name, phone_number 
from employees 
where employee_id=120;

set serveroutput on;
declare
    /*
    ����ο��� ������ �����Ҷ� ���̺� �����ÿ� �����ϰ�
    �����ϸ� �ȴ�. �� first_name�� last_name�� ������ �����̹Ƿ�
    ���� �� �˳��� ũ��� �����ϴ°��� ����.
    */
    empName varchar2(50);
    empPhone varchar2(30);
begin
    /*
    ����� : select������ ������ ����� ����ο��� ������
        ������ 1:1�� �����Ͽ� ���� �����Ѵ�. �̶� into��
        ����Ѵ�.
    */
    select first_name||' '||last_name, phone_number 
        into empName, empPhone
    from employees 
    where employee_id=120;
    
    dbms_output.put_line(empName||' '||empPhone);
end;
/

/*
�ó�����] �μ���ȣ 10�� ����� �����ȣ, �޿�, �μ���ȣ�� �����ͼ�
    �Ʒ� ������ ���� �� ȭ��� ����ϴ� PL/SQL���� �ۼ��Ͻÿ�
    ��, ������ �������̺��� �ڷ����� �����ϴ� '��������'�� �����Ͻÿ�
    
    �������� : Ư�� ���̺��� Ư�� �÷��� �����ϴ� �����ν�
        ������ �ڷ����� ũ��� �����ϰ� ������ ����Ѵ�.
        ����] ���̺��.�÷���%type
            ->���̺��� '�ϳ�'�� �÷����� �����Ѵ�.
*/
--�ó����� ���ǿ� �´� select���� �ۼ��Ѵ�.
select employee_id, salary, department_id from employees
where department_id=10;

declare
    --������̺��� Ư�� �÷��� �����ϴ� ���������� �����Ѵ�.
    empNo  employees.employee_id%type;--number(6.0)
    empSal employees.salary%type;--number(8,2)
    deptId employees.department_id%type;--number(4,0) �� �����ϴ�.
begin
    --select�� ����� into�� ���� ������ ������ �Ҵ��Ѵ�.
    select employee_id, salary, department_id 
        into empNo,empSal,deptId
    from employees
    where department_id=10;
    --������
    dbms_output.put_line(empNo||' '||empSal||' '||deptId);
end;
/

/*
�ó�����] �����ȣ�� 100�� ����� ���ڵ带 �����ͼ� emp_row������ ��ü�÷���
������ �� ȭ�鿡 ���� ������ ����Ͻÿ�.
��, emp_row�� ������̺��� ��ü�÷��� ������ �� �ִ� ���������� �����ؾ��Ѵ�.
������� : �����ȣ, �̸�, �̸���, �޿�
*/
select* from employees where employee_id=100;

declare
    /*
    ��ü�÷��� �����ϴ� �������� : ���̺�� �ڿ� %rowType�� �ٿ���
        �����Ѵ�
    */
    emp_row employees%rowType;
begin
    /*
    ���ϵ�ī�� *�� ���� ���� ��ü�÷��� ���� emp_row��
    �Ѳ����� �����Ѵ�.
    */
    select * into emp_row 
    from employees where employee_id=100;
    /*
    emp_row���� ��ü �÷��� ������ ����ǹǷ� ��½ÿ���
    ������.�÷��� ���·� ����ؾ��Ѵ�.
    */
    dbms_output.put_line(
        emp_row.employee_id||' '||
        emp_row.first_name||' '||
        emp_row.email||' '||
        emp_row.salary);
end;
/

/*
���պ���
    : class�� �����ϵ� �ʿ��� �ڷ����� ��� �����ϴ� ����
    
    �Ʒ��� 3���� �ڷ����� ���� ���պ����� �����ϰ� �ִ�.
    Ư�� �÷��� �״�� ����Ҷ��� �������� %type���·� �����ϰ�
    �÷��� ��ġ�ų� �����ؾ� �� ��� ���ǻ����� �����ϴ�.
    ����]
        type ���պ����ڷ��� is record(
            �÷���1 �ڷ���1,
            �÷���2 �������%type...
    
*/

declare 
    --3���� ���� ������ �� �ִ� �����ڷ����� �����Ѵ�.
    type emp_3type is record(
        emp_id employees.employee_id%type,--�������̺��� �÷��� �����ϴ� ����
        emp_name varchar2(50),--���Ӱ� ������ ����
        emp_job employees.job_id%type
    );
    --�����ڷ����� ���� ������ ���պ���. 3���� �÷��� ������ �� �ִ�.
    record3 emp_3type;
begin
    --select������ ������ 3���� �÷��� �ϳ��� ���պ����� �����Ѵ�.
    select employee_id, first_name||' '||last_name, job_id
        into record3
    from employees
    where department_id=10;
    
    --��½ÿ��� ������.�÷��� ���·� ����Ѵ�.
    dbms_output.put_line(record3.emp_id||' '||
    record3.emp_name||' '||record3.emp_job);
end;
/
/*
znl] �Ʒ� ������ ���� PL/SQL���� �ۼ��Ͻÿ�.
1.���պ�������
    �������̺� : employees
    ���պ����ڷ����� �̸� : empTypes
        ���1 : emp_id -> �����ȣ
        ���2 : emp_name -> �������ü�̸�(�̸�+��)
        ���3 : emp_salary -> �޿�
        ���4 : emp_percent -> ���ʽ���
    ������ ������ �ڷ����� �̿��Ͽ� ���պ��� rec2�� ������ �����ȣ 
    100���� ������ �Ҵ��Ѵ�.
2.1�� ������ ����Ѵ�.
3.�� ������ �Ϸ����� ġȯ�����ڸ� ����Ͽ� �����ȣ�� ����ڷκ��� �Է¹�����
    �ش� ����� ������ ����Ҽ��ֵ��� �����Ͻÿ�.[����]
*/
select employee_id, first_name||' '||last_name, salary, commission_pct
from employees where employee_id=100;

set serveroutput on;

declare
    --4���� �ڷḦ ������ �ִ� ���պ����ڷ��� ����
    type empTypes is record(
        emp_id number(38),
        emp_name varchar2(100), 
        emp_salary number(38),
        emp_percent employees.commission_pct%type
    );
    --���պ������� (���պ����ڷ����� Ȱ��)
    rec2 empTypes;
begin
    --������ ���ǿ� �����ϴ� select�� ���� 
    select employee_id, first_name||' '||last_name, salary, nvl(commission_pct,0)
        into rec2
    from employees 
    where employee_id=100;
    
    dbms_output.put_line('�����ȣ'||'/'||'����̸�'||'/'||'�޿�'||'/'||'���ʽ���');
    dbms_output.put_line(rec2.emp_id||' '||
    rec2.emp_name||' '||
    rec2.emp_salary||' '||
    rec2.emp_percent);
end;
/
/*
ġȯ������ : PL/SQL���� ����ڷκ��� �����͸� �Է¹����� ����ϴ�
    �����ڷ� �����տ� &�� �ٿ��ָ� �ȴ�. ����� �Է�â�� ���.

->PL/SQL������ ����� �� �ִ�. �׽�Ʈ �뵵��� �����ϸ� �ȴ�.
*/
--���� ���� 3������ �䱸�� ġȯ�����ڷ� �����Ͽ� �����ȣ�� �Է¹޾� ó���Ѵ�.

declare
    --4���� �ڷḦ ������ �ִ� ���պ����ڷ��� ����
    type empTypes is record(
        emp_id number(38),
        emp_name varchar2(100), 
        emp_salary number(38),
        emp_percent employees.commission_pct%type
    );
    --���պ������� (���պ����ڷ����� Ȱ��)
    rec2 empTypes;
    
    --ġȯ�����ڸ� ���� �Է¹��� ���� �Ҵ�޴� ����
    inputNum number(3) := &inputNum;
begin
    --������ ���ǿ� �����ϴ� select�� ���� 
    select employee_id, first_name||' '||last_name, salary, nvl(commission_pct,0)
        into rec2
    from employees 
    where employee_id=inputNum;
    
    dbms_output.put_line('�����ȣ'||'/'||'����̸�'||'/'||'�޿�'||'/'||'���ʽ���');
    dbms_output.put_line(rec2.emp_id||' '||
    rec2.emp_name||' '||
    rec2.emp_salary||' '||
    rec2.emp_percent);
end;
/
/*
-���ε庯��
    : ȣ��Ʈȯ�濡�� ����� �����ν� �� PL/SQL�����̴�.
    ȣ��Ʈ ȯ���̶� PL/SQL�� ���� ������ ������ �κ��� ���Ѵ�.
    �ܼ�(CMD)������ SQL>���������Ʈ�� �ִ� ���¸� ���Ѵ�.
    
    ����]
        var ������ �ڷ���;
        Ȥ��
        variable ������ �ڷ���;
*/
set serveroutput on;
var return_var number;--ȣ��Ʈȯ�濡�� ���ε� ���� ���� 

declare
begin
    --PL/SQL���� ����Ҷ��� �ݵ�� : �� ���� �տ� �ٿ��� �Ѵ�.
    --�Ϲݺ����� ���ε庯���� �����ϱ� ���� �뵵�� ���ȴ�.
    :return_var := 999;
    dbms_output.put_line(:return_var);
end;
/
print return_var;
--���⼱ return_var���� ��¾ȵ����� cmdȯ�濡�� 999�� ��µȴ�.
 /*
    ȣ��Ʈȯ�濡�� ����Ҷ��� print���� ����Ѵ�.
    ����� �ȵǸ� cmdâ����  Ȯ���غ���. 
 */
 
 -----------------------------------
 --���(���ǹ�) :  if��, case���� ���� ���ǹ�
 
 --if��
 --Ȧ��¦���� �Ǵ��ϴ� if�� ����
 declare 
    num number := &num;
begin                       
    if mod(num,2) =0 then
        dbms_output.put_line(num||''||'�� ¦��');
    else
        dbms_output.put_line(num||''||'�� Ȧ��');
    end if;
end;
/
 --�� ������ ġȯ�����ڸ� ���� ���ڸ� �Է¹��� �� �Ǵ��� �� �ֵ��� ����
 
 /*
 �ó�����] �����ȣ�� ����ڷκ��� �Է¹��� �� �ش� ����� � �μ�����
 �ٹ��ϴ����� ����ϴ� PL/SQL���� �ۼ��Ͻÿ� ��, if~else���� ����Ͽ�
 �����Ͻÿ�.
 */
declare 
    --ġȯ�����ڸ� ���� �����ȣ�� �Է¹���
    emp_id employees.employee_id%type := & emp_id;
    emp_name varchar2(50);
    emp_dept employees.department_id%type;
    
    dept_name varchar2(30) := '�μ���������';--�μ����� ����� ���ÿ� �ʱ�ȭ
 begin
    select employee_id, last_name, department_id
        into emp_id, emp_name, emp_dept
    from employees
    where employee_id = emp_id;--�Է¹��� �����ȣ�� ���� ���� ������
    /*
    �������� ������ ����� ���  java�� ���� else if�� ������� �ʰ�
    elsif�� ����ؾ� �Ѵ�. ���� �߰�ȣ ��� then�� ;�� ���ȴ�.
    */
    if emp_dept = 50 then
        dept_name := 'Shipping';
    elsif emp_dept = 60 then
        dept_name := 'IT';
    elsif emp_dept = 70 then
        dept_name := 'Public Relations';
    elsif emp_dept = 80 then
        dept_name := 'Sales';
    elsif emp_dept = 90 then
        dept_name := 'Executive';
    elsif emp_dept = 100 then
        dept_name := 'Finance';
    end if;
    
    dbms_output.put_line('�̸�:'|| emp_name || '�� ����');
    dbms_output.put_line('�����ȣ'|| emp_id ||',�μ���ȣ'|| 
                                        emp_dept||', �μ���'|| dept_name);
end;
/

/*
case�� : java�� switch���� ����� ���ǹ�
����] 
    �Ҵ���� ���� :=
        case ����
            when ��1 then '�Ҵ簪1'
            when ��2 then '�Ҵ簪2'
            ...
        end;
    
�ó�����] ������ if~elsif�� �ۼ��� PL/SQL���� case~when������ �����Ͻÿ�
*/

declare 
    --ġȯ�����ڸ� ���� �����ȣ�� �Է¹���
    emp_id employees.employee_id%type := & emp_id;
    emp_name varchar2(50);
    emp_dept employees.department_id%type;
    
    dept_name varchar2(30) := '�μ���������';--�μ����� ����� ���ÿ� �ʱ�ȭ
 begin
    select employee_id, last_name, department_id
        into emp_id, emp_name, emp_dept
    from employees
    where employee_id = emp_id;--�Է¹��� �����ȣ�� ���� ���� ������

    /*
    case~when���� if���� �ٸ� ���� �Ҵ��� ������ ���� ������ ��
    ���峻���� ������ �Ǵ��Ͽ� �ϳ��� ���� �Ҵ��ϴ� ����̴�.
    */
    dept_name :=
        case emp_dept
            when 50 then 'Shipping'
            when 60 then  'IT'
            when 70 then  'Public Relations'
            when 80 then  'Sales'
            when 90 then  'Executive'
            when 100 then  'Finance'
        end;
        
    dbms_output.put_line('�̸�:'|| emp_name || '�� ����');
    dbms_output.put_line('�����ȣ'|| emp_id ||',�μ���ȣ'|| 
                                        emp_dept||', �μ���'|| dept_name);
end;
/

 /*
 ���(�ݺ���)
 
 �ݺ���1 : Basic loop��
    java�� do~while���� ���� ����üũ ���� �ϴ� loop�� ������ ��
    Ż�������� �ɶ����� �ݺ��Ѵ�.
 */
 declare
    num number := 0;
begin
    loop
        --0~10���� ��µ�
        dbms_output.put_line(num);
        num := num +1;
        exit when(num>10);
    end loop;
end;
/
/*
����] basic loop ������ 1���� 10���� ������ ���� ���ϴ�
���α׷��� �ۼ��Ͻÿ�
*/
declare
    i number := 1;--������ų ����
    total number := 0;--�������� ���� ����
    /*
    ���������� sum�� ����� �� ����. ������̹Ƿ� ������ 
    �߻��ϰ� �ȴ�.
    */
begin
    /*
    ���մ��Կ�����, ���������ڰ� �����Ƿ� ������ Ȥ�� ������
    ������ �Ʒ��� ���� �����ؾ� �Ѵ�.
    */
    loop
        total := total + i;
        i :=i +1;
        exit when(i>10);
    end loop;
    dbms_output.put_line('1~10������ ����:'||total);
end;
/
 /*
 �ݺ���2 : while��
    basic loop�ʹ� �ٸ��� ������ ���� Ȯ���� �� �����Ѵ�.
    ��, ���ǿ� ���� �ʴ´ٸ� �ѹ��� ������� �������� �ִ�.
 */
declare
    num1 number := 0;
begin
    --while������ �����ϱ� �� ���� ������ �Ǵ��Ѵ�.
    while num1<11 loop
        dbms_output.put_line('�̹����ڴ�:'||num1);
        num1 := num1+1;
    end loop;
end;
/
 /*
����] basic loop ������ 1���� 10���� ������ ���� ���ϴ�
���α׷��� �ۼ��Ͻÿ�
*/
declare
    num1 number := 1;
    total number := 0;

begin
    --while������ �����ϱ� �� ���� ������ �Ǵ��Ѵ�.
    while num1<11 loop
        total := num1+total;
        num1 := num1+1      
    end loop;
    dbms_output.put_line('1~10������ ����:'||total);
end;
/
/*
�ݺ���3 : for��
    �ݺ��� Ƚ���� �����Ͽ� ����� �� �ִ� �ݺ�������, �ݺ��� ����
    ������ ������ �������� �ʾƵ� �ȴ�. �׷��Ƿ� Ư���� ������ ���ٸ�
    declare(�����)�� ������� �ʾƵ� �ȴ�.
*/

declare
begin
    for num2 in 0 .. 10 loop
        dbms_output.put_line('for�� ¯��:'||num2);   
    end loop;
end;
/

begin
    for num3 in reverse 0 .. 10 loop
        dbms_output.put_line('for�� ¯��:'||num3);   
    end loop;
end;
/
/*
�ó�����] for loop������ �������� ����Ͻÿ�
*/
--�ٹٲ� �Ǵ� ����
begin
    for dan in 2 .. 9 loop
        dbms_output.put_line(dan||'��');
        for su in 1 .. 9 loop
            dbms_output.put_line(dan||'*'||su||'='||dan*su);   
        end loop;
    end loop;
end;
/
--�ٹٲ� ���� ����
declare 
    --�����ܿ��� �ϳ��� ���� �����ϱ� ���� ����
    guguStr varchar2(1000);
begin
    --�ܿ� �ش��ϴ� for loop�� (2~9)
    for dan in 2 .. 9 loop

        dbms_output.put_line(dan||'��');
        --���� �ش��ϴ� for loop�� (1~9)
        for su in 1 .. 9 loop
            --�ϳ��� ���� �����ؼ� �����Ѵ�.
            guguStr :=  guguStr ||(dan||'*'||su||'='||dan*su)||' ';
        end loop;
        --�ϳ��� ���� ����� �� �ٹٲ��Ѵ�.
        dbms_output.put_line(guguStr);
        --����ؼ� �������� �ʵ��� �ʱ�ȭ����
        guguStr := null;
    end loop;
end;
/
/*
Ŀ��(corsor)
    : select���忡 ���� �������� ��ȯ�Ǵ� ��� �� �࿡ �����ϱ�
    ���� ��ü
    
    ������]   
        Cursor Ŀ���� Is
            select ���� (��, into���� ���� seletc)
        open cursor
            :   ������ �����϶�� �ǹ�. �� open�Ҷ� cursor �������
            select ������ ����Ǿ� ������� ��Եȴ�. cursor�� �� �������
            ù��°�࿡ ��ġ�ϰ� �ȴ�.
            
            open Ŀ����;
        Fetch ~ Into ~
            : ����¿��� �ϳ��� ���� �о���̴� �۾����� ������� ����(Fetch)
            �Ŀ� cursor�� ���� ������ �̵���.
            
            Fetch Ŀ���� Into (����1, ����2, ...)
            
        close cursor
            : Ŀ�� �ݱ�� ������� �ڿ��� �ݳ��Ѵ�. select ������ ���
            ó���� �� cursor�� close����
            
            Close Ŀ����;
            
        Cursor Ŀ���� Is
            select ����
        open Ŀ����;
            Fetch Ŀ���� Into (����1, ����2...)
        Close Ŀ����;
        
        Cursor�� �Ӽ�
            %Found : ���� �ֱ��� ���� (Fetch)�� ���� Return�ϸ� True,
                    �ƴϸ� False�� ��ȯ�Ѵ�.
            %Rowcount : ���ݱ��� Return�� ���� ������ ��ȯ�Ѵ�.
        
*/
/*
�ó�����] �μ����̺��� ���ڵ带 Cursor�� ���� ����ϴ�  PL/SQL����
                �ۼ��Ͻÿ�
*/
declare
    --�μ����̺��� ��ü�÷��� �����ϴ� �������� ����
    v_dept departments%rowtype;
    --Ŀ�� ����(�μ����̺��� ��� ���ڵ带 ��ȸ�ϴ� select��)
    Cursor cur1 is
        select 
            department_id, department_name, location_id
        from departments;
begin
    /*
    �ش� �������� �����ؼ� ������� ��������� �������
    ������̶� ����(����)���� ������ �� ��ȯ�Ǵ� ���ڵ��� �����
    ���Ѵ�.(Java������ ResultSet��ü�� ������ ������ �Ѵ�.)
    */
    open cur1;
    /*
    basic�������� ���� ���� ������� ������ŭ �ݺ��Ͽ� �����Ѵ�.
    */
    loop
        /*
        �� �÷��� ���� ���������� �����Ѵ�.
        */
        fetch cur1 into
            v_dept.department_id,
            v_dept.department_name,
            v_dept.location_id;
            /*
            Ż���������� ���̻� ������ ���� ������ exit�� ����ȴ�.
            */
            exit when cur1%notfound;
            
            dbms_output.put_line(v_dept.department_id||' '||
                                            v_dept.department_name||' '||v_dept.location_id);
    end loop;
    --Ŀ���� �ڿ��ݳ�
    close cur1;
end;
/

/*
��������] Cursor�� ����Ͽ� ������̺��� Ŀ�̼��� null�� �ƴ�
����� �����ȣ, �̸�, �޿��� ��������(�̸�)���� ����Ͻÿ�.
*/

select employee_id, first_name||' '||last_name, salary
from employees where commission_pct is not null
order by first_name;

declare 
    --������̺��� ��ü�÷��� �����ϴ� �������� ����
    v_emp employees%rowtype;
    --������ ���ǿ� �´� Ŀ���� �����Ѵ�. �̶� into���� ������� �ʴ´�.
    Cursor cur2 is
    select employee_id, first_name,last_name, salary
        from employees where commission_pct is not null
        order by first_name;
begin
    --Ŀ���� �����Ͽ� ������ �����Ѵ�.
    open cur2;
    --Basic loop���� ���� Ŀ���� ����� ������� �����Ѵ�.
    loop
        --������ �� ������ �����ϱ� ���� into�� ����Ѵ�.
        fetch cur2 into
            v_emp.employee_id,
            v_emp.first_name,
            v_emp.last_name,
            v_emp.salary;
            --���̻� ������ ������� ������ ������ Ż���Ѵ�.                                                                                                                                                   
            exit when cur2%notfound;
            
            dbms_output.put_line(v_emp.employee_id||' '||
                                            v_emp.first_name||' '||v_emp.last_name||' '||v_emp.salary);
    end loop;
    --Ŀ���� �ݾ� �ڿ��ݳ��Ѵ�.
    close cur2;
end;
/
/*
�÷���(�迭)
    �Ϲ� ���α׷��� ���� ����ϴ� �迭Ÿ���� PL/SQL������ ���̺� Ÿ���̶�� �Ѵ�.
    1����, 2���� �迭�� �����غ��� ���̺�(ǥ)�� ���� �����̱� �����̴�.
    
����
-�����迭
-VArray
-��ø���̺�
*/

/*
1. �����迭(Associative Array  / Index-by Table)
    : Ű�� ���� �ѽ����� ������ �÷������� Java�� �ؽøʰ� ���� �����̴�.
    key  : �ڷ����� �ַ� ���ڸ� ����ϸ� binary_integer, pls_integer��
        ���ȴ�. �� �ΰ��� Ÿ���� number���� ũ��� �۰�, ������꿡 ����
        Ư¡�� ������. ���� ������(varchar2) ���ε� ����� �� �ִ�.
    value : �ڷ����� �������̸� �ַ� varchar2�� ���ȴ�.
    
    ����]
        Type �����迭�ڷ��� Is
            Table of �����迭 �� Ÿ��
            Index by �����迭 Ű Ÿ��
*/

/*
�ó�����] ������ ���ǿ� �´� �����迭�� ������ �� ���� �Ҵ��Ͻÿ�.
    �����迭 �ڷ��� �� : avType, ���� �ڷ��� :������, Ű�� �ڷ��� : ������
    key : girl, boy
    value : Ʈ���̽�, ��ź�ҳ��
    ������ : var_array
*/
declare 
    --�����迭 �ڷ��� ����
    Type avType is
        Table of varchar2(30)--value(��)�� �ڷ��� ����
        Index by varchar2(10);--key(Ű)�� �ڷ��� ����
    --�����迭 Ÿ���� ��������
    var_array avType;
begin
    --�����迭�� �� �Ҵ�
    var_array('girl') := 'Ʈ���̽�';
    var_array('boy') := '��ź�ҳ��';
    --���
    dbms_output.put_line(var_array('girl'));
    dbms_output.put_line(var_array('boy'));
    
end;
/
/*
�ó�����] 100�� �μ��� �ٹ��ϴ� ����� �̸��� �����ϴ� �����迭�� �����Ͻÿ�.
    key�� ����, value�� full_name���� �����Ͻÿ�.
*/
--100�� �μ��� �ٹ��ϴ� ���� ���
select * from employees where department_id =100;
select first_name||' '||last_name from employees where department_id =100;

--������ ������ ���� �������� �ټ����� ����ǹǷ� Cursor�� ����ؾ� �Ѵ�.
declare
    --�������� ���� Ŀ�� ����
    Cursor emp_cur is
        select first_name||' '||last_name 
        from employees where department_id =100;
    --�����迭 �ڷ��� ����(���� ����, Ű�� ���ڷ� �����Ѵ�)        
    Type nameAvType is
        table of varchar2(30)
        index by binary_integer;   
    --�����迭 ������ ����
    names_arr nameAvType;
    fname varchar2(50);--�迭�� �̸��� ������ ����
    idx number := 1;--�ε��� �뵵
    
begin
    open emp_cur;
    loop 
        --�ϳ��� ��(row)���� ������ ������(�̸�)�� fname�� ����
        fetch emp_cur into fname;
        --Ż������
        exit when emp_cur%notfound;
        --�����迭�� �����͸� �����ϰ� Ű������ idx�� ���
        names_arr(idx) := fname;
        --Ű�� ���� �ε��� ++
        idx := idx +1;
    end loop;
    close emp_cur;
    --�����迭�� ũ�⸸ŭ �ݺ��ؼ� ���
    --�����迭.count -> �迭�� ����� ���� ��ȯ list.size(), hash.size(), arr.length�� ����
    for i in 1 .. names_arr.count loop
        dbms_output.put_line(names_arr(i));
    end loop;
end;
/
        
/*
2.VArray(Variable Array)
    : �������̸� ���� �迭�μ� �Ϲ� ���α׷��� ���� ����ϴ� �迭��
    �����ϴ�. ũ�⿡ ������ �־ �����Ҷ� ũ��(����� ����)�� �����ϸ�
    �̺��� ū �迭�� ���� �� ����.
    
    ����]
        Type �迭Ÿ�Ը� Is
            Array(�迭ũ��) Of ��Ұ��� Ÿ��;
*/
declare
    --VArrayŸ�� ���� : ũ��� 5, ������ �����ʹ� ������
    type vaType is
        array(5) of varchar(20);
    --VArray�� �迭���� ����
    v_arr vaType;
    cnt number := 0;
begin
    --�����ڸ� ���� ���� �ʱ�ȭ (�� 5���� 3���� �Ҵ�)
    v_arr  := vaType('First','Second','Third','','');
    
    --basic loop���� ���� �迭��� ���(���ε����� 1���� ������)
    loop 
        cnt := cnt  +1 ;
        --Ż������
        if cnt >5 then
            exit;
        end if;
        --��� 
        dbms_output.put_line(v_arr(cnt));
    end loop;
     --�迭�� ��Ұ� �����
     v_arr(3) := '�츮��';
     v_arr(4) := 'Java';
     v_arr(5) := '�����ڴ�';
     --2�� ���
     for i in 1 .. 5 loop
        dbms_output.put_line(v_arr(i));
    end loop;   
    
end;
/
 
declare 
    --�ϳ��� �÷��� �����ϴ� ���������� ���� VArray�ڷ��� ����
    type vaType1 is
        array(6) of employees.employee_id%type;
    --�迭 ���� ���� �� �ʱ�ȭ     
    va_one vaType1 := vaType1('','','','','','');
    cnt number := 1;
begin
    /*
    Java�� Ȯ�� for���� ����ϰ� ������ ����� ������ŭ �ڵ�����
    �ݺ��ϴ� ���·� ���ȴ�. select���� employee_id�� ���� i��
    �Ҵ�ǰ�, �̸� ���� �����Ѵ�. 
    */
    for i in (select employee_id from employees where department_id =100) loop
    /*for i in (select * from employees where department_id =100) loop*/--�����ϰ�  ��µ�

        --������ �����͸� �迭�� �����Ѵ�.
        va_one(cnt) := i.employee_id; 
        cnt := cnt +1;
    end loop;
    --�迭�� ũ�⸸ŭ �ݺ��ؼ� ���
    for j in 1 .. va_one.count loop
        dbms_output.put_line(va_one(j));
    end loop;
end;
/
/*
3. ��ø���̺�(Nested Table) 
    : VArray �� ����� ������ �迭�μ� �迭�� ũ�⸦ ������� �����Ƿ�
        �������� �迭�� ũ�Ⱑ �����ȴ�. ���⼭ ���ϴ� ���̺��� �ڷᰡ
        ����Ǵ� ����  ���̺��� �ƴ϶� �÷����� �� ������ �ǹ��Ѵ�.
        
        ����]
            Type ��ø���̺�� Is
                Table of ���� Ÿ��;
*/
declare
    --��ø���̺� �ڷ��� ���� �� ��������
    type ntType is
        table of varchar2(30);
    nt_array ntType;
begin
    --�����ڸ� ���� �� �Ҵ�(���⼭ ũ�� 4�� ��ø���̺� ������
    nt_array := ntType('ù��°','�ι�°','����°','');
    
    dbms_output.put_line(nt_array(1));
    dbms_output.put_line(nt_array(2));
    dbms_output.put_line(nt_array(3));
    nt_array(4) := '�׹�°�� �Ҵ�';
    dbms_output.put_line(nt_array(4));--4��° ������ �Ҵ� ����
    
    --nt_array(5) := '�ټ���°�� �Ҵ�?'; Subscript beyond count���� �߻�
    
    --�����ڸ� ���� �迭�� ũ�⸦ �������� Ȯ���Ѵ�.
    nt_array := ntType('1a','2b','3c','4d','5e','6f','7g');
   
   --ũ�� 7�� ��ø���̺� ��� 
    for i in 1 .. 7 loop
      dbms_output.put_line(nt_array(i));
    end loop;
end;
/


/*
�ó�����] ��ø���̺�� for���� ���� ������̺���
    ��ü ���ڵ��� �����ȣ�� �̸��� ����Ͻÿ�.
*/
declare
    /*
    ��ø���̺� �ڷ��� ���� �� ���� ���� : ������̺� ��ü �÷��� �����ϴ�
        ���������� �����̹Ƿ� �ϳ��� ���ڵ�(row)�� ������ �� �ִ�
        ���·� �����ߴ�.
    */
    type ntType is
        table of employees%rowtype;
    nt_array ntType;

begin
    --ũ�⸦ �������� �ʰ� �����ڸ� ���� �ʱ�ȭ�Ѵ�. 
    nt_array := ntType();
    
    /*
    ������̺��� ���ڵ� ����ŭ �ݺ��ϸ鼭 ���ڵ带 �ϳ��� rec�� �Ҵ��Ѵ�. 
    Ŀ��ó�� �����ϴ� for���� ���·� Java�� Ȯ�� for��ó�� ���Ǿ���.
    */
    for rec in (select * from employees) loop
        nt_array.extend;--��ø���̺��� ���κ��� Ȯ���ϸ鼭 null����
        nt_array(nt_array.last) := rec;--������ �ε����� ���ڵ�(�������)����
    end loop;
    
    for i in nt_array.first .. nt_array.last loop
        dbms_output.put_line(nt_array(i).employee_id||
            '>'||nt_array(i).first_name||' '||nt_array(i).last_name);
    end loop;
end;
/

/*
1. ������̺��� ������̵�� ��ȸ�ؼ� ����̸��� ���ڼ�//��ŭ #�� ��� PL/SQL���� �ۼ��Ͻÿ�.
��¿�] �̸��� ��Ismael�� ��� ###### ���·� ��µȴ�.

*/
declare 
    I_empno emp.empno%type:= &I_empno;
    I_ename emp.ename%type;
    star varchar2(100);
    
begin
    select ename 
        into I_ename
    from emp where empno=I_empno;
    
    for i in 1 .. length(I_ename) loop
        star := star||'#';
        lpad rpad
    end loop;
    dbms_output.put_line(star);
end;
/

set serveroutput on;

select translate(lower(emp_name),
'abcdefghijkmnlopqrsxtuvwxyz','#
') 
from employees where employee_id =100;

declare 
    emp_id employees.employee_id%type := &employee_id;
    emp_name varchar2(60);
begin
    select first_name||last_name 
        into emp_name
    from employees where employee_id=emp_id;

    dbms_output.put_line(translate(lower(emp_name),
'abcdefghijkmnlopqrsxtuvwxyz','#############') );
end;
/

set serveroutput on;
declare 
    emp_id employees.employee_id%type := &employee_id;
    emp_name varchar2(60);
    name_length number :=0;
begin
    select first_name||last_name 
        into emp_name
    from employees where employee_id=emp_id;
    name_langth := length(emp_name);
    for num1 in 1 .. name_length loop
        dbms_output.put_line('#');
    end loop;
end;
/

/*
2. basic loop ������ �������� ����Ͻÿ�.
*/
declare
    dan number := 2;
    su number := 1;
    guguStr2 varchar2(2000);
begin
    loop
    exit when (dan>9);
    dbms_output.put_line('['||dan||'��]');
        loop
            exit when (su > 9);
            guguStr2 := guguStr2 ||(' '||dan || '*' || su || '=' || dan*su|| '|');
            su:= su + 1;
        end loop;
        dbms_output.put_line(guguStr2);
        guguStr2 :='';
        dan := dan + 1;
        su := 1;
    end loop;
end;
/

/*
3. while loop������ ������ ���� ����� ����Ͻÿ�.
*
**
***
****
*****
*/

declare
    num1 number := 0;
    num2 number := 0;
    starStr varchar2(10);
begin count += 1;
    while num1<5 loop
        while num2<=num1 loop
            starStr := starStr||'*';
            num2 := num2 +1;
        end loop;
        dbms_output.put_line(starStr);
        starStr := '';
        num2 := 0;
        num1 := num1+1;
    end loop;
end;
/
/*
4. for loop������ ������ ���� ����� ����Ͻÿ�.
1 0 0 0 0
0 1 0 0 0
0 0 1 0 0
0 0 0 1 0
0 0 0 0 1
*/
declare
    forStr varchar2(100);
begin
    for num1 in 0 .. 5 loop
        for num2 in 0..5 loop
            if num1=num2 then
                forStr := forStr||'1';
            else
                forStr := forStr||'0';
            end if;
        end loop;
        dbms_output.put_line(forStr);
        forStr :='';
    end loop;
end;
/
/*
5. ġȯ�����ڸ� ���� ����� �̸��� �Է��ϸ� �μ���ȣ�� ���� �μ����� ����ϴ� ���α׷��� �ۼ��Ͻÿ�.  �μ����� �Ʒ� ǥ�� �����Ͽ� if���� �����ϸ� �ȴ�. 
�μ���ȣ  �μ���
----------------------------
 10    ACCOUNTING
 20    RESEARCH
 30    SALES
 40    OPERATIONS
----------------------------
���� KING�� �Է��ߴٸ� �μ���ȣ�� 10, �μ����� ACCOUNTING�� ��µǸ� �ȴ�.
*/
declare
    inputN employees.last_name%type := '&inputN';
    dept_name varchar(50) := '�׿� �μ�';
    dept_id employees.department_id%type;
begin
    select department_id 
        into dept_id
    from employees
    where upper(last_name)=upper(inputN);
    
    if dept_id = 10 then
        dept_name := 'ACCOUNTING';
    elsif dept_id = 20 then
        dept_name := 'RESEARCH';
    elsif dept_id = 30 then
        dept_name := 'SALES';
    elsif dept_id = 40 then
        dept_name := 'OPERATIONS';
    end if;
        
    dbms_output.put_line(dept_name);
end;
/
   





    