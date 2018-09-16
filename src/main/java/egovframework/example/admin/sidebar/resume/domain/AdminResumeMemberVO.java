package egovframework.example.admin.sidebar.resume.domain;

import java.sql.Date;

public class AdminResumeMemberVO {
	private char sex;
	private String phone;
	private String email;
	private Date birthDate;
	private String name;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public char getSex() {
		return sex;
	}

	public void setSex(char sex) {
		this.sex = sex;
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

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	@Override
	public String toString() {
		return "AdminResumeMemberVO [sex=" + sex + ", phone=" + phone
				+ ", email=" + email + ", birthDate=" + birthDate + "]";
	}

}
