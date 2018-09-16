package egovframework.example.admin.sidebar.member.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSearchTemplate;
import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSelectTemplate;
import egovframework.example.admin.cmmn.utils.JsonUtils;
import egovframework.example.admin.sidebar.member.domain.AdminCompanyMemberVO;
import egovframework.example.admin.sidebar.member.domain.AdminMemberVO;
import egovframework.example.admin.sidebar.member.service.impl.AdminMemberDelete;
import egovframework.example.admin.sidebar.member.service.impl.AdminMemberDetail;
import egovframework.example.admin.sidebar.member.service.impl.AdminMemberDuplication;
import egovframework.example.admin.sidebar.member.service.impl.AdminMemberExcel;
import egovframework.example.admin.sidebar.member.service.impl.AdminMemberRegister;

@Controller
@RequestMapping("/admin/member/manage")
public class MemberManageController {
	private static final Logger logger = LoggerFactory.getLogger(MemberManageController.class);
	
	@Autowired
	private Validator validator;
	
	@Autowired
	private AdminMemberDelete adminMemberDelete;
	
	@Autowired
	private AdminMemberDetail adminMemberDetail;
	
	@Autowired
	private AdminMemberExcel adminMemberExcel;
	
	@Autowired
	private AdminMemberRegister adminMemberRegister;
	
	@Autowired
	private AdminMemberDuplication adminMemberDuplication;
	
	@Resource(name = "adminMemberSearch")
	private JobqJqGridSearchTemplate jobqJqGridSearchTemplate;
	
	@Resource(name = "adminMemberList")
	private JobqJqGridSelectTemplate jobqJqGridSelectTemplate;
	
	@RequestMapping("/main")
	public String showMemberMainPage(Model model){
		return "member/memberMain-js/memberMain.admin";
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
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method = RequestMethod.DELETE, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> deleteMembers(@RequestBody String deleteNumbers){
		try {
			boolean isDeleted = adminMemberDelete.delete(JsonUtils.convertFromJson(deleteNumbers, List.class));
			if (!isDeleted) 
				return new ResponseEntity<String>("FAIL", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
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
	
	@RequestMapping(value = "/register/{type}", method = RequestMethod.GET)
	public String showMemberRegisterPage(@PathVariable("type")String type, Model model){
		if (type.equals("company")){
			model.addAttribute("companyMember", new AdminCompanyMemberVO());
		
			return "member/companyMember-js/companyMember.admin"; 
		}else{
			model.addAttribute("member", new AdminMemberVO());
			
			return "member/generalMember-js/generalMember.admin";
		}
		
	}
	
	@RequestMapping(value = "/register/general", method = RequestMethod.POST)
	public String registGeneralMember(@Valid @ModelAttribute("member")AdminMemberVO member, Errors errors, Model model){

		try {
			if(errors.hasErrors()){
				model.addAttribute("error", "NOT VALID");
				
				return "member/generalMember-js/generalMember.admin";
			}
				
			if(!adminMemberRegister.registGeneralMember(member)){
				// 회원 가입 오류시 
				
				return "member/generalMember-js/generalMember.admin";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return "redirect:/admin/member/manage/main";
	}
	
	@RequestMapping(value = "/register/company", method = RequestMethod.POST)
	public String registCompanyMember(@Valid @ModelAttribute("companyMember")AdminCompanyMemberVO companyMember, Errors errors, Model model){
		try {
			if(errors.hasErrors()){
				model.addAttribute("error", "NOT VALID");
				
				return "member/companyMember-js/companyMember.admin";
			}
				
			if(!adminMemberRegister.registCompanyMember(companyMember)){
				// 회원 가입 오류시 
				
				return "member/companyMember-js/companyMember.admin";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return "redirect:/admin/member/manage/main";
	}
	
	// @Valid가 된 애들은 @InitBinder가 있는 놈들을 한 번 거치게 된다.
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder){
		try {
			webDataBinder.setValidator(this.validator);	// 여기에 new LocalValidationBeanFactory()라고 직접 명시하면 안된다.
			// xml에 bean으로 설정하고 해줘야 한다.
			
			// java.util.Date으로만 변경이 가능하다.
			// java.sql.Date는 불가능하다...
			CustomDateEditor dateEditor = new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true);
			webDataBinder.registerCustomEditor(Date.class, "birthDate", dateEditor);
			webDataBinder.registerCustomEditor(Date.class, "companyBirthDate", dateEditor);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/detail", method=RequestMethod.GET)
	public ModelAndView showMemberDetailPage(@RequestParam Map<String, String> memberInfo){
		ModelAndView modelAndView = null;
		
		try {
			modelAndView = adminMemberDetail.getMemberDetail(memberInfo);	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/dupid/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String duplicateId(@PathVariable("id") String id){
		boolean isDuplicated = false;
		try {
			isDuplicated = adminMemberDuplication.duplicate(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isDuplicated ? "FAIL" : "SUCCESS";
	}
	
	@RequestMapping(value = "/excel", method=RequestMethod.POST)
	public ModelAndView downloadExcel(@RequestParam("memberIds") String memberIds, @RequestParam("version") String version){
		ModelAndView modelAndView = new ModelAndView();
		
		try {
			List<AdminMemberVO> memberList = adminMemberExcel.getMemberInfoForExcel(memberIds);
	
			modelAndView.setViewName("excelExport");
			modelAndView.addObject("list", memberList);
			modelAndView.addObject("version", version);
			
			if(version.equals("xls"))
				modelAndView.addObject("workbook", new HSSFWorkbook());
			else
				modelAndView.addObject("workbook", new XSSFWorkbook());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
}
