package egovframework.example.admin.cmmn.jqgrid;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.antlr.grammar.v3.ANTLRParser.finallyClause_return;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.board.BoardSelect;
import egovframework.example.admin.sidebar.member.domain.AdminMemberVO;

public abstract class JobqJqGridSelectTemplate {
	private static final Logger logger = LoggerFactory.getLogger(JobqJqGridSelectTemplate.class);
	
	private BoardSelect boardSelect;
	
	private JobqJqGridConvertorTemplate jobqjqGridConvertorTemplate;
	
	public JobqJqGridSelectTemplate() {
		super();
	}

	public JobqJqGridSelectTemplate(JobqJqGridConvertorTemplate jobqjqGridConvertorTemplate) {
		super();
		this.jobqjqGridConvertorTemplate = jobqjqGridConvertorTemplate;
	}
	
	public JobqJqGridSelectTemplate(BoardSelect boardSelect, JobqJqGridConvertorTemplate jobqjqGridConvertorTemplate) {
		super();
		this.boardSelect = boardSelect;
		this.jobqjqGridConvertorTemplate = jobqjqGridConvertorTemplate;
	}

	public final JsonObject getList(int page, int row) throws Exception{
		List<Map<String, Object>> list = getPage(page, row);
				
		int allDataCnt = boardSelect.countAllList();
		int allPages = countAllPage(allDataCnt, row);
		
		JsonObject object = jobqjqGridConvertorTemplate.convertDataToJqGridJson(page, list, row, allDataCnt, allPages);
		object.add("userData", makeTotalCount(allDataCnt));

		return object;
	}
	
	public final void setJobqJqGridSelectMapper(BoardSelect boardSelect) {
		this.boardSelect = boardSelect;
	}

	private List<Map<String, Object>> getPage(int page, int row) throws Exception{
		Map<String, Integer> pageInfo = new HashMap();
		
		int startPage = ((page - 1) * row) + 1;
		int endPage = page * row;
		
		pageInfo.put("startPage", startPage);
		pageInfo.put("endPage", endPage);
		
		return boardSelect.getList(pageInfo);
	}
	
	private int countAllPage(int page, int row){
		return page % row == 0 ? page / row : ( page / row ) + 1 ;
	}
	
	protected abstract JsonObject makeTotalCount(int allDataCnt);
}
