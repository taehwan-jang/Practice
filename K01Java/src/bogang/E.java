package bogang;

import java.util.ArrayList;
import java.util.Scanner;
import common.Student;

/*
사용자로부터 이름을 입력받아 그 이름으로 검색해서 인덱스 위치(indexOf사용)를 
알아내서 해당 인덱스로 그 객체를 삭제하고 삭제된 객체의 정보(이름,나이,학번)를 출력하여라
 */

public class E {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		int index=0;
		
		ArrayList<Student> list = new ArrayList<Student>();
		
		//저장할 객체 생성
		Student st1 = new Student("가길동", 10, "2018");
		Student st2 = new Student("나길동", 20, "2017");
		Student st3 = new Student("다길동", 30, "2016");
		Student st4 = new Student("마길동", 40, "2015");
		
		//객체 추가(컬렉션에 저장)
		list.add(st1);
		list.add(st2);
		list.add(st3);
		list.add(st4);
			
		//1.검색할 이름을 입력받음
		System.out.println("이름을 입력하세요");
		String searchName = sc.next();
			
		//2.확장for문으로 컬렉션 전체를 접근
		for(Student student : list) {
			if(student.getName().equals(searchName)==true) {
				System.out.println("[검색되었습니다.]");
				System.out.println("[석제후 정보출력.]");
				
				index = list.indexOf(student);
			}
		}
		//검색결과 없을때…검색결과가 없다고 출력
		if(index==0) {
			System.out.println("[결과가없습니다.]");
		}
		//검색결과 있을때…검색된 데이터 삭제
		else {
			list.remove(index);
		}
		
		//4.전체정보 출력
		for(Student student : list) {
			student.showInfo();
		}
			
		//검색할 이름을 입력하세요:가길동
		//오버라이딩 한 equals() 호출됨:가길동
		//[검색되었습니다]
		//[삭제후 정보출력]

	}

}