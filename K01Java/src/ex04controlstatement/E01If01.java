package ex04controlstatement;

import java.io.IOException;

/*
if문(조건문, 분기문)
	형식1.
		if(조건문){
			실행문1;
			실행문2;
		}
	-if문의 조건문은 반드시 비교식 혹은 논리식 이어야 한다.
	-즉 결과값이 boolean타입(true, false)이여야 한다.
	-실행할 문장이 하나인경우 중괄호 생략이 가능하다.
 */

public class E01If01 {
//								이부분 풀로 thorws ioexception 적고 컨트롤 스페이스		
	public static void main(String[] args) throws IOException { 
	
		int num = 10;
		
		/*
		아래문장은 조건식이 아닌 산술식이므로 에러가 발생됨.
		 */
//		if(num%2) {
//			System.out.println("잘못된 조건식 입니다.");
//		}
//		if(num) {
//			System.out.println("이것도 잘못된 좆건식입니다.");
//		}
		
		/*
		if문의 조건은 아래와 같이 boolean값을 반환하는 조건식어야 한다.
		 */
		if(num%2 == 0) {
			System.out.printf("%d는 짝수입니다.", num);
		}
		if(num%2 == 0 && num >= 10) {
			System.out.printf("%n%d는 짝수이고 10보다 크거나 같습니다.%n", num);
		}
		
		//경우에 따라 무조건 실행되는 if문도 필요함.반대의 경우도 마찬가지 (false)
		if(true) {
			System.out.println("무조건 실행되는 if문 입니다.");
		}
		
		/*
		if(조건식); -> 조건식에 상관없이 다음 문장이 실행되는 형태로
			세미콜론은 문장의 끝을 나타내므로 사용에 주의해야 한다.
		 */
		if(num%2 != 0);
		{  //위 조건에 상관없이 무조건 출력되는 문장임.
			System.out.printf("%d는 홀수입니다.", num);
		}
		
		/*
		조건검사 후 실행할 문장이 1개인 경우에는 {} 중괄호를 생략할수있다.
		단 실행문이 2개 이상인 경우에는 한문장만 실행되므로 반드시 중괄호를
		작성해야 한다.
		 */
		if(num%2 == 0)
			System.out.println("\n" + num + "은 짝수입니다.");
		if(num%2 != 0 ) {
			System.out.println("num은 " + num + "입니다.");
			System.out.println(num + "은 홀수 입니다.");
		}
		
		/*
		System.in.read();
			: 사용자에게 하나의 문자를 입력받을때 사용하는 메소드로
			입력한 문자의 아스키코드값을 반환한다.
			해당함수는 IOException을 기본적으로 가지고있어
			이를 무시하기 위해 main()메소드에서 throws 처리를 해준다
		 */
//		System.out.print("하나의 문자를 입력하세요: ");
//		int asciiCode = System.in.read();
//		System.out.println("입력한문자:" + asciiCode);
//		System.out.println("입력한문자:" + (char)asciiCode);
//		
		/*
		시나리오] 사용자가 입력한 문자가 숫자인지 판단하는 
		프로그램을 if문을 이용해서 구현하시오.
		 */
		
		/*
		아스키코드값을 알고 있을때의 구현방법
		'0' -> 48
		'9' -> 57 이므로 해당 구간안에 있다면 숫자로 판단할 수 있다.
		
		※숫자의 구간을 정할때는 반드시 논리 And를 사용해야 한다.
		 */
		System.out.print("하나의 문자를 입력하세요: ");
		int asciiCode = System.in.read();
		
		if(asciiCode>=48 && asciiCode<=57) {
			System.out.println("입력한 문자는 숫자입니다.");
		}
		else {
			System.out.println("입력한 문자는 숫자가 아닙니다.");
		}
		
		/*
		아스키코드값을 모르고 있을때의 구현방법
		 */
		
//							'0'과 '9' 아스키코드로 저장되므로 비교연산 가능함
		boolean isNumber = (asciiCode >= '0' && asciiCode <= '9');
		if(isNumber == true) {
			System.out.println("입력한 문자는 숫자입니다.");
		}
		else {
			System.out.println("입력한 문자는 숫자가 아닙니다.");
		}
	}//main의 끝

}//Class의 끝
