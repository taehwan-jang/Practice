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

//		int x = 1;
//		while(x <= 5) {
//			int y = 1;
//			while(y <= 5) {
//				if(x >= y)
//					System.out.print("*");
//				y++;
//			}
//			System.out.println(""); 
//			x++;
//		}
		System.out.println("방법 1");
		int i = 1;
		while(i <= 5) {
				
			int j = 1;
			while(j <= 5) {//무조건 25번 반복하여 실행함;
				if(i >= j) {
					System.out.print("* ");
				}
				j++;
			}
			System.out.println();
			i++;
		}
		
		System.out.println("방법 2");
		i = 1; // 동일한 지역에 동일한 변수는 생성할 수 없음.;
		while(i <= 5) {
			
			int j = 1;//지역변수기 떄문에 새로 생성 가능;
			while(j <= i) {//j는 i의 크기만큼 15번 반복하여 실행됨;
				System.out.print("* ");
				j++;
			}
			System.out.println();
			i++;
		}
		//2번 방법이 더 효율적인 방법임;
		
		
		
		
		
		
		
	}
}
