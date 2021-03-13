package ex06array;

public class QuTwoDimArray {
	
	public static void addOneArr(int[] arr, int add) {
		
		for(int i=0; i<arr.length; i++){    
            arr[i] += add;
        }
    }
    public static void addTwoArr(int[][] arr, int add) {
    	
    	for(int i=0 ; i<arr.length ; i++) {
        	for(int j=0 ; j<arr[i].length ; j++) {
        		arr[i][j] += add;
        	}
        }
    }
    public static void main(String[] args){        
    	
    	int[][] arr = {
            {1, 2, 3, 4},
            {5, 6, 7},
            {8, 9}
        };
        System.out.println("[증가메소드 호출 전]");
        arrPrint(arr);        
        addTwoArr(arr, 2);
        System.out.println("[증가메소드 호출 후]");
        arrPrint(arr);
    }
    static void arrPrint(int[][] arr) {
    	
    	for(int i=0 ; i<arr.length ; i++) {
    		for(int j=0 ; j<arr[i].length ; j++) {
    			System.out.printf(arr[i][j]+" ");
    		}
    		System.out.println();
    	}
    }
}

