package ex21jdbc.callable;

import java.sql.SQLException;
import java.sql.Types;
import ex21jdbc.connect.IConnectImpl;

public class IsMemberProCall extends IConnectImpl {

	public IsMemberProCall() {
		super("kosmo","1234");
	}
	@Override
	public void execute() {
		try {
			csmt = con.prepareCall("{ Call KosmoMemberAuth(?,?,?)}");
			
			csmt.setString(1, scanValue("회원 아이디"));
			csmt.setString(2, scanValue("회원 패스워드"));
			csmt.registerOutParameter(3, Types.NUMERIC);
			csmt.execute();
			
			int outParamResult = csmt.getInt(3);
			switch(outParamResult) {
			case 0:
				System.out.println("회원아이디 없음 회원가입하셈");
				break;
			case 1:
				System.out.println("패스워드가 일치하지않음");
				break;
			case 2:
				System.out.println("로그인 완료");
				break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
	}
	
	public static void main(String[] args) {
		new IsMemberProCall().execute();
	}

}
