package egovframework.example.admin.sidebar.resume.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.resume.dao.AdminResumeMapper;

@Service
public class AdminResumeDelete {
	@Autowired
	private AdminResumeMapper adminResumeMapper;
	
	public boolean delete(List<String> deleteList){
		if(adminResumeMapper.delete(deleteList) < 1)
			return false;
		
		return true;
	}
}
