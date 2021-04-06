package ex21jdbc.statment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertQuery {
	//전역변수
	Connection con; //DB연결을 위한 객체
	Statement stmt; //정적쿼리문을 전송 및 실행할 때 사용하는 인터페이스
	
	public InsertQuery() {
		try {
			//1.오라클 드라이버를 메모리에 로드
			Class.forName("oracle.jdbc.OracleDriver");
			//2.커넥션 인터페이스를 통해 DB연결
			con= DriverManager.getConnection(
					"jdbc:oracle:thin://@localhost:1521:xe"
					, "kosmo"
					, "1234");
			System.out.println("오라클 DB연결 성공");
					
		}
		catch (ClassNotFoundException e) {
			//ojbdc6.jar 파일이 없거나 연동되지 않았을때 예외발생
			System.out.println("오라클 드라이버 로딩 실패");
			e.printStackTrace();
		}
		catch (SQLException e) {
			//커넥션URL이나 계정명, 혹은 쿼리문이 잘못되었을때 예외발생
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("알 수 없는 예외발생");
		}
	}
	//쿼리작성 및 전송, 실행
	private void execute() {
		try {
			//3.stmt 인스턴스 생성을 위한 메소드 호출
			stmt = con.createStatement();
			//4.SQL문(쿼리문) 작성
			String sql = "INSERT INTO member VALUES "
					+ " ('test2', '2222', '이길동', SYSDATE) ";
			
			//5.쿼리실행 및 결과값 반환
			int affected = stmt.executeUpdate(sql);
			System.out.println(affected+" 행이 입력되었습니다.");
		}
		catch (SQLException e) {
			System.out.println("쿼리실행에 문제가 발생하였습니다.");
			e.printStackTrace();
		}
		finally {
			/*
			try구문으로 진입했다면 예외가 발생하더라도 무조건 실행되는
			구문으로 자원반납을 위한 close()메소드를 호출한다.
			 */
			close();
		}
	}
	private void close() {
		try {
			if(stmt!= null) stmt.close();
			if(con != null) con.close();
			System.out.println("DB자원반납 완료");
		} catch (SQLException e) {
			System.out.println("자원반납시 오류 발생");
		}
	}
	public static void main(String[] args) {
		//객체생성 및 실행
		InsertQuery iSQL = new InsertQuery();
		iSQL.execute();
	}
}
