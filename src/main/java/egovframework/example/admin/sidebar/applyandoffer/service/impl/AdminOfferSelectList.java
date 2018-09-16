package egovframework.example.admin.sidebar.applyandoffer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.cmmn.datatable.JobqDataTableOfferConvertor;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSelectTemplate;
import egovframework.example.admin.sidebar.applyandoffer.dao.AdminOfferMapper;

@Service
public class AdminOfferSelectList extends JobqDataTableSelectTemplate{
	
	@Autowired
	public AdminOfferSelectList(AdminOfferMapper adminOfferMapper) {
		super(adminOfferMapper, new JobqDataTableOfferConvertor());
	}
}
