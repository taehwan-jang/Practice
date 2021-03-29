package ex17collection;

import java.util.LinkedList;
import java.util.Scanner;

import common.Student;
/*
사용자로부터 이름을 입력받아 그 이름으로 검색해서 
인덱스 위치(indexOf사용)를 알아내서 해당 인덱스로 
그 객체를 삭제하고 삭제된 객체의 정보(이름,나이,학번)를 
출력하여라.

실행결과]
검색할 이름을 입력하세요:가길동
오버라이딩 한 equals() 호출됨:가길동
[검색되었습니다]
[삭제후 정보출력]
이름:나길동, 나이:20, 학번:2017
이름:다길동, 나이:30, 학번:2016
이름:마길동, 나이:40, 학번:2015

 */
public class QuArrayList {

	public static void main(String[] args) {
	    
		Scanner scan = new Scanner(System.in);
		
	    LinkedList<Student> list = new LinkedList<Student>();
	    
	    Student st1 = new Student("가길동", 10, "2018");
	    Student st2 = new Student("나길동", 20, "2017");
	    Student st3 = new Student("다길동", 30, "2016");
	    Student st4 = new Student("마길동", 40, "2015");
	    
	    list.add(st1);
	    list.add(st2);
	    list.add(st3);
	    list.add(st4);
	        
	    System.out.print("삭제할 이름을 입력: ");
	    String inputName = scan.nextLine();
        int index = -1;
	    for(Student st : list) {
	    	if(st.getName().equals(inputName)){
	    		index=list.indexOf(st);
	    		System.out.println("[검색되었습니다]");
	    	}
	    }
	    if(index==-1) {
	    	System.out.println("[검색결과가 없습니다]");
	    }
	    else {
	    	list.remove(index).showInfo();/*
	    	 		컬렉션에 저장된 객체를 인덱스를 통해 삭제하면
	    	 		삭제된 객체 자체를 반환하므로 멤버메소드를
	    	 		바로 호출할 수 있다.
	    	 		*/
	    }
	    System.out.println("[삭제후 정보출력]");
	    for(Student st : list) {
	    	System.out.println(st.toString());
	    }
	}
}
