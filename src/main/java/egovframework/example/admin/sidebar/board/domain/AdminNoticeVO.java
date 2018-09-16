package egovframework.example.admin.sidebar.board.domain;

import java.sql.Timestamp;

import egovframework.example.admin.cmmn.board.domain.BoardPage;

public class AdminNoticeVO {
	private int no;
	private String id;
	private String title;
	private String content;
	private Timestamp regDate;
	private Timestamp updateDate;
	private String isPublic;

	private BoardPage boardPage;

	public BoardPage getBoardPage() {
		return boardPage;
	}

	public void setBoardPage(BoardPage boardPage) {
		this.boardPage = boardPage;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getIsPublic() {
		return isPublic;
	}

	public void setIsPublic(String isPublic) {
		this.isPublic = isPublic;
	}

}
