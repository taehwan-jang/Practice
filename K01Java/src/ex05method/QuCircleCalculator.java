package ex05method;

import java.util.Scanner;

/*
원의 반지름을 파라메타로 전달하면 원의넓이와 둘레를 계산하여 반환하는 메소드를 각각 정의하자. 이를 호출하는 main 메소드를 정의하라.

메소드명 : circleArea() > 원의넓이, circleRound() > 원의둘레
-넓이공식 : 3.14 * 반지름 * 반지름
-둘레공식 : 2 * 3.14 * 반지름

 */
public class QuCircleCalculator {
	
	
	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		System.out.print("반지름을 입력 :");
		int rad = scanner.nextInt();
		
		circleArea(rad);
		circleRound(rad);
		
	}
	
	static void circleArea(int r) {
		
		final double PI = 3.14;
		double result = PI * r * r;
		System.out.printf("원의 넓이(%d) : %.2f\n", r , result);
		
	}
	static void circleRound(int r) {
		
		final double PI = 3.14;
		double result = PI * 2 * r ;
		System.out.printf("원의 둘레(%d) : %.2f", r , result);
		
	}

}
