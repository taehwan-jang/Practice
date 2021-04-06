package ex21jdbc.statment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteQuery {
	//젼역변수
	private Connection con;
	private Statement stmt;
	//생성자 : 오라클 드라이버에 대한 로드만 진행
	public DeleteQuery() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} 
		catch (ClassNotFoundException e) {
			System.out.println("드라이버로딩 실패");
			e.printStackTrace();
		}
	}
	//오라클에 대한 연결을 진행하는 메소드
	public void connect() {
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","kosmo","1234");
		} 
		catch (SQLException e) {
			System.out.println("데이터베이스 연결 오류");
			e.printStackTrace();
		}
	}
	//오라클연결, 쿼리작성, 전송 및 실행을 위한 메소드
	private void execute() {
		//여기서 오라클 연결
		connect();
		try {
			/*
			아이디 ko1은 실제 존재하지 않으므로 조건에 일치하는
			레코드가 없어 삭제가 되지 않는다. 조건에 맞는 데이터가
			없더라도 오류는 발생하지 않는다.
			 */
			//3.Statement객체 생성
			stmt = con.createStatement();
			//4.쿼리문을 작성하고 
			String query = " DELETE FROM member WHERE id='test4'";
			int affected = stmt.executeUpdate(query);
			
			System.out.println(affected +"행이 삭제됨");
		} catch (SQLException e) {
			System.out.println("쿼리실행 오류");
			e.printStackTrace();
		}
		finally {
			close();
		}
	}
	private void close() {
		try {
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();
			System.out.println("자원반납 완료");
		} catch (Exception e) {
			System.out.println("자원반납시 오류 발생");
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		new DeleteQuery().execute();
		/*
		객체 생성후 메소드를 호출하는 동일한 문장임.
		DeleteQuery dSQL = new DeleteQuery();
		dSQL.execute();
		 */
	}
}
