package ex12inheritance;

/*
가변인자(VariableArgument)
	: 메소드 오버로딩을 대체할 수 있는 문법으로 하나의 
	메소드로 여러가지 호출형식을 대체할 수 있다.
	형식]
		메소드명(자료형 ... 매개변수명){
			실행문;
		}
	-필요에 따라 매개변수를 가변적으로 조정할 수 있는문법으로
	JDK1.5부터 지원한다.
	-매개변수는 여러개를 한꺼번에 받아야 하므로 배열로 반환된다.
 */
public class E08VariableArgument {

//	static int getTotal(int param) {
//		int total = 0;
//		total += param;
//		return total;
//	}
//	static int getTotal(int param1, int param2) {
//		int total = 0;
//		total += (param1+param2);
//		return total;
//	}
//	static int getTotal(int param1, int param2, int param3) {
//		int total = 0;
//		total += (param1+param2+param3);
//		return total;
//	}
//	static int getTotal(int param1, int param2, int param3, int param4) {
//		int total = 0;
//		total += (param1+param2+param3+param4);
//		return total;
//	}
	
	//가변인자를 통한 메소드 정의
	/*
	가변인자를 통한 메소드 정의시 매개변수가 하나의 타입일때만
	가능하다. 둘 이상의 타입이라면 정의할 수 없다.
	 */
	static int getTotal(int ... param) {
		int total = 0;
		for(int i=0 ; i<param.length ; i++) {
			total += param[i];
		}
		return total;
	}
	public static void main(String[] args) {

		System.out.println("getTotal(args1)호출: "+getTotal(10));
		System.out.println("getTotal(args1,args2)호출: "+getTotal(10,20));
		System.out.println("getTotal(args1,args2,args3)호출: "+getTotal(10,20,30));
		System.out.println("getTotal(args1,args2,args3,args4)호출: "+getTotal(10,20,30,40));
		System.out.println("getTotal(매개변수6개)호출: "+getTotal(10,20,30,40,50,60));
		
//		System.out.println("getTotal(args1,args2)호출: "+getTotal(10,20.3));
//		가변인자 매개번수의 타입이 int로 정의되었기 때문에 double이 포함되어 호출이 불가능함.
		
	}

}
