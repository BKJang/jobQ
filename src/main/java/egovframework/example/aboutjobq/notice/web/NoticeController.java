package egovframework.example.aboutjobq.notice.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.aboutjobq.notice.service.NoticePagingVO;
import egovframework.example.aboutjobq.notice.service.NoticeService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class NoticeController {
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "notice.jobq")
	public String initNotice(NoticePagingVO noticePagingVO, ModelMap model) throws Exception {
		
		try{
		
			List<Map> noticeList = noticeService.selectNoticeList(noticePagingVO);
		
			model.addAttribute("noticeList", 	noticeList);
		
			//System.out.println(model);		
			EgovMap noticeCnt = noticeService.selectNoticeListCnt(noticePagingVO);
		
			model.addAttribute("noticeCnt", noticeCnt);
		
			//System.out.println(pagingCnt);
			HashMap<String, Object> resMap = new HashMap<String, Object>();
		
			//System.out.println("page : " + personApplicationPagingVO.getPage());
			//System.out.println("totalpage : " + pagingCnt.get("totalPage"));
			//System.out.println("pageScale : " + personApplicationPagingVO.getPageScale());
		
			resMap.put("page", noticePagingVO.getPage());
			resMap.put("totalPage", noticeCnt.get("totalPage"));
			resMap.put("pageScale", noticePagingVO.getPageScale());
		
			int pageGroup = (int) Math.ceil((double) noticePagingVO.getPage() / noticePagingVO.getPageScale() );
		
			long startPage = (pageGroup - 1) * noticePagingVO.getPageScale() + 1;

			noticePagingVO.setStartPage(startPage);
		
			//System.out.println("startPage: " + personApplicationPagingVO.getStartPage());
		
			resMap.put("startPage", noticePagingVO.getStartPage());
		
			long endPage = startPage + noticePagingVO.getPageScale() - 1;
		
			noticePagingVO.setEndPage(endPage);
		
			//System.out.println("endPage: " + personApplicationPagingVO.getEndPage());
		
			resMap.put("endPage", endPage);
		
			long prePage = (pageGroup-1) * noticePagingVO.getPageScale();
		
			long nextPage = pageGroup * noticePagingVO.getPageScale() + 1;
		
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
		
		return "aboutjobq/notice/notice.tiles";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "noticeDetail.jobq")
	public String initNoticeDetail(HttpServletRequest request, ModelMap model) throws Exception {
		
		try{
			String noticeNumber = request.getParameter("noticeNumber");
		
			List<Map> noticeDetail = noticeService.selectNoticeDetail(noticeNumber);
			
			model.addAttribute("noticeDetail", noticeDetail);
		
		}catch(Exception e){
			
			e.printStackTrace();
			
			return "redirect:main.jobq";
		}
		
		return "aboutjobq/notice/detail.tiles";
	}
}
