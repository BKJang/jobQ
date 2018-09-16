package egovframework.example.admin.sidebar.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

@Service
public class AdminMemberDelete {
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	
	public boolean delete(List<String> deleteList) throws Exception{
		int isDeleted = adminMemberMapper.delete(deleteList);
		if(isDeleted > 0)
			return true;
		
		return false;
	}
}
