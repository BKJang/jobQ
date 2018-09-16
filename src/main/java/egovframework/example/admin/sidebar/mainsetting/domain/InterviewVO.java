package egovframework.example.admin.sidebar.mainsetting.domain;

import java.sql.Timestamp;

import egovframework.example.admin.cmmn.board.domain.BoardPage;

public class InterviewVO{
	private int no;
	private String id;
	private char use;
	private String content;
	private Timestamp regDate;
	private Timestamp updateDate;
	
	private BoardPage boardPage;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public InterviewVO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public char getUse() {
		return use;
	}

	public void setUse(char use) {
		this.use = use;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public BoardPage getBoardPage() {
		return boardPage;
	}

	public void setBoardPage(BoardPage boardPage) {
		this.boardPage = boardPage;
	}
}
