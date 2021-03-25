package ex16exception;

import java.util.InputMismatchException;
import java.util.Scanner;
/*
예외처리를 할 떄 필요에 따라 여러개의 catch블럭을 사용할 수 있다.
이 경우 반드시 자식 예외클래스부터 catch블럭을 사용해야 한다.
Exception클래스는 모든 예외를 catch하기 때문에 반드시
마지막 블럭에 사용해야한다.
특정 클래스의 상속구조를 보고 싶을때는 선택후 ctrl+t로 확인가능
 */
public class E04MultiCatch {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

		int array[] = new int[3];
		
		try {
			for(int i=0 ; i<array.length ; i++) {
				System.out.print("array["+i+"]에 저장할 숫자 입력:");
				array[i]=Integer.parseInt(scan.nextLine());//왜 에러발생인지?
			}
			System.out.println("배열에 저장된 두 숫자 나누기: "+
					array[0]/array[1]);
			System.out.print("나이를 입력하세요:");
			int age = scan.nextInt();
			System.out.println("당신의 나이는:"+age);
			
			array[3]=age;//배열의 인덱스를 초과함.
		}
		catch(InputMismatchException e) {
			System.out.println("숫자로만 입력해");
		}
		catch(ArithmeticException e) {
			System.out.println("산술연산 안됨");
		}
		catch(NumberFormatException e) {
			System.out.println("숫자형태의 문자만 입력해");
		}
		catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("배열 인덱스 초과");
		}
		catch(Exception e) {
			System.out.println("예외발생");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		System.out.println("==끝==");
		
		
	}

}
