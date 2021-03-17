package ex10accessmodifier;

import ex10accessmodifier.sub.E01AccessModifier2;

public class E01AccessModifier1Main {

	public static void main(String[] args) {
		
		System.out.println("E01AccessModifier1 객체생성 및 접근");
		
		/*
		-동일한 패키지에 선언되었으므로 import없이 객체를 생성할 수 있다.
		-private으로 선언된 멤버는 동일한 패키지라 할지라도 접근할 수 없다.
		
		※public메소드를 통해 private 멤버에 간접적으로 접근할 수 있음
		 */
		E01AccessModifier1 one = new E01AccessModifier1();
//		동일 패키지라 할지라도 private으로 선언된 멤버에 접근할 수 없음
//		System.out.println("one.privateVar= "+ one.privateVar); 
		System.out.println("one.privateVar= "+ one.defaultVar);
		System.out.println("one.privateVar= "+ one.publicVar);
		
//		one.privateMethod();
		one.defaultMethod();
//		※public메소드를 통해 private 멤버에 간접적으로 접근할 수 있음
		one.publicMethod();
		
		/*
		동일한 패키지 선언되 클래스이므로 import없이 객체생성이 가능하다.
		또한 default클래스는 동일한 패키지에서는 접근할 수 있다.
		 */
		System.out.println("DefualtClass 객체생성 및 접근");
		new DefaultClass1().myFunc();
		//////////////////////////////////////////////////
		System.out.println("E01AccessModifier2 객체생성 및 접근");
		E01AccessModifier2 two = new E01AccessModifier2();
		
		/*
		다른 패키지에 선언된 클래스이므로 객체생성을 위해 import선언을 해야한다.
		또한 패키지가 다르면 private, default멤버에 접근할 수 없다.
		 */
		
//		System.out.println("two.privateVar= "+ two.privateVar);
//		System.out.println("two.privateVar= "+ two.defaultVar);
		System.out.println("two.privateVar= "+ two.publicVar);
		
//		two.privateMethod();
//		two.defaultMethod();
		two.publicMethod();
		
		/*
		다른 패키지에 선언된 디폴트 클래스이므로 객체생성이 불가능하다.
		import도 불가능하므로 아예 사용할 수 없는 클래스가 된다.
		 */
		System.out.println("DefualtClass 객체생성 및 접근");
//		new DefaultClass2().myFunc();
		
		
	}
}
