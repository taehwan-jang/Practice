package ex21jdbc.statment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//객체생성의 목적이 아닌 상속의 목적으로 정의된 추상클래스
public abstract class ConnectDB {

	/*
	멤버변수 : 상속받은 하위클래스에서의 접근을 허용하기 위해
		접근지정자는 protected로 선언함. public도 무관
	 */
	protected Connection con;//DB연결
	protected Statement stmt;//SQL전송 및 실행
	protected ResultSet rs;//select쿼리 실행 후 결과 반환

	//생성자1(매개변수를 가진 메소드)
	public ConnectDB(String id, String pw) {

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
					id,pw);
			System.out.println("오라클 DB연결 성공");

		} 	
		catch (ClassNotFoundException e) {
			System.out.println("오라클 드라이버로딩 실패");
			e.printStackTrace();
		}
		catch (SQLException e) {
			System.out.println("데이터베이스 연결 오류");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("알수없는 오류 발생");
			e.printStackTrace();
		}
		
	}
	//생성자2(매개변수가 없는 메소드)
	public ConnectDB() {
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
					"kosmo","1234");
			System.out.println("오라클 DB연결 성공");
			
		} 	
		catch (ClassNotFoundException e) {
			System.out.println("오라클 드라이버로딩 실패");
			e.printStackTrace();
		}
		catch (SQLException e) {
			System.out.println("데이터베이스 연결 오류");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("알수없는 오류 발생");
			e.printStackTrace();
		}
		
	}
	//자원반납을 위한 메소드
	public void close() {
		try {
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();
			if(rs!=null) rs.close();
			System.out.println("자원반납 완료");
		} catch (SQLException e) {
			System.out.println("자원반납시 오류 발생");
			e.printStackTrace();
		}
	}
	//오버라이딩을 목적으로 생성한 추상메소드(각 목적에 맞게 자식클래스에서 재정의함)
	abstract void execute();
}
