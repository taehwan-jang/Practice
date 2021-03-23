package ex13interface;

/*
추상클래스
-상속을 목적으로 제작되므로 객체생성을 허용하지 않는다.
-추상클래스는 대부분 추상메소드를 포함하고 있으므로, 이를
상속받는 클래스는 반드시 추상메소드를 오버라이딩 해야한다.
-클래스의 상속관계에서의 설계도 역할을 한다.
-객체생성은 할 수 없으나 그외 참조변수, 상속 등의 모든 기능을
가지고 있다.

추상메소드
-오버라이딩의 목적으로 제작된다.
-함수의 실행부가 없기떄문에 {}를 쓰지않고 함수의 원형에 ;을 
붙여준다.
 */

//프로젝트 전체에서 기준이 될 수 있는 추상클래스 정의
abstract class PersonalNumberStorageAbs {
	//정보 저장용
    public abstract void addPersonalInfo(String juminNum, String name);
    //정보 검색용 
    public abstract String searchPersonalInfo(String juminNum);
}
/*
DTO(Data Transfer Object) : 데이터를 저장하고 전송하기 위한
	용도의 객체를 말한다. VO(Value Object)로 표현하기도 한다.
해당 프로그램에서는 한 사람의 정보를 저장하기 위한 용도로 정의하였다.
 */
class PersonalInfoDTO {	
	private String name;
	private String juminNum;
	
	public PersonalInfoDTO(String name, String juminNum) {
		this.name = name;
		this.juminNum = juminNum;
	}
	//private멤버를 반환하기 위한 getter 메소드 정의
	public String getName() {
		return name;
	}
	public String getJuminNum() {
		return juminNum;
	}
}

/*
제공된 추상클래스를 상속하여 사람의 정보를 저장하는 기능과
검색의 기능을 구현한 클래스 
 */
class PersonalNumberStorageExt extends PersonalNumberStorageAbs {
	
	PersonalInfoDTO[] personalArr;//정보저장용 객체배열
	int numOfPerInfo;//입력정보 카운트
	
	public PersonalNumberStorageExt(int arrSize) {
		personalArr = new PersonalInfoDTO[arrSize];
		numOfPerInfo = 0;
		
	}
	/*
	상속을 통해 추상메소드를 포함하게 되었으므로 반드시 아래와 같이
	오버라이딩 해야한다. 필수사항이며 하지 않을경우 에러가 발생한다.
	 */
	
	//전달받은 인자를 통해 DTO객체를 생성한 후 객체배열에 추가한다.
	@Override
	public void addPersonalInfo(String juminNum, String name) {
		personalArr[numOfPerInfo++] =
				new PersonalInfoDTO(name, juminNum);
	}
	//주민번호를 인자로 객체배열을 검색한 후 일치한 정보가 있을경우 이름을 반환한다.
	@Override
	public String searchPersonalInfo(String juminNum) {
		for(int i=0;i<numOfPerInfo;i++) {
			if(juminNum.equals(personalArr[i].getJuminNum())==true) {
				return personalArr[i].getName();
			}
		}
		//검색결과가 없을때는 null을 반환한다.
		return null;
	}
}
public class E02AbstractToInterface1 {

	public static void main(String[] args) {
		//객체 생성
		PersonalNumberStorageExt storage =
				new PersonalNumberStorageExt(10);
		
		//정보추가
		storage.addPersonalInfo("123456-2231231", "개똥이");
		storage.addPersonalInfo("123456-1231232", "소똥이");
		
		//주민번호를 통해 정보 검색
		System.out.println(storage.searchPersonalInfo("123456-1231232"));
		System.out.println(storage.searchPersonalInfo("123456-1231231"));
		System.out.println(storage.searchPersonalInfo("123456-2231231"));
	}

}
