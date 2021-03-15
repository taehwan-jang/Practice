package ex07string;

public class E01StringBasic {

	public static void main(String[] args) {
		
		/*
		기본자료형의 경우 비교연산자(==)를 통해 값에 대한 비교를 한다.
		 */
		int num1=10, num2=20;
		String numResult = (num1==num2)? "데이터같다":"데이터다르다";
		System.out.println("비교결과:"+ numResult);
		
		/*
		String클래스의 객체생성방법 1
			: new를 이요한다. new를 사용하면 동일한 문자열이라도
			항상 Heap영역에 새로운 메모리를 생성하게 된다.
		 */
		String str1 = new String("Hello JAVA");
		String str2 = new String("Hello JAVA");
		
		/*
		str1, str2는 String 객체의 참조값을 가지고 있으므로
		아래의 비교는 단순한 참조값(주소값)에 대한 비교를 하게된다.
		2개의 객체(인스턴스)가 생성되므로 참조주소는 다르다는 결과가 출력된다.
		 */
		if(str1==str2) {
			System.out.println("str1과 str2는 참조주소 같음");
		}
		else {
			System.out.println("str1과 str2는 참조주소 다름");
		}
		/*
		equals()메소드
			: Object클래스로부터 상속받은 메소드로 실제 저장된
			문자열을 비교하도록 만들어진 메소드이다. 즉 아래는
			객체에 저장된 실제 문자열에 대한 비교가 이루어진다.
		 */
		if(str1.equals(str2)) {
			System.out.println("두 문자열은 동일하다");
		}
		else {
			System.out.println("두 문자열은 다르다");
		}
		
		/*
		String 클래스의 객체생성방법2
			: "(더블쿼테이션)"을 사용한다. 이 경우 내용이 같다면
			동일 참조값을 갖게 된다. 즉 새로운 객체(인스턴스)를
			생성하지 않는다.
			주로 String 객체(인스턴스)는 이와같이 생성한다.
		 */
		String str3 = "KOSMO";
		String str4 = "KOSMO";
		
		System.out.println("equals()메소드로 문자열 비교:"+
				str3.equals(str4));//true
		
		if(str3==str4) {
			System.out.println("주소가 같다");//출력됨
		}
		else {
			System.out.println("주소가 다르다");
		}
		
		
	}

}
