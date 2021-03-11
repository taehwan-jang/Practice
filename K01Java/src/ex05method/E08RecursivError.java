package ex05method;
/*
재귀함수(RecursiveMethod)
	: 하나의 함수에서 자신을 다시 호출하여	작엽을
	수행하는 방식으로 문제를 해결하는 메소드를 말한다.
	순환호출이라고 표현하기도 한다.
 */
public class E08RecursivError {

	
	static void showHi(int cnt) {
		System.out.println("hi");
		System.out.println("cnt= "+ cnt);
		
//		showHi(--cnt);
//		if(cnt == 1) {
//			return;
//		} ->stack overflows error ->무한루프에 빠진 메소드;
//			메소드 return 조건의 위치가 잘못됌 if 를 만날 수 없음;
		
		if(cnt==1) {
			return;
		}
		showHi(--cnt);
	}
	
	public static void main(String[] args) {
		showHi(3);
	}

}
