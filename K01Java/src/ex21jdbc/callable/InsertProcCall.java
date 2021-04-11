package ex21jdbc.callable;

import java.sql.SQLException;
import java.sql.Types;

import ex21jdbc.connect.IConnectImpl;

/*
Java에서 프로시저 호출하기

프로시저를 실행하기 위한 CallableStatement객체 생성
-프로시저 호출시에는 {call 프로시저명(?,?,...)}
-파라미터는 in, out 순서없이 작성이 가능함. 즉 프로시저 정의에
따라 달라지게 됨.
 */
public class InsertProcCall extends IConnectImpl {
	
	public InsertProcCall() {
		super("kosmo","1234");
	}

	@Override
	public void execute() {
		try {
			/*
			프로시저는 return값이 없으므로 함수처럼 ?=로 시작하지 않는다.
			out파라미터를 통해 값을 반환받게 된다.
			 */
			csmt = con.prepareCall("{call KosmoMemberInsert(?,?,?,?)}");
			//in파라미터 설정
			csmt.setString(1, scanValue("아이디"));
			csmt.setString(2, scanValue("패스워드"));
			csmt.setString(3, scanValue("이름"));
			//out파라미터 설정 반환값의 자료형을 설정함.
			csmt.registerOutParameter(4, Types.NUMERIC);
			//실행
			csmt.execute();
			//out파라미터의 할당된 값을 읽어 결과를 출력한다.
			int affected = csmt.getInt(4);
			if(affected==0) {
				System.out.println("오류발생 : 입력실패");
			}
			else {
				System.out.println(affected +"행 입력 성공");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new InsertProcCall().execute();
	}

}
