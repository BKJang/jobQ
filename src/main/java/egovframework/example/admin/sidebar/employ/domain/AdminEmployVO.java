package egovframework.example.admin.sidebar.employ.domain;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import egovframework.example.admin.cmmn.domain.AddressVO;
import egovframework.example.admin.sidebar.member.domain.AdminMemberVO;

public class AdminEmployVO {
	private int no;
	
	@NotEmpty
	private String title;
	private String imageLogoPath;

	@NotEmpty
	private String companyName;
	private String employType;
	private String career;
	private String academic;
	private String skills;
	
	@NotEmpty
	private String content;
	private String salary;
	private String employNumber;
	private Date regDate;
	private Date updateDate;
	private Date closeDate;
	private int hits;
	private char closing;
	private String state;

	private AdminMemberVO member;
	private AddressVO address;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImageLogoPath() {
		return imageLogoPath;
	}

	public void setImageLogoPath(String imageLogoPath) {
		this.imageLogoPath = imageLogoPath;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getEmployType() {
		return employType;
	}

	public void setEmployType(String employType) {
		this.employType = employType;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getAcademic() {
		return academic;
	}

	public void setAcademic(String academic) {
		this.academic = academic;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getEmployNumber() {
		return employNumber;
	}

	public void setEmployNumber(String employNumber) {
		this.employNumber = employNumber;
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

	public Date getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public char getClosing() {
		return closing;
	}

	public void setClosing(char closing) {
		this.closing = closing;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public AdminMemberVO getMember() {
		return member;
	}

	public void setMember(AdminMemberVO member) {
		this.member = member;
	}

	public AddressVO getAddress() {
		return address;
	}

	public void setAddress(AddressVO address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "AdminEmployVO [member=" + member + ", no=" + no + ", title="
				+ title + ", imageLogoPath=" + imageLogoPath + ", companyName="
				+ companyName + ", employType=" + employType + ", career="
				+ career + ", academic=" + academic + ", content=" + content
				+ ", salary=" + salary + ", employNumber=" + employNumber
				+ ", regDate=" + regDate + ", updateDate=" + updateDate
				+ ", closeDate=" + closeDate + ", hits=" + hits + ", closing="
				+ closing + ", state=" + state + ", address=" + address + "]";
	}

}
