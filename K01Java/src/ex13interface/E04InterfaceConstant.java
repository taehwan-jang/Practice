package ex13interface;

import java.util.Scanner;

/*
인터페이스에 변수를 정의하면 무조건 상수가 되므로
주로 "인터페이스형 상수"라고 표현한다. 주로 설정값이나
명시적인 코드를 위해 사용된다.
 */
interface Week {
	int MON=1,TUE=2,WED=3,THU=4,FRI=5,SAT=6,SUN=7;
}

public class E04InterfaceConstant {

	public static void main(String[] args) {

		
		System.out.println("오늘의 요일을 선택하세요.");
		System.out.println("1.월요일~7.일요일");
		System.out.print("선택(정수입력): ");
		
		Scanner scan = new Scanner(System.in);
		int inputN = scan.nextInt();
		
		switch(inputN){
			case Week.MON:
				System.out.println("주간회의가 있습니다.");
				break;
			case Week.TUE:
				System.out.println("프로젝트 기획 회의 있습니다.");
				break;
			case Week.WED:
				System.out.println("진행사항 보고하는 날입니다.");
				break;
			case Week.THU:
				System.out.println("사내 축구시합이 있는 날입니다.");
				break;
			case Week.FRI:
				System.out.println("프로젝트 마감일 입니다.");
				break;
			case Week.SAT:
				System.out.println("가족과 함께 즐거운 시간 보내세용.");
				break;
			case Week.SUN:
				System.out.println("오늘은 휴일입니다.");
				break;
		}
		
	}

}
