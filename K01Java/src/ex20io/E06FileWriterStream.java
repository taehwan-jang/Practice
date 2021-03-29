package ex20io;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

public class E06FileWriterStream {

	public static void main(String[] args) {

		try {
			/*
			자바는 유니코드를 기반으로 문자를 저장한다.
			아래는 문자스트림을 기반으로 해당 OS의 인코딩방식에 맞춰
			문자를 텍스트 파일에 저장한다.
			 */
			char ch1 = 'A';
			char ch2 = 'Z';
			char ch3 = 'Z';
			char ch4 = 'Z';
			char ch5 = 'Z';
			char ch6 = 'Z';
			char ch7 = 'Z';
			char ch8 = 'Z';
			char ch9 = 'Z';
			char ch10 = 'Z';
			char ch11 = 'Z';
			char ch12 = 'Z';
			
			/*
			test.txt 파일을 대상으로 문자 출력 스트림을 생성한다.
			만약 파일이 존재하지 않으면 새롭게 생성한다.
			 */
			Writer out = new FileWriter("src/ex20io/test.txt");
			
			out.write(ch1);
			out.write(ch2);
			out.write(ch3);
			out.write(ch4);
			out.write(ch5);
			out.write(ch6);
			out.write(ch7);
			out.write(ch8);
			out.write(ch9);
			out.write(ch10);
			out.write(ch11);
			out.write(ch12);
			out.close();
		}
		catch (IOException e) {
			System.out.println("문자스트림 작업중 오류발생");
			e.printStackTrace();
		}
		System.out.println("프로그램이 종료"); 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
