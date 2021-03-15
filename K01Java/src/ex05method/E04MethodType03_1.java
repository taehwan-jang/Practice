package ex05method;
/*
메소드형태3] 매개변수는 있으나 반환값이 없는 경우
	: 값을 전달받은 후 연산하고 해당 결과를 즉시 출력하는
	경우에 주로 사용된다.
 */
import java.util.Scanner;

/*
시나리오] 사용자가 입력한 2개의 시작값과 끝값 사이에 있는 수를
	모두 더하여 출력하는 프로그램을 작성하시오.
출력결과] 
	시작값 : 5
	종료값 : 9
	결과 : 5+6+7+8+9=??
 */
public class E04MethodType03_1 {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		
		System.out.print("시작값 : ");
		int s = scanner.nextInt();
		System.out.print("종료값 : ");
		int e = scanner.nextInt();
		yesParamNoReturn(s,e);
		
	}
	
	/*
	1에서 10까지의 합을 구하는 프로그램의 시작과 종료값만 변수로
	변경하여, 원하는 구간의 합을 구하는 프로그램으로 커스타마이징 하였다. 
	 */
	static void yesParamNoReturn(int startNum,int endNum) {
		
		int sum = 0;
		for(int i = startNum ; i <= endNum ; i++) {
			sum += i;
		}
		//계산의 결과를 즉시 출력한다.
		System.out.printf("%d~%d까지의 합은 : %d",startNum
				,endNum,sum);
	}//몇일 살았는지 나이계산 만들어볼것

}
