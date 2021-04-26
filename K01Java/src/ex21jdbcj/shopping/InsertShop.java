package ex21jdbcj.shopping;

import java.sql.SQLException;

import ex21jdbc.connect.IConnectImpl;

public class InsertShop extends IConnectImpl{

	//생성자
	public InsertShop() {
		super("kosmo","1234");
	}
	@Override
	public void execute() {
		try {
			String query =" INSERT INTO sh_goods VALUES "
					+ " (goods_seq.nextval,?,?,sysdate,?) ";
			psmt = con.prepareStatement(query);
			while(true) {
				psmt.setString(1,scanValue("상품명"));
				psmt.setString(2,scanValue("상품가격"));
				psmt.setString(3,scanValue("상품코드"));
				
				int affect = psmt.executeUpdate();
				
				if(affect == 0 ) System.out.println("행 입력 오류");
				
				else System.out.println(affect +"행이 업데이트됨.");
			}
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
	}
	public static void main(String[] args) {

		new InsertShop().execute(); 
		
	}


}
