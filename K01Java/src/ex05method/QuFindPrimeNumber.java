package ex05method;

import java.util.Scanner;

/*
전달된 값이 소수인지 아닌지를 판단하여 소수인 경우 true를 
아니면 false를 반환하는 메소드를 정의하고, 이를 이용해서 
1부터 100사이의 소수를 전부 출력하는 main메소드를 정의하자.

메소드명 : isPrimeNumber()
소수란 : 특정 정수를 나눌수 있는것이 1과 자기자신밖에 없는 수.


static int factorial(int number) {
			int result;
			if(number == 1) {
				result = 1;
.			}
			else {
				result = number * factorial(number-1);
			}
			System.out.println("계산과정:number = "+ number
					+", result = "+ result);
			return result;
 */
public class QuFindPrimeNumber {

	static int isPrimeNumber(int num1) {
		
		int result = 0;
		for(int i = 1 ; i <= num1 ; i++) {
			if(num1 % i != 0) {
				result += i;
			}
		}
		return result;
	}
	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		System.out.println("양의 정수를 입력 : ");
		int num = scanner.nextInt();
		int a = isPrimeNumber(num);
		System.out.println("1~100사이 소수 : " + a);
	}

}
