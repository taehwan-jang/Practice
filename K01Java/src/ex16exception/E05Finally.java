package ex16exception;

import java.util.InputMismatchException;
import java.util.Scanner;
/*
finally절
	: 예외발생과 상관없이 try문에 진입했을때 반드시 실행해야 할
	코드가 있는경우 기술하는 블럭이다.
	즉 try문으로 진입되지 않는다면 finally절은 실행되지 않는다.
1)try~catch : 예외를 직접 처리할때
2)try~catch~finally : 예외를 직접 처리후 실행할
	문장이 있을때
3)try~finally : 예외는 외부로 던지고 예외발생과
	상관없이 실행할 문장이 있을때
 */
public class E05Finally {

	//런타임 예외가 발생되는 메소드(예외를 메인으로 던지고잇음)
	static void runtime() throws NumberFormatException {
		Integer.parseInt("백");
		
	}
	
	static void tryCatchFinally() {
		Scanner scan = new Scanner(System.in);
		System.out.print("나이를 입력: ");
		int age = Integer.MAX_VALUE;
		try {
			age= scan.nextInt();
			System.out.println("당신은 5년후 "+(age+5)+"살 입니다.");
			return;//try구문에서 return을 만나도 finally구문은 실행된다.
		}
		catch (InputMismatchException e) {
			System.out.println("나이는 숫자만 입력해");
		}
		finally {
			System.out.println("늘 실행되는 finally");
			/*
			try문 안에서 exit(0)이 실행되면 프로그램 자체가 종료되므로
			finally구문은 실행되지 않는다.
			 */
			System.exit(0);
		}
	}
	public static void main(String[] args) {

		try {
			runtime();
		}
		catch (NumberFormatException e) {
			e.printStackTrace();
		}
		tryCatchFinally();
		/*
		finally절에서 exit(0)을 실행하므로 아래 문장은 실행되지 않는다.
		 */
		System.out.println("메인메소드 끝");
		
	}

}
