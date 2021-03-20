package ex12inheritance;

//직사각형을 표현한 클래스
class Rectangle {
	
	private int x;
	private int y;
	
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
	
	private int x;
	
	public Square(int a, int b) {
		super(a, b);
	}
	public Square(int a) {
		super(0,0);
		x = a;
	}
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
