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

	99 / 10 = 9 .. 90 / 10 = 9
	89 / 10 = 8 ...80 / 10 = 8
	.
	.
	69 / 10 = 6 ...60 / 10 = 6
 */
public class Qu_04_03 {

	public static void main(String[] args) throws IOException{

		int kNum, eNum, mNum;
		Scanner scanner = new Scanner(System.in);
		System.out.print("국어 : ");
		kNum = scanner.nextInt();
		System.out.print("영어 : ");
		eNum = scanner.nextInt();
		System.out.print("수학 : ");
		mNum = scanner.nextInt();
		
		double avg = (kNum + eNum + mNum) / 3.0;
		/*
		int result = (int)(avg / 10); ->사실 순서의 문제임 ㅋ
		 */
		System.out.printf("평균점수 : %.2f%n",  avg);
		
		int result = (int)avg;
		
		switch(result/10) { //만약에 91, 81, 71, 61 기준이라 한다면 result - 1 하면 해결;
		case 10:case 9: // case 10을 안넣으면 만점인데 F학점 받는다 
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
