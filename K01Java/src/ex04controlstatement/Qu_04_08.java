package ex04controlstatement;
/*
문제3) 다음과 같은 모양을 출력하는 프로그램을 for문으로 작성하시오.
* * * * *
* * * *
* * *
* *
*
 */
public class Qu_04_08 {

	public static void main(String[] args) {

		for(int x = 1 ; x <=5 ; x++) {
			for(int y = 1 ; y <=5 ; y++) {
				if(y >= x) {
					System.out.print("* ");
				}
			}
		System.out.println();
		}
		
		//*를 출력한 행의 갯수를 상수로 표현
//		final int FLOOR = 5;
		/*
		FLOOR(행의 갯수) - x + 1
			: 변수 x가 증가함에 따라 점점 감소하는 y를
			표현하기 위한 일반식 정의
		 */
//		for(int x = 1 ; x <= 5 ; x++) {
//			for	(int y = 1 ; y <= (FLOOR-x+1) ; y++) {
//				//일반식을 활용해서 만든거임.
//				System.out.print("* ");
//			}
//			System.out.println();
//		}
		
	}

}
