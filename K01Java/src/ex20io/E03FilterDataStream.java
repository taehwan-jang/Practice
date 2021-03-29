package ex20io;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class E03FilterDataStream {

	public static void main(String[] args) {

		//생성될 파일의 경로 설정
		String src = "src/ex20io/FilterDataStream(newfile).bin";
		
		try {
			//파일 생성을 위한 output파일 스트림 생성 
			OutputStream out = new FileOutputStream(src);
			//파일스트림의 내용을 조합할 필터스트림 생성 
			DataOutputStream filterOut = new DataOutputStream(out);
			//이 방법도 가능함 
//			DataOutputStream filterOut = new DataOutputStream(new FileOutputStream(src));
			
			/*
			위에서 생성한 출력스트림에 필터스트림까지 추가로 연결한 후
			write()를 통해 숫자데이터를 전송하여 저장한다.
			해당 데이터를 바이트 단위로 분리해서 4byte 혹은 8byte를
			전송하게 된다.
			 */
			filterOut.writeInt(123);
			filterOut.writeDouble(12.34);
			filterOut.writeInt(456);
			filterOut.writeDouble(56.78);
			
			DataInputStream filterIn = new DataInputStream(new FileInputStream(src));
			
			/*
			파일의 내용을 읽어오기 위해서 입력스트림과 필터입력스트림을
			연결한다. 필터스트림을 통해 byte단위가 아니라 int, double과
			같은 기본자료형을의 단위로 데이터를 읽어올 수 있게 된다.
			 */
			int num1 = filterIn.readInt();
			double dNum1 = filterIn.readDouble();
			int num2 = filterIn.readInt();
			double dNum2 = filterIn.readDouble();
			
			System.out.println("num1=:"+num1);
			System.out.println("dNum1=:"+dNum1);
			System.out.println("num2=:"+num2);
			System.out.println("dNum2=:"+dNum2);
			
			//스트림 소멸(자원반납)
			if(filterOut!=null) filterOut.close();
			if(filterIn!=null) filterIn.close();
		}
		catch (FileNotFoundException e) {
			System.out.println("해당파일 없음");
		}
		catch (IOException e) {
			System.out.println("IO오류 발생");
		}
	}

}
