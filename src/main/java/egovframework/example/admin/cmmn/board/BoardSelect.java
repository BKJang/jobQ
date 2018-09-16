package egovframework.example.admin.cmmn.board;

import java.util.List;
import java.util.Map;

public interface BoardSelect {
	public List<Map<String, Object>> getList(Map<String, Integer> pageInfo) throws Exception;
	
	public int countAllList() throws Exception;
}
