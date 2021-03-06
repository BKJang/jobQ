package egovframework.example.admin.sidebar.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.board.mapper.JobStoryMapper;

@Service
public class JobStoryDelete {
	@Autowired
	private JobStoryMapper jobStoryMapper;
	
	public boolean delete(List<String> deleteList) throws Exception{
		if(jobStoryMapper.delete(deleteList) > 0)
			return true;
		
		return false;
	}
	
}
