package egovframework.example.admin.sidebar.member.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.member.domain.AdminCompanyMemberVO;
import egovframework.example.admin.sidebar.member.domain.AdminMemberVO;
import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

@Service
public class AdminMemberDetail {
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	
	public ModelAndView getMemberDetail(Map<String, String> memberInfo) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		final String type = memberInfo.get("type");
		
		if(type.equals("p")){
			modelAndView.setViewName("member/generalMemberDetail-js/generalMemberDetail.admin");
			modelAndView.addObject("member", adminMemberMapper.getMemberDetail(memberInfo));
		}else{
			modelAndView.setViewName("member/companyMemberDetail-js/companyMemberDetail.admin");
			modelAndView.addObject("companyMember", adminMemberMapper.getCompanyMemberDetail(memberInfo));
		}
			
		return modelAndView;
	}
	
}
