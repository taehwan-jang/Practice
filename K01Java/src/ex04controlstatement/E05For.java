package ex04controlstatement;
/*
for문 : while문과 같은 반목문으로, 초기값, 조건식, 증감식이
	한줄에 있어 반복의 횟수를 명시적으로 알 수 있는 반복문이다.ㅣ
	그러므로 사용빈도가 가장 높다.
	형식]
		for(초기값 ; 조건식 ; 증감식) {
			실행문;
		
	실행순서]
		초기값 -> 조건식 확인 ->참일때 실행 -> 증감식
			->조건식 확인 -> 반복실행..->조건이 거짓일때 for문 탈출
 */
public class E05For {

	public static void main(String[] args) {

		
		/*
		for문의 실행순서
		1. 반복을 위한 변수 i를 1로 초기화
		2. 조건을 검사 (i <= 5)
		3. 조건이 참일 경우 실행문을 실행한다.
		4. 바로 조건검사가 아닌 i 의 증감
		5. 조건을 검사 후 참인경우 다시 실행문, 거짓인 경우 for문 탈출
		 */
		for(int i = 1; i <=5; i++) {
			System.out.println("i = " + i);
		}
		/*
		시나리오] 1~100까지의 합을 구하는 프로그램을 for문을
			이용하여 구현하시오.
		 */
		int sum = 0;
		for(int j = 1; j <= 100; j++) {
			sum+=j;
		}
		System.out.println("1~100까지의 합: "+ sum);	
		
		/*
		시나리오] for문을 이용하여 1~10사이의 정수중 2의 배수의 합을
		구하는 프로그램을 작성하시오.
		 */
		int total = 0;
		//방법 1 : 10번 반복하면서 if문을 통해 구현
		for(int i = 1 ; i<= 10 ; i++) {
			if(i % 2 == 0) {
				total += i;
			}
		}
		System.out.println("1~10사이의 2의 배수의 합 : "+ total);
		
		total = 0;
		//방법 2 : i값에 0을 대입하고 증가값 2를 부여하여 if문 없이 구현 
		for(int i = 0; i <= 10; i+=2) {
			total += i;
		}
		System.out.println("1~10사이의 2의 배수의 합(방법2) : "+ total);
		
		/*
		for문으로 무한루프를 만들때 사용.
		 */
//		int a = 1;
//		for(;;) {
//			System.out.println("나는 for문으로 만든 무한루프입니다."+ a);
//			a++;
//		}
		
		/*
		for문의 끝에 ;을 사용하면 반목할 문장이 없는것으로 간주되어
		for문과 상관없이 한번만 실행된다.
		 */
		for(int j = 0 ; j <= 5 ; j++); {//;으로 끝내면 블럭이 종료
			System.out.println("어랏..나는 누구? 여긴 어디?");
		}
		
		System.out.println("위 main함수 지역에서 선언한 변수 total= "+ total);
		
		/*
		for문의 초기식에서 선언된 변수 j는 for문이 종료되는 순간
		메모리에서 소멸된다. 여기서 사용된 변수 j는 지역변수(local variable)
		라고 한다. 지역변수는 해당 지역을 벗어나면 즉시 소멸되는 특징을 
		가지고 있다.
		 */
		
		/*
		for문의 초기값을 외부(늛은지역)에서 선언하면 해당변수는
		for문 안쪽(좁은지역)에서 사용할 수 있다. 즉 아래에 선언한
		변수 i는 main 메소드의 지역변수가 된다.
		 */
		int i = 0;
		for( ; i <= 5 ; i++) {
			System.out.println("for문 안에서의 i값= "+ i);
		}
		System.out.println("for문 밖에서의 i값= "+ i);
		
		/*
		시나리오] 구구단을 출력하는 프로그램을 for문으로 작성하시오.
		 */
		System.out.println("for문으로 제작한 구구단");
		for(int dan = 2 ; dan <= 9 ; dan++) {
			for(int su = 1 ; su <= 9 ; su++) {
				System.out.printf("%-2d*%2d= %2d",dan,su,(dan*su));		
				System.out.print("|");
			}
			System.out.println();
			
			
		}
		/*
        시나리오] 다음의 출력결과를 보이는 for문을 작성하시오
        출력결과
            0 0 0 1
            0 0 1 0
            0 1 0 0
            1 0 0 0
        해법 : x와 y를 더해서 5개 될때 1을 출력한다. 
        이런 아이디어 꼭 생각 못하더라도 외워라 새꺄
         */
		System.out.println("바둑판 모양 출력하기");
		for(int m = 1 ; m <= 4 ; m++) {
			for(int n = 1 ; n <=4 ; n++) {
				if((m+n) == 5) 
					System.out.print("1 ");
				else 
					System.out.print("0 ");
			}
			System.out.println("");
		}
	}

}
