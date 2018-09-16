package egovframework.example.main.joblist.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.cmmn.service.CmmnPagingVO;
import egovframework.example.main.joblist.service.MainJoblistService;

@Controller
public class MainJoblistController {

	@Resource(name = "mainJoblistService")
	private MainJoblistService mainJoblistService;

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "mainJoblist.jobq")
	public String initMainJoblist(ModelMap model, HttpSession session, HttpServletRequest request, @RequestParam(defaultValue= "전체") String area) throws Exception {

		CmmnPagingVO paging = new CmmnPagingVO();

		try {
			// 전체 공고 리스트 갯수 가져오기

			int ListCount = mainJoblistService.ListCount();

			// 페이징 초기화
			paging.setTotalCount(ListCount);

			List<Map> List = mainJoblistService.defaultGonggoList(paging.getPageNo(), paging.getPageSize(), area,"");
			List<Map> skillList = mainJoblistService.selectSkillList();
			List<Map> locationList = mainJoblistService.selectLocationList();
			List<Map> locationCount = mainJoblistService.selectLocationCount();
			
			model.addAttribute("gonggoList", List);
			model.addAttribute("paging", paging);
			model.addAttribute("ListCount", ListCount);
			model.addAttribute("skillList", skillList);
			model.addAttribute("locationList", locationList);
			model.addAttribute("locationCount", locationCount);

		} catch (Exception e) {

			System.out.println(e.getMessage());
			System.out.println("에러");

			return "redirect:/main.jobq";
		}

		return "main/joblist/list.tiles";
	};
//	리스트들 가져오기
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "gonggoList.jobq")
	public void gonggoList(HttpServletResponse response, HttpSession session,@RequestParam int pageNum, int pageSize, String LocationGuBun, String skillList) throws Exception {

		PrintWriter result = null;
		String GuBun = LocationGuBun;
		
		response.setCharacterEncoding("UTF-8"); //셋팅을 해야함
		
		try {
			
			//해당되는 공고들 가져오기
			List<Map> List = mainJoblistService.defaultGonggoList(pageNum, pageSize, GuBun, skillList);
			System.out.println(List);
			
			result = response.getWriter();
			result.write(JsonUtil.ListToJson(List));
			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			System.out.println("리스트 출력 에러");
		}
	};
	
//	페이징 처리
	@RequestMapping(value = "gonggoPaging.jobq")
	public void gonggoPaging(HttpServletResponse response, HttpSession session,@RequestParam int pageNum, int pageSize, String LocationGuBun, String skillList) throws Exception {

//		ajax결과 값을 넘길
		PrintWriter result = null;
		CmmnPagingVO paging = new CmmnPagingVO();
		String GuBun = LocationGuBun;
		
		response.setCharacterEncoding("UTF-8"); //셋팅을 해야함
		
		try {
			//전체 리스트 가져오기
			int ListCount = mainJoblistService.ListCount(GuBun, skillList);
			
			System.out.println(ListCount);
			
//			페이징 초기화
			if (pageNum != 0) {
				paging.setPageNo(pageNum);
				paging.setPageSize(pageSize);
			}else{
				paging.setPageSize(10);
				paging.setPageNo(1);
			}
			
			paging.setTotalCount(ListCount);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("paging", paging);
			
			result = response.getWriter();
			result.write(JsonUtil.MapToJson(map));
			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			System.out.println("페이징 에러");
		}
	}
}
