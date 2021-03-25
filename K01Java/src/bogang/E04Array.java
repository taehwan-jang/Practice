package bogang;

import java.util.Scanner;

public class E04Array {

	public static void main(String[] args) {

		/*
		시나리오] 정수 10개를 저장할 수 있는 배열을 생성한 후
		반복문을 통해 1부터 순차적인 값을 입력하시오.
		 */
		int[] arr = new int[10];
		
		for(int i=1 ; i<arr.length ; i++) {
			arr[i]+=i;
			System.out.print(arr[i]+" ");
		}
		/*
		시나리오] 정수 5개를 저장할 수 있는 배열을 생성한 후
		숫자를 입력받아 저장한다. 단 숫자가 짝수일때만 저장할 수 
		있도록 프로그램을 작성하시오.
		 */
		System.out.println();
		Scanner scan = new Scanner(System.in);
		//Array생성시 크기를 지정하면 0으로 초기화된다.
		int[] arr2 = new int[5];
		int index=0;
		//배열의 크기만큼 반복할때는 항상 length를 사용한다.
		for(int i=0 ; i<arr2.length ; i++) {
			System.out.print("숫자를 입력하세요: ");
			int inputNum = scan.nextInt();
			if(inputNum%2==0) {
				arr2[index++] = inputNum;
			}
		}
		for(int i=0 ; i<arr2.length ; i++) {
			if(arr2[i]==0) {
			}
			else{
				System.out.print(arr2[i]+" ");
			}
		}
		
		
		
		
	}

}
