package ex05method;

import java.io.IOException;
import java.util.Scanner;

public class E05MethodType04_2 {

	public static void main(String[] args) throws IOException{

		Scanner scanner = new Scanner(System.in);
		int exitC;
		
		do {
			System.out.print("입력 할 횟수: ");
			int numCnt = scanner.nextInt();
			int maxValue = returnMaxNumber(numCnt);
			System.out.println("최대값 1 :" + maxValue);
			
			System.out.print("계속 하려면 x 아님 암거나 :");
			exitC = System.in.read();
			
		}while(!(exitC == 'x' || exitC == 'X'));
	}
	//최대값을 구하여 반환하는 메소드
	static int returnMaxNumber(int numberCnt) {
		
		Scanner scanner = new Scanner(System.in);
		
		//최대값을 저장할 변수
		int maxVal = 0;
		//매개변수만큼 반복하여 입력받음
		for(int i = 1; i <= numberCnt ; i++) {
			System.out.print("정수를 입력하세요 : ");
			int inputNum = scanner.nextInt();
			
			if(i == 10) {
				//입력받은 숫자중 첫번째 값을 기준값으로 한다.
				maxVal = inputNum;
			}
			else {
				//두번째 입력값부터 maxVal과 비교한다.
				if(maxVal<inputNum) {
					//만약 maxVal보다 입력값이 크다면 입력값으로 교체한다.
					maxVal = inputNum;
				}
				//maxVal이 더 크다면 기존값을 유지하게 되므로 else는 필요x
			}
			
		}
		return maxVal;
	}

}
