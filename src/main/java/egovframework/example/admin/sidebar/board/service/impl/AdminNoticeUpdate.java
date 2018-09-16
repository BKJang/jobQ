package egovframework.example.admin.sidebar.board.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.board.mapper.AdminNoticeMapper;

@Service
public class AdminNoticeUpdate {
	@Autowired
	private AdminNoticeMapper adminNoticeMapper;
	
	public boolean update(Map<String, Object> updateMap){
		if(adminNoticeMapper.update(updateMap) > 0)
			return true;
		
		return false;
	}
}
