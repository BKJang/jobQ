package egovframework.example.admin.sidebar.member.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

@Service
public class AdminEmailForm {
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	
	public String getEmailForm(String emailFormName) throws Exception{
		return adminMemberMapper.getEmailForm(emailFormName);
	}
}
