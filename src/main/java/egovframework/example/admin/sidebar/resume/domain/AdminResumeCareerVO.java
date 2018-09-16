package egovframework.example.admin.sidebar.resume.domain;

import java.sql.Date;

public class AdminResumeCareerVO {
	private int no;
	private String companyName;
	private String role;
	private Date enterDate;
	private Date finishedDate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Date getEnterDate() {
		return enterDate;
	}

	public void setEnterDate(Date enterDate) {
		this.enterDate = enterDate;
	}

	public Date getFinishedDate() {
		return finishedDate;
	}

	public void setFinishedDate(Date finishedDate) {
		this.finishedDate = finishedDate;
	}

	@Override
	public String toString() {
		return "AdminResumeCarrerVO [no=" + no + ", name=" + companyName + ", role="
				+ role + ", enterDate=" + enterDate + ", finishedDate="
				+ finishedDate + "]";
	}
	
}
