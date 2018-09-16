package egovframework.example.admin.sidebar.member.domain;

import java.util.List;

import javax.swing.border.TitledBorder;

public class AdminMemberEmailVO {
	private List<String> idList;
	private List<String> emailList;
	private List<String> nameList;
	private String title;
	private String content;
	private String formType;
	
	public List<String> getIdList() {
		return idList;
	}

	public void setIdList(List<String> idList) {
		this.idList = idList;
	}

	public List<String> getEmailList() {
		return emailList;
	}

	public void setEmailList(List<String> emailList) {
		this.emailList = emailList;
	}
	
	public List<String> getNameList() {
		return nameList;
	}

	public void setNameList(List<String> nameList) {
		this.nameList = nameList;
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

	public String getFormType() {
		return formType;
	}

	public void setFormType(String type) {
		this.formType = type;
	}

	@Override
	public String toString() {
		return "AdminMemberEmailVO [ids=" + idList + ", emails=" + emailList
				+ ", title=" + title + ", content=" + content + ", type="
				+ formType + "]";
	}

}
