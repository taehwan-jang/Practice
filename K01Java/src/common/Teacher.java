package common;

public class Teacher extends Person {

	private String major;

	public Teacher(String name, int age, String major) {
		super(name, age);//놀랍게도 자동완성됨 source로
		this.major = major;
	}
	
	@Override
	public String getInfo() {
		return super.getInfo()+", 과목:"+major;
	}
	@Override
	public void showInfo() {
		System.out.println("선생의 정보"); 
		System.out.println(getInfo()); 
	}
	
}
