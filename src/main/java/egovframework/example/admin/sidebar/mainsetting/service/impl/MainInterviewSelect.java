package egovframework.example.admin.sidebar.mainsetting.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.mainsetting.dao.MainInterviewMapper;
import egovframework.example.admin.sidebar.mainsetting.domain.InterviewVO;

@Service
public class MainInterviewSelect {
	@Autowired
	private MainInterviewMapper mainInterviewMapper;
	
	public ModelAndView selectDetatil(int no){
		return storeInterviews(mainInterviewMapper.selectInterviewDetail(no));
	}
	
	public ModelAndView selectUpdatePageInfo(int no){
		Map<String, String> interviewVO = mainInterviewMapper.selectUpdatePageInfo(no);
		
		return new ModelAndView("mainsetting/interviewTipUpdate-js/interviewTipUpdate.admin", "interview", interviewVO);
	}
	
	private ModelAndView storeInterviews(List<InterviewVO> interviewDetailList){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mainsetting/interviewTipDetail-js/interviewTipDetail.admin");
		
		for (InterviewVO interviewVO : interviewDetailList) {
			modelAndView.addObject("interview", interviewVO);
			modelAndView.addObject("preNextContent", getPrePageAndNextPage(interviewVO.getBoardPage().getPrev(), interviewVO.getBoardPage().getNext()));
		}
		
		return modelAndView;
	}
	
	private List<InterviewVO> getPrePageAndNextPage(int prev, int next){
		Map<String, Integer> preNextInfo = new HashMap<String, Integer>();
		
		preNextInfo.put("prePageNo", prev);
		preNextInfo.put("nextPageNo", next);
		
		return mainInterviewMapper.selectPrePageAndNextPage(preNextInfo);
	}
}
