package ex12inheritance;

/*
구성관계로 표현하기에 적합한 Has-A관계
	: X has a Y -> X가 Y를 소유(포함)하고 있다.
	-경찰이 권총을 소유하다 등...
	
	Has-A와 같이 소유의 관계를 상속으로 표현하면 클래스간
	강한 연결고리가 형성되어 권총이 없는 경찰을 표현하기가
	힘들어진다. 따라서 이 경우에는 구성관계로 표현하는것이
	적합하다. 구성관계를 클래스의 멤버로 또다른 객체를
	정의하는것을 말한다.
 */
class Gun {
	int bullet;//총알의 갯수
	public Gun(int bNum) {
		bullet = bNum;
	}
	public void shotGun() {
		System.out.println("빵~!!@!");
		bullet--;
	}
}
//경찰을 추상화한 클래스 
class Police { 
	
	int handCuffs;//수갑의 보유갯수
	Gun gun;//보유한 권총 객체를 들고옴.
	
	public Police(int bNum, int hCuff) {
		handCuffs = hCuff;
		
		/*
		권총 보유여부 초기화
			: 만약 총알이 없는 상태라면 보유한 권총이 없는것으로
			표현하기 위해 멤버변수를 null로 초기화한다.
			참조변수가 null값이란것은 참조할 객체가 없다는
			의미이다. 즉 Heap(힙영역)에 생성된 객체가 없는것을
			의미한다.
		 */
		if(bNum<=0) {
			gun = null;
		}
		else {
			gun = new Gun(bNum);
		}
	}
	//수갑을 채우는 행위를 표현
	public void putHandCuff() {
		System.out.println("수갑채움 넌 감방");
		handCuffs--;
	}
	//경찰이 권총을 발사하는 행위를 표현
	public void shut() {
		if(gun == null) {
			//경찰이 총을 보유하지 않았다면 발사할 수 없다.
			System.out.println("총 없다..");
		}
		else {
			//Gun클래스의 멤버 메소드를 호출하여 실행.
			gun.shotGun();
		}
	}
}
public class E05HasAComposite {

	public static void main(String[] args) {

		//권총을 보유한 경찰을 표현
		System.out.println("==경찰1==");
		Police police1 = new Police(5, 3);
		police1.shut();
		police1.putHandCuff();
		
		//권총을 보유하지 못한 경찰을 표현
		System.out.println("==경찰2==");
		Police police2 = new Police(0, 3);
		police2.shut();
		police2.putHandCuff();
	}
}
