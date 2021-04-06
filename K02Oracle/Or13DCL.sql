/*******************************
파일명 : Or13DCL.sql
사용자권한
설명 : 새로운 사용자계정을 생성하고 시스템권한을 부여하는 방법을 학습
*******************************/

/*
[사용자계정 생성 및 권한설정]
해당 내용은 DBA권한이 있는 최고관리자(sys, system)로 접속한 후
실행해야 한다. 사용자 계정 생성 후 접속테스트는 cmd(명령프롬프트)에서
진행하도록 한다.
*/

/*
1] 사용자계정 생성 및 암호설정
    형식]
        create user 아이디 identified by 패스워드;
*/
create user test_user1 identified by 1234;
--cmd에서 sqlpuls 명령으로 접속시 login denied 에러 발생됨
--cmd : lacks CREATE SESSION 에러

/*
2] 생성된 사용자 계정에 권한 혹은 역할 부여
    형식]
        grant 시스템권한1[,시스템권한2...]  | [역할1[,역할2...]
            to 사용자1[,사용자2...] | [역할1[,역할2...]
            [with grant option];
*/
--접속권한 부여 : 접속은 되지만 테이블은 생성할 수 없다.
grant create session to test_user1;
--cmd : insufficient privileges 에러로 테이블생성 불가
--테이블생성 권한 부여-오류발생되었음(재확인)
grant create table to test_user1;














/*
3] 암호변경
    : alter user 사용자아이디 identified by 새로운암호;
*/
alter user test_user1 identified by 4321;









