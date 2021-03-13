package ex06array;
/*
다음 조건에 맞는 프로그램을 작성하시오.
1] 학생수를 사용자로부터 입력받는다.
    -Scanner클래스 사용
2] 입력받은 학생수만큼 국영수 점수를 저장할 수 있는 int형 배열을 선언한다.
3] 다시 학생수만큼 각 학생의 국영수 점수를 입력받아 2]에서 생성한 배열에 저장한다.
    -Scanner클래스 사용
4] 각 학생의 국영수 점수 및 총점 그리고 평균을 출력하여라. 
5] 이 문제는 2차원 배열을 활용하는 문제이다.
 */

import java.util.Scanner;

public class QuSungJuk {
	
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("학생수 입력 : ");
		int stuCnt = scanner.nextInt();
		int[][] stuArr = new int[stuCnt][6];
		
		for(int i=0 ; i<stuCnt ; i++) {
			int a = 0, total = 0, avg=0;
			stuArr[i][a] = i;
			a++;
			System.out.printf("\n[%d번째 학생]",i+1);
			System.out.print("\n국어 입력 :");
			int kor = scanner.nextInt();
			stuArr[i][a] = kor;
			a++;
			System.out.print("\n영어 입력 :");
			int eng = scanner.nextInt();
			stuArr[i][a] = eng;
			a++;
			System.out.print("\n수학 입력 :");
			int math = scanner.nextInt();
			stuArr[i][a] = math;
			a++;
			total= kor+eng+math;
			stuArr[i][a] = total;
			a++;
			avg= (kor+eng+math)/3;
			stuArr[i][a] = avg;
		}
		System.out.println("======================");
		System.out.println("NO KOR ENG MAT TOT AVG");
		System.out.println("======================");
		for(int i=0 ; i<stuArr.length ; i++) {
			for(int  j=0 ; j<stuArr[i].length ; j++) {
				System.out.printf("%-3d ",stuArr[i][j]);
			}
			System.out.println();
		}
		System.out.println("======================");
		
	}
}
