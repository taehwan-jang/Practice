package ex10accessmodifier;

//과일판매자로 추상화한 클래스
class FruitSeller5 {
	
	//멤버변수와 상수를 선언
	int numOfApple;//판매자의 사과보유 갯수
	int myMoney; //판매자 판매수익
	final int APPLE_PRICE;//(컨트롤쉬프트x 대문자 y 소문자)
	
	/*
	상수는 값의 변경이 불가능하고, 단 한번만 초기화되기 때문에
	일반 멤버메소드에서는 초기화를 할 수 없다.
	하지만 생성자 메소드는 객체생성시 한번만 호출되고, 개발자가
	마음대로 호출할 수 없으므로 한번이상 초기화되지 않음이 보장된다.
	따라서 멤버상수는 생성자 메소드에서는 초기화 할 수 있다.
	 */
	public FruitSeller5(int money, int appleNum, int price) {
		myMoney = money;
		numOfApple = appleNum;
		APPLE_PRICE = price;
	}
	/*
	판매자가 사과를 판매하는 행위를 표현한 멤버메소드
	1. 구매자로부터 금액을 전달받는다.(매개변수)
	2. 매개변수(금액)/사과의 단가 = 판매할 사과의 갯수 를 구함 (5000/1000=5개)
	3. 보유한 사과의 갯수에서 판매할 갯수를 차감한다.(100-5=95개)
	4. 판매수익이 증가한다.(5000원 증가)
	5. 구매자에게 사과의 갯수를 반환한다
	 */
	public int saleApple(int money) {
		int num = money / APPLE_PRICE;
		numOfApple -= num;
		myMoney += money;
		return num;
	}
	//판매자의 현재상태
	public void showSaleResult() {
		System.out.println("[판매자]남은 사과갯수: "+numOfApple);
		System.out.println("[판매자]판매 수익: "+myMoney);
	}
	
}
//구매자를 표현한 클래스
class FruitBuyer5 {
	
	int myMoney;//보유금액
	int numOfApple;//구매한 사과의 갯수
	
	//멤버변수 초기화를 위한 생성자메소드
	public FruitBuyer5(int _myMoney, int _numOfApple) {
		myMoney = _myMoney;
		numOfApple = _numOfApple;
	}
	/*
	구매자가 판메자에게 사과를 구매하는 행위를 표현한 멤버메소드
	1. 판매자에게 금액을 지불한다.
	==여기서 seller객체의 saleApple()메소드가 호출된다.==
	2. 판매자가 금액에 해당하는 사과를 갯수로 반환하면, 해당 갯수만큼
		보유한 사과의 갯수를 증가시킨다.
	3. 판매자에게 지불한 금액만큼 차감된다.
	 */
	public void buyApple(FruitSeller5 seller, int money) {
		numOfApple += seller.saleApple(money);
		myMoney -= money;
	}
	//구매자의 현재상태 출력
	public void showBuyResult() {
		System.out.println("[구매자]현재 잔액: "+ myMoney);
		System.out.println("[구매자]사과 갯수: "+ numOfApple);
	}
	
}
public class E02FruitSalesMain5 {

	public static void main(String[] args) {

		
		/*
		초기화 메소드를 정의하였으므로, 각각 성격이 다른 객체들을
		생성할 수 있다.
		 */
		//판매자1 : 사과갯수 100개 단가 1000원
		FruitSeller5 seller1 = new FruitSeller5(0,100,1000);
		
		//판매자2 : 사과갯수 80개 단가 500원
		FruitSeller5 seller2 = new FruitSeller5(0,80,500);
		
		//구매자 : 보유금액 10000원
		FruitBuyer5 buyer = new FruitBuyer5(10000,0);
		
		System.out.println("[구매행위가 일어나기전의 상태]");
		
		seller1.showSaleResult();
		seller2.showSaleResult();
		buyer.showBuyResult();
		
		//판매자1, 판매자2에게 각각 5000원을 지불하고 구매
		buyer.buyApple(seller1,	5000);
		buyer.buyApple(seller2,	5000);
		
		System.out.println("[구매행위가 일어난 후 상태]");
		
		seller1.showSaleResult();
		seller2.showSaleResult();
		buyer.showBuyResult();
		
		/*
		아래의 코드는 문법적으로는 오류가 없으나 지불금액과 구매한 
		사과의 관계가 전혀 맞지않는 논리적 오류가 발생되었다.
		즉, 코드(메소드)로 구현된 규책이 완전히 무너지게 된다.
		객체지향 프로그래밍에서는 이런 오류를 막기 위해 멤버변수에
		대한 "정보은닉"을 하도록 규정하고 있다.
		 */
		
		seller1.myMoney += 1000; //판매자1에게 1000원을 지불하고
		buyer.myMoney -= 1000;
		seller1.numOfApple -= 50;//사과 50개를 구매한다.
		buyer.numOfApple += 50;//구매자는 50개가 증가한다.
		
		seller2.myMoney += 1000; //판매자2에게 1000원을 지불하고
		seller2.numOfApple -= 70;//사과 70개를 구매한다.
		buyer.numOfApple += 70;//구매자는 70개가 증가한다.
								//구매자는 한푼도 지불하지 않음
		
		System.out.println("구매 행위가 일어난 후의 상태");
		seller1.showSaleResult();
		seller2.showSaleResult();
		buyer.showBuyResult();
		
		
		
		
		
	}

}
