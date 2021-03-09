package ex04controlstatement;
/*
public static void main(String[] args)
{
    int num1=50, num2=100;
    int big, diff;

    big = (num1>num2)? num1:num2; //조건?참:거짓;
    System.out.println(big);

    diff = (num1>num2)? num1-num2: num2-num1;
    System.out.println(diff); 
}
삼항연산자 쓰지말고 if~else 문으로 만들것
 */
public class Qu_04_05 {

	public static void main(String[] args) {

		int num1 = 50, num2 = 100;
		int big, diff;
		
		if(num1 > num2) {
			big = num1;
			diff = num1 - num2;
			System.out.println(big);
			System.out.println(diff);
		}
		else {
			big = num2;
			diff = num2 - num1;
			System.out.println(big);
			System.out.println(diff);
		}
		
		
	}

}
