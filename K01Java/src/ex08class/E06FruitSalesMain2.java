package ex08class;

//과일판매자로 추상화한 클래스
class FruitSeller2 {
	
	//멤버변수와 상수를 선언
	int numOfApple;//판매자의 사과보유 갯수
	int myMoney; //판매자 판매수익
	int apple_price;
			/*
			상수에서 변수로 변경한다.
			클래스의 멤버상수로 정의하는 경우 선언과 동시에
			초기화해야 하므로 상수는 초기값이 없는 형태로는
			선언 자체가 불가능하다.
			 */
	/*
	apple_price를 상수에서 변수로 변경한 이유는 상수는 단 한번만
	초기화되므로 멤버메소드에서는 초기화할 수 없다. 멤버메소드는
	개발자가 원할때 언제든지 호출할 수 있으므로, 상수의 특성과는 맞지
	않기 때문이다.
	 */
	public void initMembers(int money, int appleNum, int price) {
		myMoney = money;
		numOfApple = appleNum;
		apple_price = price;
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
		int num = money / apple_price;
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
class FruitBuyer2 {
	
	int myMoney;//보유금액
	int numOfApple;//구매한 사과의 갯수
	
	//멤버변수 초기화를 위한 메소드
	public void initMembers(int _myMoney, int _numOfApple) {
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
	public void buyApple(FruitSeller2 seller, int money) {
		numOfApple += seller.saleApple(money);
		myMoney -= money;
	}
	//구매자의 현재상태 출력
	public void showBuyResult() {
		System.out.println("[구매자]현재 잔액: "+ myMoney);
		System.out.println("[구매자]사과 갯수: "+ numOfApple);
	}
	
}
public class E06FruitSalesMain2 {

	public static void main(String[] args) {

		
		/*
		초기화 메소드를 정의하였으므로, 각각 성격이 다른 객체들을
		생성할 수 있다.
		 */
		//판매자1 : 사과갯수 100개 단가 1000원
		FruitSeller2 seller1 = new FruitSeller2();
		seller1.initMembers(0, 100, 1000);
		
		//판매자2 : 사과갯수 80개 단가 500원
		FruitSeller2 seller2 = new FruitSeller2();
		seller2.initMembers(0, 80, 500);
		
		//구매자 : 보유금액 10000원
		FruitBuyer2 buyer = new FruitBuyer2();
		buyer.initMembers(10000, 0);
		
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
		
		
		
		
	}

}
