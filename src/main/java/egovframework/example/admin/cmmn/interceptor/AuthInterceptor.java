package egovframework.example.admin.cmmn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory
			.getLogger(AuthInterceptor.class);
	private static final String LOGIN_URI = "/sample/admin/login";

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(false);
		String uri = request.getRequestURI();
		String query = request.getQueryString();

		if (session == null) {
			response.sendRedirect(LOGIN_URI);

			return false;
		} else {
			if (session.getAttribute("login") == null) {
				logger.info("로그인한 사용자가 아닙니다.");

				saveRequestURL(request);

				response.sendRedirect(LOGIN_URI);
				return false;
			}

			return true;
		}
	}

	private void saveRequestURL(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();

		if (query == null)
			query = "";
		else
			query = "?" + query;

		if (request.getMethod().equals("GET"))
			request.getSession().setAttribute("requestURIBeforeLogin",
					uri + query);
		else if (request.getRequestURI().equals("/sample/admin/logout"))
			request.getSession().setAttribute("requestURIBeforeLogin",
					"/sample/admin/main");
	}
}
