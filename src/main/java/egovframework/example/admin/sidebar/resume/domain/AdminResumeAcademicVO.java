package egovframework.example.admin.sidebar.resume.domain;

import java.sql.Date;

public class AdminResumeAcademicVO {
	private int no;
	private String schoolName;
	private String state;
	private Date enterDate;
	private Date finishedDate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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
		return "AdminResumeCarrerVO [no=" + no + ", name=" + schoolName + ", state="
				+ state + ", enterDate=" + enterDate + ", finishedDate="
				+ finishedDate + "]";
	}
}
