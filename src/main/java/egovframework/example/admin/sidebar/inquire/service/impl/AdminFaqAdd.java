package egovframework.example.admin.sidebar.inquire.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.inquire.mapper.AdminFaqMapper;

@Service
public class AdminFaqAdd {
	@Autowired
	private AdminFaqMapper adminFaqMapper;
	
	public boolean insert(Map<String, Object> registMap){
		if(adminFaqMapper.insert(registMap) > 0)
			return true;
		
		return false;
	}
}
