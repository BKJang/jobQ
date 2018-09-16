package egovframework.example.aboutjobq.qna.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.aboutjobq.qna.service.QnAPagingVO;
import egovframework.example.aboutjobq.qna.service.QnAService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class QnAController {
	
	@Resource(name = "qnaService")
	private QnAService qnaService;
	
	//문의 작성
	@RequestMapping(value = "registerQnA.jobq")
	public String initregisterQnA() throws Exception {

		return "aboutjobq/qna/register.tiles";
	}
	
	@RequestMapping(value = "registerQ.jobq")
	public String registerQ(HttpSession session, @RequestParam Map<String, String> map) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		Map<String, String> regData = new HashMap<String, String>();
		try{
			
			String content = map.get("qnaContent").replace("\r\n", "<br>").replaceAll("<s", "& lt")
					.replaceAll("t>", "& gt").replaceAll("</", "& tt")
					.replaceAll("\\(\"", "& ts").replaceAll("\"\\)", "& ta")
					.replaceAll("<S", "& Lt").replaceAll("T>", "& lT");
			regData.put("qnaTitle", map.get("qnaTitle"));
			regData.put("qnaContent", content);
			regData.put("id", id);
			
			//System.out.println(regData);
			
			qnaService.registerQ(regData);
			
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:main.jobq";
		}

		return "redirect:goQnAList.jobq";
	}
	
	//문의 수정
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "modifyQnA.jobq")
	public String initmodifyQnA(HttpServletRequest request, ModelMap model) throws Exception {
		
		try{
			String qnaNumber = request.getParameter("qnaNumber");
		
			List<Map> qnaDetail = qnaService.selectQnADetail(qnaNumber);
		
			model.addAttribute("qnaDetail", qnaDetail);
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:main.jobq";
		}
			
		return "aboutjobq/qna/modify.tiles";
	}
	
	@RequestMapping(value = "modifyQ.jobq")
	public String modifyQ(@RequestParam Map<String, String> map) throws Exception {
		
		//System.out.println(map);
		Map<String, String> modiData = new HashMap<String, String>();
		try{
			String content = map.get("qnaContent").replace("\r\n", "<br>").replaceAll("<s", "& lt")
					.replaceAll("t>", "& gt").replaceAll("</", "& tt")
					.replaceAll("\\(\"", "& ts").replaceAll("\"\\)", "& ta")
					.replaceAll("<S", "& Lt").replaceAll("T>", "& lT");
			
			modiData.put("qnaNumber", map.get("qnaNumber"));
			modiData.put("qnaTitle", map.get("qnaTitle"));
			modiData.put("qnaContent", content);
			
			qnaService.modifyQ(modiData);
		}catch(Exception e){
			
			e.printStackTrace();
			
			return "redirect:main.jobq";
		}
		
		return "redirect:goQnAList.jobq";
	}
	
	//문의 상세 보기
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "QnADetail.jobq")
	public String initQnADetail(HttpServletRequest request, ModelMap model) throws Exception {
		
		try{
			String qnaNumber = request.getParameter("qnaNumber");
		
			List<Map> qnaDetail = qnaService.selectQnADetail(qnaNumber);
			
			model.addAttribute("qnaDetail", qnaDetail);
		}catch(Exception e){
			e.printStackTrace();
			
			return "redirect:main.jobq";
		}
		
		return "aboutjobq/qna/detail.tiles";
	}
	
	//문의 삭제
	@RequestMapping(value = "deleteQnADetail.jobq")
	public String deleteQnADetail(HttpServletRequest request, ModelMap model) throws Exception {
		
		try{
			String qnaNumber = request.getParameter("qnaNumber");
			
			//System.out.println(qnaNumber);
		
			qnaService.deleteQnADetail(qnaNumber);
		}catch(Exception e){
			e.printStackTrace();
			
			return "redirect:main.jobq";
		}
		
		return "redirect:goQnAList.jobq";
	}
	
	//문의 목록
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "goQnAList.jobq")
	public String goQnAList(HttpSession session, ModelMap model, QnAPagingVO qnaPagingVO) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		
		try{
			qnaPagingVO.setId(id);
		
			List<Map> pagingList = qnaService.selectPagingList(qnaPagingVO);
		
			model.addAttribute("pagingList", 	pagingList);
		
			//System.out.println(model);		
			EgovMap pagingCnt = qnaService.selectPagingListCnt(qnaPagingVO);
		
			model.addAttribute("pagingCnt", pagingCnt);
		
			//System.out.println(pagingCnt);
			HashMap<String, Object> resMap = new HashMap<String, Object>();
		
			//System.out.println("page : " + personApplicationPagingVO.getPage());
			//System.out.println("totalpage : " + pagingCnt.get("totalPage"));
			//System.out.println("pageScale : " + personApplicationPagingVO.getPageScale());
		
			resMap.put("page", qnaPagingVO.getPage());
			resMap.put("totalPage", pagingCnt.get("totalPage"));
			resMap.put("pageScale", qnaPagingVO.getPageScale());
		
			int pageGroup = (int) Math.ceil((double) qnaPagingVO.getPage() / qnaPagingVO.getPageScale() );
		
			long startPage = (pageGroup - 1) * qnaPagingVO.getPageScale() + 1;

			qnaPagingVO.setStartPage(startPage);
		
			//System.out.println("startPage: " + personApplicationPagingVO.getStartPage());
		
			resMap.put("startPage", qnaPagingVO.getStartPage());
		
			long endPage = startPage + qnaPagingVO.getPageScale() - 1;
		
			qnaPagingVO.setEndPage(endPage);
		
			//System.out.println("endPage: " + personApplicationPagingVO.getEndPage());
		
			resMap.put("endPage", endPage);
		
			long prePage = (pageGroup-1) * qnaPagingVO.getPageScale();
		
			long nextPage = pageGroup * qnaPagingVO.getPageScale() + 1;
		
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
		return "aboutjobq/qna/list.tiles";
	}
	
	
}
