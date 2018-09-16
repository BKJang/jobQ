package egovframework.example.admin.sidebar.member.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.cmmn.domain.PhoneVO;
import egovframework.example.admin.sidebar.member.domain.AdminMemberVO;
import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

@Service
public class AdminMemberExcel {
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	
	public List<AdminMemberVO> getMemberInfoForExcel(String memberIds) throws Exception{
		return adminMemberMapper.getMemberInfoForExcel(convertStringToList(memberIds));
	}
	
	private List<String> convertStringToList(String memberIds){
		return Arrays.asList(memberIds.split(","));
	}
}
