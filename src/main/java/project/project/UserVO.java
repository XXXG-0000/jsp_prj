package project;

public class UserVO {
    private String email;
    private String password;
    private String name;
    private String zipcode;
    private String address;
    private String address2;
    private String phone; // 전화번호 필드 추가

    // Getters and Setters
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getAddress1() {
        return address;
    }

    public void setAddress1(String address1) {
        this.address = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getPhone() { // 전화번호 getter 추가
        return phone;
    }

    public void setPhone(String phone) { // 전화번호 setter 추가
        this.phone = phone;
    }
}
