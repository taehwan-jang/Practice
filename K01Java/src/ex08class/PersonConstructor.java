package ex08class;

/*
생성자(constructor)
-클래스를 객체화(인스턴스화)할때 자동으로 호출되는 메소드
-자동으로 호출되며, 개발자가 임의로 호출할 수 없다.
-반환값이 없다. 즉 특정 연산후 값을 반환할 수 없다.
따라서 void를 쓰지않는다.
-그 외에는 메소드가 가진 모든 특성을 가지고 있다.(인자전달,오버로딩 등)

생성자 내에서 this 활용법
용도 1 : 동일 클래스 내에서 다른 생성자를 호출할때 사용한다.
	단, 생성자 내에서만 호출 가능하다.
	사용법
		this(인자1, 인자2,..)
용도2 : 생성자 내에서 멤버변수와 매개변수의 이름이 동일할때
	구분하기 위한 용도로 사용된다.
	this.변슈명 -> 멤버변수
	변수명 -> 생성자의 매개변수
	단, 이름이 서로 다르다면 this를 생략할 수 있다. 주로
	명시적인 코드작성을 위해 사용된다.
 */

public class PersonConstructor {
	
	//멤버변수 이름, 나이, 주소
	String name;
	int age;
	String addr;
	
	//생성자 메소드
	/*
	디폴트 생성자
		: 해당 클래스에 생성자를 정의하지 않은 경우
		아래와 같은 매개변서, 실행북가 없는 생성자가 
		자동으로 삽입된다. 단, 생성자를 하나라도 정의한다면
		디폴트 생성자는 삽입되지 않는다.(주의!)
	 */
	//public PersonConstructor(){}
	
	public PersonConstructor() {
		name="이름없음";
		age=0;
		addr="미상";
		System.out.println("나는 기본생성자");
	}
	
	public PersonConstructor(String name) {
		/*
		해당 this는 멤버변수와 매개변수를 구분하기 위한 용도로 사용된다.
		좌측항은 멤버변수, 우측항은 매개변수
		 */
		this.name=name;
		age=1;
		addr="출처불명";
		
	}
	
	public PersonConstructor(String name, int age) {
		/*
		this()는 생성자내에서 다른 생성자를 호출할때 사용된다.
		단, 생성자내에서만 사용가능하고, 일반멤버메소드에서는
		사용이 불가능하다.
		 */
		this(name,age,"미상");
		System.out.println("나는 인자생성자[2]입니다.");
	}
	public PersonConstructor(String _name,int age, String addr) {
		//매개변수와 멤버변수명이 다르면 this를 쓰지 않는다.
		name=_name;
		//변수명이 동일한 경우에는 this의 사용을 권장한다.
		this.age=age;
		this.addr=addr;
		System.out.println("나는 인자생성자[3]입니다.");
	}
	void initialize(String name,int age, String addr) {
		/*
		해당 코드는 생성자 내에서만 사용할 수 있다.
		 */
//		this(name, age, "미상"); -> 에러발생됨
		
		//멤버변수를 구분하기 위한 this는 멤버메소드에서도 사용가능하다.
		this.name=name;
		this.age=age;
		this.addr=addr;
		
	}
	void showPersonInfo() {
		System.out.printf("%s님의 정보\n",this.name);
		System.out.printf("나이:%d\n",age);
		System.out.printf("주소:%s\n",addr);
	}
	
	

}
