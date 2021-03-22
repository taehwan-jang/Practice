package ex12inheritance;

class Car{
   int gasoline;
   public Car(int gas) {
	   gasoline=gas;
   }
}
class HybridCar extends Car{
   int electric;
   public HybridCar(int gas ,int elec) {
	   super(gas);
	   electric=elec;
   }
}
class HybridWaterCar extends HybridCar{
   int water;
   /*
   하위 클래스의 생성자에서는 붐노클래스의 객체를 항상 먼저
   생성해야 하므로 super()를 통해 부모생성자를 먼저
   호출한 후 자신의 멤버변수를 초기화 해야 한다.
    */
   public HybridWaterCar(int gas ,int elec, int water) {
	   //부모객체를 초기화하기 위한 super()가 항상 먼저 기술되야 한다.
	   super(gas,elec);
	   //만약 위 아래의 코드의 위치가 바뀌면 에러가 발생한다.
	   this.water=water;
   }
 
   public void showNowGauge() {
	   System.out.println("남은가솔린:"+gasoline);
	   System.out.println("남은전기량:"+electric);
	   System.out.println("남은워터량:"+water);
   }
}
public class QuConstructorAndSuper {

    public static void main(String[] args) {
    	/*
    	하위클래스를 통해 객체를 생성할때는 항상 부모쪽 멤버변수까지
    	초기화 할 수 있도록 인자를 전달받아야 한다.
    	 */
        HybridWaterCar hcar = new HybridWaterCar(10,20,30);
        hcar.showNowGauge();
    }
}
