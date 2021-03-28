package quiz;

import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;

/*
1~9까지 난수 3개 생성 (중복되지 않는)
for문으로 비교해서

-> 난수 결과: abc ->배열에 저장

사용자 숫자 입력 -> 배열에 저장

for문으로 배열 요소 비교 equals? compare?

int st,ba,out

 숫자와 위치 일치->strike
st++;
 숫자만 일치 -> ball
ba++;
 3개 다 다름 -> 1out
out++

if st==3 -> 게임 승리
시도 횟수 출력

printf ("%dStrike%dBall%dOut",st,ba,out)

계속 or 그만 출력

 */
public class QuBaseballGame {

	public static int[] makeArr() {
		Scanner scan = new Scanner(System.in);
		Random random = new Random();
		int[] com = new int[3];

		while(true) {
			for(int i=0 ; i<com.length ; i++) {
				com[i] = (random.nextInt(9)+1);
			}
			if(!(com[0]==com[1] || com[0]==com[2] || com[1]==com[2])) {
				break;
			}
		}
		return com;
		
	}
	public static void gamePlay() {
		
		Scanner scan = new Scanner(System.in);
		Random random = new Random();
		
		int[] com = makeArr();
		int[] arr = new int[3];
		int st = 0;
		int ba = 0;
		int out = 0;
		int gameCount=0;
		
		while(true) {
			try {
				st=0;
				ba=0;
				out=0;
//				System.out.println();
//				for(int i=0 ; i<arr.length ; i++) {
//					System.out.print(com[i]+"|");
//				}
				System.out.println();
				System.out.print("1~9 숫자 3개를 입력하세요 ex)1 2 3: ");
				for(int i=0 ; i<arr.length ; i++) {
					arr[i] = scan.nextInt();
//					System.out.print(arr[i]+"|");
				}
//				System.out.println();
				for(int i=0 ; i<arr.length ; i++) {
					for(int j=0 ; j<arr.length ; j++) {
						if(i==j) {
							if(arr[i]==com[j]) 
								st++;
						}
						else if (arr[i]==com[j]){
							ba++;
						}
					}
				}
				gameCount++;
				out =3-(st+ba);
				System.out.printf("스코어:|%d Strike | %d Ball | %d Out |\n\n",st,ba,out);
				if(st==3) {
					System.out.println("====정답====");
					for(int i=0 ; i<arr.length ; i++) {
						System.out.print(com[i]+"|");
					}
					System.out.println();
					System.out.println("Win!! 시도횟수:"+gameCount+"회");
					if(reStart()) {
						gameCount=0;
						com = makeArr();
						continue;
					}
					else {
						return;
					}
				}
			}
			catch (InputMismatchException e) {//필요한 예외 ->숫자 범위, 숫자 아닌거, 입력자리수?
				System.out.println("숫자를 입력하라고");
				scan.nextLine();
			}
		}
	}
	
	public static boolean reStart() {
		Scanner scan = new Scanner(System.in);
		while(true) {
			try {
				System.out.printf("다시(1)?그만(0)?:");
				int reOrnot = scan.nextInt();
				if(reOrnot==1) {
					return true;
				}
				else if(reOrnot==0){
					return false;
				}
			}
			catch (InputMismatchException e) {
				scan.nextLine();
			}
			System.out.println("0이나 1을 입력");
		}
	}
	public static void main(String[] args) {

		gamePlay();
	}
}
