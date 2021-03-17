package ex10accessmodifier.cal;

/*
Calculator 클래스는 해당 java파일에서 외부에 가장
의미있는 클래스로 public으로 선언되었다.
자바에서는 하나의 class만 public으로 선언하는것이
가능한데 해당 클래스에서 default클래스의 객체를 생성하여
사용하는 형태로 제작되어야 한다.
 */
public class Calculator {
	
	//멤버변수
	private Adder adder;
	private Subtractor subtractor;
	
	/*
	생성자메소드
		: 해당 클래스의 객체가 생성될때 덧셈, 뺄셈을 위한
		객체도 동시에 생성된다.
	 */
	public Calculator() {
		adder = new Adder();
		subtractor = new Subtractor();
	}
	
	/*
	멤버메소드
		: 덧셈 혹은 뺄셈 연산후 결과를 반환하는 메소드로
		각 연산을 위한 해당 default클래스의 멤버메소드를
		호출한 후 결과를 반환받는다.
	 */
	public int addTwoNumber(int n1, int n2) {
		return adder.addTwoNumber(n1, n2);
	}
	
	public int subTwoNumber(int n1, int n2) {
		return subtractor.subTwoNumber(n1, n2);
	}
	/*
	연산의 횟수를 디스플레이 해주는 메소드로 정보은닉 처리된
	멤버변수의 출력을 위해 각 메소드를 호출한다.
	 */
	public void showOperatingTimes() {
		System.out.println("덧셈횟수: "+ adder.getCntAdd());
		System.out.println("뺄셈횟수: "+ subtractor.getCntSub());
	}
	
	
	

}
class Adder {
	private int cntAdd;
	
	Adder(){
		cntAdd=0;
	}
	public int getCntAdd() {
		return cntAdd;
	}
	int addTwoNumber(int n1, int n2) {
		cntAdd++;
		return n1+n2;
	}
}
class Subtractor {
	private int cntSub;
	
	Subtractor(){
		cntSub=0;
	}
	public int getCntSub() {
		return cntSub;
	}
	int subTwoNumber(int n1, int n2) {
		cntSub++;
		return n1-n2;
	}
}
