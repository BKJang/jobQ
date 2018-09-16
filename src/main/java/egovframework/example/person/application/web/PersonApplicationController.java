package egovframework.example.person.application.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.company.offer.service.CompanyOfferService;
import egovframework.example.person.application.service.PersonApplicationPagingVO;
import egovframework.example.person.application.service.PersonApplicationService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class PersonApplicationController {
	
	@Resource(name="personApplicationService")
	private PersonApplicationService personApplicationService;
	
	@RequestMapping(value = "insertApp.jobq")
	public String insertApp(HttpSession session, @RequestParam int gonggoNum) throws Exception {

		String id = (String)session.getAttribute("member_id");
		
		try{
			Map<String, Object> map = new HashMap<String, Object>();
				
			map.put("id", id);
			map.put("gonggoNum", gonggoNum);
		
			personApplicationService.insertAppList(map);
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:main.jobq";
		}
		
		return "redirect:/personApplication.jobq";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "personApplication.jobq")
	public String initPersonOffer(HttpSession session, ModelMap model, PersonApplicationPagingVO personApplicationPagingVO) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		
		try{
			personApplicationPagingVO.setId(id);
		
			List<Map> pagingList = personApplicationService.selectPagingList(personApplicationPagingVO);
		
			model.addAttribute("pagingList", 	pagingList);
		
			//System.out.println(model);		
			EgovMap pagingCnt = personApplicationService.selectPagingListCnt(personApplicationPagingVO);
		
			model.addAttribute("pagingCnt", pagingCnt);
		
			//System.out.println(pagingCnt);
			HashMap<String, Object> resMap = new HashMap<String, Object>();
		
			//System.out.println("page : " + personApplicationPagingVO.getPage());
			//System.out.println("totalpage : " + pagingCnt.get("totalPage"));
			//System.out.println("pageScale : " + personApplicationPagingVO.getPageScale());
		
			resMap.put("page", personApplicationPagingVO.getPage());
			resMap.put("totalPage", pagingCnt.get("totalPage"));
			resMap.put("pageScale", personApplicationPagingVO.getPageScale());
		
			int pageGroup = (int) Math.ceil((double) personApplicationPagingVO.getPage() / personApplicationPagingVO.getPageScale() );
		
			long startPage = (pageGroup - 1) * personApplicationPagingVO.getPageScale() + 1;

			personApplicationPagingVO.setStartPage(startPage);
		
			//System.out.println("startPage: " + personApplicationPagingVO.getStartPage());
		
			resMap.put("startPage", personApplicationPagingVO.getStartPage());
		
			long endPage = startPage + personApplicationPagingVO.getPageScale() - 1;
		
			personApplicationPagingVO.setEndPage(endPage);
		
			//System.out.println("endPage: " + personApplicationPagingVO.getEndPage());
		
			resMap.put("endPage", endPage);
		
			long prePage = (pageGroup-1) * personApplicationPagingVO.getPageScale();
		
			long nextPage = pageGroup * personApplicationPagingVO.getPageScale() + 1;
		
			//System.out.println("pageGroup: " + pageGroup);
			//System.out.println("prePage: " + prePage);
			//System.out.println("nextPage: " + nextPage);
		
			resMap.put("pageGroup", pageGroup);
			resMap.put("prePage", prePage);
			resMap.put("nextPage", nextPage);
		
			//System.out.println(resMap);
			model.addAttribute("resMap", resMap);
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:main.jobq";
		}
		return "person/application/list.tiles";
	}
	
	@RequestMapping(value = "cancelApplication.jobq")
	public String cancelApp(@RequestParam String appId) throws Exception {
		
		try{
			personApplicationService.cancelApplication(appId);
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:main.jobq";
		}
		
		return "redirect:/personApplication.jobq";
	}
	
	@RequestMapping(value = "deleteApplication.jobq")
	public String deleteApp(@RequestParam String appId) throws Exception {
		
		try{
			personApplicationService.deleteApplication(appId);
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:main.jobq";
		}
		
		return "redirect:/personApplication.jobq";
	}
}
