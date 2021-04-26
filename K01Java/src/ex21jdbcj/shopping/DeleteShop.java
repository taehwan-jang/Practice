package ex21jdbcj.shopping;

import java.sql.Types;

import ex21jdbc.connect.IConnectImpl;

public class DeleteShop extends IConnectImpl {
	
	public DeleteShop() {
		super("kosmo","1234");
	}
	@Override
	public void execute() {
		try {
			csmt = con.prepareCall("{call ShopDeleteGoods(?,?)}");
			
			while(true) {
				csmt.setString(1, scanValue("삭제할 상품의 일련번호:"));
				csmt.registerOutParameter(2, Types.NUMERIC);
				
				csmt.execute();
				int affect = csmt.getInt(2);
				
				if(affect==0) System.out.println("변경실패");
				else System.out.println(affect+"행 삭제 완료");
			}
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
	}
	public static void main(String[] args) {

		new DeleteShop().execute();
		
		
	}

}
