package egovframework.example.admin.sidebar.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

@Service
public class AdminMemberDuplication {
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	
	public boolean duplicate(String id) throws Exception{
		String checkedId = adminMemberMapper.duplicate(id);
		
		if(checkedId == null || checkedId.isEmpty())
			return false;
		
		return true;
	}
}
