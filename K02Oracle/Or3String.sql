/**********************************
���ϸ� : Or3String.sql
���ڿ� ó���Լ�
���� : ���ڿ��� ���� ��ҹ��ڸ� ��ȯ�ϰų� ���ڿ��� ���̸� ��ȯ�ϴ� ��
        ���ڿ��� �����ϴ� �Լ�
**********************************/

/*
concat('���ڿ�1','���ڿ�2')
    : ���ڿ� 1�� ���ڿ� 2�� ���� �����ؼ� ����ϴ� �Լ�
    
    ����1 : concat('���ڿ�1','���ڿ�2')
    ����2 : '���ڿ�1'||'���ڿ�2'
*/

select concat('good',' morning') as "��ħ�λ�" from dual;
select 'Oracle'||' 11g'||' Good' from dual;
-- --> ���� SQL���� concat()���� �����ϸ�..

select concat(concat('Oracle',' 11g'),' Good') from dual;

/*
initcap(���ڿ�)
    : ���ڿ��� ù���ڸ� �빮�ڷ� ��ȯ�ϴ� �Լ�.
    ��, ù���ڸ� �ν��ϴ� ������ ������ ����
    -���鹮�� ������ ������ ù���ڸ� �빮�ڷ� ��ȯ�Ѵ�.
    -���ĺ��� ���ڸ� ������ ������ ���� ������ ������
        ù���� ���ڸ� �빮�ڷ� ��ȯ�Ѵ�.
*/
select initcap('hi hello �ȳ�') from dual;
select initcap('good/bad morning') from dual;
select initcap('never6say*good��bye') from dual;

--������̺��� john �� ã�Ƽ� �����Ͻÿ�
select first_name, last_name 
    from employees where first_name='john';--���x    

select first_name, last_name 
    from employees where first_name='John';--3������

select first_name, last_name 
    from employees where first_name=initcap('john');--3������


/* 
 ��ҹ��� ����
 lower() : �ҹ��ڷ� ������
 upper() : �빮�ڷ� ������
*/
select lower('GOOD'), upper('good') from dual;
--�������� ���� john�� �˻��Ϸ���
SELECT
    *
FROM employees where lower(first_name)='john';

SELECT
    *
FROM employees where upper(first_name)='JOHN';
--�÷��� ����� ���� �빮�� Ȥ�� �ҹ��ڷ� ������ �� �������� �˻��Ѵ�.

/*
lpad(), rpad()
    : ���ڿ��� ����, �����ʿ� Ư���� ��ȣ�� ä�ﶧ ����ϴ� �Լ�
    ����] lpad('���ڿ�','��ü�ڸ���','ä�﹮�ڿ�')
        -> ��ü �ڸ������� ���ڿ��� ���̸�ŭ�� ������ ������
        ���� �κ��� �־��� ���ڿ��� ä���ִ� �Լ�
        rpad()�� �������� ä����.
*/
select
    'good', 
    lpad('good', 7, '#'),
    rpad('good', 7, '#'),
    lpad('good', 7),
    rpad('good', 7)
from dual;
    
/*
trim() : ������ ������ �� ����ϴ� �Լ�
    ����] trim([leading | trailing | both] ������ ���� from �÷�)
     - leading : ���� ������
     - trailing : ������ ������
     - both : ���ʿ��� ������. �������� ������ both�� ����Ʈ��.
     [����1] ���� ���� ���ڸ� ���ŵǰ�, �߰��� �ִ� ���ڴ� ���ŵ��� ����
     [����2] '����'�� ������ �� �ְ�, '���ڿ�'�� ������ �� ����. �����߻���
*/
select ' ���������׽�Ʈ ' as nontrim1,
    trim(' ���������׽�Ʈ ') as trim2,
    trim('��' from '�ٶ��㰡 ������ ž�ϴ�') as trim3, --����Ʈ�� both�� ����
    trim(both '��' from '�ٶ��㰡 ������ ž�ϴ�') as trim4,--���� '��' ������
    trim(leading '��' from '�ٶ��㰡 ������ ž�ϴ�') as trim5,--���� '��' ������
    trim(trailing '��' from '�ٶ��㰡 ������ ž�ϴ�') as trim6,--������ '��'������
    trim(both '��' from '�ٶ��㰡 �ٸ��� ������ ž�ϴ�') as trim7--�ٸ��� '��'�� ��������

from dual;
--trim7 : �߰��� '��'�� ���ŵ��� �ʴ´�.
--�ɼ��� ���� ��� both�� ����Ʈ�̹Ƿ� trim3, trim4�� ������ ����� ���´�

/*
�Ʒ� ������ �������� �߻���. 

Trim set contains more or less than 1 character. This is not
allowed in TRIM function.

                                        trim()�� ���ڸ� ������ �� �ִ�. ����
���ڿ��� �����ϰ� �ʹٸ� replace() �Լ��� ����ؾ� �Ѵ�.
*/
select 
    trim(both '�ٶ���' from '�ٶ��㰡 �ٸ��� ������ ž�ϴ�') as trimerror--���ڿ��� trim���� ����Ұ�
from dual;

/*
ltrim(), rtrim() -> L[eft]TRIM, R[IGHT]TRIM
    : ����, ���� '����' Ȥ�� '���ڿ�'�� �����Ҷ� ����Ѵ�.
    ��TRIM�� ���ڿ��� ������ �� ������, LTRIM�� RTRIM�� ���ڿ�����
    ������ �� �ִ�.
*/
select
    ltrim(' ������������ ') ltrim1,
    ltrim('�������ڿ�����','����') ltrim2,
    rtrim(' ������������ ') rtrim1,
    rtrim('a�������ڿ�����','����') rtrim2
from dual;--rtrim4ó�� �߰��� �ִ� ���ڿ��� ���ŵ��� �ʴ´�

/*
substr() : ���ڿ����� �����ε������� ���̸�ŭ �߶� ���ڿ��� ����Ѵ�.
    ����] substr(�÷�, �����ε���, ����)
    
    ����1) ����Ŭ�� �ε����� 1���� �����Ѵ�. (0���;ƴ�)
    ����2) '����'�� �ش��ϴ� ���ڰ� ������ ���ڿ��� �������� �ǹ��Ѵ�.
    ����3) �����ε����� ������ ���������� �˷� �ε����� �����Ѵ�.
*/
select substr('good morning john',8,4) from dual;
select substr('good morning john',8) from dual;
--�ε��� 2���� �߶�. �ѱ��̹Ƿ� �������� ����� ���ݴٸ� 
select substr('�ȳ��ϼ���',2) from dual;

/*
substrb() : ����Ʈ(byte)������ �߶󳽴�.
    ��������� �ѱ۰� ���� �����ڵ�� �ѱ��ڿ� 3byte�� ǥ���ǳ�
    ���ݾ� ��߳��� ��찡 ����Ƿ� �׽�Ʈ�� �ʿ��ϴ�
*/
select substrb('�ȳ��ϼ���',1) from dual;
select substrb('�ȳ��ϼ���',2) from dual;
select substrb('�ȳ��ϼ���',3) from dual;
select substrb('�ȳ��ϼ���',4) from dual;
select substrb('�ȳ��ϼ���',5) from dual;
select substrb('�ȳ��ϼ���',6) from dual;
select substrb('�ȳ��ϼ���',7) from dual;
select substrb('�ȳ��ϼ���',8) from dual;

/*
replace() : ���ڿ��� �ٸ� ���ڿ��� ��ü�� �� ����Ѵ�.
    ����] replace(�÷���) or ���ڿ�, '������ ����� ����', '������ ����')
    
    ��trim(), ltrim(), rtrim()�޼ҵ��� ����� replace()�޼ҵ� �ϳ��� ��ü�� �� 
    �����Ƿ� trim()�� ���� replace()�� �ξ� �� ���󵵰� ����.
*/
select replace('good morning tom','morning','evening') as "���ڿ���ü" from dual;
select replace('good morning tom','morning') as "���ڿ���ü" from dual;

--trim�� �¿����� ������ ���ŵǳ�, �߰��� ������ ���ŵ��� �ʴ´�.
select trim(' blank1 blank2 ') as "��������1" from dual;
--replace�� �¿��� �Ӹ� �ƴ϶� �߰��� ���鵵 ������ �� �ִ�.
select replace(' blank1 blank2 ',' ','') as "��������2" from dual; 

/*
instr() : �ش� ���ڿ����� Ư�����ڰ� ��ġ�� �ε������� ��ȯ�Ѵ�.
    ����1] instr(�÷���, 'ã������')
        ->���ڿ��� ó������ ���ڸ� ã�´�.
    
    ����2] instr(�÷���, 'ã������', 'Ž���� ������ �ε���', '���° ����')
        ->Ž���� �ε������� ���ڸ� ã�´�. ��, ã�� ������ ���°��
        �ִ� �������� ������ �� �ִ�.
*/
--n�� �߰ߵ� ù��° �ε��� ��ȯ
select instr('good morning john', 'n') from dual;--9
--n�� �߰ߵ� �ι�° �ε��� ��ȯ
select instr('good morning john', 'n',1,2) from dual;--11
--10��° �ε������� Ž���� �����Ͽ� n�� �߰ߵ� 2��° �ε��� ��ȯ
select instr('good morning john', 'n',10,2) from dual;--17






















