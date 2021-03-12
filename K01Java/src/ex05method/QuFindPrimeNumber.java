package ex05method;

import java.util.Scanner;

import ex01start.E02SystemOutPrintln;

/*
전달된 값이 소수인지 아닌지를 판단하여 소수인 경우 true를 
아니면 false를 반환하는 메소드를 정의하고, 이를 이용해서 
1부터 100사이의 소수를 전부 출력하는 main메소드를 정의하자.

메소드명 : isPrimeNumber()
소수란 : 특정 정수를 나눌수 있는것이 1과 자기자신밖에 없는 수.
 */



public class QuFindPrimeNumber {

	static boolean isPrimeNumber(int num) {
		//1은 소수가 아니므로 무조건 false 반환
		if(num == 1) {
			return false;
		}
		else {
			/*
			모든 자연수는 1과 자신으로 나눠지므로 두 숫자를 제외한
			나머지 수로 나눠서 떨어지는지 판단하면 된다.
			 */
			for(int j = 2 ; j < num ; j++) {
				if(num % j == 0) {//j로 나눠서 나눠떨어지면 소수가 아니므로 false 반환
					return false;
				}
			}
		}
		//위 조건을 통과하면 소수이므로 true 반환
		return true;
	}
	
	public static void main(String[] args) {
		//1에서 100사이의 정수를 정수인지 판단하기 위해
		for(int i = 1 ; i <= 100 ; i++) {
			//아래함수를 호출하여 소수이면 true를 반환한다.
			if(isPrimeNumber(i) == true) {
				//해당 숫자 i가 소수라면 콘솔에 출력한다.
				System.out.println("소수 : "+ i);
			}
			
		}
			
	}
	
	//
//	static boolean isPrimeNumber(int num1) {
//		
//		boolean value = true;
//		for(int i = 2 ; i < num1 ; i++) {
//			if(num1 % i == 0) {
//				value = false;
//				System.out.println("false");
//				break;
//			}
//			if(num1 % i != 0) continue;
//		}
//	return value;
//	}
//	public static void main(String[] args) {
//
//		Scanner scanner = new Scanner(System.in);
//		System.out.print("양의 정수를 입력 : ");
//		int num = scanner.nextInt();
//		boolean isPrime = isPrimeNumber(num);
//		if(isPrime == true)
//			System.out.println("true");
//		
//
//
//
//	}
	
}
