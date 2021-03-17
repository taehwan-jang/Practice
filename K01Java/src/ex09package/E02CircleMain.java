package ex09package;

import ex09package.Kosmo.perimeter.Circle;

public class E02CircleMain {

	public static void main(String[] args) {

		
		//원의 넓이 : 클래스 사용을 위해 전체 패키지 경로를 사용한다.
		ex09package.Kosmo.area.Circle circle1 =
				new ex09package.Kosmo.area.Circle(6.5);
		System.out.println("반지름 6.5인 원의 넓이: "+circle1.getArea());
		
		//원의 둘레 : 클래스 사용을 위해 import 선언후 사용한다.
		Circle circle2 = new Circle(4.5);
		System.out.println("반지름이 4.5인 원의 둘레: "+ circle2.getPerimeter());
		
	}

}
