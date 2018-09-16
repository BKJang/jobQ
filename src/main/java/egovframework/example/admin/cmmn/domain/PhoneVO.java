package egovframework.example.admin.cmmn.domain;


public class PhoneVO {
	private String firstNumber;
	private String midNumber;
	private String lastNumber;

	public String getFirstNumber() {
		return firstNumber;
	}

	public void setFirstNumber(String firstNumber) {
		this.firstNumber = firstNumber;
	}

	public String getMidNumber() {
		return midNumber;
	}

	public void setMidNumber(String midNumber) {
		this.midNumber = midNumber;
	}

	public String getLastNumber() {
		return lastNumber;
	}

	public void setLastNumber(String lastNumber) {
		this.lastNumber = lastNumber;
	}
	
	public String getFullPhoneNumber(){
		StringBuilder builder = new StringBuilder();
		
		builder.append(this.firstNumber);
		builder.append("-");
		builder.append(this.midNumber);
		builder.append("-");
		builder.append(this.lastNumber);
		
		return builder.toString(); 
	}
}
