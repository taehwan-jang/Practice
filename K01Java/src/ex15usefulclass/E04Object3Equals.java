package ex15usefulclass;

class MyClass {
	int data;
	public MyClass(int data) {
		this.data = data;
	}
	/*
	toString() : 실제 저장된 데이터가 반환되도록 Object
		클래스로부터 상속받아 오버라이딩한 메소드
	 */
	@Override
	public String toString() {
		return String.valueOf(data);
	}
	/*
	MyClass형의 객체의 비교를 위해 오버라이딩한 메소드.
	객체가 가지고있는 멤버변수의 비교를 통해 동일여부를 판단한다.
	 */
	@Override
	public boolean equals(Object obj) {
		/*
		매개변수로 전달된 객체를 Object로 받은후 MyClass의
		인스턴스인지 먼저 판단한다. instanceof 연산자는 해당
		객체가 상속관계에 있는지를 판단한다.
		 */
		if(obj instanceof MyClass) {
			/*
			매개변수가 MyClass타입이 맞다면 비교를 위해
			다시 MyClass타입으로 형변환한다.
			 */
			MyClass mc = (MyClass)obj;
			
			if(mc.data==this.data) {
				System.out.println("myClass-멤버동일함");
				return true;
			}
			else {
				System.out.println("myClass-멤버다름");
				return false;
			}
		}
		/*
			매개변수로 전달된 객체가 MyClass의 인스턴스가 
			아니라면 비교의 대상이 될 수 없으므로 false 반환
		 */
		else {
			System.out.println("myClass객체가 아님");
			return false;
		}
	}
	
}
class Point {
	int x, y;
	public Point(int x, int y) {
		this.x = x;
		this.y = y;
	}
	/*
	객체 1,2의 x,y값을 동시에 비교해서 둘 다 도일할때 같은 객체로
	판단하도록 오버라이딩 처리한다.
	 */
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Point) {
			Point pos = (Point)obj;
			if(this.x==pos.x && this.y==pos.y) {
				return true;
			}
			else {
				return false;
			}
		}
		else{
			return false;
		}
	}
	@Override
	public String toString() {
		return "x="+String.valueOf(x)+", y="+String.valueOf(y);
	}
	
	
	
}
public class E04Object3Equals {

	public static void main(String[] args) {
		
		MyClass mc1 = new MyClass(10);
		MyClass mc2 = new MyClass(10);
		
		System.out.println("[두 객체를 equals()메소드로 비교]");
		
		if(mc1==mc2) {
			System.out.println("인스턴스 참조값이 같다.");
		}
		else{
			System.out.println("인스턴스 참조값이 다르다.");
		}
		//객체간의 내용비교
		System.out.println(mc1.equals(mc2)?"같다":"다르다");
		
		/*
		println()은 출력전 항상 객체의 toString()메소드를 자동으로
		호출하므로 아래 출력 결과는 동일하다.
		 */
		System.out.println("[두 객체의 toString()메소드 호출]");
		System.out.println("mc1.toString()->"+mc1.toString());
		System.out.println("mc2.toString()->"+mc2.toString());
		
		Point pos1 = new Point(10, 20);
		Point pos2 = new Point(10, 30);
		//둘 다 point객체이므로 비교할 수 있음
		System.out.println("두 점의 비교결과:");
		System.out.println(pos1.equals(pos2)?"같다":"다르다");
		//서로 다른 객체이므로 비교의 대상이 될 수 없음.
		System.out.println(pos1.equals(mc1)); 
		//아래 출력결과는 동일
		System.out.println("pos1.toString()->"+pos1.toString());
		System.out.println("pos2.toString()->"+pos2.toString());
		System.out.println(pos1);
		System.out.println(pos2);
		
		
		
		

	}

}
