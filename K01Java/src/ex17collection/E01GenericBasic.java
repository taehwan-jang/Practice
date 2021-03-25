package ex17collection;

//오렌지를 표현한 클래스
class Orange {
	int sugar;
	public Orange(int sugar) {
		this.sugar = sugar;
	}
	public void showInfo() {
		System.out.println("오렌지의 당도 "+sugar+"이다.");
	}
}
//오렌지 전용박스: Orange객체만 저장할 수 있는 클래스
class OrangeBox {
	Orange item;
	public void store(Orange item) {//저장
		this.item = item;
	}
	public Orange pullOut() {//꺼냄
		return item;
	}
}
//과일박스 : Object기반으로 모든 객체(과일)을 저장할 수 있는 클래스
class FruitBox {
	Object item;
	public FruitBox(Object item) {
		this.item = item;
		
	}
	public void store(Orange item) {
		this.item = item;
	}
	public Object pullOut() {
		return item;
	}
}

public class E01GenericBasic {

	public static void main(String[] args) {
		/*
		Orange에 Orange객체를 생성한 후 저장하고 정보를 출력한다.
		 */
		OrangeBox oBox1 = new OrangeBox();
		Orange orange1 = new Orange(10);
		oBox1.store(orange1);
		orange1 = oBox1.pullOut();
		orange1.showInfo();
		
		/*
		oBox1은 오렌지 전용 박스이므로 다른과일(즉 객체)를 저장할 수 없다.
		컴파일 에러가 발생하므로 샐항자체가 불가능
		->즉 자료형에는 안전한지만, 구현에는 불편함이 있다.
		다른 객체를 저장하기 위해서는 또다른 Box클래스를 생성해야 한다.
		 */
//		oBox1.store("당도가 20인 오렌지"); <-컴파일 에러 발생
//		Orange orange2 = oBox1.pullOut();
//		orange2.showInfo();
		/*
		Object를 기반으로 한 FruitBox는 구현에는 편리하나 코드레벨에서
		에러가 발생하지 않으므로 오류를 찾아내기가 훨씬 더 어렵다.
		따라서 자료형에는 안전하지 못한 코드가 된다.
		 */
		FruitBox fBox1 = new FruitBox(new Orange(20));
		Orange orange3 = (Orange)fBox1.pullOut();
		orange3.showInfo();
		
		FruitBox fBox2 = new FruitBox("당도 30 오렌지");
		Orange orange4 = (Orange)fBox2.pullOut();//<-런타임에러 발생
		orange4.showInfo();
	}
}
