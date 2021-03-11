package ex05method;
/*
메소드형식4] 매개변수도 있고 반환값도 있는 형식으로
	4가지 형식 중 가장 많이 사용되는 형태의 메소드이다.
 */
import java.util.Scanner;

/*
시나리오] 인원수를 매개변수로 전달받아 인원수 만큼 나이를
	입력받아 그 나이의 합을 반환하는 메소드를 작성하시오.
 */
public class E05MethodType04_1 {

	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("사람 수를 입력하세요 : ");
		
		int personCnt = scanner.nextInt();
		int sumOfAge = getTotalAge(personCnt);
		
		System.out.println("입력받은 나이의 합은? : "+sumOfAge);
		int ageAvg = sumOfAge / 3; 
		System.out.print("평균나이? : "+ageAvg);
		
	}
	
	static int getTotalAge(int personCnt) {
		
		Scanner scanner = new Scanner(System.in);
		int sumAge = 0;//나이의 누적합을 저장할 변수;
		
		//전달받은 사람의 수만큼 반복하면서 나이를 입력받는다.
		for(int n = 1 ; n <=personCnt ; n++) {
			System.out.print(n+"번째 사람의 나이 :");
			int age = scanner.nextInt();
			sumAge += age;
		}
		//나이의 합을 반환한다. line 19로;
		return sumAge;
	}

}
