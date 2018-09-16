package egovframework.example.login.login.service.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import egovframework.example.login.login.web.LoginVO;

@Service
public class LoginService {
	
	@Autowired
	private LoginMapper loginMapper;
	
	public ResponseEntity<String> login(LoginVO loginData, HttpSession session){
		ResponseEntity<String> isLogin = null;
		
		Map<String, String> authMember = loginMapper.login(loginData.getId());
		

		
		

		
		if (authMember == null) { 
			
			System.out.println("널");
			
			System.out.println(authMember);

			
			


			
			isLogin = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		
		} else if (!loginData.getPwd().equals(authMember.get("PASSWORD"))){
			
			System.out.println("패스워드 다름");
			
			System.out.println(authMember);
			
			System.out.println(loginData.getId());
			System.out.println(loginData.getPwd());
			System.out.println(authMember.get("PASSWORD"));
			
			isLogin = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			
		}
		
		else if (loginData.getId().equals(authMember.get("ID")) && loginData.getPwd().equals(authMember.get("PASSWORD"))){
			
			
			System.out.println(authMember);
			
			System.out.println(loginData.getPwd());
			System.out.println(authMember.get("PASSWORD"));
			System.out.println("성공");
			
			session.setAttribute("member_id", loginData.getId());
			session.setAttribute("member_pwd", loginData.getPwd());
			session.setAttribute("member_name", authMember.get("NAME"));
			session.setAttribute("member_type", authMember.get("TYPE"));
			session.setAttribute("resume_title", authMember.get("TITLE"));
			session.setAttribute("resume_delete", authMember.get("RE_DELETE"));
		
			
			isLogin = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} 

		System.out.println("리턴");
		
		return isLogin;
	}
}
