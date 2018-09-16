package egovframework.example.admin.sidebar.mainsetting.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.mainsetting.dao.MainLogoMapper;

@Service
public class MainLogoListSelect {
	@Autowired
	private MainLogoMapper mainLogoMapper;
	
	public ModelAndView getLogoList() throws Exception{
		return new ModelAndView("admin/mainsetting/jsp/logolist", "logoList", mainLogoMapper.getLogoList());
	}
}
