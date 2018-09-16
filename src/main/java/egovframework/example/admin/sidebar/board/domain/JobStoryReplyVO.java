package egovframework.example.admin.sidebar.board.domain;

import java.sql.Timestamp;

public class JobStoryReplyVO {
	private int boardNo;
	private int replyNo;
	private String id;
	private String content;
	private Timestamp regDate;
	private Timestamp updateDate;
	private char isDelete;

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public char getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(char isDelete) {
		this.isDelete = isDelete;
	}

	@Override
	public String toString() {
		return "JobStoryReplyVO [boardNo=" + boardNo + ", replyNo=" + replyNo
				+ ", id=" + id + ", content=" + content + ", regDate="
				+ regDate + ", updateDate=" + updateDate + ", isDelete="
				+ isDelete + "]";
	}

}
