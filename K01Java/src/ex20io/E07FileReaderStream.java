package ex20io;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.Reader;

public class E07FileReaderStream {

	public static void main(String[] args) {
		
		try {
			//버퍼로 사용할 크기가 10인 char형 배열생성
			char[] cbuf = new char[12];
			int readCnt;
			
			//txt파일을 대상으로 문자입력 스트림을 생성
			Reader in = new FileReader("src/ex20io/test.txt");
			
			//배열 cbuf에 앞에서부터 최대 12개의 문자를 읽어서 저장한다.
			readCnt = in.read(cbuf, 0, 12);
			System.out.println(readCnt);
			for(int i=0 ; i<readCnt ; i++) {
				System.out.println(cbuf[i]);
			}
			in.close();
			
			
		} catch (FileNotFoundException e) {
			System.out.println("파일없음");
		}
		catch (Exception e) {
			System.out.println("IO오류 발생");
		}
	}
}
