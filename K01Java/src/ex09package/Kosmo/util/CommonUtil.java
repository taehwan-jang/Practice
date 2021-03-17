package ex09package.Kosmo.util;
//패키지 다시써 K가 대문자로 써져있자나

public class CommonUtil {

	/*
	전달된 문자열을 검사하여 숫자가 아닌 문자가 포함된 경우 false를
	반환하고, 모두 숫자인 경우 true를 반환한다.
	 */
	public static boolean isNumber(String strValue) {
		
		//만약 전달된 문자열이 빈 문자열이라면 무조건 false를 반환한다.
		if(strValue.length()==0) {
			return false;
		}
		for(int i=0 ; i<strValue.length() ; i++) {
			//각 인덱스에 해당하는 문자의 아스키코드를 반환하여 확인한다.
			int acode = strValue.codePointAt(i);
			if(!(acode>='0'&&acode<='9')) {
				return false;
			}
		}
		return true;
		
	}

}
