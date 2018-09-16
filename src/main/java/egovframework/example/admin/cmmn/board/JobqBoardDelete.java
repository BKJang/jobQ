package egovframework.example.admin.cmmn.board;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class JobqBoardDelete {
	private BoardDelete boardDelete;
	
	public JobqBoardDelete() {
		super();
	}

	public boolean delete(List<String> deleteList){
		 if(boardDelete.delete(deleteList) > 0)
			 return true;
		 
		 return false;
	}

	public JobqBoardDelete setBoardDelete(BoardDelete boardDelete) {
		this.boardDelete = boardDelete;
	
		return this;
	}
	
}
