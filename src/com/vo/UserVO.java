package com.vo;

public class UserVO {
	String userid;
	String pwd;
	String uname;
	String gender;
	String phone;
	String email;
	String address;
	String birthdate;
	int uno;
	

	public UserVO() {
	}
	public UserVO(String uid, String pwd, String uname, String gender, String phone, String email, String address,
			String birthdate) {
		this.userid = uid;
		this.pwd = pwd;
		this.uname = uname;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.birthdate = birthdate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String uid) {
		this.userid = uid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	@Override
	public String toString() {
		return "UserVO [uid=" + userid + ", pwd=" + pwd + ", uname=" + uname + ", gender=" + gender + ", phone=" + phone
				+ ", email=" + email + ", address=" + address + ", birthdate=" + birthdate + "]";
	}
}
