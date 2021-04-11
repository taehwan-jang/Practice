package ex21jdbcj.shopping;

import java.sql.SQLException;
import java.sql.Types;

import ex21jdbc.connect.IConnectImpl;

public class UpdateShop extends IConnectImpl{
	
	public UpdateShop() {
		super("kosmo","1234");
	}
	
	@Override
	public void execute() {
		try {
			csmt = con.prepareCall("{call ShopUpdateGoods(?,?,?,?,?)}");
			
			csmt.setString(1, scanValue("수정할상품번호"));
			csmt.setString(2, scanValue("상품명"));
			csmt.setString(3, scanValue("가격"));
			csmt.setString(4, scanValue("제품코드"));
			csmt.registerOutParameter(5,Types.NUMERIC);
			
			csmt.execute();
			
			int affect = csmt.getInt(5);
			
			if(affect==0) System.out.println("변경실패");
			else System.out.println(affect +"행이 변경됨.");
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
	}
	
	public static void main(String[] args) {
		
		new UpdateShop().execute();
	}

}
