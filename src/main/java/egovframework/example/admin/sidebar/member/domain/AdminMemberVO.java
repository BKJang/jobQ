package egovframework.example.admin.sidebar.member.domain;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import egovframework.example.admin.cmmn.domain.EmailVO;
import egovframework.example.admin.cmmn.domain.PhoneVO;

public class AdminMemberVO {
	@NotNull
	// @Size(min = 2, max = 4)
	/*@Pattern(regexp="/^[가-힣]{2,4}$/", message = "한글만 입력가능합니다.")*/
	private String name;
	
	@NotEmpty
	// @Size(min = 3, max = 15)
	/*@Pattern(regexp = "/^[a-z]+[a-z0-9]{3,15}$/g")*/
	private String id;
	
	@NotEmpty
	// @Size(min = 3, max = 15)
	/*@Pattern(regexp = "/^[a-z]+[a-z0-9]{3,15}$/g")*/
	private String password;
	
	@NotEmpty
	// @Size(min = 3, max = 15)
	/*@Pattern(regexp = "/^[a-z]+[a-z0-9]{3,15}$/g")*/
	private String confirmPassword;
	
	@NotEmpty
	// @Length(max = 2)
	/*@Pattern(regexp = "/^[a-z]+[a-z0-9]{3,15}$/g")*/
	private String sex;	// char에는 @NotEmpty를 쓸 수 없다.
	
	private int age;
	
	// Date에도 날짜를 @NotEmpty를 쓸 수 없다.
	@NotNull
	private Date birthDate;
	
	@Valid
	private EmailVO email;
	
	private PhoneVO phone;
	
	private String type;
	private String homepage;
	private Date regDate;
	private Date updateDate;

	public EmailVO getEmail() {
		return email;
	}

	public void setEmail(EmailVO email) {
		this.email = email;
	}

	public PhoneVO getPhone() {
		return phone;
	}

	public void setPhone(PhoneVO phone) {
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public void getAgeByBirth(){
		final Calendar calendar = Calendar.getInstance();
		final SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-DD");
		String date = simpleDateFormat.format(this.birthDate);
		int year = Integer.parseInt(date.split("-")[0]);
		
		this.age = (calendar.get(calendar.YEAR) - year + 1);
	}
	
	@Override
	public String toString() {
		return "AdminMemberVO [name=" + name + ", id=" + id + ", password="
				+ password + ", confirmPassword=" + confirmPassword + ", sex="
				+ sex + ", age=" + age + ", birthDate=" + birthDate
				+ ", email=" + email.getFullEmail() + ", phone=" + phone.getFullPhoneNumber() + ", type=" + type + ", homepage=" + homepage
				+ ", regDate=" + regDate + ", updateDate=" + updateDate + "]";
	}
}
