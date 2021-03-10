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
					System.out.print("*");
				}
			}
		System.out.println();
		}
	}

}
