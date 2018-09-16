package egovframework.example.admin.sidebar.employ.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.employ.domain.AdminEmployVO;
import egovframework.example.admin.sidebar.employ.mapper.AdminEmployMapper;

@Service
public class MainEmployDetail {
	@Autowired
	private AdminEmployMapper adminEmployMapper;

	public ModelAndView getDetail(int no) {
		ModelAndView modelAndView = new ModelAndView();
		
		AdminEmployVO employ = adminEmployMapper.getDetail(no);
		List<String> skills = getSkills();
		
		modelAndView.setViewName("employ/employDetail-js/employDetail.admin");
		modelAndView.addObject("employ", employ);
		modelAndView.addObject("skills", skills);
		
		return modelAndView;
	}
	
	private List<String> getSkills(){
		return adminEmployMapper.getSkills();
	}
}
