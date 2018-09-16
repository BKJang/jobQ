package egovframework.example.cmmn.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session = request.getSession(false);
		
		if(session == null){
			System.out.println("세션 없음");
			response.sendRedirect("/sample/login.jobq");
			return false;
		}
		
		if(session.getAttribute("member_id")== null){
			System.out.println("id 세션 없음");
			response.sendRedirect("/sample/login.jobq");
			return false;
		}
		
		return true;
		
	}
}
