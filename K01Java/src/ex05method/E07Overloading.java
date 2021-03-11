package ex05method;

/*
메소드 오버로딩(Method Overloading)
	: 동일한 이름의 메소드를 두개 이상 정의하는 것을 말한다.
	-매개변수의 갯수가 다르거나, 자료형이 다를때 성립한다.
	-반환타입만 다른것은 허용하지 않는다.
	-컴파일러는 메소드 호출시 전달되는 파라미터(인자)을 통해
	호출할 메소드를 구분한다.
 */
import java.util.Scanner;

public class E07Overloading {

	static void person(int jumin, int mil) {
		System.out.println("군필");
		System.out.println("주민번호:"+ jumin);
		System.out.println("군번:"+ mil);
	}
//	반환타입만 다른 형태는 오버로딩이 성립되지않는다.
//	 반환형(타입)  메소드이름	(매개변수)	
//	static void person(int jumin) {
//		System.out.println("미필이거나 여성");
//		System.out.println("주민번호:"+ jumin);
//	}
	static int person(int jumin) {
		System.out.println("미필이거나 여성");
		System.out.println("주민번호:"+ jumin);
		return 1;
	}
//								Argument(인자)=파라미터
//								인자를 매개변수로 전달하여 메소드 실행
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("주민번호를 입력:");
		int jNum = scanner.nextInt();
		System.out.print("군번을 입력:");
		int mNum = scanner.nextInt();
		
		person(jNum,mNum);
		System.out.println("============");
		person(jNum);
	}

}
