package ex04controlstatement;

import java.io.IOException;

/*
하나의 문자를 입력받아 사용자가 입력한 값이 숫자인지 판단하여 
숫자라면 2의배수인지를 다시 판단하여서 
2의배수인 경우에만 "2의 배수 입니다"라고 출력하여라. 
그 외에는 "2의 배수가 아닙니다" 라고 출력한다.
힌트] '0'의 아스키코드값은 48 입니다. 
 0  1  2 3 4 5 6 7 8 9 
      50  52  54  56 
(System.in.read()->문자 하나를 입력(문자열 ,숫자로 인식x))
*/ 
public class Qu_04_01 {

	public static void main(String[] args) throws IOException{

		System.out.print("문자를 입력하세요: ");
		int asciiCode = System.in.read();
		
		if(asciiCode>=48 && asciiCode<=57) {
			if(asciiCode%2==0) { // 좀 더 간단한 방법 찾아볼것
				System.out.println("2의 배수입니다.");
			}
			else {
				System.out.println("2의 배수가 아닙니다.");
			}
		}
		else {
			System.out.println("숫자가 아닙니다.");
		}
		System.out.print("문자 하나를 입력하세요 : ");
		int ascii = System.in.read();
		
		boolean isNum = (ascii>= '0' && ascii <= '9');
		if(isNum == true) {
			System.out.println("숫자 입니다.");
			
		/*
		숫자형 문자가 가지고있는 아스키코드 값에서 48(0의 아스키코드 값)
		을 빼면 해당 문자의 정수가 된다.
		즉 '4' - '0' = (정수) 4
		 */
			if((ascii - '0') % 2 == 0) {
				System.out.println("2의 배수입니다.");
			}
			else {
				System.out.println("2의 배수가 아닙니다.");
			}
		}
		else {
			System.out.println("숫자가 아닙니다.");
		}
		
		System.out.println("입력한 숫자는 : " + (ascii - '0'));
	}

}
