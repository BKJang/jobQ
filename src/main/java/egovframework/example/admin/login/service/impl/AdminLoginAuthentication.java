package egovframework.example.admin.login.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.login.domain.LoginVO;
import egovframework.example.admin.login.mapper.AdminLoginMapper;

@Service
public class AdminLoginAuthentication {
	
	@Autowired
	private AdminLoginMapper adminLoginMapper;
	
	public Map<String, Object> authenticate(LoginVO loginVO){
		Map<String, Object> authenticatedUser = adminLoginMapper.authenticate(loginVO);
		
		if(authenticatedUser == null)
			return null;
		else
			return authenticatedUser;
	}
}
