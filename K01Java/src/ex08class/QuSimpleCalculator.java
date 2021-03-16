package ex08class;
/*
기본 4칙연산을 할때마다 연산의 결과와 몇번 수행되었는지를 
출력하는 계산기 클래스를 정의해보자.아래 main함수에 부합하는 
CalculatorEx 클래스를 정의하면되고 해당 수치는 임의로 바꿔도 된다.
init() 멤버메소드에서는 계산의 결과를 카운트하는 멤버변수를 0으로 초기화 한다.

 */
public class QuSimpleCalculator {

	public static void main(String[] args) {

	    CalculatorEx cal = new CalculatorEx();
	    cal.init();
	    System.out.println("1 + 2 = " + cal.add(1 , 2));
	    System.out.println("1 + 2 = " + cal.add(12 , 2));
	    System.out.println("10.5 - 5.5 = " + cal.min(10.5 , 5.5));
	    System.out.println("4.0 * 5.0 = " + cal.mul(4.0 , 5.0));
	    System.out.println("100 / 25 = " + cal.div(100 , 25));
	    System.out.println("10.0 * 3.0 = " + cal.mul(10.0 , 3.0));
	    cal.showOpCount();
	}
}
class CalculatorEx {
	
	int addCnt;
	int minCnt;
	int mulCnt;
	int divCnt;
	
	public void init() {
		addCnt=0;
		minCnt=0;
		mulCnt=0;
		divCnt=0;
	}
	
	public double add(double a, double b) {
		double result1=0;
		addCnt+=1;
		return result1 = a+b;
	}
	public double min(double a, double b) {
		double result2=0;
		minCnt+=1;
		return result2 = a-b;
	}
	public double mul(double a, double b) {
		double result3=0;
		mulCnt+=1;
		return result3 = a*b;
	}
	public double div(double a, double b) {
		double result5=0;
		divCnt+=1;
		return result5 = a/b;
	}
	public void showOpCount() {
		System.out.println("덧셈횟수 : "+ addCnt);
		System.out.println("뺄셈횟수 : "+ minCnt);
		System.out.println("곱셈횟수 : "+ mulCnt);
		System.out.println("나눗셈횟수 : "+ divCnt);
	}
}
