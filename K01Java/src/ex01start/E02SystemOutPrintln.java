package ex01start;

import java.util.Iterator;

public class E02SystemOutPrintln {

	public static void main(String[] args) {

		int num1 = 100;
		/*
		 System.out.println()
	 		: 내용을 출력한 후 자동으로 출바꿈 처리를 한다.
		 Ssystem.out.print()
	 		: 출력 후 줄바꿈 처리를 하지 않는다. 만약 줄바꿈을
	 		하고싶다면 \n 을 추가한다.
		 System.out.printf()
	  		: 출력 내용을 서식에 맞춰 출력할때 사용하며 자체적인
	  		줄바꿈 긴으은 없다. 줄바꿈 처리를 위해서 \n 혹은 %n
	  		두가지를 사용할 수 있다. 서식문자에는 %d, %f 등이 있다.
		 */
		System.out.println("num1="+ num1);
		System.out.print("num1="+ num1 + "\n");
		System.out.printf("num1=%d%n", num1);
		/*
		print()문에서의 + 기호의 역할
		-숫자끼리는 실제 덧셈 연산을 수행한다.
		-문자열, 숫자, 실수 등 서로 성격이 다른 데이터끼리는
		단순 연결만 해서 출력한다.
		 */
		
		System.out.println(7);
		System.out.println(3.14);

		//단순 출력만 된다.
		
		System.out.println(3 + 5);//8
		System.out.println(3.5 + 5.1);//8.6
		//숫자와 숫자로 인식하여 실제 덧셈연산의 결과를 출력한다.
		
		System.out.println("3+5="+ 8);
		System.out.println(3.15 + "는 실수입니다.");
		System.out.println("3+5"+ "의 연산결과는 8입니다.");
		//숫자와 문자열이므로 단순 연결해서 출력한한다.
		
		System.out.println("num1 은 "+ num1 +" 입니다.");
		//변수와 문자열을 연결해서 출력한다.
		
	}

}
