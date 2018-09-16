package egovframework.example.admin.sidebar.member.domain;

import org.hibernate.validator.constraints.NotEmpty;

public class CompanyNumber {
	@NotEmpty
	private String firstCompanyNumber;
	
	@NotEmpty
	private String midCompanyNumber;
	
	@NotEmpty
	private String lastCompanyNumber;

	public String getFirstCompanyNumber() {
		return firstCompanyNumber;
	}

	public void setFirstCompanyNumber(String firstCompanyNumber) {
		this.firstCompanyNumber = firstCompanyNumber;
	}

	public String getMidCompanyNumber() {
		return midCompanyNumber;
	}

	public void setMidCompanyNumber(String midCompanyNumber) {
		this.midCompanyNumber = midCompanyNumber;
	}

	public String getLastCompanyNumber() {
		return lastCompanyNumber;
	}

	public void setLastCompanyNumber(String lastCompanyNumber) {
		this.lastCompanyNumber = lastCompanyNumber;
	}
	
	public String getFullCompanyNumber(){
		StringBuilder builder = new StringBuilder();
		
		builder.append(firstCompanyNumber);
		builder.append("-");
		builder.append(midCompanyNumber);
		builder.append("-");
		builder.append(lastCompanyNumber);
	
		return builder.toString();
	}

	@Override
	public String toString() {
		return "CompanyNumber [firstCompanyNumber=" + firstCompanyNumber
				+ ", midCompanyNumber=" + midCompanyNumber
				+ ", lastCompanyNumber=" + lastCompanyNumber + "]";
	}
}
