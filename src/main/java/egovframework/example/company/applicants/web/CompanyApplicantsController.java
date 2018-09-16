package egovframework.example.company.applicants.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.cmmn.service.CmmnPagingVO;
import egovframework.example.company.applicants.service.CompanyApplicantsService;

@Controller
public class CompanyApplicantsController {
	
	@Resource(name = "companyApplicantsService")
	private CompanyApplicantsService companyApplicantsService;
	
	
//	초기 화면 띠우기 
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "companyApplicants.jobq")
	public String initCompanyApplicants(ModelMap model, HttpSession session, @RequestParam(defaultValue="전체") String selectOne,
			@RequestParam(defaultValue="Popular") String appState, @RequestParam(defaultValue="0") int selectTwo, @RequestParam(defaultValue="0") int gonggoNum,
			@RequestParam(defaultValue="1") int pageNum, @RequestParam(defaultValue="10") int pageSize) throws Exception {
		//@RequestParam int gonggoNum, String readState
		
		String id = (String) session.getAttribute("member_id");
		Map<String, Object> selectMap = new HashMap<String, Object>();
		Map<String, Object> appMap = new HashMap<String, Object>();
		Map<String, Object> appIngMap = new HashMap<String, Object>();
		Map<String, Object> appEndMap = new HashMap<String, Object>();
		CmmnPagingVO pagingAll = new CmmnPagingVO();
		CmmnPagingVO pagingIng = new CmmnPagingVO();
		CmmnPagingVO pagingEnd = new CmmnPagingVO();
		
		try {
			
			//로그인 상태 검사
			if (id == null) {
				
				System.out.println("로그인을 해주세요");
				return "redirect:/main.jobq";
			}
			
			selectMap.put("id", id);
			
			if (selectOne.equals("전체")) {
				selectMap.put("selectOne", "2");
			} else if(selectOne.equals("게재중")){ 
				selectMap.put("selectOne", "0");	
			}else{
				selectMap.put("selectOne", "1");
			}
			
			appMap.put("id", id);
			appMap.put("gonggoNum", gonggoNum);
			appIngMap.put("id", id);
			appIngMap.put("gonggoNum", gonggoNum);
			appEndMap.put("id", id);
			appEndMap.put("gonggoNum", gonggoNum);
			
		/*	if (appState.equals("Recent")) {
				appMap.put("appState", "0");
			} else if(appState.equals("Announce_End")){
				appMap.put("appState", "1");	
			}else{
				appMap.put("appState", "2");
			}*/
			
			int allCount = companyApplicantsService.selectGonggoCount(gonggoNum, 2, id);
			int ingCount = companyApplicantsService.selectGonggoCount(gonggoNum, 0, id);
			int endCount = companyApplicantsService.selectGonggoCount(gonggoNum, 1, id);
			
//			페이징 셋팅
			pagingAll.setTotalCount(allCount);
			pagingIng.setTotalCount(ingCount);
			pagingEnd.setTotalCount(endCount);
			appMap.put("appState", "2");
			appIngMap.put("appState", "0");
			appEndMap.put("appState", "1");
			
			
			
			
			if (appState.equals("Recent")) {
				pagingAll.setPageNo(1);
				pagingEnd.setPageNo(1);
				pagingIng.setPageNo(pageNum);
				
			} else if(appState.equals("Announce_End")){
				pagingAll.setPageNo(1);
				pagingIng.setPageNo(1);
				pagingEnd.setPageNo(pageNum);
				
			}else{
				pagingIng.setPageNo(1);
				pagingEnd.setPageNo(1);
				pagingAll.setPageNo(pageNum);
			}
			
			appIngMap.put("pageNum", pagingIng.getPageNo());
			appEndMap.put("pageNum", pagingEnd.getPageNo());
			appMap.put("pageNum", pagingAll.getPageNo());
			
			appMap.put("gonggoNum", gonggoNum);
			appMap.put("pageSize", pagingAll.getPageSize());
			appIngMap.put("gonggoNum", gonggoNum);
			appIngMap.put("pageSize", pagingAll.getPageSize());
			appEndMap.put("gonggoNum", gonggoNum);
			appEndMap.put("pageSize", pagingAll.getPageSize());
			
			//셀렉트 리스트 가져오기
			List<Map> allGonggoList = companyApplicantsService.selectAllGonggo(selectMap);
			// 지원자 리스트 가져오기
			List<Map> appList = companyApplicantsService.selectAppList(appMap);
			
			//여기 구현하기
			List<Map> appIngList = companyApplicantsService.selectAppList(appIngMap);
			List<Map> appEndList = companyApplicantsService.selectAppList(appEndMap);
			
			model.addAttribute("allGonggoList", allGonggoList);
			model.addAttribute("appList", appList);
			model.addAttribute("selectOne", selectOne);
			model.addAttribute("appState", appState);
			model.addAttribute("appIngList", appIngList);
			model.addAttribute("appEndList", appEndList);
			model.addAttribute("selectTwo", gonggoNum);
			model.addAttribute("pagingAll", pagingAll);
			model.addAttribute("pagingIng", pagingIng);
			model.addAttribute("pagingEnd", pagingEnd);
			model.addAttribute("allCount", allCount);
			
		} catch (Exception e) {
				
			System.out.println("불러오기 오류");
			return "redirect:/companyMain.jobq";
		}
		return "company/applicants/list.tiles";
	}
	
	//멀티 셀렉트 구현
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "changeSelectMenu.jobq")
	public void changeMenu(HttpServletResponse response, HttpSession session, @RequestParam String closingNum) throws Exception {

		String id = (String) session.getAttribute("member_id");
		Map<String, Object> map = new HashMap<String, Object>();
		PrintWriter result = null;
		response.setCharacterEncoding("UTF-8"); //셋팅을 해야함
		
		try {
			
			map.put("id", id);
			map.put("closingNum", closingNum);
				
			List<Map> gonggoList = companyApplicantsService.selectGonggoList(map);
			
			System.out.println(gonggoList);
			
			result = response.getWriter();
			result.write(JsonUtil.ListToJson(gonggoList));
		} catch (Exception e) {
				
			System.out.println("ajax 오류");
		}
	}
	
	
	//합격처리 하기
	@RequestMapping(value = "changeStateCheck.jobq")
	public void changeState(HttpServletResponse response, HttpSession session, @RequestParam int appId, int changeNum) throws Exception {

		//String id = (String) session.getAttribute("member_id");
		Map<String, Object> map = new HashMap<String, Object>();
		//PrintWriter result = null;
		
		response.setCharacterEncoding("UTF-8"); //셋팅을 해야함
		
		try {
			map.put("appId", appId);
			map.put("changeNum", changeNum);
			
			companyApplicantsService.changeState(map);
			
			//result = response.getWriter();
			//result.write(JsonUtil.ListToJson("처리되었습니"));
		} catch (Exception e) {
				
			System.out.println("ajax 오류");
		}
	}
}
