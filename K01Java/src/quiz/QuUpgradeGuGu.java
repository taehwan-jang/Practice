package quiz;

public class QuUpgradeGuGu {

	public static void main(String[] args) {
		int mNum=1;
		for(int dan=2;dan<=9;dan++) {
			for(int su=1 ; su<=9 ; su++) {
				if(su==1) {
					System.out.println(dan+"*"+1+"="+dan);
				}
				for(int k=1 ; k<=9 ; k++) {
					if(k==1) {
						mNum = dan*1;
					}
					else if (su>=k){
						mNum*=dan;
						System.out.print(dan+"*");
					}
				}
				if(su !=1)
					System.out.printf("%d=%d\n",dan,mNum);
			}System.out.println();
		}
	}
}
