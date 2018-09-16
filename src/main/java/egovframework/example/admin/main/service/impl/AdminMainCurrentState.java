package egovframework.example.admin.main.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.main.mapper.AdminMainSiteCurrentState;

@Service
public class AdminMainCurrentState {
	@Autowired
	private AdminMainSiteCurrentState adminMainSiteCurrentState;
	
	public Map<String, String> getSiteCurrentInfo() throws Exception{
		// 오라클에서 NUMBER형으로 오는 값들은 MyBatis를 통해서 자바의 Bigdeci가 된다.
		// 문자열 연산을 하려면, String.valueOf()를 통해서 형변환을 해야한다.
		Map<String, String> siteCurrentInfo = adminMainSiteCurrentState.getSiteState();
		
		return siteCurrentInfo;
	}
	
}
