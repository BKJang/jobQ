package egovframework.example.admin.cmmn.board.domain;

// 게시판 페이지
public class BoardPage {
	private int prev;
	private int next;

	public int getPrev() {
		return prev;
	}

	public int getNext() {
		return next;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public void setNext(int next) {
		this.next = next;
	}
}
