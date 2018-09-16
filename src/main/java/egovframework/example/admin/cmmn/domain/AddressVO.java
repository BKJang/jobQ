package egovframework.example.admin.cmmn.domain;

import org.hibernate.validator.constraints.NotEmpty;

public class AddressVO {
	@NotEmpty
	private String zipCode;
	
	@NotEmpty
	private String roadAddr;
	
	@NotEmpty
	private String detailAddr;

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getRoadAddr() {
		return roadAddr;
	}

	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	@Override
	public String toString() {
		return "AddressVO [zipCode=" + zipCode + ", roadAddr=" + roadAddr
				+ ", detailAddr=" + detailAddr + "]";
	}

}
