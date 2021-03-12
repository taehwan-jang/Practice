package ex06array;

public class E02ArrayAndMethod {

	public static void main(String[] args) {

		//배열을 선언과 동시에 초기화. 요소의 갯수에 의해 크기 결정됨.
		int[] arr = {1,2,3,4,5};
		int[] ref;
		System.out.println("초기화 직후 출력");
		for(int i=0 ; i<arr.length ; i++) {
			System.out.println(i+"번째 arr"+arr[i]);//1,2,3,4,5 출력
		}
		System.out.println("arr주소값(참조값)"+arr);
		System.out.println("===========");
		
		/*
		배열명을 매개변수로 전달하는것은 배열의 주소값(참조값)을 전달하는 것이다.
		따라서 arr이 가지고 있는 주소값을 전달한다.정수의 경우
		해당값이 그대로 전달된다.
		 */
		ref = addAllArray(arr,7);
		/*
		addAllArray()메소드에서 반환하는 값은 처음에 전달했던
		배열의 주소값이므로 결과적으로 ref도 동일한 배열을 참조하게 도니다.
		 */
			
		System.out.println("메소드 호출 후 출력");
		for(int i=0 ; i<ref.length ; i++) {
			System.out.println(ref[i]+" ");
		}
		System.out.println();
		for(int i=0 ; i <arr.length ; i++) {
			System.out.println(arr[i]+" ");
		}
		System.out.println("arr주소값(참조값)"+arr);
		System.out.println("ref주소값(참조값)"+ref);
		
	}
	/*
	매개변수로 전달된 참조값을 ar이 받게되므로 결국 동일한 배열을 
	참조하게 된다.  즉 main()메소드에서 생성한 배열과 동일한 배열이	된다.
	 */
	static int[] addAllArray(int[] ar, int addVal) {
		
		for(int i=0 ; i <ar.length ; i++) {
			/*
			배열의 가 요소값에 7을 더한후 결과값을 다시 저장한다.
			즉 7씩 증가시키는 연산이 수행된다.
			 */
			ar[i] += addVal;
		}
		return ar;
	}

}
