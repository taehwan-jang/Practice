package ex06array;

public class E07ForEachObject {

	public static void main(String[] args) {

		String[] strArr = new String[] {
				"자바 재미",
				"자바 유용",
				"자바 어렵"
		};
		
		for(String e : strArr) {
			System.out.println(e);
		}
	}

}
