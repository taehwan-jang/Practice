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
		double rad = scanner.nextDouble();
		
		double area = circleArea(rad);
		double round = circleRound(rad);
		
		System.out.printf("원의 넓이(%.2f) : %.2f\n", rad , area);
		System.out.printf("원의 둘레(%.2f) : %.2f ", rad , round);
	}
	
	static double circleArea(double r) {
		
		final double PI = 3.14;
		double resultArea = PI * r * r;
		
		return resultArea;	
	}
	
	static double circleRound(double r) {
		
		final double PI = 3.14;
		double resultRound = PI * 2 * r ;
		
		return resultRound;
	}

}
