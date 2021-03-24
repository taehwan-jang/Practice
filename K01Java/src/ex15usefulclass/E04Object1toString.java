package ex15usefulclass;

/*
Object 클래스
-자바에서의 최상위 클래스이다.
-별도의 선언없이 Object클래스에 정의된 모든 메소드를
	사용할 수 있다.
-개발자가 정의한 모든 클래스를 Object객체로 참조할 수 
	있다.
	ex) Object obj = new Person();
		혹은
		void myFunc(Object obj){
			실행부
		}
 */
//               이 부분은 써도되고 안써도됨
class MyFriends extends Object {
	String myName;
	public MyFriends(String name) {
		myName = name;
	}
	//오버라이딩 하여 재정의 함.
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "이름: "+ myName;
	}
}
/*
toString() 메소드
-Object클래스에 정의된 메소드로 println()이 문자열을
	출력하기 전에 자동으로 호출하는 메소드이다.
-인스턴스 변수를 문자열 형태로 변환하여 반환해준다.
-필요한 경우 클래스를 정의할때 적절히 오버라이딩하여
	재정의하는것이 좋다. 단 필수사항은 아니다.
 */
class YourFriends extends Object {
	String myName;
	public YourFriends(String name) {
		myName = name;
	}
}


public class E04Object1toString {

	public static void main(String[] args) {

		MyFriends fn1 = new MyFriends("장태바리");
		YourFriends fn2 = new YourFriends("바리바리");
		
		System.out.println(fn1);
		System.out.println(fn2);
		
		
	}

}
