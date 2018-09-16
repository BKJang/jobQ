package egovframework.example.admin.sidebar.inquire.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.inquire.mapper.AdminFaqMapper;

@Service
public class AdminFaqMain {
	@Autowired
	private AdminFaqMapper adminFaqMapper;
	
	public ModelAndView getMainData() throws Exception{
		int mainUseFaqCnt = adminFaqMapper.getMainData();
		
		return new ModelAndView("inquire/faq-js/faq.admin", "mainUseFaqCnt", mainUseFaqCnt);
	}
}
