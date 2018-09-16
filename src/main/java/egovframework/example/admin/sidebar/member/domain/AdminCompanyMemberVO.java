package egovframework.example.admin.sidebar.member.domain;

import java.util.Date;

import javax.validation.Valid;

import org.hibernate.validator.constraints.NotEmpty;

import egovframework.example.admin.cmmn.domain.AddressVO;

public class AdminCompanyMemberVO {
	@NotEmpty
	private String companyName;
	
	@NotEmpty
	private String bossName;
	private String type;
	
	// int형에는 @NotEmpty를 쓸 수 없다. @NotEmpty는 String전용이다.
	// int, Date는 @NotNull을 사용해야 한다.
	private String companyMemberNumber;
	private Date companyBirthDate;
	
	@NotEmpty
	private String companyExplain;
	private String companyHomepage;
	
	@Valid
	private CompanyNumber companyNumber;
	
	@Valid
	private AdminMemberVO member;
	
	@Valid
	private AddressVO companyAddr;

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getBossName() {
		return bossName;
	}

	public void setBossName(String bossName) {
		this.bossName = bossName;
	}

	public CompanyNumber getCompanyNumber() {
		return companyNumber;
	}

	public void setCompanyNumber(CompanyNumber companyNumber) {
		this.companyNumber = companyNumber;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCompanyMemberNumber() {
		return companyMemberNumber;
	}

	public void setCompanyMemberNumber(String companyMemberNumber) {
		this.companyMemberNumber = companyMemberNumber;
	}

	public Date getCompanyBirthDate() {
		return companyBirthDate;
	}

	public void setCompanyBirthDate(Date companyBirthDate) {
		this.companyBirthDate = companyBirthDate;
	}

	public String getCompanyExplain() {
		return companyExplain;
	}

	public void setCompanyExplain(String companyExplain) {
		this.companyExplain = companyExplain;
	}

	public String getCompanyHomepage() {
		return companyHomepage;
	}

	public void setCompanyHomepage(String companyHomepage) {
		this.companyHomepage = companyHomepage;
	}

	public AdminMemberVO getMember() {
		return member;
	}

	public void setMember(AdminMemberVO member) {
		this.member = member;
	}

	public AddressVO getCompanyAddr() {
		return companyAddr;
	}

	public void setCompanyAddr(AddressVO companyAddr) {
		this.companyAddr = companyAddr;
	}

	@Override
	public String toString() {
		return "AdminCompanyMemberVO [companyName="
				+ companyName + ", bossName=" + bossName + ", type=" + type
				+ ", companyMemberNumber=" + companyMemberNumber
				+ ", companyBirthDate=" + companyBirthDate
				+ ", companyExplain=" + companyExplain + ", companyHomepage="
				+ companyHomepage + ", companyNumber=" + companyNumber
				+ ", member=" + member + ", companyAddr=" + companyAddr + "]";
	}
	
}
