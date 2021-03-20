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
   public HybridWaterCar(int gas ,int elec, int water) {
	   super(gas,elec);
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
        HybridWaterCar hcar = new HybridWaterCar(10,20,30);
        hcar.showNowGauge();
    }
}
