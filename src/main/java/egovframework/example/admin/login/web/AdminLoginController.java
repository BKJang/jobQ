package egovframework.example.admin.login.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.example.admin.login.domain.LoginVO;
import egovframework.example.admin.login.service.impl.AdminLoginAuthentication;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class);
	
	@Autowired
	private Validator validator;
	
	@Autowired
	private AdminLoginAuthentication adminLoginAuthentication;
	
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public String serviceGet(@ModelAttribute("login")LoginVO loginVO){
		return "admin/login/jsp/login";
	}
	
	// <input type="password" /> 에서 입력한 값들은 '한글로 치든 영어로 치든 영어로 전달'된다.
	// 즉, 데이터 베이스쪽에서 테스트를 할 때는 영어로 된 데이터를 넣어놓면 된다.
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public String servicePost(@ModelAttribute("login")@Valid LoginVO loginVO, Errors errors, HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		// String requestURI = (String)session.getAttribute("requestURIBeforeLogin");
		Map<String, Object> authenticatedUser = null;
		
		if(errors.hasErrors()){
			model.addAttribute("ERROR", "NOT_VALID");
			
			return "admin/login/jsp/login";
		}
		
		authenticatedUser = adminLoginAuthentication.authenticate(loginVO);
		if(authenticatedUser != null){
			session.setAttribute("login", authenticatedUser);
			
			return "redirect:/admin/main";
			// return new ResponseEntity<String>(requestURI != null ? requestURI : "/sample/admin/main", HttpStatus.OK);
		}else{
			model.addAttribute("ERROR", "LOGIN_FAIL");
			
			return "admin/login/jsp/login";
		}
		
	}
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder){
		try {
			// 여기에 new LocalValidationBeanFactory()라고 직접 명시하면 안된다.
			// xml에 bean으로 설정하고 해줘야 한다.
			webDataBinder.setValidator(this.validator);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
