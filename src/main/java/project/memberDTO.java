package project;

public class memberDTO {
	private int num;		// n번째 회원
	private String id;		// 회원의 id
	private String name;	// 회원의 이름
	private String email;	// 회원의 이메일
	private String create;	// 회원의 가입일
	private String rank;	// 회원의 등급
	private boolean status;	// 회원의 상태
	private String tel;		// 회원의 전화번호

	// getter&setter
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCreate() {
		return create;
	}
	public void setCreate(String create) {
		this.create = create;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "memberDTO [num=" + num + ", id=" + id + ", name=" + name + ", email=" + email + ", create=" + create
				+ ", rank=" + rank + ", status=" + status + ", tel=" + tel + "]";
	}
	
	
}
