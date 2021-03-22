package ex12inheritance;

class Burger {
	String burgerName;
	private int price;
	String patty;
	String source;
	String vege;
	
	public Burger(String burgerName, int price, String patty, String source, String vege) {
		this.burgerName = burgerName;
		this.price = price;
		this.patty = patty;
		this.source = source;
		this.vege = vege;
	}
	    public int getPrice() {
    	return price;
    }
        public void showMenu() {
    	System.out.println(burgerName);
    	System.out.println("가격: "+price);
    	System.out.printf("식재료: %s,%s,%s\n",patty,source,vege);
    }

}
//햄버거의 기본가격 추상화 
class HamburgerPrice {

    Burger burger;
    final int COKE = 1000;
    final int POTATO = 1500;
    int menuPrice;

    public HamburgerPrice(Burger burger1) {
    	burger = burger1;
    	burger1.showMenu();
    }
    public int totalPrice() {
    	return (burger.getPrice()+COKE+POTATO);
    }
    public void showPrice() {
    	System.out.println("결제금액: "+totalPrice());
    	System.out.println("========================");
    }
}
//세트가격을 추상화(기본가격을 상속)
class SetPrice extends HamburgerPrice {    
	
	public SetPrice(Burger burger2) {
		super(burger2);
	}
	@Override
	public int totalPrice() {
//		return (burger.getPrice()+COKE+POTATO)-500;
		return super.totalPrice()-500;
	}
	@Override
	public void showPrice() {
		System.out.println("결제금액: "+totalPrice());
		System.out.println("========================");
	}
}

public class QuBuyHamburger {

    public static void main(String[] args) {
        
        //치즈버거 객체 생성
        Burger burger1 = new Burger("치즈버거", 2000, "쇠고기패티", "케챱", "피클");
        //치킨버거 객체 생성
        Burger burger2 = new Burger("치킨버거", 3000, "닭고기패티", "마요네즈", "양상치");
        
        //치즈버거를 기본가격으로 구매
        HamburgerPrice price1 = new HamburgerPrice(burger1); 
        price1.showPrice();    // 4500원    
        
        //치킨버거를 세트가격으로 구매
        HamburgerPrice price2 = new SetPrice(burger2); 
        price2.showPrice();    // 5000원
    }
}

