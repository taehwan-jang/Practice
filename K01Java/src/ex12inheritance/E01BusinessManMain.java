package ex12inheritance;

/*
상속(Inheritance)
	: 기존의 정의된 클래스에 메소드와 변수를 추가하여 새로운
	클래스를 정의하는 것을 말한다.
	부모클래스를 자식클래스가 상속할때는 extends 키워드를
	사용한다. private는 아무리 상속된 클래스라도 호출 불가
 */

//부모클래스(상위,기본,super) :  사람의 일반적인 형태를 추상화 한 클래스
class Man{
	private String name;
	//생성자는 오버로딩 하여 정의됨.
	public Man() {
		System.out.println("Man클래스 디폴트 생성자 호출됨");
	}
	public Man(String name) {
		this.name = name;
		System.out.println("Man 클래스 인자생성자 호출됨");
	}
	public void tellYourName() {
		System.out.println("내 이름은 "+name+" 입니다.");
	}
}

//자식클래스(하위, 유도,sub) : Man클래스를 상속받는 회사원 클래스
class BusinessMan extends Man{
	private String company;
	private String position;
	
	/*
	상속받은 자식클래스는 부모클래스의 생성자를 호출하여 부모객체가
	먼저 생성되도록 해야한다.
	super()는 부모클래스의 생성자를 호출하는 역할을 하는데
	만약 super()를 기술하지않으면 디폴트(기본)생성자가 호출된다.
	 */
	public BusinessMan(String name, String company, String position)
	{
		super(name);//부모클래스의 매개변수 1개인 생성자를 호출한다.
		
		this.company = company;
		this.position = position;
		System.out.println("BusinessMan 생성자 호출");
		
	}
	public void tellYourInfo() {
		System.out.println("회사명은 "+company+" 입니다.");
		System.out.println("직급은 "+position+" 입니다.");
//		부모클래스에 정의된 멤버메소드 호출. 상속받았으므로 호출 가능함.
//		따로 참조변수를 활용할 필요 없음
		tellYourName();
	}
}

public class E01BusinessManMain {
	
	public static void main(String[] args) {
		
		/*
		자식 클래스를 통해 객체를 생성하지만, 실행결과에는 부모클래스의
		생성자가 먼저 호출된다. 항상 부모객체가 먼저 생성된 후 자식객체가
		생성된다.
		 */
		BusinessMan man1 = new BusinessMan("김천국", "naver", "팀장");
		BusinessMan man2 = new BusinessMan("이낙원", "daum", "부장");
		
		man1.tellYourInfo();
		man1.tellYourName();
		
		man2.tellYourInfo();
		man2.tellYourName();
		
		
	}

}
