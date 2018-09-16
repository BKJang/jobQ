package egovframework.example.admin.sidebar.resume.domain;

public class AdminResumeMainDatas {
	private String data;
	private String type;

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "AdminResumeMainDatas [data=" + data + ", type=" + type + "]";
	}
	
}
