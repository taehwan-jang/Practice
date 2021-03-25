package ex17collection;

import java.util.ArrayList;
import java.util.Iterator;

/*
ArrayList<E> : List계열의 컬렉션
-데이터의 중복 저장이 허용된다.
-데이터의 저장 순서를 보장한다.
-데이터 접근시 get() 혹은 iterator()를 이용한다.
-Array라는 이름처럼 '배열'의 특성을 가지고있어
	index를 통한 저장 및 접근이 가능하다
 */
public class E03ArrayList {
	
	public static void main(String[] args) {
		
		/*
		만약 아래와 같이 타입매개변수 부분을 생략하거나 Object로 설정하면
		모든 객체를 저장할 수 있는 컬렉션을 정의할 수 있다.
		ArrayList list = new ArrayList();
		ArrayList<Object> list = new ArrayList<Object>();
		*/
		ArrayList<String> list = new ArrayList<String>();
		
		/*
		1-1]객체저장 add()메소드
			add(객체) : 순차적으로 저장하면서 인덱스는 0부터 자동으로
				부여한다.
			add(인덱스,개체) : 인덱스를 직접 부여하여 객체를 저장한다.
				단, 인덱스를 건너뛰면 예외가 발생한다.
			size() : 컬렉션에 저장된 객체의 갯수를 반환한다. 배열의
				크기와 동일하다고 생각하면 된다.
		 */
		list.add("소녀시대");
		list.add("빅뱅");
		list.add("트와이스");
		list.add(3,"워너원");
//		list.add(5,"소방차");인덱스를 건너뛸 수 없다
		list.add(list.size(),"오마이걸");
		list.add(list.size(),"방탄소년단");
		System.out.println("중복저장전 객체수: "+list.size());
		/*
		1-2]중복저장
			: List는 배열의 속성을 가지므로 데이터의 중복이 허용된다.
			add()메소드는 추가에 성공한 경우 true를 반환한다.
		 */
		System.out.println(list.add("트와이스")?"중복ㅇㅋ":"중복ㄴㄴ");
		System.out.println(list.add("트와이스"));
		System.out.println("중복저장후 객체수: "+list.size());
		
		/*
		1-3]리스트 컬렉션 출력하기(for,확장for 활용)
			: 컬렉션을 다룰때는 주로 확장 for문을 사용한다.
			get(인덱스) : 인덱스에 해당하는 객체를 반환한다.
		 */
		System.out.println("\n[일반for문 사용]");
		for(int i=0; i<list.size() ; i++) {
			System.out.print(list.get(i)+" "); 
		}
		System.out.println("\n[확장for문 사용]");
		for(String str : list) {
			System.out.print(str + " ");
		}
		/*
		1-4]Iterator 사용법
		1.컬렉션에 저장된 내용을 Iterator에게 알려주기 위해 객체를
			생성한다.
		2.hasNext()로 반환할 객체가 있는지 검사하고, next()로
			해당 객체를 반환한다.
		3. 모든 객체가 반환되었다면 hasNext()에서 false를 반환한다.	
		 */
		System.out.println("\n[반복자(Iterator)사용]");
		Iterator itr = list.iterator();
		while(itr.hasNext()) {
			System.out.print(itr.next()+" ");
		}
		System.out.println("\n---------------------------");
		
		/*
		1-4]덮어쓰기
			: 기존의 내용을 변경한다. 기존의 내용은 삭제된다.
			set(인덱스, 객체)
		 */
		list.set(4, "오마이걸>덮어쓰기");
		for(String str : list) {
			System.out.print(str + " ");
		}
		System.out.println("\n---------------------------");
		/*
		1-5]끼워넣기
			add(삽입할 인덱스,객체) : 해당 인덱스에 삽입하고
				기존데이터는 자동으로 뒤로 밀리게 된다.
		 */
		list.add(4,"블랙핑크>끼워넣기");
		for(String str : list) {
			System.out.print(str + " ");
		}
		System.out.println("\n---------------------------");
		/*
		1-6]포함여부 확인
			contains(객체) : 찾고자 하는 객체가 있는경우 true를
				반환한다. 위치한 인덱스까지는 확인할 수 없다.
		 */
		System.out.println(list.contains("빅뱅")?"있음":"없음");
		System.out.println(list.contains("블랙핑크")?"있음":"없음");
		/*
		1-7]삭제
		방법1 : 인덱스로 삭제하기.
			remove(인덱스) : 인덱스를 통해서 삭제를 진행한 후
				완료되면 해당 객체를 반환한다. 삭제후에는 인덱스가
				자동으로 재부여된다. 삭제 성공시 해당객체를 반환하므로
				어떤 객체가 삭제되었는지 확인이 가능하다.
		 */
		//방법1
		String str = list.remove(2);
		System.out.println("삭제된 개체:"+str);
		//방법2 : indexOf()를 통해 인덱스를 찾은후 삭제
		int index = list.indexOf("빅뱅");
		System.out.println("빅뱅의 index:"+index);
		list.remove(index);
		//방법3 : 인스턴스의 참조값을 통해 삭제 왜 "방탄소년단"이 참조값일까? 
		System.out.println(list.remove("방탄소년단")?"삭제성공":"삭제실패");
		list.remove("오마이걸");
		System.out.println("오마이걸 삭제 후 출력");
		for(String st : list) {
			System.out.print(st +" ");
		}
		System.out.println();
		/*
		1-8] 전체삭제
		 */
		list.removeAll(list);//방법1
		list.clear();//방법2
		System.out.println("전체삭제후 객체수:"+list.size());
		
	}
}
