package ex12inheritance;

//직사각형을 표현한 클래스
class Rectangle {
	
	private int x;
	private int y;
	public Rectangle() {}
	public Rectangle(int a, int b) {
		x = a;
		y = b;
	}
	public void ShowAreaInfo() {
		System.out.println("직사각형: "+x*y);
	}
} 
//정사각형을 표현한 클래스(정사각형은 직사각형의 일종)
class Square extends Rectangle {
	/*
	멤버변수
		: 해당 클래스의 경우에는 부모클래스가 이미 가로,세로에
		대한 멤버변수를 정의하였으므로 자식쪽에서는 멤버변수의 확장은
		필요없다.
	 */
	
	private int x;
	
	/*
	자식의 생성자 : 정사각형은 가로, 세로의 길이가 동일하므로 인자값
		1개로 부모의 멤버변수 2개를 초기화 할 수 있도록 super()를
		정의하면 된다.
	 */
	public Square(int a) {
		//super(a,a)
		x = a;
	}
	/*
	자식 객체를 통해 넓이를 구할때는 정사각형의 넓이가 나와야 하므로
	오버라이딩으로 정의해야 한다. 오버라이딩된 메소드는 상속관계에서
	항상 최하위의 메소드가 호출되게 된다.
	 */
	@Override
	public void ShowAreaInfo() {
		System.out.println("정사각형: "+x*x);
	}
} 
class QuRectangleMain {
  public static void main(String[] args) {
  	Rectangle rec = new Rectangle(4, 3);
  	rec.ShowAreaInfo();
  	
  	Square sqr = new Square(7);
  	sqr.ShowAreaInfo();
  	}
}
