package ex05method;

import java.util.Scanner;

/*
섭씨(Celsius)를 입력받아서 화씨(Fahrenheit)로 변환하여 리턴하는 함수와 화씨를 입력받아서 섭씨로 변환하여 리턴하는 함수를 만들어라.

공식]
화씨 = 1.8 * 섭씨 + 32
섭씨 = (화씨 - 32) / 1.8

 */
public class QuTemperature {

	static double celTofah(double cel) {
		double result = 1.8 * cel + 32 ; 
		return result;
	}
	static double fahTocel(double fah) {
		return (fah - 32) / 1.8 ;
	}
	public static void main(String[] args) {

		/*
		전달하는 파라미터가 정수이고, 매개변수가 실수일 경우
		전달될때 자동형변환이 된다
		 */
		Scanner scanner = new Scanner(System.in); 
		System.out.print("섭씨->화씨 1 입력, 화씨->섭씨 2 입력 :");
		int tem = scanner.nextInt();
		if(tem == 1) {
			System.out.print("온도 입력(섭씨) :");
			double cel = scanner.nextInt();
			double changeFah = celTofah(cel);
			System.out.println("화씨 온도 :" + changeFah + "F");
		}
		else {
			System.out.print("온도 입력(화씨) :");
			double fah = scanner.nextInt();
			fahTocel(fah);
			System.out.println("섭씨 온도 :" + fahTocel(fah) + "˚");
		}
		
	}

}
