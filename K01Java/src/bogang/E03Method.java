package bogang;

import java.util.Scanner;

public class E03Method {
	//타입1 : 구구단 출력
	static void guguPrint() {
		for(int dan = 2 ; dan <10 ; dan++) {
			System.out.println();
			for(int su =1 ; su<10 ; su++) {
				System.out.printf("%-2dx%2d=%2d",dan,su,(dan*su));
				System.out.print("|");
			}
		}
	}
	//타입2 : 주어진 범위의 구구단 출력
	static void guguRangeShow(int n, int m) {
		for(int dan = n ; dan <=m ; dan++) {
			System.out.println();
			for(int su =1 ; su<10 ; su++) {
				System.out.printf("%-2dx%2d=%2d",dan,su,(dan*su));
				System.out.print("|");
			}
		}
	}
	//세 과목의 평균값 반환
	static double sungjukResult() {
		Scanner scan = new Scanner(System.in);
		System.out.print("국어를 입력: ");
		double kor = scan.nextDouble();
		System.out.print("영어를 입력: ");
		double eng = scan.nextDouble();
		System.out.print("수학를 입력: ");
		double math = scan.nextDouble();
		return (kor+eng+math)/3.0;
	}
	static int numberPlus(int endNum) {
		int total=0;
		for(int i=1 ; i<=endNum ; i++ ) {
			total += i;
		}
		return total;
	}

	static void upgradeGugu() {
		for(int dan = 2 ; dan <10 ; dan++) {
			System.out.println();
			for(int su =1 ; su<=dan ; su++) {
				System.out.printf("%-2dx%2d=%2d",dan,su,(dan*su));
				System.out.print("|");
			}
		}
	}
	public static void main(String[] args) {
		/*
		시나리오] 구구단을 출력하는 메소드를 작성하시오.
		    메소드명 : guguPrint()
		    주의] main메소드에서 호출하므로 정의하는 메소드는 
		    반드시 static으로 선언해야 한다.
		    ※매개변수도 없고, 반환타입도 없는 경우
		 */
		System.out.println("매개변수x, 반환값x");
		
		guguPrint();
		/*
        시나리오]매개변수로 2개의 정수를 전달하여 해당 범위의 
            구구단을 출력하는 메소드를 작성하시오.
            만약 2, 5가 전달된다면 2단, 3단, 4단, 5단만 출력된다.
            메소드명 : guguRangeShow(int n1, int n2)
            ※매개변수는 있고, 반환타입은 없는 메소드
         */
        System.out.println("매개변수O, 반환값X");
        
        guguRangeShow(1,2);
        
        /*
        시나리오] sungjukResult() 메소드를 호출하면 국어,영어,수학
        점수를 입력받은후 평균값을 반환하도록 구현하시오.
        ※매개변수X, 반환값O
         */
        System.out.println("매개변수X, 반환값Y");
        
        System.out.println("평균점수="+sungjukResult());
        /*
        시나리오] 정수 하나를 매개변수로 전달하면 1부터 해당 매개변수
        까지의 합을 구하여 결과값을 반환하는 메소드를 작성하시오.
        메소드명 : numberPlus(int endNum) 
        ※매개변수O, 반환값O
         */
        System.out.println("1~50까지 합= "+numberPlus(50));
        /*
        연습문제] 다음과 같은 출력결과를 보이는 프로그램을 메소드로 구현하시오
        메소드명 : upgradeGugu()
        실행결과] 
        ---------- java ----------
        2x1=2 2x2=4
        3x1=3 3x2=6 3x3=9
        4x1=4 4x2=8 4x3=12 4x4=16
        5x1=5 5x2=10 5x3=15 5x4=20 5x5=25
        6x1=6 6x2=12 6x3=18 6x4=24 6x5=30 6x6=36
        7x1=7 7x2=14 7x3=21 7x4=28 7x5=35 7x6=42 7x7=49
        8x1=8 8x2=16 8x3=24 8x4=32 8x5=40 8x6=48 8x7=56 8x8=64
        9x1=9 9x2=18 9x3=27 9x4=36 9x5=45 9x6=54 9x7=63 9x8=72 9x9=81
         */
        
        upgradeGugu();
        
	}

}
