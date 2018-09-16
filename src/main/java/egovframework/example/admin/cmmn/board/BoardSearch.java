package egovframework.example.admin.cmmn.board;

import java.util.List;
import java.util.Map;

public interface BoardSearch{
	public int countSearchedData(Map<String, Object> searchInfo);
	
	public List<Map<String, Object>> search(Map<String, Object> searchInfo);
}
