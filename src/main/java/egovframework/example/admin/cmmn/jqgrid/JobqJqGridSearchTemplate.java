package egovframework.example.admin.cmmn.jqgrid;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.board.BoardSearch;
import egovframework.example.admin.cmmn.board.BoardSelect;


public abstract class JobqJqGridSearchTemplate {
	private static final Logger logger = LoggerFactory.getLogger(JobqJqGridSearchTemplate.class);
	
	private BoardSearch boardSearch;
	
	private BoardSelect boardSelect;
	
	private JobqJqGridConvertorTemplate jobqJqGridConvertorTemplate;
	
	public JobqJqGridSearchTemplate(BoardSearch boardSearch,
			BoardSelect boardSelect,
			JobqJqGridConvertorTemplate jobqJqGridConvertorTemplate) {
		super();
		this.boardSearch = boardSearch;
		this.boardSelect = boardSelect;
		this.jobqJqGridConvertorTemplate = jobqJqGridConvertorTemplate;
	}

	public final JsonObject search(Map<String, Object> searchInfo) throws Exception{
		int row = Integer.parseInt((String) searchInfo.get("rows"));
		int page = Integer.parseInt((String)searchInfo.get("page"));
		
		calculatePage(searchInfo);
		
		int allData = boardSelect.countAllList();
		int countSearchedData = boardSearch.countSearchedData(searchInfo);
		int searchedPages = countSearchPage(countSearchedData, row);
		
		JsonObject object = jobqJqGridConvertorTemplate.convertDataToJqGridJson(page, boardSearch.search(searchInfo), row, allData, searchedPages);
		object.add("userData", makeTotalCountAndSearchedCount(allData, countSearchedData));
		
		return object;
	}
	
	protected abstract JsonObject makeTotalCountAndSearchedCount(int allData, int countSearchedData);
		
	private int countSearchPage(int page, int row) {
		return page % row == 0 ? page / row : ( page / row ) + 1 ;
	}
	
	private void calculatePage(Map<String, Object> searchInfo){
		int page = Integer.parseInt((String)searchInfo.get("page"));
		int row = Integer.parseInt((String)searchInfo.get("rows"));
		
		String startPage = String.valueOf(((page - 1) * row) + 1);
		String endPage = String.valueOf(page * row);
		
		searchInfo.put("startPage", startPage);
		searchInfo.put("endPage", endPage);
	}

	public void setJobqJqGridConvertorTemplate(JobqJqGridConvertorTemplate jobqJqGridConvertorTemplate) {
		this.jobqJqGridConvertorTemplate = jobqJqGridConvertorTemplate;
	}
}
