package ex19thread;

import java.util.Random;

/*
Thread(쓰레드)
-쓰레드의 생성은 Thread클래스를 상속받는것부터 시작한다.
-해당 방법은 쓰레드로 생성할 클래스가 다른 클래스를 상속받지
않아도 되는 경우 사용하는 방식이다.
-만약 해당 클래스가 다른 클래스를 상속받아야 한다면 Runnable
인터페이스를 구현하여 사용한다.

 */
class ShowTread extends Thread{
	String threadName;
	Random a = new Random();
	
	public ShowTread(String name) {
		threadName = name;
	}
	/*
	run() 메소드는 쓰레드의 main()메소드에 해당한다.
	Thread클래스의 run()메소드를 오버라이딩 한것으로 해당 메소드는
	직접 호출하면 안되고, start()를 통해 간접적으로 호출해야 한다.
	만약 직접 호출하면 단순한 실행만 될뿐 쓰레드가 생성되지 않으므로
	주의해야 한다.
	 */
	@Override
	public void run() {
		for(int i=1 ; i<=6 ; i++) {
			System.out.println("안녕하세요.["+threadName+"]입니다.");
			System.out.println(a.nextInt(45)+1);
			try {
				/*
				Thread클래스의 static메소드로 실행의 흐름을
				주어진 시간만큼 block상태로 전환시켜 준다.
				1000분의 1초 단위로 기술하게 되므로 아래는 1초만큼
				Block시키게 된다.
				 */
				sleep(1000);
			}
			catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	
}
public class E01ThreadStart {

	public static void main(String[] args) {

		ShowTread st1 = new ShowTread("로또번호");
		ShowTread st2 = new ShowTread("Thread 2nd");
		
		//쓰레드 객체를 통한 쓰레드 생성(실행)
		st1.start();
		st2.start();
		
		/*
		start()를 통해 호출하지않으면 st1 과 st2가 동시에
		실행되지 않는다. st1의 실행이 끝난 후에 st2가 진행됨
		 */
//		st1.run();
//		st2.run();
		
	}

}
