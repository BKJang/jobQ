package egovframework.example.admin.sidebar.board.domain;

import java.sql.Timestamp;
import java.util.List;

import egovframework.example.admin.cmmn.board.domain.BoardPage;

public class JobStoryVO {
	private int no;
	private String id;
	private String title;
	private String content;
	private String imgPath;
	private Timestamp regDate;
	private Timestamp updateDate;
	private char isDelete;
	private int hits;

	private List<JobStoryReplyVO> reply;
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

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
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

	public char getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(char isDelete) {
		this.isDelete = isDelete;
	}

	public List<JobStoryReplyVO> getReply() {
		return reply;
	}

	public void setReply(List<JobStoryReplyVO> reply) {
		this.reply = reply;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	@Override
	public String toString() {
		return "JobStoryVO [no=" + no + ", id=" + id + ", title=" + title
				+ ", content=" + content + ", imgPath=" + imgPath
				+ ", regDate=" + regDate + ", updateDate=" + updateDate
				+ ", isDelete=" + isDelete + "]";
	}

}
