package egovframework.example.admin.sidebar.mainsetting.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.mainsetting.dao.MainLogoMapper;

@Service
public class MainLogoUpdate {
	@Autowired
	private MainLogoMapper mainLogoMapper;
	
	public boolean updateMainLogo(String updateLogoPath) throws Exception{
		// 메인 로고를 변경하기전에 그 전에 있던 메인로고를 'N'으로 설정해야 한다.
		mainLogoMapper.updateMainLogo();
		
		// 메인 로고 변경이 성공하면 1을 반환(한 개만 변경하므로)하므로 0보다 크면 변경이 성공하게 된다.
		if( mainLogoMapper.updateLogo(updateLogoPath) > 0 )
			return true;
		
		return false;
	}
}
