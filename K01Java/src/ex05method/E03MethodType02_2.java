package ex05method;

import java.util.Scanner;

public class E03MethodType02_2 {

	static String getScore() {

		Scanner scanner = new Scanner(System.in);
		
		System.out.print("국어 : ");
		int kor = scanner.nextInt();
		System.out.print("영어 : ");
		int eng = scanner.nextInt();
		System.out.print("수학 : ");
		int math = scanner.nextInt();
		
		//평균값 구하기;
		double avg = (kor + eng + math) / 3.0;
		//학점을 저장하기 위한 변수;
		//평균값의 구간을 정하기 위해 10으로 나누고 몫을 사용;
		int result = (int)avg / 10;
		String getScore = "";
			
		switch(result) {
		case 10:case 9:
			getScore = "A학점"; break;
		case 8:
			getScore = "B학점"; break;
		case 7:
			getScore = "C학점"; break;
		case 6:
			getScore = "D학점"; break;
		default:
			getScore = "F학점";
			
		}
		//위에서 결정된 학점을 반환.(항상 호출한 지점으로 반환된다.)
		return getScore;
	}
	public static void main(String[] args) {
		
		System.out.printf("너의 학점은 " + getScore() + "이다.\n");
		String h = getScore();
		System.out.printf("당신의 학점은 %s 입니다.", h);
	}

}
