package ex07string;
/*
StringBuffer 클래스
	: String 클래스는 기존 문자열에 새로운 문자열을 추가하면
	새롭게 생성된 메모리에 문자열을 저장한다. 기존 메모리가 소멸되고
	새로운 메모리가 생성되는 낭비를 막기 위해, 문자열을 변경이 많은
	경우라면 StringBuffer 클래스를 주로 사용한다. 해당 클래스는
	기존 메모리의 문자열을 변경하는 방식으로 문자열을 추가한다.
	StringBuffer를 선언할때는 String과는 달리 ""만으로는 안됨
	반드시 StirngBuffer sample = new StringBuffer("문자열");로 
	선언해야함.
 */
public class E03StringBuilderBuffer {

	public static void main(String[] args) {
		
		/*
		append() : 문자열의 끝에 새로운 문자열을 연결한다.
		insert() : 저장한 인덱스 위치에 문자열을 삽입한다.
		 */
		StringBuffer strBuf = new StringBuffer("AB");
		strBuf.append(25);
		strBuf.append("Y").append(true);
		System.out.println("strBuf="+ strBuf);

		strBuf.insert(2, false);
		strBuf.insert(strBuf.length(), 'Z');
		System.out.println("strBuf="+ strBuf);
		
		System.out.println("[String과 StringBuffer의 "+
		"참조값 비교]");
		String str1 = "코스모";
		String str2 = "코스모";
		
		if(str1==str2) {
			System.out.println("연결전:주소값동일");
		}
		else {
			System.out.println("연결전:주소값다름");
		}
		
		str1 = str1 +" 영원하라";
		if(str1==str2) {
			System.out.println("연결후:주소값동일");
		}
		else {
			System.out.println("연결후:주소값다름");
		}
		
		//기조ㅗㄴ의 메모리를 유지하면서 버퍼의 크기를 조절한다.
		StringBuffer buf = new StringBuffer();
		System.out.println("buf="+ buf);
		System.out.println("저장된 문자열크기:"+buf.length());
		System.out.println("기본버퍼크기:"+buf.capacity());
		
		buf.append("KOSMO");
		System.out.println("buf="+ buf);
		System.out.println("저장된 문자열크기:"+buf.length());
		System.out.println("기본버퍼크기:"+buf.capacity());
		
		buf.append(" 금일은 StringBuffer공부중 ").append("오늘은 월요일");
		System.out.println("buf="+ buf);
		System.out.println("저장된 문자열크기:"+buf.length());
		System.out.println("기본버퍼크기:"+buf.capacity());
		
		
		
		
		
		
	}

}
