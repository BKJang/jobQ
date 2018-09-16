package egovframework.example.main.main.web;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.main.main.service.MainService;

@Controller
public class MainController {
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@RequestMapping(value = "main.jobq")
	public <map> String initMain(HttpServletRequest request, ModelMap model) throws Exception {


		List<?> mainList = mainService.selectMainContents();	//핫채용정보
		
		model.addAttribute("mainList", mainList);
		
		System.out.println(mainList);
		
		
		List<?> mainList2 = mainService.selectMainContents2();	//스페셜채용정보
		

		model.addAttribute("mainList2", mainList2);
		

		
		
		//랜덤으로 순서 재배치 아래 세줄 추가

		 Collections.shuffle(mainList2); 

	        for (int i = 0; i < mainList2.size(); i++) {

	            /*System.out.println(mainList2.get(i));*/
	            
	        }

	            
		List<?> mainTipList = mainService.selectMainTip();	//면접팁
		
		model.addAttribute("mainTipList", mainTipList);
		
		/*System.out.println(mainTipList);*/
		
		
		List<?> noticeList = mainService.selectNotice();	//공지사항
		
		model.addAttribute("noticeList", noticeList);
		
		/*System.out.println(noticeList);*/
		
		
		List<?> faqList = mainService.selectFaq();	//FAQ public=y
		
		model.addAttribute("faqList", faqList);
		
		/*System.out.println(noticeList);*/
		
		
		List<?> storyList = mainService.selectStory();	//게시판 최신글 2개
		
		model.addAttribute("storyList", storyList);
		
		/*System.out.println(noticeList);*/
		
			
		
		return "main/main/main.tiles";
	}
	
	/*@RequestMapping(value = "mainPic.jobq", method = RequestMethod.GET)
	public ResponseEntity<byte[]> initMainPic(@RequestParam(value = "picPath", required = false)String picPath) throws Exception{
		ResponseEntity<byte[]> response = null;
		

			response = mainService.selectMainPic(picPath);

		return response;

		
	}*/

}
