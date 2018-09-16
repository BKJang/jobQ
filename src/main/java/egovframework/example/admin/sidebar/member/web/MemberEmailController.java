package egovframework.example.admin.sidebar.member.web;

import java.util.Map;

import javax.annotation.Resource;

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

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSearchTemplate;
import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSelectTemplate;
import egovframework.example.admin.cmmn.utils.JsonUtils;
import egovframework.example.admin.sidebar.member.domain.AdminMemberEmailVO;
import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;
import egovframework.example.admin.sidebar.member.service.impl.AdminEmailForm;
import egovframework.example.admin.sidebar.member.service.impl.MemberEamilService;

@Controller
@RequestMapping("/admin/member")
public class MemberEmailController {
	@Autowired
	private MemberEamilService memberEamilService;
	
	@Resource(name = "adminMemberSearch")
	private JobqJqGridSearchTemplate jobqJqGridSearchTemplate;
	
	@Resource(name = "adminMemberList")
	private JobqJqGridSelectTemplate jobqJqGridSelectTemplate;
	
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	
	@Autowired
	private AdminEmailForm adminEmailForm;
	
	@RequestMapping(value = "/email/main", method=RequestMethod.GET)
	public String showMemberEmailPage(Model model) throws Exception{
		return "member/memberEmail-js/memberEmail.admin";
	}
	
	@RequestMapping(value = "/email/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
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
	
	@RequestMapping(value = "/email/search", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> search(@RequestParam Map<String, Object> searchInfo){
		JsonObject searchedList = null;
		
		try {
			searchedList = jobqJqGridSearchTemplate.search(searchInfo);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>(JsonUtils.convertToJsonString(searchedList), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/email/form/{form}", method = RequestMethod.GET, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> getEmailForm(@PathVariable("form")String emailFormName){
		try {
	
			return new ResponseEntity<String>(adminEmailForm.getEmailForm(emailFormName), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("INTERNAL_SERVER_ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/email", method=RequestMethod.POST)
	public ResponseEntity<String> sendMail(@RequestBody String emailInfoJson){
		AdminMemberEmailVO emailVO = JsonUtils.convertFromJson(emailInfoJson, AdminMemberEmailVO.class);
		
		try {
			memberEamilService.sendEmail(emailVO);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return new ResponseEntity<String>("MAIL_SEND_SUCCESS", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/email/search/exist", method=RequestMethod.GET, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> checkSearchDataExist(@RequestParam Map<String, Object> searchInfo){
		try {
			if(adminMemberMapper.countSearchedData(searchInfo) > 0)
				return new ResponseEntity<String>("DATA_EXIST", HttpStatus.OK);
		
		} catch (Exception e) {
			e.printStackTrace();
		
			return new ResponseEntity<String>("INTERNAL_SERVER_ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<String>("NOT_EXIST_DATA", HttpStatus.OK);
	}
}
