package egovframework.example.main.jobstory.service;



import egovframework.example.cmmn.service.CmmnVO;

public class StoryPagingVO extends CmmnVO {
	
	private String id = "";
	private long rows = 5;

	public long getRows() {
		return rows;
	}

	public void setRows(long rows) {
		this.rows = rows;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
