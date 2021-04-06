/*******************************
���ϸ� : Or13DCL.sql
����ڱ���
���� : ���ο� ����ڰ����� �����ϰ� �ý��۱����� �ο��ϴ� ����� �н�
*******************************/

/*
[����ڰ��� ���� �� ���Ѽ���]
�ش� ������ DBA������ �ִ� �ְ������(sys, system)�� ������ ��
�����ؾ� �Ѵ�. ����� ���� ���� �� �����׽�Ʈ�� cmd(���������Ʈ)����
�����ϵ��� �Ѵ�.
*/

/*
1] ����ڰ��� ���� �� ��ȣ����
    ����]
        create user ���̵� identified by �н�����;
*/
create user test_user1 identified by 1234;
--cmd���� sqlpuls ������� ���ӽ� login denied ���� �߻���
--cmd : lacks CREATE SESSION ����

/*
2] ������ ����� ������ ���� Ȥ�� ���� �ο�
    ����]
        grant �ý��۱���1[,�ý��۱���2...]  | [����1[,����2...]
            to �����1[,�����2...] | [����1[,����2...]
            [with grant option];
*/
--���ӱ��� �ο� : ������ ������ ���̺��� ������ �� ����.
grant create session to test_user1;
--cmd : insufficient privileges ������ ���̺���� �Ұ�
--���̺���� ���� �ο�-�����߻��Ǿ���(��Ȯ��)
grant create table to test_user1;














/*
3] ��ȣ����
    : alter user ����ھ��̵� identified by ���ο��ȣ;
*/
alter user test_user1 identified by 4321;









