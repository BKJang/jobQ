package egovframework.example.admin.sidebar.member.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.member.domain.AdminCompanyMemberVO;
import egovframework.example.admin.sidebar.member.domain.AdminMemberVO;
import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

@Service
public class AdminMemberRegister {
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	
	public boolean registGeneralMember(AdminMemberVO member) throws Exception{
		member.setAge(calculateAge(member.getBirthDate()));
		
		if(adminMemberMapper.registGeneralMember(member) > 0)
			return true;
		
		return false;
	}
	
	private int calculateAge(Date birthDate){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		int birthYear = Integer.parseInt(format.format(birthDate).split("-")[0]);
		
		return currentYear - birthYear + 1;
	}
	
	public boolean registCompanyMember(AdminCompanyMemberVO companyMember) throws Exception{
		calculateAge(companyMember.getMember().getBirthDate());
		
		if(adminMemberMapper.registCompanyMember(companyMember) > 0)
			return true;
		
		return false;
	}
	
}
