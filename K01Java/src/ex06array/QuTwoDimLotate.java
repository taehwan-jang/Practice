package ex06array;

public class QuTwoDimLotate {
	
	static void arrSwap(int[][] ar) {
		
		int[] temp;
		int length = ar.length;
		
		temp = ar[ar.length-1];
		for(int j=1 ; j<ar.length ; j++) {
			ar[length-j] = ar[length-j-1];
		}
		ar[0] = temp;  
	}
	
	public static void main(String[] args) {
		
//		int[][] arr = new int[3][3];
//		
//		for(int i=0 ; i<arr.length ; i++) {
//			for(int j=0 ; j<arr[i].length ; j++) {
//				if(i==0) {
//					arr[i][j] += i+j+1;
//				}
//			}
//		}
		
		int[][] arr = {
				{1,2,3},
				{4,5,6},
				{7,8,9}
		};
		System.out.println("[swap메소드 호출전]");
		showarr(arr);
		arrSwap(arr);
		System.out.println("[swap메소드 호출후]");
		showarr(arr);
	}
	static void showarr(int[][] ar2) {
		
		for(int i=0 ; i<ar2.length ; i++) {
			for(int j=0 ; j<ar2[i].length ; j++) {
				System.out.print(ar2[i][j]+" ");;
			}
			System.out.println();
		}
	}
}
