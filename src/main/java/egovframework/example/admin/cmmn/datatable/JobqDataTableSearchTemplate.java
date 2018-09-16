package egovframework.example.admin.cmmn.datatable;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.board.BoardSearch;
import egovframework.example.admin.cmmn.board.BoardSelect;

public abstract class JobqDataTableSearchTemplate {
	private static final Logger logger = LoggerFactory.getLogger(JobqDataTableSearchTemplate.class);
	
	private BoardSearch boardSearch;
	
	private BoardSelect boardSelect;
	
	private JobqDataTableConvertorTemplate jobqDataTableConvertorTemplate;
	
	public JobqDataTableSearchTemplate(BoardSearch boardSearch,
			BoardSelect boardSelect,
			JobqDataTableConvertorTemplate jobqDataTableConvertorTemplate) {
		super();
		this.boardSearch = boardSearch;
		this.boardSelect = boardSelect;
		this.jobqDataTableConvertorTemplate = jobqDataTableConvertorTemplate;
	}

	public final JsonObject search(Map<String, Object> searchInfo) throws Exception{
		// int row = Integer.parseInt((String) searchInfo.get("rows"));
		// int page = Integer.parseInt((String)searchInfo.get("page"));
		List<Map<String, Object>> list = getSearchPage(searchInfo);
		// calculatePage(searchInfo);
		
		// int allDataCnt = boardSelect.countAllList();
		int countSearchedData = boardSearch.countSearchedData(searchInfo);
		// int searchedPages = countSearchPage(countSearchedData, Integer.parseInt((String) searchInfo.get("length")));
		
		JsonObject object = jobqDataTableConvertorTemplate.convertDataToJqGridJson(list);
		object.addProperty("recordsFiltered", countSearchedData);	// 버튼 개수는 이놈과 관련이 있다.
		
		return object;
	}
	
	protected abstract JsonObject makeTotalCountAndSearchedCount(int allData, int countSearchedData);
	
	private List<Map<String, Object>> getSearchPage(Map<String, Object> searchInfo) throws Exception{
		int page = Integer.parseInt((String) searchInfo.get("start"));
		int row = Integer.parseInt((String) searchInfo.get("length"));
				
		int startPage = page + 1;
		int endPage = row * ((page + 1) / row + 1);
		
		searchInfo.put("startPage", String.valueOf(startPage));
		searchInfo.put("endPage", String.valueOf(endPage));
		
		return boardSearch.search(searchInfo);
	}
	
	/*private int countSearchPage(int page, int row) {
		return page % row == 0 ? page / row : ( page / row ) + 1 ;
	}*/
	
	/*private void calculatePage(Map<String, String> searchInfo){
		int page = Integer.parseInt(searchInfo.get("page"));
		int row = Integer.parseInt(searchInfo.get("rows"));
		
		String startPage = String.valueOf(((page - 1) * row) + 1);
		String endPage = String.valueOf(page * row);
		
		searchInfo.put("startPage", startPage);
		searchInfo.put("endPage", endPage);
	}*/
}
