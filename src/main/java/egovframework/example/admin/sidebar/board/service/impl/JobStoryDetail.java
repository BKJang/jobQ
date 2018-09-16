package egovframework.example.admin.sidebar.board.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.board.domain.JobStoryVO;
import egovframework.example.admin.sidebar.board.mapper.JobStoryMapper;

@Service
public class JobStoryDetail {
	@Autowired
	private JobStoryMapper jobStoryMapper;
	
	public ModelAndView getDetail(int no) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
			
		JobStoryVO jobStoryVO = jobStoryMapper.getDetail(no);
		List<JobStoryVO> jobStoryPrevAndNext = jobStoryMapper.getPrevAndNextPage(getPrevAndNextPage(jobStoryVO));
		
		modelAndView.setViewName("board/jobstoryDetail-js/jobstoryDetail.admin");
		modelAndView.addObject("jobstory", jobStoryVO);
		modelAndView.addObject("prevAndNext", jobStoryPrevAndNext);
		
		return modelAndView;
	}
	
	private List<Integer> getPrevAndNextPage(JobStoryVO jobStoryVO){
		return Arrays.asList(jobStoryVO.getBoardPage().getPrev(), jobStoryVO.getBoardPage().getNext());
	}
	
}
