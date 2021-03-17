package ex09package.Kosmo.seller;

//패키지가 다른 경우 import하려면 반드시 public으로 선언해야 한다.
public class FruitSeller4 {
	
	int numOfApple;
	int myMoney; 
	final int APPLE_PRICE;//(컨트롤쉬프트x 대문자 y 소문자)
	
	public FruitSeller4(int money, int appleNum, int price) {
		myMoney = money;
		numOfApple = appleNum;
		APPLE_PRICE = price;
	}
	public int saleApple(int money) {
		int num = money / APPLE_PRICE;
		numOfApple -= num;
		myMoney += money;
		return num;
	}
	public void showSaleResult() {
		System.out.println("[판매자]남은 사과갯수: "+numOfApple);
		System.out.println("[판매자]판매 수익: "+myMoney);
	}
	
}