package egovframework.example.admin.sidebar.mainsetting.web;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.utils.JsonUtils;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainInterviewAdd;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainInterviewDelete;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainInterviewList;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainInterviewSearch;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainInterviewSelect;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainInterviewUpdate;

@Controller
@RequestMapping("/admin/mainsetting/interview")
public class InterviewTipController {
	private static final Logger logger = LoggerFactory.getLogger(InterviewTipController.class);
	
	@Autowired
	private MainInterviewList mainInterviewList;
	
	@Autowired
	private MainInterviewDelete mainInterviewDelete;
	
	@Autowired
	private MainInterviewSelect mainInterviewSelect;
	
	@Autowired
	private MainInterviewSearch mainInterviewSearch;
	
	@Autowired
	private MainInterviewAdd mainInterviewAdd;
	
	@Autowired
	private MainInterviewUpdate mainInterviewUpdate;
	
	@RequestMapping(value = "/main", method=RequestMethod.GET)
	public String showInterviewTipMainPage(){
		return "mainsetting/interviewTip-js/interviewTip.admin";
	}

	@RequestMapping(value = "/list", method=RequestMethod.GET, produces="application/json; charset=utf-8")
	public ResponseEntity<String> getInterviewTipList(@RequestParam("page")int page, @RequestParam("rows")int rows){
		JsonObject jsonObj = null;
		
		try {
			jsonObj = mainInterviewList.getList(page, rows);
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>(JsonUtils.convertToJsonString(jsonObj), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/list", method=RequestMethod.DELETE, produces="text/plain; charset=utf-8")
	public ResponseEntity<String> deleteInterview(@RequestBody String deleteJsonString){
		ResponseEntity<String> responseEntity = null;
		
		try {
			List<String> deleteList = JsonUtils.convertFromJson(deleteJsonString, List.class);
			
			if(mainInterviewDelete.deleteList(deleteList) < 0)
				responseEntity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
			
			responseEntity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return responseEntity;
	}
	
	@RequestMapping(value = "/detail/{no}", method=RequestMethod.GET)
	public ModelAndView showInterviewDetailPage(@PathVariable("no") int no){
		ModelAndView modelAndView = null;
		
		try {
			modelAndView = mainInterviewSelect.selectDetatil(no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces="application/json; charset=utf-8")
	public ResponseEntity<String> search(@RequestParam Map<String, Object> searchInfo){
		JsonObject list = null;
		
		try {
			list = mainInterviewSearch.search(searchInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(JsonUtils.convertToJsonString(list), HttpStatus.BAD_REQUEST);
		}

		return new ResponseEntity<String>(JsonUtils.convertToJsonString(list), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/addpage", method=RequestMethod.GET)
	public String showInterviewAddPage(){
		return "mainsetting/interviewTipAdd-js/interviewTipAdd.admin";
	}
	
	@RequestMapping(value = "/updatePage/{no}", method=RequestMethod.GET)
	public ModelAndView showInterviewUpdatePage(@PathVariable("no")int no){
		ModelAndView modelAndView = null;
		try {
			
			modelAndView = mainInterviewSelect.selectUpdatePageInfo(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method=RequestMethod.PATCH)
	public ResponseEntity<String> updateInterviewTip(@RequestBody String interviewInfo){
		Map<String, String> updateInfo = null;
		ResponseEntity<String> response = null;
		
		try {
			updateInfo = JsonUtils.convertFromJson(interviewInfo, Map.class);
			response = mainInterviewUpdate.update(updateInfo);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return response;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method=RequestMethod.POST)
	public ResponseEntity<String> createInterview(@RequestBody String interviewInfo){
		Map<String, Object> interviewMap = JsonUtils.convertFromJson(interviewInfo, Map.class);
		
		try {
			
			boolean isCreated = mainInterviewAdd.add(interviewMap);
			if(isCreated)
				return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
	}
	
}
