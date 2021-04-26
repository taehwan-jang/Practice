package bogang;

import java.util.Scanner;

public class Test {
public static void main(String[] args) {
	gameStart();
}
	public static void gameStart() {
		Scanner scan = new Scanner(System.in);
		int x=1;
		int y=1;
		int a=1;
		int b=1;
		char[][] game = new char[3][3];
		int count =0;
		while(true) {
			System.out.println("\n좌표입력[x(1~3),y(1~3)]\n");
			String pla1 = scan.next();
			x=pla1.charAt(0)-'0';
			y=pla1.charAt(2)-'0';
			a=pla1.charAt(0)-'0';
			b=pla1.charAt(2)-'0';
			game[x-1][y-1]='O';
			game[a-1][b-1]='X';
			count++;
			for(int i=0 ; i<game.length ; i++) {
				for(int j =0 ; j<game[i].length ; j++) {
					if(j==0) {
						System.out.print(" "+game[i][j]);
					}
					else if(j==2){
						System.out.print(game[i][j]);
					}
					else {
						System.out.print(" │ "+game[i][j]+" │ ");
					}
				}
				if(i!=2)
					System.out.println("\n───┼───┼───");
			}
			
			if(game[0][0]=='O'&&game[1][1]=='O'&&game[2][2]=='O') {
				System.out.println("player1 승리");
				break;
			}
			else if(game[0][2]=='O'&&game[1][1]=='O'&&game[2][0]=='O') {
				System.out.println("player1 승리");
				break;
			}
			else if(game[0][0]=='O'&&game[0][1]=='O'&&game[0][2]=='O') {
				System.out.println("player1 승리");
				break;
			}
			else if(game[1][0]=='O'&&game[1][1]=='O'&&game[1][2]=='O') {
				System.out.println("player1 승리");
				break;
			}
			else if(game[2][0]=='O'&&game[2][1]=='O'&&game[2][2]=='O') {
				System.out.println("player1 승리");
				break;
			}
			else if(game[0][0]=='O'&&game[1][0]=='O'&&game[2][0]=='O') {
				System.out.println("player1 승리");
				break;
			}
			else if(game[0][1]=='O'&&game[1][1]=='O'&&game[2][1]=='O') {
				System.out.println("player1 승리");
				break;
			}
			else if(game[0][2]=='O'&&game[1][2]=='O'&&game[2][2]=='O') {
				System.out.println("player1 승리");
				break;
			}
			else if(game[0][0]=='X'&&game[1][1]=='X'&&game[2][2]=='X') {
				System.out.println("player2 승리");
				break;
			}
			else if(game[0][2]=='X'&&game[1][1]=='X'&&game[2][0]=='X') {
				System.out.println("player2 승리");
				break;
			}
			else if(game[0][0]=='X'&&game[0][1]=='X'&&game[0][2]=='X') {
				System.out.println("player2 승리");
				break;
			}
			else if(game[1][0]=='X'&&game[1][1]=='X'&&game[1][2]=='X') {
				System.out.println("player2 승리");
				break;
			}
			else if(game[2][0]=='X'&&game[2][1]=='X'&&game[2][2]=='X') {
				System.out.println("player2 승리");
				break;
			}
			else if(game[0][0]=='X'&&game[1][0]=='X'&&game[2][0]=='X') {
				System.out.println("player2 승리");
				break;
			}
			else if(game[0][1]=='X'&&game[1][1]=='X'&&game[2][1]=='X') {
				System.out.println("player2 승리");
				break;
			}
			else if(game[0][2]=='X'&&game[1][2]=='X'&&game[2][2]=='X') {
				System.out.println("player2 승리");
				break;
			}
			else if(count==9) {
				System.out.println("무승부");
				break;
			}

				
			
			
			
		}
		
	}

}
