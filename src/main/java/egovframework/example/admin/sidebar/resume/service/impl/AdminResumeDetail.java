package egovframework.example.admin.sidebar.resume.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.resume.dao.AdminResumeMapper;
import egovframework.example.admin.sidebar.resume.domain.AdminResumeVO;

@Service
public class AdminResumeDetail {
	@Autowired
	private AdminResumeMapper adminResumeMapper;
	
	public ModelAndView getDetail(int no){
		AdminResumeVO resumeInfo = adminResumeMapper.getDetail(no);
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("resume/resumeDetail-js/resumeDetail.admin");
		modelAndView.addObject("resume", resumeInfo);
		
		return modelAndView; 
	}
	
	public ModelAndView getDetail(int no, String state){
		ModelAndView modelAndView = getDetail(no);
		
		modelAndView.setViewName("applyAndOffer/applyDetail-js/applyDetail.admin");
		modelAndView.addObject("state", state);
		
		return modelAndView;
	}
}
