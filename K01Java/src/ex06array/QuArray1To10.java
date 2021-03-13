package ex06array;
/*
다음 절차에 따라 프로그램을 작성하시오.
1. 크기가 10인 정수타입의 배열을 선언한다.
2. 반복문을 이용하여 배열을 채운다. 
이때 배열은 1,2,3,4....순서대로 채운다.
3. 2번에서 채운 배열을 출력한다.
4. 위에서 채운 배열의 첫번째 값에서 마지막값까지 누적해서 더한다.
5. 누적해서 더한 값을 출력한다. 

초기화된 배열 요소
1 2 3 4 5 6 7 8 9 10 
배열전체요소의합:55

 */
public class QuArray1To10 {

	public static void main(String[] args) {

		int[] numArr = new int[10];
		
		for(int i=0 ; i<numArr.length ; i++) {
			numArr[i] += i+1;
		}
		System.out.println("초기화된 배열 요소");
		for(int i=0 ; i<numArr.length ; i++) {
			System.out.print(numArr[i]+" "); 
		}
		int sumArr=0;
		for(int i=0 ; i<numArr.length ; i++) {
			sumArr += numArr[i];
		}
		System.out.printf("\n배열 전체요소의 합 : %d",sumArr);
	}
}
