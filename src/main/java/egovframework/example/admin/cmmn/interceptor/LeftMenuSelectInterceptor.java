package egovframework.example.admin.cmmn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LeftMenuSelectInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(LeftMenuSelectInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		final String[] requestURLArray;
		
		try {
			requestURLArray = request.getRequestURI().split("/");
			
			
			if(requestURLArray.length == 4){
				request.setAttribute("requestFirstURL", requestURLArray[3]);
				logger.info(requestURLArray[3]);
			}else if(requestURLArray.length >= 5){
				request.setAttribute("requestFirstURL", requestURLArray[3]);
				request.setAttribute("requestSecondURL", requestURLArray[4]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
	

}
