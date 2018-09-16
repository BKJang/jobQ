package egovframework.example.admin.cmmn.domain;

import org.hibernate.validator.constraints.NotEmpty;

public class EmailVO {
	@NotEmpty
	private String emailId;
	
	@NotEmpty
	private String emailDomain;

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getEmailDomain() {
		return emailDomain;
	}

	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	
	public String getFullEmail(){
		StringBuilder builder = new StringBuilder();
		
		builder.append(this.emailId);
		builder.append("@");
		builder.append(this.emailDomain);
		
		return builder.toString();
	}
}
