package egovframework.example.main.resumelist.web;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.main.resumelist.service.MainResumeListService;
import egovframework.example.main.resumelist.service.PagingVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MainResumeListController {
	
	@Resource(name="mainResumeListService")
	private MainResumeListService mainResumeListService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "mainResumelist.jobq")
	public String initMainResumelist(ModelMap model) throws Exception {
		
		try {
			List<Map> mainResumeSkillList = mainResumeListService.selectResumeSkillInfo();
			List<Map> mainPersonList = mainResumeListService.selectMainResumeInfo();
			List<Map> numberOfResume = mainResumeListService.selectNumberOfResume();
		
			model.addAttribute("numberOfResume", numberOfResume);
			model.addAttribute("mainPersonList", mainPersonList);
			model.addAttribute("mainResumeSkillList", mainResumeSkillList);
		//model.addAttribute("mainCareer", mainCareer);
		} catch(Exception e){
			e.printStackTrace();
			return "redirect:/main.jobq";
		}
		return "main/resumelist/list.tiles";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "resumeDetail.jobq")
	public String initMainResumedetail(HttpServletRequest request, ModelMap model,@RequestParam(defaultValue = "0") int appId ) throws Exception {
		
		try {
			String resumeNumber = request.getParameter("resume_detail");
			System.out.println(resumeNumber);
			if (appId != 0) {
//				지원자 읽음 처리하기	
				mainResumeListService.updateRead(appId);
			}
			
			model.addAttribute("resumeNumber", resumeNumber);
		
			List<Map> mainResumePersonList = mainResumeListService.selectPersonMainInfo(resumeNumber);
			List<Map> mainResumeAcademicList = mainResumeListService.selectPersonAcademicInfo(resumeNumber);
			List<Map> mainResumeCareerList = mainResumeListService.selectPersonCareerInfo(resumeNumber);
			List<Map> mainResumeList = mainResumeListService.selectPersonResumeInfo(resumeNumber);
		
			model.addAttribute("mainResumePersonList", mainResumePersonList);
			model.addAttribute("mainResumeAcademicList", mainResumeAcademicList);
			model.addAttribute("mainResumeCareerList", mainResumeCareerList);
			model.addAttribute("mainResumeList", mainResumeList);
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:/main.jobq";
		}
		return "main/resumelist/detail.tiles";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "paging.jobq")
	public String initMainResumedetail2(ModelMap model, PagingVO pagingVO, HttpServletRequest request) throws Exception {
			
		
		try {
			String keyword = request.getParameter("keyword");
			
			model.addAttribute("keyword", keyword);
			pagingVO.setKeyword(keyword);
		
			List<Map> mainResumeSkillList = mainResumeListService.selectResumeSkillInfo();
			List<Map> pagingList = mainResumeListService.selectPagingList(pagingVO);
		
			model.addAttribute("pagingList", 	pagingList);
		
			EgovMap pagingCnt = mainResumeListService.selectPagingListCnt(pagingVO);
		
			model.addAttribute("pagingCnt", pagingCnt);
		
			//System.out.println(pagingCnt);
			HashMap<String, Object> resMap = new HashMap<String, Object>();
		
			System.out.println("page : " + pagingVO.getPage());
			System.out.println("totalpage : " + pagingCnt.get("totalPage"));
			System.out.println("pageScale : " + pagingVO.getPageScale());
		
			resMap.put("page", pagingVO.getPage());
			resMap.put("totalPage", pagingCnt.get("totalPage"));
			resMap.put("pageScale", pagingVO.getPageScale());
		
			int pageGroup = (int) Math.ceil((double) pagingVO.getPage() / pagingVO.getPageScale() );
		
			long startPage = (pageGroup - 1) * pagingVO.getPageScale() + 1;

			pagingVO.setStartPage(startPage);
		
			//System.out.println("startPage: " + pagingVO.getStartPage());
		
			resMap.put("startPage", pagingVO.getStartPage());
		
			long endPage = startPage + pagingVO.getPageScale() - 1;
		
			pagingVO.setEndPage(endPage);
		
			System.out.println("endPage: " + pagingVO.getEndPage());
		
			resMap.put("endPage", endPage);
		
			long prePage = (pageGroup-1) * pagingVO.getPageScale();
		
			long nextPage = pageGroup * pagingVO.getPageScale() + 1;
		
			//System.out.println("pageGroup: " + pageGroup);
			//System.out.println("prePage: " + prePage);
			//System.out.println("nextPage: " + nextPage);
		
			resMap.put("pageGroup", pageGroup);
			resMap.put("prePage", prePage);
			resMap.put("nextPage", nextPage);
		
			//System.out.println(resMap);
			model.addAttribute("resMap", resMap);
			model.addAttribute("mainResumeSkillList", mainResumeSkillList);
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:main.jobq";
		}
		
		return "main/resumelist/list.tiles";
	}
	
}
