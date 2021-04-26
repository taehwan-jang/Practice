package ex20io;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.ObjectInputStream;

/*
연습문제] 직렬화된 파일 friend_info.ojb를 복원하는 프로그램을 작성하시오.
	만약 3명의 친구가 저장되어있다면 복원후 3명의 정보를 그대로 출력하면
	된다.
 */
public class E13MyFriendDeserializable2 {

	public static void main(String[] args) {

		try {
			ObjectInputStream in = 
					new ObjectInputStream(
							new FileInputStream("src/ex20io/friend_info.obj"));
			
			/*
			EOF -> EndOfFile 더이상 읽을게 없다 그래서 if로 break조건 걸어줘 
			 */
			while(true) {//저장된 객체의 크기를 모르기 때문에 무한루프;
				Friend fn = (Friend)in.readObject();
				if(fn==null) break;
				fn.showAllData();
			}
			
		}
		catch (ClassNotFoundException e) {
			System.out.println("클래스 못찾음");
		}
		catch (FileNotFoundException e) {
			System.out.println("파일을 못찾음");
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		System.out.println("프로그램끝");
	}
	

}
