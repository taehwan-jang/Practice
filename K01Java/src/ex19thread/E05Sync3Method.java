package ex19thread;

/*
동기화메소드
	: 여러 쓰레드에 의해 호출되는 공유메소드를 동기화하여
	여러 쓰레드가 동시에 접근하지 못하도록 lock을 거는것을 
	말한다.
형식] 접근지정자 synchronized 반환타입 메소드명(){
		실행문장;
	}
 */
class MethodSyncClass {
	synchronized void increase(int seed, int inc) {
		for(int i=1 ; i<=10 ; i++) {
			seed += inc;
			System.out.println(String.format("쓰레드명:%s,씨드값:%d", Thread.currentThread().getName(),seed));
			
		}
		/*
		메소드 자체가 동기화 처리되었으므로 쓰레드 실행중에
		sleep()을 만나더라도 다른 쓰레드는 접근하지 못한다.
		 */
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {}
	}
}
class MethodSyncThread extends Thread {
	MethodSyncClass msc;
	int seed,inc;
	public MethodSyncThread(String threadName,MethodSyncClass msc, int seed, int inc) {
		super(threadName);
		this.msc = msc;
		this.seed = seed;
		this.inc = inc;
	}
	@Override
	public void run() {
		msc.increase(seed, inc);
	}
}

public class E05Sync3Method {

	public static void main(String[] args) {

		MethodSyncClass msc = new MethodSyncClass();
		
		MethodSyncThread t1 = new MethodSyncThread("1st 쓰렏", msc, 10, 2);
		MethodSyncThread t2 = new MethodSyncThread("2nd 쓰렏", msc, 10, 5);
		
		t1.start();
		t2.start();
		
	}

}
