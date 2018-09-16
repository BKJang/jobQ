package egovframework.example.admin.sidebar.mainsetting.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.mainsetting.dao.MainInterviewMapper;

@Service
public class MainInterviewAdd {
	@Autowired
	private MainInterviewMapper mainInterviewMapper;

	public boolean add(Map<String, Object> interviewMap) {
		if(mainInterviewMapper.add(interviewMap) > 0)
			return true;
		
		return false;
	}
	
	
}
