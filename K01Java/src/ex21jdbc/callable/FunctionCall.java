package ex21jdbc.callable;

import java.sql.SQLException;
import java.sql.Types;

import ex21jdbc.connect.IConnectImpl;

/*
Java에서 Orcle 함수 호출하기

오라클에서 정의한 함수를 실행하기 위한 CallableStatement객체 생성
-Connection객체의 prepareCall()메소드로 생성한다.
-형식
	prepareCall("{? = call 함수명(인자1,인자2,..)}");
-첫번째 물음표는 반환값을 의미
	반환값은 파라미터 설정시 java.sql.Types클래스의 자료형으로 설정한다.
 */
public class FunctionCall extends IConnectImpl {

	public FunctionCall() {
		super("kosmo","1234");
	}
	@Override
	public void execute() {
		try {
			/*
			callable객체 생성
			 	? = call 함수명(?)
			 	첫번째 인자 : 함수 실행후 반환값 처리
			 	두번째 인자 : 함수 호출시 전달할 파라미터
			 */
			csmt = con.prepareCall("{? = call fillAsterik(?)}");
			//반환값의 자료형 설정
			csmt.registerOutParameter(1, Types.VARCHAR);//괄호안의 값 뭔지 공부해봐
			//in파라미터 설정
			csmt.setString(2, scanValue("아이디"));
			//실행
			csmt.execute();
			//반환값을 getXXX() 계열의 함수를 통해 출력
			System.out.println("함수의 반환값:"+ csmt.getString(1));
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
	}
	
	public static void main(String[] args) {
		new  FunctionCall().execute();
	}

}
