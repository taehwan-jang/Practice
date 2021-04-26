package ex21jdbc.callable;

import java.sql.SQLException;
import java.sql.Types;
import ex21jdbc.connect.IConnectImpl;

public class DeleteProcCall extends IConnectImpl{

	public DeleteProcCall() {
		super("kosmo","1234");
	}
	@Override
	public void execute() {
		try {
			//Connection객체의 repareCall()메소드를 통해 프로시저 호출
			csmt = con.prepareCall("{call KosmoMemberDelete(?,?)}");
			/*
			In파라미터 설정 : 실제 삭제할 아이디를 입력받은 후 전달
			Out파라미터 설정 : 반환될 값의 타입을 설정
			 */
			csmt.setString(1, scanValue("삭제할 아이디"));
			csmt.registerOutParameter(2, Types.VARCHAR);
			csmt.execute();
			
			System.out.println("[삭제프로시저 실행결과]");
			System.out.println(csmt.getString(2));
			
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
	}
	
	
	public static void main(String[] args) {

		new DeleteProcCall().execute();
	}

}
