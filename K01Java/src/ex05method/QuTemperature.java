package ex05method;

import java.util.Scanner;

/*
섭씨(Celsius)를 입력받아서 화씨(Fahrenheit)로 변환하여 리턴하는 함수와 화씨를 입력받아서 섭씨로 변환하여 리턴하는 함수를 만들어라.

공식]
화씨 = 1.8 * 섭씨 + 32
섭씨 = (화씨 - 32) / 1.8

 */
public class QuTemperature {

	static void celTofah(int celsius) {
		
		double fah = 1.8 * celsius + 32 ;
		System.out.println("화씨 온도 :" + fah + "F");
	}
	static void fahTocel(int fahrenheit) {
		
		double cel = (fahrenheit - 32) / 1.8 ;
		System.out.println("섭씨 온도 :" + cel + "˚");

	}
	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in); 
		System.out.print("섭씨->화씨 1 입력, 화씨->섭씨 2 입력 :");
		int tem = scanner.nextInt();
		if(tem == 1) {
			System.out.print("온도 입력(섭씨) :");
			int cel = scanner.nextInt();
			celTofah(cel);
		}
		else {
			System.out.print("온도 입력(화씨) :");
			int fah = scanner.nextInt();
			fahTocel(fah);
		}
		
	}

}
