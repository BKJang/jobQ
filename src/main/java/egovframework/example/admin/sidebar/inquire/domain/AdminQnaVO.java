package egovframework.example.admin.sidebar.inquire.domain;

import java.sql.Timestamp;

import egovframework.example.admin.cmmn.board.domain.BoardPage;

public class AdminQnaVO {
	private int no;
	private String id;
	private String title;
	private String content;
	private Timestamp regDate;
	private Timestamp updateDate;
	private String state;

	private String replyId;
	private String replyContent;
	private Timestamp replyRegDate;

	private BoardPage boardPage;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getReplyId() {
		return replyId;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Timestamp getReplyRegDate() {
		return replyRegDate;
	}

	public void setReplyRegDate(Timestamp replyRegDate) {
		this.replyRegDate = replyRegDate;
	}

}
