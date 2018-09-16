package egovframework.example.admin.sidebar.inquire.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.board.domain.AdminNoticeVO;
import egovframework.example.admin.sidebar.board.mapper.AdminNoticeMapper;
import egovframework.example.admin.sidebar.inquire.domain.AdminFaqVO;
import egovframework.example.admin.sidebar.inquire.mapper.AdminFaqMapper;

@Service
public class AdminFaqDetail {
	@Autowired
	private AdminFaqMapper adminFaqMapper;
	
	public ModelAndView getDetail(int no) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
			
		AdminFaqVO adminFaqVO = adminFaqMapper.getDetail(no);
		List<AdminFaqVO> faqPrevAndNext = adminFaqMapper.getPrevAndNextPage(getPrevAndNextPage(adminFaqVO));
		
		modelAndView.setViewName("inquire/faqDetail-js/faqDetail.admin");
		modelAndView.addObject("faq", adminFaqVO);
		modelAndView.addObject("prevAndNext", faqPrevAndNext);
		
		return modelAndView;
	}
	
	private List<Integer> getPrevAndNextPage(AdminFaqVO adminFaqVO){
		return Arrays.asList(adminFaqVO.getBoardPage().getPrev(), adminFaqVO.getBoardPage().getNext());
	}
}
