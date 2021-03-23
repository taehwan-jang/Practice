package ex14innerclass;
/*
익명클래스(Anonoymous Class)
-이름이 없는 클래스를 말한다.
-내부클래스처럼 이벤트기반의 프로그래밍에서 많이 사용된다.
-부모클래스의 메소드를 오버라이딩 하는것이 목적이다.
-클래스를 정의하는것이 마치 메소드를 정의하는것과 비슷하다.
-마지막에 세미콜론을 반드시 써줘야한다.

형식]
	부모클래스명 참조변수 = new 부모클래스명() {
		익명클래스의 실행부
		부모클래스의 메소드 오버라이딩();
	};
	
	※부모클래스를 상속받아 이름없는 자식클래스를 생성하는
	개념으로 이해하면 된다. 상속되기 때문에 오버라이딩이 가능하다.
	즉, {} 안쪽은"자식"의 영역이다.
 */
class Person {
	String name;
	public Person(String n) {
		name = n;
	}
	void printInfo() {
		System.out.println(String.format("이름:%s", name));
	}
}
class Student extends Person {
	String stNumber;
	public Student(String n, String stNum) {
		super(n);
		stNumber = stNum;
	}
	//자식에서 확장한 멤버메소드(부모에는 정의되지 않음)
	String getInfo() {
		return String.format("학번:%s", stNumber);
	}
	//오버라이딩한 메소드(부모에 정의되어 있음)
	@Override
	void printInfo() {
		super.printInfo();
		System.out.println(getInfo());
	}
}
//추상클래스
abstract class AbstractClass {
	public abstract void abstractMethod();
}
interface Interface {
	void abstractMethod();
}
public class E03AnonymousClass {

	public static void main(String[] args) {

		/*
		Student라는 이름을 가진 자식 클래스를 통해 객체를 생성하고
		부모의 참조변수로 참조하는 이질화 형태.
		참조변수가 부모타입이므로 자식객체에 직접 접근은 불가능하고
		반드시 다운캐스팅(강제형번환)후 접근해야 한다.
		 */
		Person person = new Student("문사람", "2016");
		person.printInfo();
//		person.stNumer = "2015";
		((Student)person).stNumber = "2015";//다운캐스팅 이후 접근 가능
		System.out.println(((Student)person).getInfo());
		/*
		Person클래스의 상속받은 익명클래스 정의
			: Person타입의 인스턴스 변수에 Person을 상속받은 익명클래스를
			생성해서 그 주소를 할당한다.
		-개념적으로 new Persno(){}; -> 익명 extends Person();
		형태로 생각하면 된다.
		-이름이 없는 객체이므로 부모클래스의 이름을 빌려서 객체를 생성했다고
		생각하자.
		 */
		Person anonyPerson = new Person("이말년") {
			/*
			자식(익명클래스)객체에서 새롭게 확장한 멤버
			-> 아래 멤버는 익명클래스 내에서만 접근이 허용된다.
			익명이므로 다운캐스팅이 불가능->외부 클래스 접근 불가
			따라서 익명클래스에서는 멤버의 확장은 거의 하지 않는다.
			 */
			int newVar;
			void newMethod() {
				System.out.println("익명클래스에서 새롭게 확장한 메소드");
				
			}
			//오버라이딩해서 재정의한 메소드
			@Override
			void printInfo() {
				System.out.println("newVar="+newVar);
				System.out.println("Person.name="+name);
				newMethod();
				System.out.println("익명클래스에서 오버라이딩");
			}
		};
		anonyPerson.printInfo();//호출가능(오버라이딩 했으므로!)
//		anonyPerson.newMethod();//접근불가(확장한 멤버이므로)
		/*
		부모타입의 참조변수를 자식객체에서 확장한 멤버에 접근할 수 없으므로
		에러가 발생한다. 접근을 위해서는 다운캐스팅을 해야하지만, 익명이므로
		다운캐스팅이 불가능하다.
		 */
		//추상클래스를 상속해서 정의한 익명 클래스(놀랍게도 오버라이딩까지 자동완성된다)
		AbstractClass abstractClass = new AbstractClass() {
			String str = "확장변수";
			@Override
			public void abstractMethod() {
				System.out.println("추상메소드 오버라이딩");
				System.out.println("str="+str);
			}
		};
		abstractClass.abstractMethod();
		
		Interface in = new Interface() {
			int interVar = 100;
			@Override
			public void abstractMethod() {
				System.out.println("인터페이스의 추상메소드 오버라이딩");
				System.out.println("interVar="+interVar);
			}
		};
		in.abstractMethod();
		
		/*
		결론]
			상속의 목적은 "기능의 확장"
			익명클래스의 목정은 "오버라이딩"
			그러므로 주로 익명클래스의 부모는 interface를 사용한다.
		 */
	}
}
