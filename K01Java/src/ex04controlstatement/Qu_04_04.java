package ex04controlstatement;
/*
public static void main(String[] args)
{
     int num = 120;
     if (num > 0) {
        if ((num % 2) == 0) {
            System.out.println("양수이면서 짝수");
        }
     }
}
하나의 if 문으로 고칠것
 */
public class Qu_04_04 {

	public static void main(String[] args) {
		
		int num = 120;
		if (num > 0 && num %2 ==0) {
			System.out.println("양수이면서 짝수");
		}
		else if (num >0 && num %2 != 0){
			System.out.println("양수이면서 홀수");
		}
		else if (num <0 && num %2 == 0){
			System.out.println("음수이면서 짝수");
		}
		else {
			System.out.println("음수이면서 홀수");
		}
	}

}
