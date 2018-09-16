package egovframework.example.admin.sidebar.board.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.board.domain.AdminNoticeVO;
import egovframework.example.admin.sidebar.board.domain.JobStoryVO;
import egovframework.example.admin.sidebar.board.mapper.AdminNoticeMapper;

@Service
public class AdminNoticeDetail {
	@Autowired
	private AdminNoticeMapper adminNoticeMapper;
	
	public ModelAndView getDetail(int no) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
			
		AdminNoticeVO adminNoticeVO = adminNoticeMapper.getDetail(no);
		List<AdminNoticeVO> noticePrevAndNext = adminNoticeMapper.getPrevAndNextPage(getPrevAndNextPage(adminNoticeVO));
		
		modelAndView.setViewName("board/noticeDetail-js/noticeDetail.admin");
		modelAndView.addObject("notice", adminNoticeVO);
		modelAndView.addObject("prevAndNext", noticePrevAndNext);
		
		return modelAndView;
	}
	
	private List<Integer> getPrevAndNextPage(AdminNoticeVO adminNoticeVO){
		return Arrays.asList(adminNoticeVO.getBoardPage().getPrev(), adminNoticeVO.getBoardPage().getNext());
	}
}
