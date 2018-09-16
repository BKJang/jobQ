package egovframework.example.admin.sidebar.resume.web;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSearchTemplate;
import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSelectTemplate;
import egovframework.example.admin.cmmn.utils.JsonUtils;
import egovframework.example.admin.sidebar.resume.service.impl.AdminResumeDelete;
import egovframework.example.admin.sidebar.resume.service.impl.AdminResumeDetail;
import egovframework.example.admin.sidebar.resume.service.impl.AdminResumeMain;

@Controller
@RequestMapping("/admin/resume")
public class ResumeController {
	private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);
	
	@Resource(name = "adminResumeSelectList")
	private JobqJqGridSelectTemplate jobqJqGridSelectTemplate;
	
	@Autowired
	private AdminResumeDetail adminResumeDetail;
	
	@Autowired
	private AdminResumeMain adminResumeMain;
	
	@Autowired
	private AdminResumeDelete adminResumeDelete;
	
	@Resource(name = "adminResumeSearch")
	private JobqJqGridSearchTemplate jobqJqGridSearchTemplate;
	
	@RequestMapping("/main")
	public ModelAndView showResumeMainPage(Model model){
		ModelAndView modelAndView = null;
		try {
			
			modelAndView = adminResumeMain.getResumeMainData();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> getList(@RequestParam("page") int page, @RequestParam("rows") int rows){
		JsonObject list = null;

		try {
			
			list = jobqJqGridSelectTemplate.getList(page, rows);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>(JsonUtils.convertToJsonString(list), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/detail/{no}")
	public ModelAndView showResumeDetailPage(@PathVariable("no")int no){
		ModelAndView modelAndView = null;
		
		try {
			modelAndView = adminResumeDetail.getDetail(no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.GET)
	public String showResumeUpdatePage(Model model) throws Exception{
		return "resume/updateResume-js/updateResume.admin";
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	public String updateResume(Model model) throws Exception{
		return "resume/resume-js/updateResume.admin";
	}
	
	@RequestMapping(method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteResume(@RequestBody String resumeNumbers) throws Exception{
		try {
			List<String> deleteList = JsonUtils.convertFromJson(resumeNumbers, List.class);
			
			boolean isDeleted = adminResumeDelete.delete(deleteList);
			if(isDeleted)
				return new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("INTERNAL_SERVER_ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<String>("BAD_REQUEST", HttpStatus.BAD_REQUEST);
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
	public ResponseEntity<String> search(@RequestParam Map<String, Object> searchInfo){
		processData(searchInfo);
		JsonObject searchedList = null;
		
		try {
			searchedList = jobqJqGridSearchTemplate.search(searchInfo);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>(JsonUtils.convertToJsonString(searchedList), HttpStatus.OK);
	}

	private void processData(Map<String, Object> searchInfo) {
		if(searchInfo.containsKey("skill")){
			searchInfo.put("skills", Arrays.asList(((String)searchInfo.get("skill")).split(",")));
		}
		
		if(searchInfo.containsKey("area")){
			searchInfo.put("areas", Arrays.asList(((String)searchInfo.get("area")).split(",")));
		}
		
	}
}
