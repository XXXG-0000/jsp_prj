package day1016;

public class TestVO {

	private String name;
	private int age;
	
	public TestVO() {
		System.out.println("기본 생성자");
	}// TestVO
	
	public TestVO(String name, int age) {
		System.out.println("Overloading된 생성자");
		this.name = name;
		this.age = age;
	}// TestVO

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "TestVO [name=" + name + ", age=" + age + "]";
	}
	
	
	
	
}
