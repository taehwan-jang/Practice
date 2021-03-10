package ex05method;

import java.util.Scanner;

/*
메소드의 규칙
-Java에서 main 메소드는 무조건 public static void로
	선언하기로 약속되어 있다.
-static으로 선언된 메서도는 static으로 선언된 메소드만
	호출할 수 있디.
-메소드로 호출 후 반환값은 항상 호출한 위치로 반횐된다. 이때
	메소드는 메모리에서 소멸된다.
-반환값이 없는 void형 메소드도 실행이 완료되면 호출한 위치로
	실행의 흐름이 돌아온다.
	
 */
public class E01MethodBasic {

	/*
	메소드 정의 1 : 반환형 O, 매개변서 O 형태로 정의
		-> 두개의 정수를 전달받아 합의 결과를 반환한다.
	 */
	private static int simpleFunc(int a, int b) {

		int sum = a + b;
		return sum;
	}
	/*
	메소드 정의 2 : 반환형 X, 배개변수 X 형태로 정의
		->전달되는 값 없이 이름을 입력한 후 namePrint()메소드를
		호출한다. 반환값이 없는 경우에는 반드시 void라고 명시해야한다.
	 */
	private static void menuPrint() {

		System.out.print("당신의 이름은 무엇인가요? : ");
		Scanner scanner = new Scanner(System.in);
		String name = scanner.nextLine();
		
		namePrint(name);
	}
	
	/*
	메소드정의3 : 반환형 X, 배개변수 O 형태로 정의
		-> 반환값이 없는 경우 실행이 종료되면 호출했던 지점으로
		다시 돌아간다.
	 */
	private static void namePrint(String n) {
		System.out.println("제 이름은 " + n +" 입니다.");
	}
	public static void main(String[] args) {

		/*
		메소드를 호출할때는 함수의 원형 그대로 기술하면 된다.
		매개변수가 있다면 갯수만큼 포함시켜 주면 된다. 매개변수의
		갯수가 다르면 호출되지 않고 에러가 발생된다. 또한 매개변수의
		타입이 맞지 않아도 에러가 발생한다.(int형 매개변수인데 double형을 호출한다던지)
		 */
		int result = simpleFunc(1,2);
		System.out.println("1과 2를 전달한 결과 : " + result);
		System.out.println("10과 20을 전달한 결과 : " + simpleFunc(10,20));
		
		menuPrint();
		
	}



}
