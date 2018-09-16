package egovframework.example.admin.sidebar.board.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.datatable.JobqDataTableSearchTemplate;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSelectTemplate;
import egovframework.example.admin.cmmn.utils.JsonUtils;
import egovframework.example.admin.sidebar.board.domain.JobStoryReplyVO;
import egovframework.example.admin.sidebar.board.service.impl.JobStoryDelete;
import egovframework.example.admin.sidebar.board.service.impl.JobStoryDetail;
import egovframework.example.admin.sidebar.board.service.impl.JobStoryReply;
import egovframework.example.admin.sidebar.board.service.impl.JobStoryReplyDelete;

@Controller
@RequestMapping("/admin/board/jobstory/*")
public class JobStoryController {
	private static final Logger logger = LoggerFactory.getLogger(JobStoryController.class);
	
	@Resource(name = "jobStorySelectList")
	private JobqDataTableSelectTemplate jobqDataTableSelectTemplate; 
	
	@Autowired
	private JobStoryDetail jobStoryDetail;
	
	@Autowired
	private JobStoryReply jobStoryReply; 
	
	@Autowired
	private JobStoryDelete jobStoryDelete; 
	
	@Autowired
	private JobStoryReplyDelete jobStoryReplyDelete; 
	
	@Resource(name = "jobstorySearch")
	private JobqDataTableSearchTemplate jobqDataTableSearchTemplate;
	
	@RequestMapping("/main")
	public String showJobStoryPage(Model model) throws Exception{
		return "board/jobstory-js/jobstory.admin";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> getList(@RequestParam("start") int start, @RequestParam("length") int length){
		JsonObject list = null;
		
		try {
			list = jobqDataTableSelectTemplate.getList(start, length);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>(JsonUtils.convertToJsonString(list), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String insertReply(JobStoryReplyVO replyVO){
		boolean isCreated = jobStoryReply.insertReply(replyVO);
		
		if(isCreated)
			return "redirect:/admin/board/jobstory/detail/" + replyVO.getBoardNo();
		else
			return "board/jobstoryDetail-js/jobstoryDetail.admin";	// 답글을 오류가 나면 다시 그 페이지로 이동
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteJobStoryReply(@RequestBody String jsonDeleteNumbers){
		List<String> deleteList = JsonUtils.convertFromJson(jsonDeleteNumbers, List.class);
		
		try {
			boolean isDeleted = jobStoryReplyDelete.deleteReply(deleteList);
			if(isDeleted)
				return new ResponseEntity<String>("OK", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("INTERNAL_SERVER_ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<String>("BAD_REQUEST", HttpStatus.BAD_REQUEST);
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.DELETE)
	@ResponseBody
	public String deleteJobStory(@RequestBody String jsonDeleteNumbers) throws Exception{
		List<String> deleteList = JsonUtils.convertFromJson(jsonDeleteNumbers, List.class);
		
		try {
			boolean isDeleted = jobStoryDelete.delete(deleteList);
			if(isDeleted)
				return "SUCCESS";
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return "FAIL";
		}
		
		return "FAIL";
	}
	
	@RequestMapping("/detail/{no}")
	public ModelAndView showDetailJobStoryPage(@PathVariable("no")int no, HttpServletRequest request) throws Exception{
		ModelAndView modelAndView = null;
		
		try {
			modelAndView = jobStoryDetail.getDetail(no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> search(@RequestParam Map<String, Object> searchInfo){
		JsonObject searchedList = null;
		
		try {
			searchedList = jobqDataTableSearchTemplate.search(searchInfo);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>(JsonUtils.convertToJsonString(searchedList), HttpStatus.OK);
	}
}
