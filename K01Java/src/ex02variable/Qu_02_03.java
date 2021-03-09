package ex02variable;
/*
반지름이 10인 원의 넓이를 구해 출력하시오.
단, 면애의 타입을 int, float, double형
세가지로 선언하여 각각 출력해야한다.
변수명] 
    int형 : area_int
    float형 : area_float
    double형 : area_double
공식]
    원의넓이 = 반지름 * 반지름 * 3.14

 */
public class Qu_02_03 {

	public static void main(String[] args) {

		int area_int = (int)(10 * 10 * 3.14);
		float area_float = (float)(10 * 10 * 3.14);
		double area_double = 10 * 10 * 3.14;
		
		System.out.println("int형 넓이 : " + area_int);
		System.out.println("float형 넓이 : " + area_float);
		System.out.println("double형 넓이 : " + area_double);
		//형변환 다시 한번 공부해볼것. float 헷갈림
	}

}
