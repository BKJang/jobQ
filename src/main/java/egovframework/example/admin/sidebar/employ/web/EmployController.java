package egovframework.example.admin.sidebar.employ.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSearchTemplate;
import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSelectTemplate;
import egovframework.example.admin.cmmn.utils.JsonUtils;
import egovframework.example.admin.sidebar.employ.domain.AdminEmployVO;
import egovframework.example.admin.sidebar.employ.service.impl.AdminEmployAdd;
import egovframework.example.admin.sidebar.employ.service.impl.AdminEmployMain;
import egovframework.example.admin.sidebar.employ.service.impl.MainEmployDetail;

@Controller
@RequestMapping("/admin/employ")
public class EmployController {
	private static final Logger logger = LoggerFactory.getLogger(EmployController.class);
	private final String DEFAULT_LOGO_DIR_PATH = "C:" + File.separator + "jobq_logo_file";
	
	@Autowired
	private Validator validator;
	
	@Resource(name = "adminEmploySelectList")
	private JobqJqGridSelectTemplate jobqJqGridSelectTemplate;
	
	@Autowired
	private MainEmployDetail adminEmployDetail;
	
	@Autowired
	private AdminEmployAdd adminEmployAdd;
	
	@Autowired
	private AdminEmployMain adminEmployMain;
	
	@Resource(name = "adminEmploySearch")
	private JobqJqGridSearchTemplate jobqJqGridSearchTemplate;
	
	@RequestMapping("/main")
	public ModelAndView showEmployMainPage() throws Exception{
		ModelAndView modelAndView = null;
		try {
			
			modelAndView = adminEmployMain.getEmployMainData();
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
	
	@RequestMapping(value = "/detail/{no}", method=RequestMethod.GET)
	public ModelAndView showEmployDetailPage(@PathVariable("no") int no){
		ModelAndView modelAndView = null;
		
		try {
			modelAndView = adminEmployDetail.getDetail(no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/addpage", method=RequestMethod.GET)
	public String showEmployAddPage(@ModelAttribute("employ")AdminEmployVO employVO) throws Exception{
		return "employ/employAdd-js/employAdd.admin";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String AddEmploy(@ModelAttribute("employ") @Valid AdminEmployVO employVO, Errors errors, Model model) throws Exception{
		try {
			if(errors.hasErrors()){
				model.addAttribute("error", "NOT VALID");
				
				return "employ/employAdd-js/employAdd.admin";
			}
				
			if(!adminEmployAdd.add(employVO))
				return "employ/employAdd-js/employAdd.admin";
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return "redirect:/admin/employ/main";
	}
	
	// 업로드 하기 위해서는 MultipartFile에 <input type="file" name="upload" />에 name속성에 맵핑해야 한다. - 최범균 Spring4 파일 업로드 참고
	@RequestMapping(value = "/logo" , method = RequestMethod.POST, produces = "text/html; charset=utf-8")
	public ResponseEntity<String> attachEmployLogo(@RequestParam("CKEditorFuncNum")String ckeditorId, @RequestParam("upload") MultipartFile employLogoImage){
		StringBuilder ckeditorRequestUrl = new StringBuilder("");
		String imgFullPath = "";
		
		if(!employLogoImage.isEmpty()){
			UUID uuid = UUID.randomUUID();
			
			String imgFileName = uuid.toString() + "_" + employLogoImage.getOriginalFilename();
			
			File file = new File(DEFAULT_LOGO_DIR_PATH, imgFileName);	// 파일 클래스를 통해서는 경로와의 스트림을 생성한다.
			
			try {
				FileCopyUtils.copy(employLogoImage.getBytes(), file);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 상대주소로 적어주면 된다.
			imgFullPath = "logo?employImageLogoPath=" + DEFAULT_LOGO_DIR_PATH + File.separator + imgFileName;
			
			ckeditorRequestUrl.append("<script>window.parent.CKEDITOR.tools.callFunction(");
			ckeditorRequestUrl.append(ckeditorId);
			ckeditorRequestUrl.append(",'");
			ckeditorRequestUrl.append(imgFullPath.replace(File.separatorChar, '/'));	// 웹 브라우저는 '/'로 경로를 인식한다. 윈도우는 '\'를 사용한다. 
			ckeditorRequestUrl.append("',");
			ckeditorRequestUrl.append("'이미지가 업로드 되었습니다.'");
			ckeditorRequestUrl.append(")</script>");
		}
		
		return new ResponseEntity<String>(ckeditorRequestUrl.toString(), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/logo", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getEmployLogoImage(@RequestParam("employImageLogoPath") String employLogoImagePath){
		String path = employLogoImagePath.replace('/', File.separatorChar);
		String type = path.substring(path.lastIndexOf(".") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		if(type.toUpperCase().equals("PNG"))
			headers.setContentType(MediaType.IMAGE_PNG);
		else if(type.toUpperCase().equals("PNG")){
			headers.setContentType(MediaType.IMAGE_GIF);
		}else if(type.toUpperCase().equals("JPNG")){
			headers.setContentType(MediaType.IMAGE_JPEG);
		}
		
		try (InputStream inputStream = new FileInputStream(path)){
		
			return new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		
		return null;
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
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder){
		try {
			webDataBinder.setValidator(this.validator);	// 여기에 new LocalValidationBeanFactory()라고 직접 명시하면 안된다.
			// xml에 bean으로 설정하고 해줘야 한다.
			
			// java.util.Date으로만 변경이 가능하다.
			// java.sql.Date는 불가능하다...
			CustomDateEditor dateEditor = new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true);
			webDataBinder.registerCustomEditor(Date.class, "updateDate", dateEditor);
			webDataBinder.registerCustomEditor(Date.class, "closeDate", dateEditor);
			webDataBinder.registerCustomEditor(Date.class, "regDate", dateEditor);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
