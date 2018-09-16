package egovframework.example.admin.sidebar.mainsetting.service.impl;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.utils.JobqJsonUtils;
import egovframework.example.admin.sidebar.mainsetting.dao.MainAnnouncementMapper;

@Service
public class MainAnnouncementSearch {
	
	@Autowired
	private MainAnnouncementMapper mainAnnouncementMapper;
	
	@Autowired
	private JobqJsonUtils jobqJsonUtils;
	
	public JsonObject search(Map<String, Object> searchInfo){
		int row = Integer.parseInt((String) searchInfo.get("rows"));
		int page = Integer.parseInt((String)searchInfo.get("page"));
		
		calculatePage(searchInfo);
		processingStates(searchInfo);
		
		int allAnnouncements = mainAnnouncementMapper.countAllList();
		int countSearchedAnnouncements = mainAnnouncementMapper.countSearchedAnnouncements(searchInfo);
		int searchedPages = countSearchPage(countSearchedAnnouncements, row);
		
		JsonObject object = jobqJsonUtils.jqGridWithAnnouncementJsonObject(page, mainAnnouncementMapper.searchAnnouncements(searchInfo), row, allAnnouncements, searchedPages);
		
		object.add("userData", makeTotalCountAndSearchedCount(allAnnouncements, countSearchedAnnouncements));
		return object;
	}

	private void processingStates(Map<String, Object> searchInfo) {
		if(searchInfo.containsKey("notice_state")){
			List<String> states = Arrays.asList(((String)searchInfo.get("notice_state")).split(","));
			
			searchInfo.put("notice_state", states);
		}
	}
	
	private int countSearchPage(int page, int row){
		return page % row == 0 ? page / row : ( page / row ) + 1 ;
	}
	
	private void calculatePage(Map<String, Object> searchInfo){
		int page = Integer.parseInt((String)searchInfo.get("page"));
		int row = Integer.parseInt((String)searchInfo.get("rows"));
		
		int startPage = ((page - 1) * row) + 1;
		int endPage = page * row;
		
		searchInfo.put("startPage", startPage);
		searchInfo.put("endPage", endPage);
	}
	
	private JsonObject makeTotalCountAndSearchedCount(int allAnnouncements, int countSearchedAnnouncements){
		JsonObject object = new JsonObject();
		
		object.addProperty("allAnnouncements", allAnnouncements);
		object.addProperty("countSearchedAnnouncements", countSearchedAnnouncements);
		
		return object;
	}
}
