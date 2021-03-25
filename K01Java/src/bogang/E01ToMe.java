package bogang;

public class E01ToMe {

	public static void main(String[] args) {
		
		/*
		1 + (1+2) + (1+2+3) + (1+2+...10)
		결과계산
		 */
		int totalSum1 = 0;
		for(int s=1 ; s<=10 ; s++) {
			for(int t=1 ; t<=s ; t++) {
				totalSum1 +=t;
			}
		}
		System.out.println("totalSum1="+totalSum1);
		
		int totalSum2 = 0;
		int totalSum3 = 0;
		for(int i=1 ; i<=10 ; i++) {
			totalSum2 +=i;
			totalSum3 += totalSum2;
		}
		System.out.println("totalSum3="+totalSum3);
		
	}

}
