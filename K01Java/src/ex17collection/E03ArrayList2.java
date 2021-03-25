package ex17collection;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;

import common.Student;

public class E03ArrayList2 {

	public static void main(String[] args) {

		/*
		아래 2개의 컬렉션은 내부적인 자료구조만 다를뿐, 구현방법은
		완전히 동일하다.
		컬렉션 생성시 Student형의 타입매개변수를 사용한다.
		 */
//		ArrayList<Student> list2 = new ArrayList<Student>();
		LinkedList<Student> list2 = new LinkedList<Student>();
		
//		개발자가 정의한 인스턴스 생성(외부패키지에 정의함)
		Student st1 = new Student("정우성", 10, "2014");
		Student st2 = new Student("원빈", 20, "2012");
		Student st3 = new Student("장동건", 30, "2015");
		Student st4 = new Student("공유", 40, "2018");
		
//		컬렉션에 인스턴스 저장
		list2.add(st1);
		list2.add(st2);
		list2.add(st3);
		list2.add(st4);
		list2.add(st2);//객체 중복저장 가능함
		
		System.out.println("[중복저장후]");
		for(Student st : list2) {
			st.showInfo();
		}
		int index = list2.indexOf(st2);
		System.out.println(index);
		/*
		객체삭제 : 인덱스가 아닌 인스턴스의 참조값을 통해 삭제하는경우
			중복된 객체가 있으면 앞에 있는 객체 하나만 삭제된다.
		 */
		list2.remove(st2);
		System.out.println("[중복저장객체 삭제]");
		for(Student st : list2) {
			st.showInfo();
		}
		System.out.println("[반복자 사용]");
		Iterator<Student> it2 = list2.iterator();
		while(it2.hasNext()) {
//			Student student = it2.next();
//			student.showInfo();
			/*
			위 2줄의 코드를 아래 1줄로 고칠 수 있다.
			*/
			it2.next();
		}
		//List계열의 컬렉션은 인덱스로 접근 가능함
		System.out.println("[일반 for문 사용]");
		for(int i=0 ; i<list2.size() ; i++) {
			list2.get(i).showInfo();
		}
		
		System.out.println("[확장 for문 사용]");
		for(Student st : list2) {
			st.showInfo();
		}
		//인덱스를 통한 삭제
		System.out.println("삭제된 객체의 이름: "+list2.remove(2).getName());
		//인스턴스 참조값을 통한 삭제
		list2.remove(st1);
		System.out.println("[인스턴스 삭제 후]");
		for(Student st : list2) {
			st.showInfo();
		}
		
	}

}
