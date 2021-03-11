package ex05method;
/*
재귀메소드의 오류코드
	1. 감소연산자로 인해 cnt 값은 차감됨
	2. 조건식의 위치가 잘못됨
	3. 재귀호출을 하기 전에 return을 반환할 수 있도록 수정해야함.

stack overflow(스택오버플로우)
	: 스택은 함수가 종료되기 전까지의 모든 정보를 저장하는 메모리로
	유한한 공간이므로 무한루프에 빠지게되면 저장능력을 초과하여
	해당 에러가 발생하게 된다.
 */
public class E08RecursivError {

	
	static void showHi(int cnt) {
		System.out.println("hi");
		System.out.println("cnt= "+ cnt);
//		
//		showHi(--cnt);
//		if(cnt == 1) {
//			return;
//		} //->stack overflows error ->무한루프에 빠진 메소드;
////			메소드 return 조건의 위치가 잘못됌 if 를 만날 수 없음;
		
		if(cnt==1) {
			return;
		}
		showHi(--cnt);
	}
	
	public static void main(String[] args) {
		showHi(3);
	}

}
