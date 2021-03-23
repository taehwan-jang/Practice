package ex12inheritance;

import java.util.Scanner;

/*
친구를 표현한 최상위 클래스로 해딩 프로그램에서는
Friend 클래스로 객체생성은 하지 않는다.
상속의 목적으로만 정의된 클래스이다.
 */
class Friend {
	//멤버변수
	String name;//이름
	String phone;//전화번호
	String addr;//주소
	//생성자메소드
	public Friend(String name, String phone, String addr) {
		this.name = name;
		this.phone = phone;
		this.addr = addr;
	}
	//멤버메소드 
	/*
	멤버변수 전체 정보를 출력하는 메소드
	 */
	public void showAllData() {
		System.out.println("이름: "+name);
		System.out.println("전화번호: "+phone);
		System.out.println("주소: "+addr);
	}
	/*
	간략한 정보만을 출력하는 멤버메소드로 현재 실행부가 없는
	상태로 정의되었다. 해당 프로그램에서는 오버라이딩의 목적으로만
	정의되었다.
	 */
	public void showBasicInfo() {}
}
/*
고딩친구
 */
class HighFriend extends Friend {
	//확장한 멤버변수
	String nickName;//별명
	public HighFriend(String name, String phone, String addr, String nickName) {
		super(name,phone,addr);
		this.nickName = nickName;
	}
	/*
	고딩친구의 전체정보를 출력하기 위해 부모에서 정의된 메소드를
	super를 통해 호출하고, 자식에서 확장한 변수를 별도의 print문을
	통해 출력하고 있다. 
	 */
	@Override
	public void showAllData() {
		System.out.println("==고등친구 전체정보==");
		super.showAllData();
		System.out.println("별명: "+ nickName);
	}
	/*
	자식에서 오버라이딩 하여 재정의한 메소드로 고딩친구의
	간략한 정보를 출력한다.
	 */
	@Override
	public void showBasicInfo() {
		System.out.println("==고등친구==");
		System.out.println("별명: "+nickName);
		System.out.println("전번: "+phone);
	}
}
//대딩친구
class UnivFriend extends Friend {
	//자식에서 확장한 멤버변수
	String major;//전공
	public UnivFriend(String name, String phone, String addr, String major) {
		super(name,phone,addr);
		this.major = major;
	}
	@Override
	public void showAllData() {
		System.out.println("==대학친구 전체정보==");
		super.showAllData();
		System.out.println("전공: "+ major);
	}
	@Override
	public void showBasicInfo() {
		System.out.println("==대학친구==");
		System.out.println("이름: "+name);
		System.out.println("전화번호: "+phone);
	}
}

public class E10MyFriendInfoBook {

	public static void menuShow() {
		
		System.out.println("**메뉴를 입력하세요**");
		System.out.println("1.고등친구입력");
		System.out.println("2.대학친구입력");
		System.out.println("3.전체정보출력");
		System.out.println("4.간략정보출력");
		System.out.println("5.검색");
		System.out.println("6.삭제");
		System.out.println("7.프로그램종료");
		System.out.print("메뉴선택>>>");
	}
	/*
	프로그램 전반의 흐름에 대해서만 기술하고 관련 함수를
	호출하는 정도로만 구성한다. main메소드는 단지 프로그램의
	시작점 정도의 의미만 가지는게 좋다.
	 */
	public static void main(String[] args) {
		
		//프로그램의 비즈니스 로직을 가진 핸들러 객체를 생성한다.
		FriendInfoHandler handler = new FriendInfoHandler(100);/*
		연락처 정보를 저장할 객체배열의 크기를 100으로 초기화한다 이는 나중에 
		수정하는 편이 좋음 배열의 크기가 달라질 수 있기 때문이다. 연락처의
		갯수가 100개가 넘어가면 새로 지정해야하는 불편함이 있음
		*/
		
		//무한루프로 구성하여 사용자가 원하는 시점에 프로그램을 종료시킨다.
		while(true) {
			//메뉴출력을 위한 메소드 호출
			menuShow();
			
			Scanner scan = new Scanner(System.in);
			int choice = scan.nextInt();
			
			switch(choice) {
			//친구 정보 추가
			case 1: case 2:
				handler.addFriend(choice);
				break;
			//전체 정보 보기
			case 3: 
				//전체정보출력
				handler.showAllData();
				break;
			//간략 정보 보기
			case 4:
				handler.showSimpleData();
				break;
			//검색
			case 5:
				//친구정보검색
				handler.searchInfo();
				break;
			//삭제
			case 6:
				//친구정보삭제
				handler.deleteInfo();
				break;
//			프로그램 종료
			case 7:
				System.out.println("프로그램을 종료합니다.");
				//main메소드의 종료는 프로그램의 종료로 이어진다.
				return;
			}
		}
		
	}

}
class FriendInfoHandler {
	
	private Friend[] myFriends;
	private int numOfFriends;
	
	public FriendInfoHandler(int num) {
		myFriends = new Friend[num];
		numOfFriends = 0;
	}
	//새로운 친구 연락처 정보 추가
	public void addFriend(int choice) {
		Scanner scan = new Scanner(System.in);
		
		String iName,iphone,iAddr,iNickName,iMajor;
		
		System.out.println("이름: ");
		iName = scan.nextLine();
		System.out.println("전화번호: ");
		iphone = scan.nextLine();
		System.out.println("주소: ");
		iAddr = scan.nextLine();
		/*
		1.친구정보를 입력받은 후
		2.객체배열의 0번방에 객체를 저장하고
		3.numOfFriends를 1 증가시킨다. 후위증가 시키면됨.
		 */
		if(choice==1) {//고딩친구
			System.out.println("별명: ");
			iNickName = scan.nextLine();
			myFriends[numOfFriends++] = new HighFriend(iName, iphone, iAddr, iNickName);
		}
		else if(choice==2) {//대딩친구
			System.out.println("전공: ");
			iMajor = scan.nextLine();
			myFriends[numOfFriends++] = new UnivFriend(iName, iphone, iAddr, iMajor);
		}
		System.out.println("친구 정보 입력 완료");
	}
	/*
	친구의 정보를 출력하기 위한 멤버메소드
	1.친구정보를 추가할때 High 또는 Univ 객체가 배열에 저장된다.
	2.입력시 모든 객체는 Friend로 자동형변환되어 저장된다.
	3.정보 출력시 배열에 입력된 객체수만큼 반복하면서 각 요소를 통해
		멤버메소드를 호출한다.
	4.이때 오버라이딩된 메소드를 통해 항상 해당 객체의 정보를 출력할 수
		있다. 참조변수의 타입에 영향을 받지 않고 항상 오버라이딩된
		최하위의 메소드가 호출된다.
	 */
	public void showAllData() {
		for(int i=0; i<numOfFriends ; i++) {
			myFriends[i].showAllData();
		}
		System.out.println("==전체정보가 출력되었습니다.==");
	}
	public void showSimpleData() {
	for(int i=0; i<numOfFriends ; i++) {
		myFriends[i].showBasicInfo();
	}
	System.out.println("==간략정보가 출력되었습니다.==");
	}
	
	//주소록 검색
	public void searchInfo() {
		Scanner scan = new Scanner(System.in);
		System.out.print("검색할 이름을 입력하세요: ");
		String searchName = scan.nextLine();
		
		for(int i=0 ; i<numOfFriends ; i++) {
			/*
			검색을 위해 입력한 이름과, 각 인덱스에 저장된 객체의 name변수의
			비교를 통해 문자열 검색을 진행한다.
			 */
			if(searchName.equals(myFriends[i].name)==true) {
				//일치하는 이름이 있는경우 정보를 출력한다.
				myFriends[i].showAllData();
				System.out.println("요청하신 정보입니다.");
			}
//			else {잘못된 문장임 for문이 돌때마다 찾기전까지 출력됨 병신아
//				System.out.println("요청하신 정보가 없습니다.");
//			}
		}
	}
	//주소록 항목 삭제
	public void deleteInfo() {
		Scanner scan = new Scanner(System.in);
		System.out.print("삭제할 이름을 입력하세요: ");
		String deleteName = scan.nextLine();
		/*
		배열의 요소 중 삭제된 요소의 인덱스값을 저장할 용도의 변수.
		요소를 삭제한 후 빈자리를 채워넣을때 사용할것임.
		배열의 인덱스이므로 초기값은 -1로 설정한다.
		 */
		int delIndex = -1;
		
		//객체배열에 저장된 친구정보의 갯수만큼 반복 
		for(int i=0; i<numOfFriends ; i++) {
			if(deleteName.compareTo(myFriends[i].name)==0){
				//요소를 삭제하기 위해 null값으로 변경한다.
				myFriends[i] = null;
				//삭제된 요소의 index를 저장한다.
				delIndex = i;
				//전체 index카운트를 1 차감한다.
				numOfFriends--;
				//하나의 객체를 삭제했다면 즉시 for문 탈출
				break;
			}
		}
		if(delIndex==-1) {
			//검색된 데이터가 없어 삭제되지 않았다면 -1을 유지한다.
			System.out.println("삭제할 데이터가 없습니다.");
		}
		else {
			/*
			객체배열에서 검색된 요소를 삭제한 후 입력된 위치의 바로뒤 요소를
			앞으로 하나씩 이동시킨다.
			 */
			for(int i=delIndex ; i<numOfFriends ; i++) {
				myFriends[i] = myFriends[i+1];
			}
			System.out.println("==데이터("+delIndex+"번)가 삭제되었습니다==");
		}
	}
}
