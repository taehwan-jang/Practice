package ex04controlstatement;
/*
*
* *
* * *
* * * *
* * * * *
이 모양 출력하는 프로그램을 while문으로 작성할 것.
 */
public class Qu_04_06 {

	public static void main(String[] args) {

		int x = 1;
		while(x <= 5) {
			int y = 1;
			while(y <= 5) {
				if(x >= y)
					System.out.print("*");
				y++;
			}
			System.out.println(""); 
			x++;
		}
	}
}
