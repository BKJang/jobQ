package egovframework.example.admin.sidebar.inquire.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.inquire.domain.AdminQnaVO;
import egovframework.example.admin.sidebar.inquire.mapper.AdminQnaMapper;

@Service
public class AdminQnaDetail {
	@Autowired
	private AdminQnaMapper adminQnaMapper;
	
	public ModelAndView getDetail(int no) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
			
		AdminQnaVO adminQnaVO = adminQnaMapper.getDetail(no);
		List<AdminQnaVO> faqPrevAndNext = adminQnaMapper.getPrevAndNextPage(getPrevAndNextPage(adminQnaVO));
		
		modelAndView.setViewName("inquire/qnaDetail-js/qnaDetail.admin");
		modelAndView.addObject("qna", adminQnaVO);
		modelAndView.addObject("prevAndNext", faqPrevAndNext);
		
		return modelAndView;
	}
	
	private List<Integer> getPrevAndNextPage(AdminQnaVO adminQnaVO){
		return Arrays.asList(adminQnaVO.getBoardPage().getPrev(), adminQnaVO.getBoardPage().getNext());
	}
}
