package ex06array;

import java.util.Scanner;

/*
길이가 10인 배열을 선언한후 총 10개의 정수를 입력받아 순서대로 저장한다. (첫번째배열)
그리고 순서대로 저장된 숫자들을 홀수는 배열의 앞에서부터 채워나가고 짝수는 배열의 끝에서부터 채워나간다.(두번째배열)
*/
public class QuFillArray {

	public static void main(String[] args) {

		int[] inputArr = new int[10];
		int[] orderArr = new int[10];
		
		int n = 0;
		int m = orderArr.length;
		Scanner scanner = new Scanner(System.in);
		for(int i=0 ; i<inputArr.length ; i++) {
			System.out.printf("%d번째 숫자를 입력하세요 : ",i+1);
			inputArr[i] = scanner.nextInt();
	
			if(inputArr[i] %2 != 0) {
				orderArr[n] += inputArr[i];
				n++;
			}
			else {
				orderArr[m-1] += inputArr[i];
				m--;
			}
		}
		System.out.println("\n순서대로 입력된 결과");
		for(int i=0; i<inputArr.length ; i++) {
			System.out.printf(inputArr[i]+" ");			
		}
		System.out.println("\n\n홀수/짝수 구분입력결과");
		for(int i=0; i<orderArr.length ; i++) {
			System.out.print(orderArr[i]+" ");			
		}
	}
}
