package egovframework.example.admin.sidebar.inquire.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.board.JobqBoardDelete;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSearchTemplate;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSelectTemplate;
import egovframework.example.admin.cmmn.utils.JsonUtils;
import egovframework.example.admin.sidebar.inquire.mapper.AdminFaqMapper;
import egovframework.example.admin.sidebar.inquire.service.impl.AdminFaqAdd;
import egovframework.example.admin.sidebar.inquire.service.impl.AdminFaqDetail;
import egovframework.example.admin.sidebar.inquire.service.impl.AdminFaqMain;
import egovframework.example.admin.sidebar.inquire.service.impl.AdminFaqUpdate;

@Controller
@RequestMapping("/admin/inquire/faq/*")
public class FAQController {
	private static final Logger logger = LoggerFactory.getLogger(FAQController.class);
	
	@Resource(name = "adminFaqSelectList")
	private JobqDataTableSelectTemplate jobqDataTableSelectTemplate; 

	@Autowired
	private AdminFaqMain adminFaqMain;
	
	@Autowired
	private AdminFaqDetail adminFaqDetail; 
	
	@Autowired
	private AdminFaqMapper adminFaqMapper;
	
	@Autowired
	private JobqBoardDelete jobqBoardDelete;
	
	@Autowired
	private AdminFaqUpdate adminFaqUpdate;
	
	@Autowired
	private AdminFaqAdd adminFaqAdd; 
	
	@Resource(name = "adminFaqSearch")
	private JobqDataTableSearchTemplate jobqDataTableSearchTemplate;
	
	@RequestMapping("/main")
	public ModelAndView showFAQMainPage() {
		ModelAndView modelAndView = null;
		
		try {
			modelAndView = adminFaqMain.getMainData();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
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
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteFaq(@RequestBody String deleteNumbers) throws Exception{
		try {
			boolean isDeleted = jobqBoardDelete.setBoardDelete(adminFaqMapper).delete(JsonUtils.convertFromJson(deleteNumbers, List.class));
			if(isDeleted)
				return new ResponseEntity<String>("SUCCESS", HttpStatus.OK); 
		
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("true", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>("true", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method=RequestMethod.PUT, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> updateFaq(@RequestBody String updateInfo) throws Exception{
		Map<String, Object> updateMap = JsonUtils.convertFromJson(updateInfo, Map.class);
		
		try {
			boolean isUpdated = adminFaqUpdate.update(updateMap);
			if(isUpdated)
				return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>("SERVER_ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@RequestMapping(value = "/detail/{no}", method=RequestMethod.GET)
	public ModelAndView updateFAQ(@PathVariable("no")int no){
		ModelAndView modelAndView = null;
		
		try {
			modelAndView = adminFaqDetail.getDetail(no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/addpage", method=RequestMethod.GET)
	public String showAddNoticePage(Model model) throws Exception{
		return "inquire/faqAdd-js/faqAdd.admin";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addpage", method=RequestMethod.POST)
	public ResponseEntity<String> addNotice(@RequestBody String registInfo) throws Exception{
		Map<String, Object> registMap = JsonUtils.convertFromJson(registInfo, Map.class);
		
		try {
			boolean isCreated = adminFaqAdd.insert(registMap);
			if(isCreated)
				return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>("SERVER_ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
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
	
	@RequestMapping(value = "/state", method = RequestMethod.PATCH)
	public ResponseEntity<String> updateFaqState(@RequestParam Map<String, Object> faqInfo){
		try {
			boolean isUpdatedState = adminFaqUpdate.updateState(faqInfo);
			if(isUpdatedState)
				return new ResponseEntity<String>("OK", HttpStatus.OK);
		
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("BAD_REQUEST", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>("SERVER_ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
