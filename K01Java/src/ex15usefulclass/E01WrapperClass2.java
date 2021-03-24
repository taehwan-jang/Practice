package ex15usefulclass;

public class E01WrapperClass2 {

	public static void main(String[] args) {

		/*
		paresInt() : 숫자형식의 문자열을 숫자로 변경한다.
		 */
		String strNumber = "1000";
		System.out.println("10+strNumber="+(10+strNumber));
		System.out.println("10+strNumber를 숫자로 변경: "
				+(10+Integer.parseInt(strNumber)));
		System.out.println("10+strNumber를 숫자로 변경: "
				+(10+Integer.parseInt(strNumber)));
		/*
		문자열을 숫자로 변경할때는 반드시 숫자형식만 와야한다.
		"원"은 숫자가 아니므로 예외가 발생한다. 
		 */
		String money = "120원";
//		System.out.println("120원="+Integer.parseInt(money));
		
		/*
		실수형태의 문자열을 실수로 변경할때는 paresInt()를 사용할 수 없다.
		위와 동일한 예외가 발생한다. 씨발
		 */
		String floatString = "3.14";
//		System.out.println(Integer.parseInt(floatString));
		System.out.println("실수형(float)형으로 변경: "+Float.parseFloat(floatString));
		System.out.println("실수형(double)형으로 변경: "+Double.parseDouble(floatString));
		
		/*
		Character클래스의 주요메소드
		 */
		
		/*
		codePointAt() : 문자열에서 index에 해당하는 한 문자의
			아스키코드 값을 반환한다.
		 */
		System.out.println("ABCD에서 3번째 인덱스 D의 아스키코드");
		System.out.println(Character.codePointAt("ABCD",3));
		
		/*
		isDigit() : 인자로 전달된 문자가 숫자인지 판단한다.
			숫자일때 true를 반환한다. 
		 */
		System.out.println("isDigit()을 이용한 숫자판단");
		System.out.println(Character.isDigit('a')?"숫자임":"숫자아님");
		System.out.println(Character.isDigit(50)?"숫자임":"숫자아님");
		System.out.println(Character.isDigit('7')?"숫자임":"숫자아님");
		
		/*
		isLetter() : 문자인지 여부를 판단하는 메소드로 특수기호나
			숫자형은 false를 반환한다.
		 */
		System.out.println("isLetter()메소드를 통한 문자판단");
		System.out.println(Character.isLetter('가'));
		System.out.println(Character.isLetter('A'));
		System.out.println(Character.isLetter('#'));
		System.out.println(Character.isLetter('9'));
		
		/*
		isWhitespace() : 공백문자인지 판단하는 메소드
		 */
		System.out.println("isWhitespace() 메소드로 공백문자 판단");
		System.out.println(Character.isWhitespace('A'));
		System.out.println(Character.isWhitespace(' '));
		
		/*
		isLowerCase() : 소문자인지 판단
		isUpperCase() : 대문자인지 판단
		단 영문자가 아닌경우 false를 반환한다.
		 */
		System.out.println("알파벳 대소문자 판단");
		System.out.println(Character.isLowerCase('A'));
		System.out.println(Character.isUpperCase('z'));
		System.out.println(Character.isLowerCase('a'));
		System.out.println(Character.isUpperCase('Z'));
		System.out.println(Character.isLowerCase('가'));
		
		/*
		시나리오] 주어진 문자열 안에 몇개의 공백문자(스페이스)가 있는지
		판단하는 프로그램을 작성하시오
			참고) toCharArray() : 문자열을 char형 배열로 반환해주는
			String클래스에 정의된 메소드.
		 */
		String text = "this text is sample ok";
		int whitecount = 0;
		char[] chArr = text.toCharArray();
		for(int i=0 ; i<chArr.length ; i++) {
			if(Character.isWhitespace(chArr[i])) {
				whitecount++;
			}
		}
		System.out.println("총공백수="+whitecount);
		
		
	}

}
