package egovframework.example.admin.sidebar.applyandoffer.web;

import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.datatable.JobqDataTableSearchTemplate;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSelectTemplate;
import egovframework.example.admin.cmmn.utils.JsonUtils;
import egovframework.example.admin.sidebar.resume.service.impl.AdminResumeDetail;

@Controller
@RequestMapping("/admin/applyandoffer/apply/*")
public class ApplyController {
	private static final Logger logger = LoggerFactory.getLogger(ApplyController.class);
	
	@Resource(name = "adminApplySelectList")
	private JobqDataTableSelectTemplate jobqDataTableSelectTemplate;
	
	@Autowired
	private AdminResumeDetail adminResumeDetail;
	
	@Resource(name = "adminApplySearch")
	private JobqDataTableSearchTemplate jobqDataTableSearchTemplate;
	
	@RequestMapping("/main")
	public String showApplyMainPage(Model model) throws Exception{
		return "applyAndOffer/apply-js/apply.admin";
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
	
	@RequestMapping(value = "/detail", method=RequestMethod.GET)
	public ModelAndView showApplyDetailPage(@RequestParam("no")int no, @RequestParam("state")String state){
		ModelAndView modelAndView = null;
		
		try {
			
			modelAndView = adminResumeDetail.getDetail(no, state);
		} catch (Exception e) {
			e.printStackTrace();	
	
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> search(@RequestParam Map<String, Object> searchInfo){
		JsonObject searchedList = null;
		
		if(searchInfo.containsKey("state")){
			List<String> states = Arrays.asList(((String)searchInfo.get("state")).split(","));
			
			searchInfo.put("states", states);
		}
		
		try {
			searchedList = jobqDataTableSearchTemplate.search(searchInfo);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>(JsonUtils.convertToJsonString(searchedList), HttpStatus.OK);
	}
}
