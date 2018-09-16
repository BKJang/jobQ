package egovframework.example.admin.sidebar.applyandoffer.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.applyandoffer.dao.AdminOfferMapper;

@Service
public class AdminOfferDetail {
	@Autowired
	private AdminOfferMapper adminOfferMapper;
	
	public ModelAndView getDetail(int no){
		ModelAndView modelAndView = new ModelAndView();
		Map<String, String> offer = adminOfferMapper.getDetail(no);
		
		return new ModelAndView("applyAndOffer/offerDetail-js/offerDetail.admin", "offer", offer);
	}
}
