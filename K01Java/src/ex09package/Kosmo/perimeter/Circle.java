package ex09package.Kosmo.perimeter;

//원의 둘레를 계산하기 위한 크래스
public class Circle {
	double rad;
	final double PI;
	
	public Circle(double rad) {
		this.rad = rad;
		PI = 3.141592;
	}
	
	public double getPerimeter() {
		return 2 * PI *rad;
	}
	
}
