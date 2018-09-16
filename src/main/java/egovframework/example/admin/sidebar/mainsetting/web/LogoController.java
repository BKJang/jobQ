package egovframework.example.admin.sidebar.mainsetting.web;

import java.net.URLDecoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.cmmn.utils.JsonUtils;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainLogoDelete;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainLogoInsert;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainLogoListSelect;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainLogoSelect;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainLogoUpdate;

@Controller
@RequestMapping("/admin/mainsetting/logo")
public class LogoController {
	private static final Logger logger = LoggerFactory.getLogger(LogoController.class);
	
	@Autowired
	private MainLogoInsert mainLogoInsert;
	
	@Autowired
	private MainLogoSelect mainLogoSelect;
	
	@Autowired
	private MainLogoListSelect mainLogoListSelect;
	
	@Autowired
	private MainLogoUpdate mainLogoUpdate;
	
	@Autowired
	private MainLogoDelete mainLogoDelete;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String showLogoMainPage(Model model) throws Exception{
		return "mainsetting/logo-js/logo.admin";
	}
	
	@RequestMapping(value = "/mainlogo", method = RequestMethod.GET)
	public ResponseEntity<byte[]> showLogoMainLogo(@RequestParam(value = "logoPath", required = false)String logoPath) throws Exception{
		ResponseEntity<byte[]> response = null;
		
		if(logoPath == null)
			response = mainLogoSelect.selectMainLogo();
		else
			response = mainLogoSelect.selectLogo(logoPath);
			
		return response;
	}
	
	@RequestMapping(method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> uploadImage(MultipartFile file){
		String uploadedFullPath = "";
		
		try {
			uploadedFullPath = mainLogoInsert.insertLogo(file.getOriginalFilename(), file.getBytes());
		}catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>(uploadedFullPath, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/logolist", method = RequestMethod.GET)
	public ModelAndView showLogoListPage(){
		try {
			ModelAndView modelAndView = mainLogoListSelect.getLogoList();
			
			return modelAndView;
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return null;
	}
	
	// @RequestBody String jsonString으로 가져오더 라도 그대로 사용하지 말고
	// JsonUtils.convertFromJson(jsonString, String.class)을 이용해서 사용해야 한다.
	// jsonString.length() => 74
	// logoPath.length() => 72
	// 문자열 길이의 차이는 아직 알 수 없음.
	
	// PATCH와 PUT의 차이는 PATCH는 일부분 변경을 의미하고, PUT은 전체변경을 의미한다.
	// 2개의 의미를 나눠서 개발해야 한다.
	@RequestMapping(method = RequestMethod.PATCH, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> updateMainLogo(@RequestBody String jsonString){
		
		try {
			String logoPath = JsonUtils.convertFromJson(jsonString, String.class);
			// 데이터로 전송되는 것들은 상관이 없지만, URL같은 경우는 HTTP에 정해진 규칙에 의해서 인코딩 되기 때문에 그 방식에 맞춰 디코딩 해야한다.
			logoPath = URLDecoder.decode(logoPath, "utf-8"); 

			boolean isUpdated = mainLogoUpdate.updateMainLogo(logoPath);
			if(isUpdated)
				return new ResponseEntity<String>("LOGO_UPDATE_SUCCESS", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
		
			return new ResponseEntity<String>("INTERNAL_SERVER_ERROR", HttpStatus.INTERNAL_SERVER_ERROR);	
		}
		
		return null;
	}
	
	@RequestMapping(method = RequestMethod.DELETE, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> deleteLogo(@RequestBody String jsonString){
		
		try {
			String logoPath = JsonUtils.convertFromJson(jsonString, String.class);
			// 데이터로 전송되는 것들은 상관이 없지만, URL같은 경우는 HTTP에 정해진 규칙에 의해서 인코딩 되기 때문에 그 방식에 맞춰 디코딩 해야한다.
			logoPath = URLDecoder.decode(logoPath, "utf-8"); 
			boolean isDeleted = mainLogoDelete.deleteLogo(logoPath);
			if(isDeleted)
				return new ResponseEntity<String>("LOGO_DELETE_SUCCESS", HttpStatus.OK);
			else
				return new ResponseEntity<String>("LOGO_DELETE_FAIL", HttpStatus.BAD_REQUEST);
			
		} catch (Exception e) {
			e.printStackTrace();
		
			return new ResponseEntity<String>("INTERNAL_SERVER_ERROR", HttpStatus.INTERNAL_SERVER_ERROR);	
		}
	}
}
