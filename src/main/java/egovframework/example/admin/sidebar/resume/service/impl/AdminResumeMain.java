package egovframework.example.admin.sidebar.resume.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.resume.dao.AdminResumeMapper;
import egovframework.example.admin.sidebar.resume.domain.AdminResumeMainDatas;

@Service
public class AdminResumeMain {
	@Autowired
	private AdminResumeMapper adminResumeMapper;
	
	public ModelAndView getResumeMainData() throws Exception{
		List<AdminResumeMainDatas> mainDatas = adminResumeMapper.getResumeMainData();
		
		return new ModelAndView("resume/resume-js/resume.admin", "mainDatas", mainDatas);
	}
}
