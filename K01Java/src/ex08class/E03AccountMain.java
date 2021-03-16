package ex08class;
/*
시나리오] 은행계좌를 추상화 해보자
    멤버변수 : 예금주(name)
            계좌번호(accountNumber)
            잔고(balance)

    멤버메소드 : 입금하다(deposit())
             출금하다(withdraw())
             계좌잔고 출력하기(showAccount())

    조건1 : 입금은 무제한으로 가능함
    조건2 : 잔고가 부족할 경우에는 출금불능 처리
 */

class Account {
	
	//멤버변수
	String name;
	String accountNumber;
	int balance;
	
	//멤버메소드
	
	//입금처리 : 매개변수로 전달되는 금액만큼 입금처리
	void deposit(int money) {
		balance += money;
		System.out.println(money+"원이 입금됨");
		System.out.println("현재 잔고: "+balance+"원");
	}
	//출금처리
	void withdraw(int money) {
		//출금을 위해 잔고와 출금액을 비교해서 처리한다.
		if(balance>=money) {
			//잔고가 충분한 경우 출금액을 차감한다.
			balance -= money;
			System.out.println(money+"원이 출금됨");
			System.out.println("현재 잔고: "+balance+"원");
		}
		else {
			System.out.println("잔고부족으로 출금불가");
		}
	}
	
	//계좌조회
	void showAccount() {
		System.out.println("계좌주: "+name);
		System.out.println("계좌번호: "+accountNumber);
		System.out.println("잔고 : "+balance+"원");
	}
	//초기화 메소드 : 멤버변수 초기화 용도로 사용된다.
	void init(String n, String a, int b) {
		name = n;
		accountNumber = a;
		balance = b;
	}
	
}

public class E03AccountMain {

	public static void main(String[] args) {

		Account account = new Account();
		account.init("장동건", "111-21-8885", 1000);
		account.deposit(9000);
		account.withdraw(5000);
		account.showAccount();
		
		Account account2 = new Account();
		account2.name ="정우성";
		account2.accountNumber = "123-45-68968";
		account2.balance= 900000;
		account2.showAccount();
	}

}
