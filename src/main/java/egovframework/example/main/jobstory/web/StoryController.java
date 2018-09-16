package egovframework.example.main.jobstory.web;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sun.mail.handlers.multipart_mixed;

import egovframework.example.main.jobstory.service.StoryPagingVO;
import egovframework.example.main.jobstory.service.StoryService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class StoryController {

	@Resource(name = "storyService")
	private StoryService storyService;

	@RequestMapping(value = "mainJobstory.jobq")
	public String initStoryList(StoryPagingVO storyPagingVO,HttpSession session, HttpServletRequest request, ModelMap model)
			throws Exception {

	
		String id = (String)session.getAttribute("member_id");
		
		
		try{
		
		
		storyPagingVO.setId(id);
		List<Map> storyList = storyService.selectPagingList(storyPagingVO);
		model.addAttribute("storyList", 	storyList);
	
		EgovMap pagingCnt = storyService.selectPagingListCnt(storyPagingVO);
		model.addAttribute("pagingCnt", pagingCnt);
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put("page", storyPagingVO.getPage());
		resMap.put("totalPage", pagingCnt.get("totalPage"));
		resMap.put("pageScale", storyPagingVO.getPageScale());
	
		
		int pageGroup = (int) Math.ceil((double) storyPagingVO.getPage() / storyPagingVO.getPageScale() );
		
		long startPage = (pageGroup - 1) * storyPagingVO.getPageScale() + 1;

		storyPagingVO.setStartPage(startPage);
	
		resMap.put("startPage", storyPagingVO.getStartPage());
	
		long endPage = startPage + storyPagingVO.getPageScale() - 1;
	
		storyPagingVO.setEndPage(endPage);
	
	
		resMap.put("endPage", endPage);
	
		long prePage = (pageGroup-1) * storyPagingVO.getPageScale();
	
		long nextPage = pageGroup * storyPagingVO.getPageScale() + 1;

		resMap.put("pageGroup", pageGroup);
		resMap.put("prePage", prePage);
		resMap.put("nextPage", nextPage);
	
		//System.out.println(resMap);
		model.addAttribute("resMap", resMap);
		
		
		
		}catch(Exception e){
			
			e.printStackTrace();
			
			return "redirect:main.jobq";
		}
		
		
		
		/*List<?> storyList = storyService.selectStoryAllList();

		model.addAttribute("storyList", storyList);

		System.out.println(storyList);*/

		return "main/jobstory/list.tiles";

	}

	
	
	
	
	
	
	@RequestMapping(value = "jobstoryDetail.jobq")
	public String initStoryDetail(ModelMap model, HttpServletRequest request) throws Exception {

		String storyNum = request.getParameter("storyNum");
		
		
		try {

			Map<String, Object> inputVal = new HashMap<String, Object>();
			inputVal.put("storyNum", storyNum);

			storyService.updateStoryHits(storyNum);
			List<Map> selectStoryDetail = storyService.selectStoryDetail(inputVal);
			List<Map> selectStoryDetailComment = storyService.selectStoryDetailComment(inputVal);

			model.addAttribute("selectStoryDetail", selectStoryDetail);
			model.addAttribute("selectStoryDetailComment", selectStoryDetailComment);
			model.addAttribute("storyNum", storyNum);
			
			System.out.println("스토리번호" + storyNum);



		} catch (Exception e) {
			
			System.out.println("에러에러");
			System.out.println("스토리번호" + storyNum);

			return "redirect:/main.jobq";
		}

		return "main/jobstory/detail.tiles";
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = " jobstoryRegister.jobq ")
	public String initStoryRegister() throws Exception {

		return "main/jobstory/register.tiles";
	}
	
	
	@RequestMapping(value = "storyInsert.jobq" , method=RequestMethod.POST)
	public String initStoryInsert(@RequestParam Map<String,Object> map, HttpSession session, HttpServletRequest request,@RequestParam("storyPic") MultipartFile multipartFile,  ModelMap model) throws Exception {
		System.out.println(multipartFile.getName());
		System.out.println(multipartFile.getOriginalFilename());
		System.out.println(multipartFile.getSize());
		
		
		for (String key : map.keySet()) {
			System.out.println("key : " + key + ", value : " + map.get(key));
		}
		
		String id = (String)session.getAttribute("member_id");
		//String storyNum = request.getParameter("storyNum");
		
		
		
		try{
			map.put("id", id);
			storyService.storyInsert(map);
			
			
			storyService.storyPic(multipartFile, session, (String)map.get("storyNum"));
			//model.addAttribute("storyNum", storyNum);
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return "redirect:/mainJobstory.jobq";
	}
	
	
	@RequestMapping(value = "storyCommentInsert.jobq" , method=RequestMethod.POST)
	public String initStoryCommentInsert(@RequestParam Map<String,Object> map, HttpSession session, HttpServletRequest request, ModelMap model) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		String storyNum = request.getParameter("storyNum");
		
		try{
			map.put("id", id);
			storyService.storyCommentInsert(map);
			
			Map<String, Object> inputVal = new HashMap<String, Object>();
			inputVal.put("storyNum", storyNum);
			
			model.addAttribute("storyNum", storyNum);
			
			System.out.println("스토리번호" + storyNum);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/jobstoryDetail.jobq?storyNum=" + storyNum;
	}
	
	
	@RequestMapping(value = "storyDelete.jobq" , method=RequestMethod.POST)
	public String initStoryDelete(@RequestParam Map<String,Object> map, HttpSession session, HttpServletRequest request) throws Exception {
		
		String storyNum = request.getParameter("storyNum");
		
		try{
			
			Map<String, Object> inputVal = new HashMap<String, Object>();
			inputVal.put("storyNum", storyNum);
			
			storyService.storyDelete(map);
			
			System.out.println("삭제삭제 스토리번호" + storyNum);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/mainJobstory.jobq";
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "storyCommentDelete.jobq" , method=RequestMethod.POST)
	public String initStoryCommentDelete(@RequestParam Map<String,Object> map, HttpSession session, HttpServletRequest request,HttpServletResponse reponse, ModelMap model) throws Exception {
		
		String storyCommentNum = request.getParameter("storyCommentNum");
		
		String storyNum = request.getParameter("storyNum");
		
		try{
			
			System.out.println("스토리 내가 보고싶다 : " + storyNum);
			Map<String, Object> inputVal = new HashMap<String, Object>();
			inputVal.put("storyCommentNum", storyCommentNum);
			
			storyService.storyCommentDelete(map);
			
			System.out.println("삭제삭제 댓글번호" + storyCommentNum);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/jobstoryDetail.jobq?storyNum=" + storyNum;
	}
	
	
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "storyEdit.jobq")
	public String storyEdit(HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		String storyNum = request.getParameter("storyNum"); 
		
		try {
			
			Map<String, Object> inputVal = new HashMap<String, Object>();
			//inputVal.put("id", id)
			inputVal.put("storyNum", storyNum);
			
			System.out.println(inputVal);
			
			List<Map> editStory = storyService.selectStory(inputVal);
			System.out.println(editStory);
						
			model.addAttribute("editStory", editStory);
			
		} catch (Exception e) {

			return "redirect:/main.jobq";
		}
		return "main/jobstory/register.tiles";
	}

	
	@RequestMapping(value = "updateStory.jobq")
	public String updateStory(@RequestParam Map<String,Object> map, HttpSession session, HttpServletRequest request,  ModelMap model) throws Exception {
	
		
		String storyNum = request.getParameter("storyNum");
		
		try{
			
			System.out.println("게시판수정 스토리넘" +storyNum);
			storyService.updateStory(map);
			
			model.addAttribute("storyNum", storyNum);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/mainJobstory.jobq";
	}
}