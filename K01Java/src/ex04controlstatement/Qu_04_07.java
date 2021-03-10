package ex04controlstatement;
/*
 1~100까지의 숫자중 3의배수 이거나 7의배수인 숫자의 합을 
 구하는 프로그램을 작성하시오. 단, 3과 7의 공배수인 경우 
 합에서 제외해야 한다.  출력의결과는 누적되는 모든 수를 
 콘솔에 print한다.
 */
public class Qu_04_07 {

	public static void main(String[] args) {

		int num = 1;
		int total = 0;
		do {
			if(num % 3 == 0 || num % 7 == 0) 
				if(num % 21 != 0) {
					System.out.print(num);
					if(num >= 99) break;
					System.out.print(" + ");
				}
					total += num;
				num++;
		}while(num <= 100);
		System.out.print(" = "+ total);
	}
}
