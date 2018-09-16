package egovframework.example.admin.cmmn.datatable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.board.BoardSelect;


public abstract class JobqDataTableSelectTemplate {
	private static final Logger logger = LoggerFactory.getLogger(JobqDataTableSelectTemplate.class);
	
	private BoardSelect boardSelect;

	private JobqDataTableConvertorTemplate jobqDataTableConvertorTemplate;
	
	public JobqDataTableSelectTemplate() {}
	
	public JobqDataTableSelectTemplate(BoardSelect boardSelect, JobqDataTableConvertorTemplate jobqDataTableConvertorTemplate) {
		this.boardSelect = boardSelect;
		this.jobqDataTableConvertorTemplate = jobqDataTableConvertorTemplate;
	}

	public final JsonObject getList(int start, int length) throws Exception{
		List<Map<String, Object>> list = getPage(start, length);
		JsonObject object = new JsonObject();
		
		int allDataCnt = boardSelect.countAllList();
		int allPages = countAllPage(allDataCnt, length);
		
		object = jobqDataTableConvertorTemplate.convertDataToJqGridJson(list);
		// object.addProperty("recordsTotal", allDataCnt);
		object.addProperty("recordsFiltered", allDataCnt);	// 버튼 개수는 이놈과 관련이 있다.
		
		return object;
	}
	
	private List<Map<String, Object>> getPage(int page, int row) throws Exception{
		Map<String, Integer> pageInfo = new HashMap();
		
		int startPage = page + 1;
		int endPage = row * ((page + 1) / row + 1);
		
		pageInfo.put("startPage", startPage);
		pageInfo.put("endPage", endPage);
		
		return boardSelect.getList(pageInfo);
	}
	
	private int countAllPage(int page, int row){
		return page % row == 0 ? page / row : ( page / row ) + 1 ;
	}
}
