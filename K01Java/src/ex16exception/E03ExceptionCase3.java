package ex16exception;

import java.io.IOException;
/*
예외처리방법3
	: 예외가 발생한 위치에서는 처리하지 않고 외부로 던진다.
	대신 함수를 호출한 지점에서 예외객체를 받은 후 처리한다.
	이떄 예외발생과 상관없이 finally절은 실행된다.
 */
public class E03ExceptionCase3 {

	static void compileFunc() throws IOException {
		try {
			System.out.print("하나의 문자를 입력하세요: ");
			int userChar = System.in.read();
			System.out.println("입력된 문자는:"+(char)userChar);
			int result = 10/0;/*
				해당 문장이 실행되면 ArithmeticException이 발생한다.
				따라스 main의 try문에는 해당 예외를 처리할수 없어
				실행이 중간에 멈추게된다. 이 경우 여러개의 catch절이
				필요하다.
			*/
		}
		finally {
//			int result = 10/0;-> finally라고해도 안에 에러가 발생하면 실행x
			System.out.println("예외와 상관없이 항상 실행되는 finally");
		}
	}
	public static void main(String[] args) {

		try {
			compileFunc();
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		System.out.println("==END==");
	}

}
