package egovframework.example.admin.sidebar.mainsetting.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.mainsetting.dao.MainInterviewMapper;

@Service
public class MainInterviewDelete {
	@Autowired
	private MainInterviewMapper mainInterviewMapper;
	
	public int deleteList(List<String> deleteList){
		return mainInterviewMapper.deleteInterviews(deleteList);
	}
	
}
