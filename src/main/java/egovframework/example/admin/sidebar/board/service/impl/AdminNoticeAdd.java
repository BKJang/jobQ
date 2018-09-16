package egovframework.example.admin.sidebar.board.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.board.mapper.AdminNoticeMapper;

@Service
public class AdminNoticeAdd {
	@Autowired
	private AdminNoticeMapper adminNoticeMapper;
	
	public boolean insert(Map<String, Object> registMap){
		if(adminNoticeMapper.insert(registMap) > 0)
			return true;
		
		return false;
	}
}
