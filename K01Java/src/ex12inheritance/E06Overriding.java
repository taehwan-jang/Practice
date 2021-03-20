package ex12inheritance;

/*
오버라이딩(Overriding)
	: 클래스가 상속관계에 있을때 하위클래스에서 상위클래스의
	멤버메소드와 완전히 동일한 모양으로 재정의하는 것을 말한다.
	오버로딩(Overloading)과 다른점은 매개변수의 갯수, 반환타입 등이
	완전히 똑같은 형태로 정의한다는 것이다.
	하위클래스에서 오버라이딩한 메소드는 상위클래스의 메소드를
	가리게되므로 항상 최하위클래스에서 오버라이딩한 메소드가
	호출되게된다.
 */

//일반적인 스피커를 추상화한 클래스
class Speaker {
	private int volumnRate;//볼륨
	//외부에서 설정 가능한 setter 메소드
	public void setVolumn(int vol) {
		volumnRate = vol;
	}
	//상속관계에서 오버라이딩을 목적으로 정의한 메소드
	public void showState() {
		System.out.println("스피커  볼륨의 크기: "+ volumnRate);
	}
}
//일반적인 스피커의 기능에 중저음이 보강된 스피커를 추상화
class BaseSpeaker extends Speaker {
	
	private int baseRate;
	public void setBase(int base) {
		baseRate = base;
	}
	/*
	@Override
		: '어노테이션'이라 부르고 오버라이딩된 메소드에
		추가하여 컴파일러에게 알려주는 역할을 한다.(명시적으로)
	 */
	@Override
	public void showState() {
		/*
		super를 통해 부모클래스에 정의된 멤버메소드를 호출한다.
		특히, 오버라이딩된 메소드를 호출할 때 super가 없으면
		재귀함수가 되므로 반드시 기술해야한다.
		 */
		super.showState();
		System.out.println("베이스의 볼륨크기: "+baseRate);
	}
}
public class E06Overriding {

	public static void main(String[] args) {

		//자식 클래스를 통해 객체생성
		BaseSpeaker baseSpeaker = new BaseSpeaker();
		baseSpeaker.setVolumn(10);
		baseSpeaker.setBase(20);
		baseSpeaker.showState();/*
			자식 객체로 호출하였으므로 자식 클래스에서 오버라이딩한
			showState() 메소드가 호출된다. 
		*/
		
		System.out.println();
		
		/*
		부모클래스의 참조변수가 자식클래스의 객체를 참조할 수 있다.
		이 경우 접근범위는 부모클래스로 제한된다.
		즉 아래 호출부분에서 speaker참조 변수를 통해서는 setBase()
		메소드는 호출할 수 없다. setBase()는 자식클래스에서 정의된 멤버
		메소드이기 때문이다. 단, 오버라이딩 처리된 메소드가 있는 경우에는
		하위클래스의 메소드가 호출된다.
		 */
		Speaker speaker = new BaseSpeaker();//?
		speaker.setVolumn(30);
//		speaker.setBase(40);
		speaker.showState();
	}
}
