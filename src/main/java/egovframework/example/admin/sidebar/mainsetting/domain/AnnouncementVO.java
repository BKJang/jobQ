package egovframework.example.admin.sidebar.mainsetting.domain;

import java.sql.Timestamp;

public class AnnouncementVO {
	private int no;
	private String id;
	private String title;
	private String companyName;
	private String state;
	private Timestamp regDate;
	private Timestamp updateDate;

	public AnnouncementVO() {
		super();
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "AnnouncementVO(" + no + ", " + id + ", " + title + ", "
				+ companyName + ", " + state + ", " + regDate + ", "
				+ updateDate + ")";
	}
}
