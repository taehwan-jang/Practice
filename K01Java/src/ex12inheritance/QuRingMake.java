package ex12inheritance;

class Point {
	int xDot, yDot;
	public Point(int x, int y) {
	   xDot=x;
	   yDot=y;
	}
	public void showPointInfo(){
	   System.out.println("[x좌표:"+xDot+", y좌표"+yDot+"]");
	}
}
class Circle {    
    int radian;//반지름
    Point center;
    public Circle(int a, int b, int c){
    	center = new Point(a, b);
    	radian = c;
    }
    public void showCircleInfo() {
    	/*
    	반지름은 멤버변수를 통해 즉시 출력하고, 중심점은 Point객체의
    	멤버메소드를 호출하여 출력한다.
    	 */
    	System.out.println("반지름: "+radian);
    	center.showPointInfo();
    }
}
class Ring{
    Circle innerCircle;//안쪽의 원
    Circle outerCircle;//바깥쪽의 원
    
    /*
    링 클래스에서는 원이 2개 있어야 하므로 아래와 같이
    Circle객체를 2개 생성한다.
     */
    public Ring(int a,int b,int c,int d,int e,int f) {
    	innerCircle = new Circle(a,b,c);
    	outerCircle = new Circle(d,e,f);
    }
    public void showRingInfo() {
    	/*
    	상속관계가 아니므로 각각의 멤버변수(Circle객체)를 통해 메소드를
    	불러와야 한다.
    	 */
    	System.out.println("안쪽원의 정보: ");
    	innerCircle.showCircleInfo();
    	System.out.println("바깥쪽원의 정보: ");
    	outerCircle.showCircleInfo();
    }
}
class QuRingMake {
    public static void main(String[] args) {
        Ring c = new Ring(1,1,3,2,2,9);
        c.showRingInfo();
    }
}
