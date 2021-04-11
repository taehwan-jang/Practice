package ex21jdbcj.shopping;

import java.sql.SQLException;
import ex21jdbc.connect.IConnectImpl;

public class SelectShop extends IConnectImpl {

	public SelectShop() {
		super("kosmo","1234");
	}
	@Override
	public void execute() {
		try {
			stmt = con.createStatement();
			String what = scanValue("상품이름");
			String query = " SELECT g_idx, "
					+ " goods_name, "
					+ "  ltrim(to_char(goods_price,'l999,999,999')), "
					+ " to_char(regidate,'yyyy-mm-dd hh24:mi:ss'), "
					+ " p_code "
					+ " FROM sh_goods WHERE "
					+ " goods_name LIKE '%'||'"+what+"'||'%'";
			
			rs = stmt.executeQuery(query);
			System.out.println("일련번호  상품명   		가격    	등록일   	  제품코드"); 
			while(rs.next()) {
				int g_idx = rs.getInt(1);
				String g_name = rs.getString(2);
				String g_price = rs.getString(3);
				String date = rs.getString(4);
				int p_code = rs.getInt(5);
				
				System.out.printf("  %s    %s %s %s %s\n",
						g_idx,g_name,g_price,date,p_code);
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
		new SelectShop().execute();
	}
}
