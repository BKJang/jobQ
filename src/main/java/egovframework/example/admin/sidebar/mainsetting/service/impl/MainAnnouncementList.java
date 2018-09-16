package egovframework.example.admin.sidebar.mainsetting.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.utils.JobqJsonUtils;
import egovframework.example.admin.sidebar.mainsetting.dao.MainAnnouncementMapper;
import egovframework.example.admin.sidebar.mainsetting.domain.AnnouncementVO;

@Service
public class MainAnnouncementList {
	@Autowired
	private MainAnnouncementMapper mainAnnouncementMapper;
	
	@Autowired
	private JobqJsonUtils jobqJsonUtils;
	
	public JsonObject getList(int page, int row){
		List<AnnouncementVO> list = getPage(page, row);
		int allAnnouncements = mainAnnouncementMapper.countAllList();
		int allPages = countAllPage(allAnnouncements, row);
		
		return jobqJsonUtils.jqGridWithAnnouncementJsonObject(page, list, row, allAnnouncements, allPages);
	}
	
	private List<AnnouncementVO> getPage(int page, int row){
		Map<String, Integer> pageInfo = new HashMap();
		
		int startPage = ((page - 1) * row) + 1;
		int endPage = page * row;
		
		pageInfo.put("startPage", startPage);
		pageInfo.put("endPage", endPage);
		
		return mainAnnouncementMapper.getList(pageInfo);
	}
	
	private int countAllPage(int page, int row){
		return page % row == 0 ? page / row : ( page / row ) + 1 ;
	}
	
}
