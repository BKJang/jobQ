package egovframework.example.admin.sidebar.mainsetting.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.utils.JobqJsonUtils;
import egovframework.example.admin.sidebar.mainsetting.dao.MainInterviewMapper;
import egovframework.example.admin.sidebar.mainsetting.domain.InterviewVO;

@Service
public class MainInterviewList {
	@Autowired
	private MainInterviewMapper mainInterviewMapper;
	
	@Autowired
	private JobqJsonUtils jobqJsonUtils; 
	
	public JsonObject getList(int page, int row){
		List<InterviewVO> list = getPage(page, row);
		int allInterviews = mainInterviewMapper.countAllList();
		int allPages = countAllPage(allInterviews, row);
		
		return jobqJsonUtils.jqGridWithInterviewJsonObject(page, list, row, allInterviews, allPages);
	}
	
	private List<InterviewVO> getPage(int page, int row){
		Map<String, Integer> pageInfo = new HashMap();
		
		int startPage = ((page - 1) * row) + 1;
		int endPage = page * row;
		
		pageInfo.put("startPage", startPage);
		pageInfo.put("endPage", endPage);
		
		return mainInterviewMapper.getList(pageInfo);
	}
	
	private int countAllPage(int allInterviews, int row){
		return allInterviews % row == 0 ? allInterviews / row : ( allInterviews / row ) + 1 ;
	}
}
