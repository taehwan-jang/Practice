package ex11static;

/*
static블럭
	: 동일 클래스안의 main메소드보다 먼저 실행되는 블럭으로
	main메소드의 실행코드가 없어도 먼저 실행된다.
	단, 다른 클래스에 main이 있는 경우에는 main이 순차적으로
	실행되다가 static 블럭이 있는 클래스가 객체화될때 실행된다.
	이때 생성자보다 static블럭이 먼저 실행된다.
 */
public class StaticBlock {

	//인스턴스형 멤버변수 및 메소드
	int instanceVar;
	void instanceMethod() {}
	
	//정적멤버
	static int staticVar;
	static void staticMethod() {
		int localVar;
		System.out.println("정적메소드");
	}
	
	//static블럭
	static {
		//블럭내에서 정적멤버에 접근가능
		staticVar = 1000;
		
		/*
		블럭내에서만 사용할 수 있는 변수로써, 블럭내에서
		일반적인 변수를 생성할 수 있다.
		 */
		int localVar;
		localVar = 1000;
		System.out.println("localVar= "+ localVar);//허용됨
		
		/*
		static블럭내에서는 인스턴스형 멤버에 접근할 수 없다.
		 */
//		System.out.println("instanceVar= "+ instanceVar);
//		instanceMethod();
		
		/*
		정적멤버에는 접근할 수 있다.
		 */
		System.out.println("staticVar= "+ staticVar);
		staticMethod();
		System.out.println("==static block==");
		
	}
	
	//생성자 메소드
	/*
	외부파일의 main메소드에서 실행되는 경우 해등 클래스의 객체가
	생성ㅅ자를 통해 생성되기전에 static블럭이 먼저 실행된다.
	 */
	public StaticBlock() {
		staticVar = -1;
		System.out.println("==staticBlock의 생성자==");
	}
	/*
	main메소드가 외부파일에 있을경우 테스트를 위해 아래 부분은
	주석처리 후 실행해본다. E02StaticBlockMain예제를 실행하면됨
	 */
//	public static void main(String[] args) {
//		System.out.println("==메인메소드==");
//		
//		/*
//		static 블럭내에서 선언된 지역변수이므로 main메소드에서는
//		사용이 불가능하다.
//		 */
//		System.out.println("localVar= "+ localVar);
//	}

}
