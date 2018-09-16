package egovframework.example.admin.sidebar.mainsetting.service.impl;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.utils.JobqJsonUtils;
import egovframework.example.admin.sidebar.mainsetting.dao.MainInterviewMapper;

@Service
public class MainInterviewSearch {
	@Autowired
	private MainInterviewMapper mainInterviewMapper;
	
	@Autowired
	private JobqJsonUtils jobqJsonUtils;
	
	public JsonObject search(Map<String, Object> searchInfo){
		int row = Integer.parseInt((String) searchInfo.get("rows"));
		int page = Integer.parseInt((String)searchInfo.get("page"));
		
		calculatePage(searchInfo);
		processingInterviewUse(searchInfo);
		
		int allInterviews = mainInterviewMapper.countAllList();
		int countSearchedInterviews = mainInterviewMapper.countSearchedInterviews(searchInfo);
		int searchedPages = countSearchPage(countSearchedInterviews, row);
		
		JsonObject object = jobqJsonUtils.jqGridWithInterviewJsonObject(page, mainInterviewMapper.searchInterviews(searchInfo), row, allInterviews, searchedPages);
		
		object.add("userData", makeTotalCountAndSearchedCount(allInterviews, countSearchedInterviews));
		
		return object;
	}
	
	private void processingInterviewUse(Map<String, Object> searchInfo) {
		if(searchInfo.containsKey("interview_use")){
			List<String> uses = Arrays.asList(((String)searchInfo.get("interview_use")).split(","));
			
			searchInfo.put("interview_use", uses);
		}
	}
	
	private int countSearchPage(int page, int row){
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
	
	private JsonObject makeTotalCountAndSearchedCount(int allInterviews, int countSearchedInterviews){
		JsonObject object = new JsonObject();
		
		object.addProperty("allInterviews", allInterviews);
		object.addProperty("countSearchedInterviews", countSearchedInterviews);
		
		return object;
	}
}
