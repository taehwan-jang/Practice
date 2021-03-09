package ex04controlstatement;

import java.io.IOException;

/*
하나의 문자를 입력받아 숫자인지 여부를 판단하는 
프로그램을 삼항연산자를 이용하여 구현하시오.    
(System.in.read()를 사용하세요)
 */
public class Qu_04_02 {

	public static void main(String[] args) throws IOException{

		System.out.print("문자 하나를 입력하세요.: ");
		int asciiCode = System.in.read();
		
		String asciicode = (asciiCode >= 48 && asciiCode <= 57) ? "숫자입니다." : "문자입니다.";
		System.out.println(asciicode);
	}

}
