package quiz;

import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;

/*
게임설명 : 업다운게임을 메소드를 이용해 구현한다.
컴퓨터는 1~100사이의 숫자 하나를 생성한다.
총 시도횟수는 7번을 부여한다.
사용자는 7번의 시도안에 숫자를 맞춰야 한다.
사용자가 숫자를 입력했을때 컴퓨터는 높은지/낮은지 알려준다.
7번안에 맞추면 성공, 맞추지 못하면 실패라고 출력한다.
성공/실패 후 계속 할지를 물어보고 1이면 게임 재시작, 0이면 프로그램을 종료한다.
함수를 사용하여 구현한다.
무한루프에 빠지게 된다면 scan.nextLine()을 활용하여 버퍼에 남아있는 Enter키를 제거해주도록 하자.

업다운 게임에 다음 조건에 맞는 예외처리 구문을 추가하시오.
숫자입력시 1~100을 벗어난 경우 사용자정의 예외클래스를 통해 처리하시오
클래스명 : NumberRangeException
게임 재시작 / 종료 입력시 문자를 입력했을때 발생되는 예외를 처리하시오.

 */
public class QuUpDownGame {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		Random random = new Random();
		int gameCount = 0;
		int comNumber = (random.nextInt(100)+1);
		
		while(true) {
			try {
				System.out.print("숫자를 입력: ");
				int inputNumber = scan.nextInt();
				if(!(inputNumber>=1 && inputNumber<=100)) {
					NumberRangeException er = new NumberRangeException();
					throw er;
				}
				if(comNumber>inputNumber) {
					gameCount++;
					System.out.println("Up");
				}
				else if(comNumber<inputNumber) {
					gameCount++;
					System.out.println("Down");
				}
				else if(comNumber==inputNumber) {
					System.out.println("정답");
					gameCount=8;
				}
				if(gameCount==7) {
					System.out.println("실패ㅋ, 계속?(1)그만(0)?: ");
					System.out.println("정답: "+comNumber);
					int reOrStop = scan.nextInt();
					if(reOrStop==1) {
						gameCount=0;
						comNumber = (random.nextInt(10)+1);
						continue;
					}
					else if(reOrStop==0){
						return;
					}
				}
				else if(gameCount==8) {
					System.out.println("성공!!, 계속?(1)그만(0)?: ");
					int reOrStop = scan.nextInt();
					if(reOrStop==1) {
						gameCount=0;
						comNumber = (random.nextInt(10)+1);
						continue;
					}
					else if(reOrStop==0){
						return;
					}
				}
			}
			catch (InputMismatchException e) {
				System.out.println("숫자를 입력해야합니다");
				scan.nextLine();
			}
			catch (NumberRangeException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
class NumberRangeException extends Exception {
	public NumberRangeException() {
		super("1~100사이 숫자를 입력하세요");
	}
}
