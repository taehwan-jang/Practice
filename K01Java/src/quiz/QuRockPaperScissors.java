package quiz;

import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;

/*
게임설명 : 가위바위보 게임을 메소드를 통해 구현한다.
난수생성기를 이용하여 1, 2, 3중 하나의 숫자를 생성한다.
사용자가 가위(1),바위(2),보(3) 중 하나를 낸다.
승부를 판단하여 출력한다.
1,2,3 이외의 숫자를 입력하면 잘못된 입력을 알려주고 재입력을 요구한다.
숫자입력을 잘못한 경우는 게임횟수에 포함하지 않는다.
게임은 5번 진행하고 5번째 게임을 끝내면 다시할지 물어본다. 재시작(1), 종료(0)
0, 1 이외의 숫자를 입력하면 재입력을 요구해야 한다.

 */
class WrongNumberException extends Exception {
	public WrongNumberException(){
		super("****1~3 입력****");
	}
	public WrongNumberException(int a){
		super("****0~1 입력****");
	}
}
public class QuRockPaperScissors {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		Random ran = new Random();
		int gamecount = 0;
		
		while(true) {
			int comN = ran.nextInt(3)+1;
			try {
				System.out.print("무엇을 내시겠습니까(1.가위 2.바위 3.보): ");
				int inputN = scan.nextInt();
				if(!(inputN>0 && inputN<4)) {
					WrongNumberException er = new WrongNumberException();
					throw er;
				}
				if(comN==1 && inputN==1) {
					System.out.println("컴퓨터: 1.가위");
					System.out.println("비김");
					gamecount++;
				}
				else if(comN==1 && inputN==2) {
					System.out.println("컴퓨터: 1.가위");
					System.out.println("★이김★");
					gamecount++;
				}
				else if(comN==1 && inputN==3) {
					System.out.println("컴퓨터: 1.가위");
					System.out.println("짐");
					gamecount++;
				}
				if(comN==2 && inputN==1) {
					System.out.println("컴퓨터: 2.바위");
					System.out.println("짐");
					gamecount++;
				}
				else if(comN==2 && inputN==2) {
					System.out.println("컴퓨터: 2.바위");
					System.out.println("비김");
					gamecount++;
				}
				else if(comN==2 && inputN==3) {
					System.out.println("컴퓨터: 2.바위");
					System.out.println("★이김★");
					gamecount++;
				}
				if(comN==3 && inputN==1) {
					System.out.println("컴퓨터: 3.보");
					System.out.println("이김");
					gamecount++;
				}
				else if(comN==3 && inputN==2) {
					System.out.println("컴퓨터: 3.보");
					System.out.println("짐");
					gamecount++;
				}
				else if(comN==3 && inputN==3) {
					System.out.println("컴퓨터: 3.보");
					System.out.println("★이김★");
					gamecount++;
				}
				if(gamecount==5) {
					System.out.println("5번 게임 끝, 계속?(1)그만(0)?: ");
					int reOrStop = scan.nextInt();
					if(reOrStop==1) {
						gamecount=0;
						continue;
					}
					else if(reOrStop==0){
						return;
					}
				}
			}
			catch (InputMismatchException e) {
				/*
				정수를 입력받으라고 만들어놓은애..
				ex) 1 + enter ->정상
					ㅁ + enter -> 무한루프 발생
					ㅁ을 보자마자 에러 빵 날리고 버퍼에 enter가 
					남아있기때문에 int inputN = scan.nextInt();
					를 계속 스킵해 그래서 enter를 제거시켜야해
					nextInt() 혹은 nextLine()을 입력하면
					입력됐던게 인식이 되어서 할당됨 
				 */
				System.out.println("숫자를 입력");
				scan.nextLine();
			}
			catch (WrongNumberException e) {
				System.out.println(e.getMessage());
			}
			
		}
	}
}
