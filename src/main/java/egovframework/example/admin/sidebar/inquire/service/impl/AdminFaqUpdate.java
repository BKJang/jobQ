package egovframework.example.admin.sidebar.inquire.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.inquire.mapper.AdminFaqMapper;


@Service
public class AdminFaqUpdate {
	@Autowired
	private AdminFaqMapper adminFaqMapper;
	
	public boolean update(Map<String, Object> updateMap){
		if(adminFaqMapper.update(updateMap) > 0)
			return true;
		
		return false;
	}

	public boolean updateState(Map<String, Object> faqInfo) {
		if(adminFaqMapper.updateState(faqInfo) > 0)
			return true;
		
		return false;
	}
}
