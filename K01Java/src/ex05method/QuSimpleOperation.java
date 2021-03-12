package ex05method;

import java.util.Scanner;

/*
문제5-1) 파일명 : QuSimpleOperation.java (난이도:하)
두개의 정수를 입력받아서 사칙연산의 결과를 출력하는 메소드와 main메소드를 작성해보자. 단 나눗셈은 몫과 나머지를 각각 출력해야 한다.
파라메타로 전달되는 두 숫자는 모두 0 이상의 양의 정수이다.
메소드명 : arithmetic()
 */
public class QuSimpleOperation {

	static void arithmetic(int a, int b) {
		
		System.out.printf("%2d + %2d = %d\n",a,b,(a + b));
		System.out.printf("%2d - %2d = %d\n",a,b,(a - b));
		System.out.printf("%2d * %2d = %d\n",a,b,(a * b));
		System.out.printf("%2d / %2d = %d(몫)\n",a,b,(a / b));
		System.out.printf("%2d %% %2d = %d(나머지)\n",a,b,(a % b));
	}//			   printf문에서 %를 출력하려면 %% 두개 붙여야함(이스케이프 시퀀스 사용)
	
	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		System.out.print("양의 정수를 입력1 :");
		int sNum = scanner.nextInt();
		System.out.print("양의 정수를 입력2 :");
		int eNum = scanner.nextInt();
		
		arithmetic(sNum,eNum);
	}

}
