package egovframework.example.admin.sidebar.employ.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.employ.mapper.AdminEmployMapper;
import egovframework.example.admin.sidebar.resume.domain.AdminResumeMainDatas;

@Service
public class AdminEmployMain {
	@Autowired
	private AdminEmployMapper adminEmployMapper;
	
	public ModelAndView getEmployMainData() throws Exception{
		List<AdminResumeMainDatas> mainDatas = adminEmployMapper.getEmployMainData();
		
		return new ModelAndView("employ/employ-js/employ.admin", "mainDatas", mainDatas);
	}

}
