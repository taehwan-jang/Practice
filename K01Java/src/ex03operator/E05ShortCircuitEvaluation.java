package ex03operator;

public class E05ShortCircuitEvaluation {

	public static void main(String[] args) {

		/*
		SCE(ShortCircuitEvaluation)
			: 하나의 조건검사만으로 결과를 알 수 있는 경우 Java 컴파일러는
			뒤의 조건을 수행하지 않고 건너뛰게 된다. 이 경우 변수의 값이
			변경되는 코드가 있다면 실행되지 않으므로 주의해야 한다.
		 */
		int num1=0, num2=0;
		boolean result;
		
		/*
		논리 And(&&)의 경우 둘 중 하나만 false이면 false를 반환하므로
		첫번째 조건이 false이면 두번째 문장은 실행하지 않는다.
		 */
		result = (num1+=10)<0 && (num2+=10)>0;
		System.out.println("result="+ result);
		System.out.println("num1="+ num1 +", num2="+num2);
		
		/*
		논리 Or(||)의 경우 둘 중 하나만 true이면 true를 반환하므로
		첫번째 조건이 true이면 두번째 문장은 실행하지 않는다.
		 */
		result = (num1=+10)>0 || (num2+=10)>0;
		System.out.println("result="+ result);
		System.out.println("num1="+num1+", num2="+num2);
		
		/*
		num2는 초기값 0을 유지하게 된다. 만약 num2의 값이 프로그램에
		영향을 미치게 된다면 이 부분은 주의해야 한다.
		 */
	}

}
