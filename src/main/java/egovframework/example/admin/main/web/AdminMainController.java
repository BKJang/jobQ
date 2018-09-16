package egovframework.example.admin.main.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.main.mapper.AdminMainEmployAndResume;
import egovframework.example.admin.main.mapper.AdminMainNotice;
import egovframework.example.admin.main.service.impl.AdminMainCurrentState;

@Controller
public class AdminMainController {
	private static final Logger logger = LoggerFactory.getLogger(AdminMainController.class);
	
	@Autowired
	private AdminMainCurrentState adminMainCurrentState; 
	
	@Autowired
	private AdminMainNotice adminMainNotice;
	
	@Autowired
	private AdminMainEmployAndResume adminMainEmployAndResume; 
	
	@RequestMapping("/admin/main")
	public ModelAndView showMainPage(){
		ModelAndView modelAndView = new ModelAndView();
		List<List<Map<String, String>>> notices = getMainNotices();
		
		try {
			modelAndView.setViewName("main/index-js/index.admin");
			
			modelAndView.addObject("siteCurrentState", adminMainCurrentState.getSiteCurrentInfo());
			modelAndView.addObject("members", notices.get(0));	// 첫번째 리스트는 신규 멤버 5명
			modelAndView.addObject("employs", notices.get(1));	// 두번째 리스트는 신규 구인 공고 5개
			modelAndView.addObject("resumes", notices.get(2));	// 세번째 리스트는 신규 이력서 5개
			modelAndView.addObject("qnas", notices.get(3));	// 네번째 리스트는 신규 QNA 5개
			modelAndView.addObject("storys", notices.get(4));	// 다섯번째 리스트는 신규 JOB STORY 5개
			modelAndView.addObject("applyAndOffers", notices.get(5));	// 여섯번째 리스트는 신규 지원 및 제의 현황 5개
		
			modelAndView.addObject("employDates", adminMainEmployAndResume.getEmployDates());
			modelAndView.addObject("resumeDates", adminMainEmployAndResume.getResumeDates());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	private List<List<Map<String, String>>> getMainNotices(){
		List<List<Map<String, String>>> notices = new ArrayList<List<Map<String, String>>>();
		
		try {
			notices.add(adminMainNotice.getMembers());
			notices.add(adminMainNotice.getEmploys());
			notices.add(adminMainNotice.getResumes());
			notices.add(adminMainNotice.getQnas());
			notices.add(adminMainNotice.getBoards());
			notices.add(adminMainNotice.getApplyAndOffers());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return notices;
	}
}
