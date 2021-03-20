package ex12inheritance;

/*
static(정적) 타입의 멤버도 상속이 된다, 하위클래스에서 접근시에는
멤버변수의 이름만으로도 접근이 가능하다.
또한, 클래스 외부에서 접근할 경우 객체생성없이 클래스명을 통해서도
접근 가능하다. 즉 static이 가진 기본적인 규칙을 그대로 따른다.
 */
class Adder{
	public static int val = 0;
	
	/*
	static으로 선언된 멤버변수는 실제로는 외부(메소드영역)에
	생성되어 있으므로 클래스명을 통한 접근이 허용된다.
	코드 레벨에서 보면 해당 클래스의 멤버변수이므로 변수명만으로
	접근하는것도 가능하다.
	 */
	public void add(int num) {
		val += num;
		Adder.val += num;
	}
}
//자식클래스의 멤버메소드는 모두 실행가능한 코드임. 접근에 문제없음.
class AdderFriend extends Adder{
	public void friendAdd(int num) {
		val += num;
		Adder.val += num;
	}
	public void showVal() {
		System.out.println("val= "+val);
		System.out.println("val= "+Adder.val);
		
	}
}


public class E03StaticInheritance {

	public static void main(String[] args) {

		Adder ad = new Adder();
		AdderFriend adFriend = new AdderFriend();
		
		ad.add(1);
		adFriend.friendAdd(3);
		Adder.val += 5;
		AdderFriend.val += 7;
		
		adFriend.showVal();
		
		
	}

}
