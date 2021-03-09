package ex04controlstatement;

import java.io.IOException;
import java.util.Scanner;

/*
국어, 영어, 수학 점수를 사용자로부터 입력받아서    평균을 구해  
90점이상 A학점, 
    80점이상 B학점,
    ....
    60점미만 F학점을 출력하는 프로그램을 작성하시오.
단 switch문을 사용해야 합니다.(Scanner클래스를 사용하세요)
 */
public class Qu_04_03 {

	public static void main(String[] args) throws IOException{

		Scanner scanner = new Scanner(System.in);
		System.out.print("국어 : ");
		int kNum = scanner.nextInt();
		System.out.print("영어 : ");
		int eNum = scanner.nextInt();
		System.out.print("수학 : ");
		int mNum = scanner.nextInt();
		
		double avg = (kNum + eNum + mNum) / 3;
		System.out.printf("평균점수 : %.2f%n",  avg);
		
		int iavg = (int)avg;
		
		switch(iavg/10) { //만약에 91, 81, 71, 61 기준이라 한다면 iavg-1 하면 해결;
		case 9:
			System.out.println("A학점");
			break;
		case 8:
			System.out.println("B학점");
			break;
		case 7:
			System.out.println("C학점");
			break;
		case 6:
			System.out.println("D학점");
			break;
		default:
			System.out.println("F학점");
		}
		

	}

}
