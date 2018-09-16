package egovframework.example.admin.sidebar.resume.domain;

import java.sql.Date;
import java.util.List;

public class AdminResumeVO {
	private List<AdminResumeAcademicVO> academics;
	private List<AdminResumeCareerVO> careers;
	private AdminResumeMemberVO member;
	
	private int no;
	private String id;
	private String title;
	private String content;
	private String area;
	private String skills;
	private String salary;
	private char isOpen;
	private String mainPic;
	private String type;
	private Date regDate;
	private Date updateDate;

	public AdminResumeMemberVO getMember() {
		return member;
	}

	public void setMember(AdminResumeMemberVO member) {
		this.member = member;
	}

	public List<AdminResumeAcademicVO> getAcademics() {
		return academics;
	}

	public void setAcademics(List<AdminResumeAcademicVO> academics) {
		this.academics = academics;
	}

	public List<AdminResumeCareerVO> getCareers() {
		return careers;
	}

	public void setCareers(List<AdminResumeCareerVO> careers) {
		this.careers = careers;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMainPic() {
		return mainPic;
	}

	public void setMainPic(String mainPic) {
		this.mainPic = mainPic;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public char getIsOpen() {
		return isOpen;
	}

	public void setIsOpen(char isOpen) {
		this.isOpen = isOpen;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	@Override
	public String toString() {
		return "AdminResumeVO [academics=" + academics + ", careers=" + careers
				+ ", member=" + member + ", no=" + no + ", id=" + id
				+ ", title=" + title + ", content=" + content + ", area="
				+ area + ", skills=" + skills + ", salary=" + salary
				+ ", isOpen=" + isOpen + ", type=" + type + ", regDate="
				+ regDate + ", updateDate=" + updateDate + "]";
	}

}
