package egovframework.example.login.login.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.login.login.service.impl.LoginService;

@Controller
public class LoginController {
	@Autowired
	/*@Resource(name  = "loginService")*/
	private LoginService loginService;
	
	@RequestMapping(value = "login.jobq", method = RequestMethod.GET)
	public String showLoginPage() throws Exception {
		return "login/login/login.tiles2";
	}
	
	@RequestMapping(value = "login.jobq", method = RequestMethod.POST)
	public ResponseEntity<String> login(LoginVO loginData, HttpSession session) {
		try {
			ResponseEntity<String> isLogin =  loginService.login(loginData, session);
			return isLogin;
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		
		return null;
		
	}
	
	
	//로그아웃하면 공고정보까지 다 날라가길래 아래 소스로 바꿈
	@RequestMapping(value = "logout.jobq")
	public ModelAndView logOut(ModelAndView mv, HttpSession session){
		
		String page = "redirect:/";
		session.removeAttribute("member_id");
		session.removeAttribute("member_pwd");
		session.removeAttribute("member_name");
		session.removeAttribute("member_type");
		session.removeAttribute("resume_delete");
		mv.setViewName(page);;
		return mv;
	
	
	//요한이가 알려주는 소스
	/*@RequestMapping(value = "logout.jobq", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		
		session.removeAttribute("member_id");
		session.removeAttribute("member_name");*/
		
		
		/*return "main/main/main.tiles";*/
	}
}
