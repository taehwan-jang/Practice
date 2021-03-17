package ex09package;
/*
연습문제] 해당 프로그램을 아래의 지시에 따라 패키지로 
구분하여 정상 실행되도록 변경하시오.

FruitSeller4 클래스 -> ex09package.kosmo.seller 패키지에 묶는다.
FruitBuyer4 클래스 -> ex09package.kosmo.buyer 패키지에 묶는다.

두 클래스를 적당히 import하여 정상동작할수 있도록 
FruitSalesMain4 클래스를 구성한다.
 */

import ex09package.Kosmo.buyer.FruitBuyer4;
import ex09package.Kosmo.seller.FruitSeller4;
/*
Buyer, Seller 클래스를 외부 패키지에 묶어 정의하였으므로
위와 같이 import 처리 후 사용할 수 있다.
 */

public class E03FruitSalesMain4 {

	public static void main(String[] args) {

		
		//판매자1 : 사과갯수 100개 단가 1000원
		FruitSeller4 seller1 = new FruitSeller4(0,100,1000);
		
		//판매자2 : 사과갯수 80개 단가 500원
		FruitSeller4 seller2 = new FruitSeller4(0,80,500);
		
		//구매자 : 보유금액 10000원
		FruitBuyer4 buyer = new FruitBuyer4(10000,0);
		
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
